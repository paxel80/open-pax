"""
open-pax — Telegram Bridge para Letta
======================================
Bot ligero que conecta @LaInconclusa80_bot con el servidor Letta.
Recibe mensajes → los envía a Letta via REST → devuelve la respuesta.

Uso:
    TELEGRAM_BOT_TOKEN=xxx LETTA_BASE_URL=http://letta:8283 python telegram-bridge.py
"""

import os
import sys
import json
import logging
import asyncio

import httpx
from telegram import Update
from telegram.ext import (
    ApplicationBuilder,
    CommandHandler,
    MessageHandler,
    ContextTypes,
    filters,
)

# ---------------------------------------------------------------------------
# Configuración
# ---------------------------------------------------------------------------
TELEGRAM_BOT_TOKEN = os.environ.get("TELEGRAM_BOT_TOKEN", "")
LETTA_BASE_URL = os.environ.get("LETTA_BASE_URL", "http://localhost:8283")
LETTA_AGENT_NAME = os.environ.get("LETTA_AGENT_NAME", "open-pax")
ALLOWED_USERS = os.environ.get("ALLOWED_USERS", "")

if not TELEGRAM_BOT_TOKEN:
    sys.exit("❌ Falta TELEGRAM_BOT_TOKEN en las variables de entorno.")

# Parsear IDs de usuarios autorizados
ALLOWED_USER_IDS: set[int] = set()
if ALLOWED_USERS:
    ALLOWED_USER_IDS = {int(uid.strip()) for uid in ALLOWED_USERS.split(",") if uid.strip()}

# Logging
logging.basicConfig(
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
    level=logging.INFO,
)
logger = logging.getLogger("open-pax-tg")

# Cliente HTTP para hablar con Letta (Timeout elevado a 10 min por Ollama en CPU)
http_client = httpx.AsyncClient(base_url=LETTA_BASE_URL, timeout=600.0, follow_redirects=True)

# Cache del agent_id (se resuelve una vez al inicio)
_agent_id: str | None = None


# ---------------------------------------------------------------------------
# Funciones auxiliares
# ---------------------------------------------------------------------------
async def get_agent_id() -> str:
    """Busca el agente por nombre y cachea su ID."""
    global _agent_id
    if _agent_id:
        return _agent_id

    resp = await http_client.get("/v1/agents/")
    resp.raise_for_status()
    agents = resp.json()

    for agent in agents:
        if agent.get("name") == LETTA_AGENT_NAME:
            _agent_id = agent["id"]
            logger.info(f"✅ Agente encontrado: {LETTA_AGENT_NAME} (ID: {_agent_id})")
            return _agent_id

    sys.exit(f"❌ No se encontró el agente '{LETTA_AGENT_NAME}'. Ejecuta setup-agent.py primero.")


async def send_to_letta(message_text: str, user_name: str = "Erik") -> str:
    """Envía un mensaje al agente Letta y extrae la respuesta."""
    agent_id = await get_agent_id()

    payload = {
        "messages": [
            {
                "role": "user",
                "content": message_text,
                "name": user_name,
            }
        ],
    }

    resp = await http_client.post(
        f"/v1/agents/{agent_id}/messages/",
        json=payload,
    )
    resp.raise_for_status()
    response_data = resp.json()

    # Extraer el texto de respuesta del agente.
    # Letta devuelve una lista de mensajes; buscamos los de tipo
    # "assistant_message" o que contengan "assistant_message".
    assistant_texts = []
    messages = response_data if isinstance(response_data, list) else response_data.get("messages", [])

    for msg in messages:
        msg_type = msg.get("message_type", msg.get("type", ""))

        # Formato v1: assistant_message con content directo
        if msg_type == "assistant_message":
            content = msg.get("content", msg.get("assistant_message", ""))
            if content:
                assistant_texts.append(content)
            continue

        # Formato alternativo: role-based
        if msg.get("role") == "assistant" and msg.get("content"):
            assistant_texts.append(msg["content"])

    if assistant_texts:
        return "\n".join(assistant_texts)

    # Fallback: devolver JSON crudo si no podemos parsear
    logger.warning(f"No se pudo parsear respuesta de Letta: {json.dumps(response_data)[:500]}")
    return "🤔 Recibí tu mensaje pero no pude generar una respuesta clara. Intenta de nuevo."


def is_authorized(user_id: int) -> bool:
    """Verifica si el usuario está autorizado."""
    if not ALLOWED_USER_IDS:
        return True  # Sin filtro = acceso libre (dev)
    return user_id in ALLOWED_USER_IDS


# ---------------------------------------------------------------------------
# Handlers de Telegram
# ---------------------------------------------------------------------------
async def cmd_start(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    """Responde al comando /start."""
    if not update.effective_user or not update.message:
        return
    if not is_authorized(update.effective_user.id):
        await update.message.reply_text("⛔ No tienes acceso a este bot.")
        return

    await update.message.reply_text(
        "👋 ¡Hola! Soy **open-pax**, tu asistente personal.\n\n"
        "Escríbeme lo que necesites y te ayudaré.\n"
        f"Tu Telegram ID: `{update.effective_user.id}`",
        parse_mode="Markdown",
    )


async def cmd_status(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    """Verifica el estado de Letta."""
    if not update.message:
        return
    if not is_authorized(update.effective_user.id):
        return

    try:
        resp = await http_client.get("/v1/health/")
        health = resp.json()
        agent_id = await get_agent_id()
        await update.message.reply_text(
            f"🟢 **open-pax status**\n"
            f"• Letta: `{health}`\n"
            f"• Agente: `{LETTA_AGENT_NAME}` ({agent_id[:12]}...)\n"
            f"• LLM endpoint: `{LETTA_BASE_URL}`",
            parse_mode="Markdown",
        )
    except Exception as e:
        await update.message.reply_text(f"🔴 Error de conexión con Letta: `{e}`", parse_mode="Markdown")


async def handle_message(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    """Procesa mensajes de texto y los envía a Letta."""
    if not update.effective_user or not update.message or not update.message.text:
        return
    if not is_authorized(update.effective_user.id):
        await update.message.reply_text("⛔ No tienes acceso a este bot.")
        return

    user = update.effective_user
    text = update.message.text
    logger.info(f"📩 Mensaje de {user.first_name} ({user.id}): {text[:100]}")

    # Indicar que estamos "escribiendo"
    await update.message.chat.send_action("typing")

    try:
        response = await send_to_letta(text, user_name=user.first_name or "Erik")
        await update.message.reply_text(response, parse_mode="Markdown")
        logger.info(f"📤 Respuesta enviada ({len(response)} chars)")
    except httpx.HTTPStatusError as e:
        logger.error(f"Error HTTP de Letta: {e.response.status_code} — {e.response.text[:300]}")
        await update.message.reply_text(
            f"⚠️ Error del servidor Letta ({e.response.status_code}). Intenta en unos segundos."
        )
    except Exception as e:
        logger.error(f"Error inesperado: {e}", exc_info=True)
        await update.message.reply_text("⚠️ Ocurrió un error inesperado. Revisa los logs.")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
def main() -> None:
    """Arranca el bot de Telegram."""
    logger.info("🚀 Iniciando open-pax Telegram Bridge...")
    logger.info(f"   Letta URL: {LETTA_BASE_URL}")
    logger.info(f"   Agente: {LETTA_AGENT_NAME}")
    logger.info(f"   Usuarios autorizados: {ALLOWED_USER_IDS or 'TODOS (dev mode)'}")

    app = ApplicationBuilder().token(TELEGRAM_BOT_TOKEN).build()

    app.add_handler(CommandHandler("start", cmd_start))
    app.add_handler(CommandHandler("status", cmd_status))
    app.add_handler(MessageHandler(filters.TEXT & ~filters.COMMAND, handle_message))

    logger.info("✅ Bot listo. Escuchando mensajes...")
    app.run_polling(allowed_updates=Update.ALL_TYPES)


if __name__ == "__main__":
    main()

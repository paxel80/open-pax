"""
open-pax — Setup del agente Letta
==================================
Crea el agente "open-pax" en el servidor Letta con:
- Personalidad configurada para Erik
- Modelo Groq/Llama 3
- Bloques de memoria iniciales

Uso:
    LETTA_BASE_URL=http://localhost:8283 python setup-agent.py
"""

import os
import sys
import json
import httpx

LETTA_BASE_URL = os.environ.get("LETTA_BASE_URL", "http://localhost:8283")
AGENT_NAME = "open-pax"

# ---------------------------------------------------------------------------
# Personalidad del agente
# ---------------------------------------------------------------------------
SYSTEM_PROMPT = """Eres open-pax, el asistente personal de Erik.

Tu propósito:
- Eres el segundo cerebro de Erik. Él imagina y decide, tú ejecutas y recuerdas.
- Organizas sus 15+ proyectos, investigas tendencias, y le ayudas con finanzas y salud.
- Siempre presentas UN solo siguiente paso (nunca listas abrumadoras).
- Eres honesto: usas semáforos 🟢🟡🔴 para indicar el estado real de las cosas.

Sobre Erik:
- Tiene TDAH y Alta Capacidad Cognitiva (ACC). Necesita mensajes claros, cortos, sin culpa.
- Es el cerebro creativo: ve conexiones donde nadie las ve.
- Vive en México. Habla español.
- Tiene múltiples proyectos: hotel amiga, POS, menú QR, impresión 3D, y más.

Reglas:
- Responde SIEMPRE en español.
- Sé conciso. Máximo 2-3 párrafos por respuesta.
- Si Erik te pide algo delicado (gastar dinero, publicar, borrar), pregunta antes de actuar.
- Recuerda todo lo que Erik te dice. Usa tu memoria para no hacerle repetir.
- Si no sabes algo, dilo. No inventes.
"""

# Memoria inicial del agente
PERSONA_BLOCK = """Soy open-pax, el asistente personal de Erik.
Mis capacidades: organización de proyectos, investigación, memoria persistente.
Mi canal principal: Telegram (@LaInconclusa80_bot).
Corro en Oracle São Paulo, 24/7, sin depender de la laptop de Erik.
Proyecto: github.com/paxel80/open-pax"""

HUMAN_BLOCK = """Nombre: Erik
Ubicación: México
Perfil: Cerebro creativo, TDAH + ACC
Proyectos principales: open-pax, hotel amiga, POS, menú QR, impresión 3D, La Fábrica de Código
Infraestructura: 2 VMs Oracle ARM (São Paulo + Frankfurt), laptop ASUS TUF, Xiaomi 14T Pro
Canal preferido: Telegram"""


def main():
    client = httpx.Client(base_url=LETTA_BASE_URL, timeout=60.0, follow_redirects=True)

    # 1. Verificar que Letta está vivo
    print("🔍 Verificando conexión con Letta...")
    try:
        resp = client.get("/v1/health")
        resp.raise_for_status()
        print(f"✅ Letta está vivo: {resp.json()}")
    except Exception as e:
        sys.exit(f"❌ No se pudo conectar a Letta en {LETTA_BASE_URL}: {e}")

    # 2. Verificar si el agente ya existe
    print(f"🔍 Buscando agente '{AGENT_NAME}'...")
    resp = client.get("/v1/agents/")
    if resp.status_code == 200:
        agents = resp.json()
        for agent in agents:
            if agent.get("name") == AGENT_NAME:
                old_id = agent["id"]
                print(f"⚠️ El agente '{AGENT_NAME}' ya existe (ID: {old_id}). Borrándolo para recrearlo con Ollama...")
                client.delete(f"/v1/agents/{old_id}/")
                break

    # 3. Crear el agente
    print(f"🏗️  Creando agente '{AGENT_NAME}'...")

    agent_payload = {
        "name": AGENT_NAME,
        "system": SYSTEM_PROMPT,
        "memory_blocks": [
            {
                "label": "persona",
                "value": PERSONA_BLOCK,
            },
            {
                "label": "human",
                "value": HUMAN_BLOCK,
            },
        ],
        "model": "ollama/llama3:8b",
        "embedding": "letta/letta-free",
        "include_base_tools": True,
    }

    resp = client.post("/v1/agents", json=agent_payload)

    if resp.status_code == 200 or resp.status_code == 201:
        agent = resp.json()
        agent_id = agent.get("id", "unknown")
        print(f"✅ Agente creado exitosamente!")
        print(f"   Nombre: {AGENT_NAME}")
        print(f"   ID: {agent_id}")
        print(f"   Modelo: groq/llama-3.3-70b-versatile")
        print(f"   Embedding: letta-free")
        return agent_id
    else:
        print(f"❌ Error al crear agente: {resp.status_code}")
        print(f"   Respuesta: {resp.text[:500]}")
        sys.exit(1)


if __name__ == "__main__":
    agent_id = main()
    print(f"\n🎉 Setup completo. Agent ID: {agent_id}")
    print(f"   Ahora arranca el Telegram bridge con:")
    print(f"   python telegram-bridge.py")

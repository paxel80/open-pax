# 📂 Bitácora de recursos — recursospax

> **Índice de las 7 fichas.**
> Última actualización: 5-jul-2026

---

## 🗂️ Fichas por categoría

| # | Ficha | Archivo | Estado | Contenido |
|---|---|---|---|---|
| 1 | 🧠 **APIs de cerebros (LLM)** | [`01_apis-llm.md`](01_apis-llm.md) | ✅ Completa | 10 APIs cloud + 2 modelos locales. Auditoría de duplicados y fuentes. |
| 2 | 🏦 **Cuentas cloud** | `02_cuentas-cloud.md` | 🔴 pendiente | Oracle SP, Oracle FRA, Cloudflare, GitHub, Supabase, Northflank |
| 3 | 🔌 **MCP** | `03_mcp.md` | 🔴 pendiente | Servidores MCP disponibles (Pieces, CodeGraph, etc.) |
| 4 | 🎫 **API tokens y keys** | `04_api-tokens.md` | 🔴 pendiente | Telegram, WhatsApp, Ngrok, Langfuse, n8n, Vercel, Scaleway, Tavily, OpenCode Zen |
| 5 | 🖥️ **Modelos locales** | `05_modelos-locales.md` | 🔴 pendiente | Ollama SP (llama3.1:8b), Ollama laptop (qwen3:4b), modelos perdidos (14b/27b) |
| 6 | 🔑 **Claves SSH** | `06_claves-ssh.md` | 🔴 pendiente | `oci_paxel` (SP), `oci_amigo` (FRA), `termux_phone` (Xiaomi), etc. |
| 7 | 💉 **Saldo prepago** | `07_saldo-prepago.md` | 🔴 pendiente | DeepSeek (CNY), OpenAI (USD). Saldo actual, última recarga, gasto. |

---

## 📝 Cómo leer una ficha

Cada ficha sigue esta plantilla:

1. **Resumen rápido**: tabla de todos los recursos de la categoría con semáforo
2. **Ficha por recurso**: campos fijos (plataforma, tipo, costo, límite, saldo,
   fecha creación, última verificación, dónde está la clave/archivo, notas)
3. **Alertas**: lo que necesita acción urgente
4. **Fuentes**: de qué archivos del disco se extrajo la información

---

## 🟢🟡🔴 Semáforos

| Símbolo | Significado |
|---|---|
| 🟢 | **Verificado y funcionando** (probado, responde, tiene saldo) |
| 🟡 | **Existe pero no verificado** (clave encontrada, no probada desde LiteLLM) |
| 🔴 | **Problema o desconocido** (clave expirada, saldo desconocido, caído, acción urgente) |

---

## ⚠️ Reglas de esta bitácora

1. **Las claves NUNCA se escriben aquí (RR4).** Se referencia la ubicación del
   archivo que las contiene, pero el texto de la clave no aparece en estas fichas.
2. **Fechas absolutas (RR2).** `5-jul-2026`, nunca "vence en 30 días".
3. **Honestidad (RR3).** Si no sabemos algo, ponemos "🔴 desconocido".
4. **Una sola fuente de verdad (RR5).** Si una clave está en 3 lados, esta
   bitácora dice cuál es la "canónica" que debe usar cerebropax/open-pax.

---

## 📅 Historial de actualizaciones

| Fecha | Qué se actualizó |
|---|---|
| 5-jul-2026 | 🆕 Bitácora creada. Ficha 1 (APIs LLM) completada con auditoría de 4 archivos fuente. |
| 5-jul-2026 | Anthropic agregada a la ficha 1 (clave revelada por Erik via curl, no estaba en .env). Total: 13 cerebros. |
| 5-jul-2026 | Cerebropax `config.yaml` actualizado: 9 categorías completas en `router_groups` + Anthropic en modelos/fallbacks/grupo `calidad-tope`. |
| 5-jul-2026 | Cerebropax `.env.example` actualizado con `ANTHROPIC_API_KEY`. |
# Investigación: plantillas n8n, LangChain y CrewAI

> Migrado a disco desde la conversación de investigación inicial.
> Fecha: 2026-07-05

## Diagrama: dónde está el techo de cada plataforma

```
Complejidad / capacidades del asistente (2026)

  Alta ─┐
        │  CrewAI (Flows multi-crew)  ────────────────┐
        │  LangGraph (jerárquico) ──────────────┐     │
        │  n8n (memoria + producción) ─────┐     │     │
        │                                  │     │     │
  Baja ─┘
        └──────────────────────────────────────────────
         Conectar servicios        Coordinar agentes   Razonamiento + memoria
```

## Opción 1 — n8n: "Personal Assistant Long-Term Memory" 🟢

**Repositorio:** `studiomeyer-io/n8n-templates` → plantilla `03-personal-assistant-long-term-memory`
**Estrellas:** 3 (repo nuevo, craftsmanship alto)
**Enlace:** https://github.com/studiomeyer-io/n8n-templates

**Qué hace:** Bot de Telegram con memoria. Guarda cada conversación en un grafo de conocimiento. Cada vez que hablas: busca en memoria → razona con contexto → vuelve a escribir lo aprendido.

**Por qué es "lo máximo" en n8n:**
- 🟢 Memoria entre sesiones (knowledge graph + búsqueda semántica)
- 🟢 Multi-proveedor con un clic (OpenAI / Anthropic / Ollama local)
- 🟢 Endurecida para producción: HMAC de webhooks, rate-limit, idempotencia, ramas de error
- 🟡 Depende de backend de memoria de pago (StudioMeyer Memory, tier gratis 200 ops; ~29€/mes producción)

**Costo:** ~0,002–0,007 USD por ejecución + tier de memoria.

## Opción 2 — LangChain/LangGraph: "AI Personal Assistant" jerárquico 🟢

**Repositorio:** `kaymen99/personal-ai-assistant`
**Estrellas:** 174
**Enlace:** https://github.com/kaymen99/personal-ai-assistant

**Qué hace:** Un supervisor agent (manager) recibe mensajes por Telegram/Slack/WhatsApp y delega a 5 sub-agentes:
- 📧 Email Agent (Gmail)
- 📅 Calendar Agent (Google Calendar)
- ✅ Notion Agent (to-do lists)
- 💬 Slack Agent
- 🔍 Researcher Agent (Tavily web search + scrape)

**Por qué es "lo máximo" en LangChain:**
- 🟢 Arquitectura jerárquica multi-agente con LangGraph
- 🟢 Observabilidad con LangSmith
- 🟢 Funciona con GPT-4, Llama 3, Gemini, Groq
- 🟡 Más "código" que n8n, menos "producción-hardened"

**Costo:** ~0 USD si usas Groq/Llama 3 gratis + APIs gratuitas.

## Opción 3 — CrewAI: "Meeting Assistant Flow" 🟡

**Repositorio:** `crewAIInc/crewAI-examples` (oficial, 6,1k estrellas — ⚠️ archivado abr-2026, ahora en `crewAI-cookbook`)
**Enlace:** https://github.com/crewAIInc/crewAI-examples

**Qué hace:** Flow que procesa notas de reuniones, integra con Trello + Slack, orquesta varios crews con estado y enrutamiento dinámico.

**Por qué es "lo máximo" en CrewAI:**
- 🟢 Flows con estado + humano-en-el-bucle
- 🟢 Orquestación multi-crew
- 🟡 Repo oficial archivado; comunidad migró a `crewAI-cookbook`
- 🔴 CrewAI brilla más en flujos de equipo (marketing, contenido, recruiting) que en asistente personal puro

## Bonus fuera de la lista

`the-open-agent/openagent` (5,3k estrellas, Go, single binary, browser-use + computer-use + MCP + RAG + 30 proveedores) — probablemente el asistente personal self-hosted más completo que existe hoy, pero no es n8n/LangChain/CrewAI.

## Recomendación que se aplicó en open-pax

Opción 2 (kaymen99 con LangGraph) como base de aprendizaje → migrar a Opción 1 (n8n + memoria) para producción. En open-pax esto evolucionó a una combinación completa (ver `02_investigacion-profunda-2026.md`).
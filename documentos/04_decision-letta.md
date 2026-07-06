# Decisión Arquitectónica: Letta como primer punto de contacto

> Fecha: 2026-07-05
> Estado: ✅ Aprobada
> Autor: Erik + open-pax AI

## Contexto

open-pax necesita un agente que funcione 24/7 en Telegram sin depender de la laptop de Erik. Se evaluaron 3 opciones:

## Opciones evaluadas

| Criterio | Letta (MemGPT) | OpenClaw | Bot custom (python-telegram-bot + LiteLLM) |
|---|---|---|---|
| Memoria persistente | 🟢 Integrada (pgvector) | 🟡 Plugin básico | 🔴 No tiene |
| Telegram nativo | 🟡 Vía bridge | 🟢 Nativo | 🟢 Nativo |
| WhatsApp | 🟡 Vía REST API | 🟢 Nativo | 🟡 Requiere WA Business API |
| ARM (aarch64) | 🟢 Multi-arch Docker | 🟢 Docker | 🟢 Python puro |
| RAM estimada | ~2-3 GB | ~1-2 GB | ~200 MB |
| Ecosistema Python | 🟢 SDK oficial | 🟡 Plugins | 🟢 Total control |
| BYOK (Groq, DeepSeek) | 🟢 Sí | 🟢 Sí | 🟢 Vía LiteLLM |
| Comunidad | 🟢 60k+ ⭐ | 🟡 Más nuevo | N/A |
| Extensibilidad a futuro | 🟢 Tools, MCP, multi-agent | 🟡 Plugins | 🔴 Todo manual |

## Decisión

**Letta**, porque:

1. **Memoria desde el día 1.** La Regla R5 de open-pax exige "tolerancia cero a la amnesia". Letta tiene memoria persistente integrada con entity-linking y razonamiento temporal. No necesitamos montar Mem0 + Qdrant como servicios separados para empezar.

2. **Ruta de crecimiento.** Letta soporta tools personalizados, MCP, y multi-agent. Cuando lleguemos a Fase 2 (sub-agentes) y Fase 3 (Mem0 dedicado), podemos migrar la memoria gradualmente o usar ambos en paralelo.

3. **REST API como columna vertebral.** Todo pasa por `localhost:8283`. Constelación (WhatsApp) puede conectarse al mismo endpoint. Telegram, WhatsApp y cualquier canal futuro comparten el mismo cerebro.

## Qué ganamos vs Mem0 dedicado

- ✅ Setup en 1 `docker compose up` en vez de 4 servicios (LangGraph + Mem0 + Qdrant + LiteLLM)
- ✅ Memoria funcional desde el minuto cero
- ✅ Menos piezas móviles = menos mantenimiento en la VM de 24 GB

## Qué perdemos

- 🟡 La memoria de Letta no es tan precisa como Mem0 (91.6% LoCoMo). Pero para Fase 1 es más que suficiente.
- 🟡 Si queremos migrar a Mem0 después, habrá que exportar/importar la memoria acumulada.

## Ruta de migración

Si Letta no escala o Mem0 se vuelve necesario:
1. Exportar archival memory de Letta vía API
2. Importar a Mem0 como memories
3. Cambiar el bridge de Telegram para apuntar a LangGraph + Mem0
4. El bridge de Telegram no cambia — solo cambia el backend

## Referencias

- [Letta docs](https://docs.letta.com)
- [Letta GitHub](https://github.com/letta-ai/letta)
- [Mem0 GitHub](https://github.com/mem0ai/mem0)
- [02_investigacion-profunda-2026.md](../documentos/02_investigacion-profunda-2026.md)

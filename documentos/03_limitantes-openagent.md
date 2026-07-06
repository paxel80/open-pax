# Limitantes de OpenAgent — por qué no es la base de open-pax

> Migrado a disco desde la conversación sobre limitantes de OpenAgent.
> Fecha: 2026-07-05

## 🔴 Lo que NO hace bien para el caso "asistente humano-equivalente"

| Limitante | Detalle | Impacto |
|---|---|---|
| **No es orquestador multi-agente jerárquico** | Es "un" agente con loops, no supervisor + sub-agentes | No puede delegar "email al de email, calendario al de calendario" |
| **Memoria = RAG, no memoria personal persistente** | Tiene RAG (documentos), pero no grafo de Mem0 con entity-linking + razonamiento temporal | Olvida quién eres entre sesiones |
| **Sin telephony real** | STT/TTS sí, pero no hace/recibe llamadas telefónicas como LiveKit con SIP | No "contesta llamadas" de verdad |
| **No tiene human-in-the-loop nativo** | No hay `interrupt_on` antes de acciones delicadas | No pregunta antes de gastar/crear/transferir |
| **No es "personal", es plataforma multi-tenant** | Diseñado para equipos/organizaciones con SSO | Hay que adaptarlo; no viene con mentalidad asistente |
| **Go, no Python** | Extenderlo requiere Go 1.25; el ecosistema de agentes es Python | Integrar LangGraph/Mem0/LiveKit/browser-use cuesta más |

## 🟡 Limitantes técnicos/prácticos

- Monolito: un solo binario de 2,414 commits. Modificar el core es pesado.
- Sin stealth/captcha propio: computer-use depende de su cloud de pago.
- Modelos `bu-*` son de pago.
- Sin MCP-first (lo soporta, pero no es columna vertebral).
- Pocas métricas públicas comparables.

## 🟢 Donde SÍ brilla

- Single binary, Windows nativo (sin WSL/Docker)
- 30+ proveedores incluido Ollama
- Workflow visual BPMN
- Admin dashboard con analytics
- Multi-tenancy + audit logs
- Apache-2.0, self-hostable

## Veredicto

```
¿Usarlo como asistente personal?        🔴  No encaja — es plataforma, no secretario
¿Usarlo como referencia arquitectónica? 🟢  Sí — prueba que se integra en 1 binario
¿Usarlo como base para open-pax?        🟡  Posible, pero te amarras a Go y pierdes el ecosistema Python
```

**Decisión en open-pax:** No usar OpenAgent como base. Usarlo como **inspiración arquitectónica** (ver que cabe en un binario, el panel admin, multi-tenant). La pila real es Deep Agents + LangGraph + Mem0 + LiveKit + browser-use + MCP — todos Python, interconectables, self-hostables, cada uno líder en su área.
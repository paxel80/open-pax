# Investigación profunda 2026: avances por área

> Migrado a disco desde la conversación de investigación profunda.
> Fecha: 2026-07-05
> Este documento alimenta la arquitectura final de open-pax.

## Mapa del techo actual por área (semáforos 2026)

```
Área                     Antes (2024)    Ahora (jul-2026)      Avance clave
─────────────────────────────────────────────────────────────────────────
🗣️ Voz en tiempo real    🟡 2-3s latencia 🟢 <600ms + turn-take  LiveKit/Vapi Squads
🧠 Memoria permanente    🟡 71% accuracy  🟢 91.6% (LoCoMo)      Mem0 algoritmo nuevo abr-2026
🖥️ Computer-use (web)    🔴 30% tareas    🟢 90%+ con stealth      browser-use 3.0 + bu-* models
🔀 Orquestación agentes  🟡 frágil        🟢 durable + subagents  LangGraph 1.2.7 + Deep Agents
🔌 Conectar servicios    🟡 1 a 1         🟢 MCP universal (88k⭐)  registro + 9 SDKs
📦 Despliegue            🟡 3 servicios   🟢 1 binario             OpenAgent single-binary
```

## ÁREA 1 — Voz y llamadas 🟢

### LiveKit Agents (11,2k ⭐) — self-hostable, costo ~0
- 🟢 Telephony real: hace y recibe llamadas telefónicas de verdad (no simuladas)
- 🟢 Multi-agent handoff: un agiente te pasa a otro especializado sin cortar la llamada
- 🟢 MCP nativo: conecta cualquier herramienta con una línea
- 🟢 Avatares de video (Tavus, Bithuman)
- 🟢 Detección de turno con transformer: no te interrumpe
- 🟢 STT+TTS intercambiables: Deepgram, Cartesia, Whisper local
- 🟢 100% open-source, corres todo en tu servidor

### Vapi — cloud, más fácil, cuesta
- 🟢 Squads: orquesta múltiples agentes de voz con transferencias
- 🟢 Sub-600ms de latencia
- 🟡 De pago (tier gratis limitado)

### Novedad clave 2026: el "handoff" de voz
Un agente de voz detecta qué necesitas y **transfiere** a un sub-agente especializado sin que la persona note el corte. Como una recepcionista humana que deriva al departamento correcto.

## ÁREA 2 — Memoria permanente 🟢 (saltó de 71% a 91.6%)

### Mem0 (60,1k ⭐) — self-hostable, algoritmo nuevo abril 2026

| Benchmark | Antes | Ahora | Mejora |
|---|---|---|---|
| LoCoMo | 71.4 | **91.6** | +20 puntos |
| LongMemEval | 67.8 | **94.8** | +27 puntos |
| BEAM (1M tokens) | — | **64.1** | nuevo |

**Qué cambió:**
- 🟢 Extracción ADD-only en una sola pasada: no sobrescribe, acumula
- 🟢 Entity linking: reconoce que "Erik" y "él" son la misma persona
- 🟢 Multi-signal retrieval: semántico + palabras clave + entidades
- 🟢 Razonamiento temporal: distingue "reunión de ayer" vs "próxima reunión"
- 🟢 Self-hostable con Docker, auth integrada, dashboard

## ÁREA 3 — Computer-use 🟢

### browser-use (103k ⭐ — el repositorio de IA más popular de 2026)
- 🟢 CLI 3.0 con "Browser Harness": el modelo controla el navegador con Python
- 🟢 Stealth + rotación de proxies: evita detección de bots
- 🟢 Resuelve CAPTCHAs (vía cloud)
- 🟢 Modelos propios `bu-*` optimizados para navegador (3-5x más rápido)
- 🟢 Perfil de Chrome real: reutiliza tus logins guardados
- 🟢 Ejemplos: rellenar solicitudes de trabajo, comprar la lista del súper
- 🟢 MIT, self-hostable (local con Playwright)

### Novedad clave 2026: el "harness", no el "framework"
browser-use dio a los modelos libertad directa del navegador con Python. Resultado: 90%+ de éxito en tareas reales.

**Verdad sobre "crear cuentas":** browser-use lo hace técnico. Pero:
- 🟡 Los TOS de la mayoría de webs prohíben registros automatizados
- 🟡 CAPTCHAs avanzados (Cloudflare Turnstile) siguen siendo muro
- 🟢 Funciona perfecto en servicios propios o autorizados

## ÁREA 4 — Cerebro orquestador 🟢

### LangGraph (36,5k ⭐) v1.2.7 + Deep Agents

Deep Agents (harness nuevo 2026, encima de LangGraph) trae de fábrica:

| Capacidad | Significado para el asistente |
|---|---|
| 🟢 Planeación (`write_todos`) | Hace una lista antes de actuar |
| 🟢 Subagents (tool `task`) | Delega sub-tareas a "hijos" con contexto limpio |
| 🟢 Filesystem virtual | Lee/escribe/edita archivos con permisos |
| 🟢 Skills (agentskills.io) | Carga conocimientos on-demand |
| 🟢 Memory con `AGENTS.md` | Preferencias persistentes entre sesiones |
| 🟢 Summarization + context offloading | Trabaja horas sin llenar el contexto |
| 🟢 Human-in-the-loop (`interrupt_on`) | Pausa antes de lo delicado → pide confirmación |
| 🟢 MCP | Conecta cualquier servidor MCP con una línea |
| 🟢 Durable execution | Si se cae, retoma desde donde quedó |
| 🟢 Streaming | Ves cada paso en tiempo real |

Es el **mismo patrón que usa Claude Code** (el agente de Anthropic). Harness de producción de LangChain.

## ÁREA 5 — Conectar servicios 🟢

### MCP (Model Context Protocol) (88,1k ⭐ — estándar de Anthropic)
- 🟢 Un conector universal: Gmail, Drive, Calendar, Slack, Notion, GitHub, Postgres, filesystem, memory
- 🟢 Registro oficial: registry.modelcontextprotocol.io
- 🟢 9 SDKs oficiales (Python, TS, Go, Rust, Java, Kotlin, C#, PHP, Ruby, Swift)
- 🟢 LiveKit, Deep Agents, browser-use, OpenAgent todos lo soportan nativo

## ÁREA 6 — El "todo en uno" (referencia) 🟢

### OpenAgent (5,3k ⭐) — single binary en Go
30+ proveedores de LLM, browser-use + computer-use, RAG, MCP, workflow builder BPMN, multi-tenancy + SSO, audit logs, REST API + Swagger. Corre nativo en Windows.

**Usado como referencia arquitectónica, NO como base** (ver `03_limitantes-openagent.md`).
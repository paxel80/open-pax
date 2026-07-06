# Veredicto del Consejo — Arquitectura open-pax (PREMISAS CORREGIDAS)

> **Council of High Intelligence** · 6 miembros · 3 rondas · 5-jul-2026
> Segunda deliberación con premisas corregidas: 48 GB RAM + $1,500 MXN/sem APIs.
> **Sustituye al veredicto anterior** (documentos/12) que asumía $0/mes + laptop sola.

---

## Veredicto

🟢 **3 capas: n8n + LiteLLM/cerebropax + Letta.** Consenso unánime (6/6).

| Capa | Función | VM anfitriona | RAM |
|---|---|---|---|
| **n8n** | Orquestación visual (workflows, APIs, cron, sensores) | nube2 FRA | ~1 GB |
| **LiteLLM/cerebropax** | Router único de modelos (local + 2do equipo + APIs pagas) | nube2 FRA | ~2 GB |
| **Letta** | Memoria episódica persistente + agentes con estado | nube1 SP | ~3 GB |

❌ **LangChain y CrewAI eliminados definitivamente.** No aportan primitiva computacional nueva — son azúcar sintáctico. Añaden fallo silencioso y deuda sin capability incremental.

## Por qué cambió el veredicto (2 → 3 capas)

El veredicto anterior descartó Letta por RAM en laptop sola (7.7 GB). Con 48 GB distribuidas, esa restricción desaparece. **Pero los recursos no justifican la capa — la justifica la especificación.**

Argumento decisivo (Feynman, que volteó a Torvalds):
> "Un asistente humano-equivalente sin memoria es una contradicción — requisito de especificación, no lujo."

Letta introduce primitiva computacional nueva (estado-agente-memoria persistente) que n8n y LiteLLM no modelan. No es azúcar — es género distinto.

## Votación

| Opción | Peso | Votantes |
|---|---|---|
| **3 capas (n8n+LiteLLM+Letta)** | 6.5 | Aristotle, Ada, Feynman, Torvalds, Karpathy [1.5×], Meadows |
| W_total 6.5 · umbral 4.333 · **CONSENSO UNÁNIME** | | |

## Lo que sobrevive intacto del veredicto anterior

- ✅ **Regla anti-inversión** (Meadows): workflows llaman al cerebro; cerebro nunca orquesta workflows
- ✅ **Carga de prueba en quien añade complejidad**: LangChain/CrewAI no entran sin evidencia medible
- ✅ **LangChain y CrewAI eliminados**: solapamiento numérico prueba no-ortogonalidad
- ✅ **Scope inicial ~30 caps verificadas**, no 316

## El $1,500 MXN/sem cambia el modelo LLM, no la arquitectura

| Tier | Modelo | Uso | Costo/mes |
|---|---|---|---|
| Local laptop | qwen3:4b | trivial, offline | $0 |
| 2do equipo Tailscale | qwen3:14b | razonamiento profundo local | $0 |
| API económica | Groq llama-3.3-70b / DeepSeek-V3 | 70% llamadas | ~$80 |
| API premium | GPT-4o-mini / Claude Haiku | caps críticas (legal, salud) | ~$200 |
| Reserva | — | buffer | ~$90 |

LiteLLM enruta automáticamente al tier óptimo por capacidad.

## Criterios de eliminación (falsables)
- Si tras 90 días Letta acumula memoria corrupta sin alarma → auditar snapshots o replantear
- Si 1 capability A+R no se resuelve con las 3 capas en 3 intentos → evaluar LangChain puntual (no como capa base)
- Si consumo combinado supera 18 GB RAM en una VM → redistribuir entre nube1 y nube2

## Siguiente paso concreto
**Desplegar LiteLLM/cerebropax en nube2 Frankfurt antes del 20-jul-2026.** Letta ya está en nube1. n8n se redespliega en nube2. Las 3 capas quedan activas.

## Aportes clave por miembro
- **Aristotle**: los 94 A+R como género que requiere estado justifica la 3ª capa — no los recursos
- **Ada**: Letta = primitiva computacional nueva; LangChain/CrewAI = azúcar sintáctico. Economía de abstracción
- **Feynman**: "asistente humano-equivalente sin memoria es contradicción" — requisito de spec, no lujo. Volteó a Torvalds
- **Torvalds**: actualizó 2→3 al aceptar spec vinculante. "Carga cognitiva ≠ complejidad arquitectónica"
- **Karpathy** [1.5× dominio]: con RAM no restrictiva, el caso descansa en capability pura. Letta = primitiva única
- **Meadows**: memoria = stock acumulable que dispara bucle de aprendizaje. Sin 3ª capa, bucle roto

---
*Generado por /council (2ª deliberación) · 6 miembros · 3 rondas · 5-jul-2026 · open-pax/documentos/13*
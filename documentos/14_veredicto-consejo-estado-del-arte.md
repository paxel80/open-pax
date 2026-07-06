# Veredicto del Consejo — Estado del Arte (neutral, 18 miembros, autonomía máxima)

> **Council of High Intelligence** · 18 miembros · 3 rondas · 5-jul-2026
> Deliberación neutral SIN contexto de proyecto específico.
> Restricción primordial: autonomía máxima — mínimo o nada de human-in-the-loop.
> **Fuente única de verdad sobre el estado del arte 2026.**

---

## Veredicto

🟢 **Paradigma óptimo: single-agent + autoverify + reversible.**

Un único LLM con:
1. Tool-calling robusto (vía MCP como estándar)
2. Memoria persistente legible (vectorial + estructurada, auditable)
3. Auto-verificador interno (segundo pase adversarial + tests deterministas)
4. Reversibilidad por diseño (sandbox, dry-run, undo, dead-man's switch)
5. Kill-switches automáticos disparados por invariantes, no por humanos

El humano migra de **guardián en el lazo** a **diseñador ex-ante + auditor ex-post**.

❌ Multi-agente rechazado (15/16). ❌ Workflow rígido rechazado (14/16).

## Votación

| Opción | Votos | Miembros |
|---|---|---|
| **single-agent+autoverify+reversible** | 15 | Aristotle, Socrates, Ada, Aurelius, Machiavelli, Lao Tzu, Feynman, Torvalds, Karpathy, Sutskever, Kahneman, Meadows, Munger, Taleb, Rams |
| workflow+LLM+autoverify | 1 | Sun Tzu (disidente) |
| W_total 16 · umbral 10.67 · **CONSENSO ABRUNADOR (15/16)** | | |

## (1) Frontera actual

| Capacidad | Estado | Fiabilidad |
|---|---|---|
| Cognición/razonamiento acotado | 🟢 | Alta |
| Comunicación (texto, voz) | 🟢 | Alta |
| Acción digital (tool-calling) | 🟢 | Alta |
| Memoria (RAG, vectorial) | 🟡 | Media (frágil a escala) |
| Percepción multimodal puntual | 🟡 | Media |
| Creatividad generativa | 🟡 | Media (recombinación) |
| Planificación >5-10 pasos | 🔴 | Baja (decae exponencial) |
| Acción física general | 🔴 | Imposible hoy |
| Juicio ético autónomo | 🔴 | Imposible hoy |
| Auto-mejora sin deriva | 🔴 | Problema abierto |
| Aprendizaje continuo en pesos | 🔴 | No demostrado |

## (2) Arquitectura óptima

```
DISEÑADOR EX-ANTE (humano, una vez)
  define invariantes + perímetros + umbrales
        ↓
AGENTE AUTÓNOMO
  LLM (núcleo) → Tool-calling (MCP) → Sandbox (reversible)
        ↓
  AUTO-VERIFICADOR
    • 2º pase adversarial (LLM-as-judge, modelo distinto)
    • Tests deterministas (lint, typecheck, dry-run)
        ↓
  KILL-SWITCH AUTOMÁTICO
    disparado por invariantes violadas (NO por humano)
        ↓
  MEMORIA LEGIBLE (audit trail)
    vectorial + estructurada + logs
        ↓ (trazas asíncronas)
AUDITOR EX-POST (humano, revisa después)
```

## (3) Building blocks SOTA 2026

| Bloque | Función | Ejemplo open-source |
|---|---|---|
| LLM con function-calling | Núcleo de razonamiento | Qwen3 / Llama-4 / Mistral |
| MCP | Protocolo estándar de herramientas | Model Context Protocol |
| Vector DB | Memoria persistente | Qdrant / Chroma / pgvector |
| LangGraph / Pydantic-AI | Gestión de estado ligera | Orquestación mínima |
| Docker sandbox | Ejecución reversible | Aislamiento + undo |
| LLM-as-judge | Auto-verificador adversarial | 2º modelo, instrucción opuesta |
| Eval suite | Verificación determinista | Tests, lint, typecheck |
| Watchdog | Kill-switch automático | Invariantes → corte |

## (4) Mecanismo que reemplaza al human-in-loop

1. **Auto-verificador adversarial** — 2º pase LLM con instrucción de refutar. Reemplaza la duda del humano. [mechanistic]
2. **Reversibilidad por diseño** — toda acción compensable o sandboxed. El error no necesita humano; se deshace solo. [mechanistic]
3. **Kill-switches automáticos** — watchdog determinista corta al violar invariantes. No humano; invariante. [mechanistic]
4. **Memoria como espejo** — agente lee su historial, detecta divergencia intención/ejecución, se autocorrige. [heuristic]

## Límites honestos

🔴 **Imposible hoy:** acción física general, juicio ético fundamentado, auto-mejora sin deriva, aprendizaje en pesos, planificación >5-10 pasos fiable.

🟡 **Alcanzable SOLO con verificador objetivo:** código (tests), configs (validadores), SQL (dry-run). Sin verificador → ilusoria (LLM-judge alucina).

🟢 **Alcanzable con autonomía plena:** acciones reversibles en sandbox, tareas con señal de error automática, operaciones donde el error se deshace sin costo permanente.

## Compromisos aceptables
- Sin acción física autónoma
- Sin juicio ético autónomo fundamentado (sólo invariantes codificados ex-ante)
- Autonomía solo donde hay verificador objetivo
- Verificador comparte sesgos si es mismo modelo (mitigación: modelo distinto + métricas deterministas)

## Criterios de eliminación
- Auto-verificador >30% falsos negativos → no fiable, necesita humano/verificador externo
- Acción irreversible sin kill-switch causa daño >umbral → no autónomo en esa clase
- Memoria degrada >20% precisión en 90 días → podar o rediseñar

## Disidencia
**Sun Tzu**: workflow determinista fija verificación como chokepoint estratégico. No dealbreaker. Hipótesis a vigilar: si single-agent pierde control sin estructura, workflow gana.

## Aportes clave
- **Aristotle**: autonomía exige reversibilidad como causa final
- **Socrates**: autoverificación necesita criterio externo; reversible single-agent es el único honesto
- **Sun Tzu** [disidente]: workflow fija verificación como punto de control estratégico
- **Ada**: bucle cerrado acción→verificación→reversión determinista; minimiza espacio de estados
- **Aurelius**: reversibilidad convierte error en lección, no catástrofe
- **Machiavelli**: multi-agente = aliados que desertan en silencio
- **Lao Tzu**: autonomía nace de restar, no sumar
- **Feynman**: si no puedes deshacerlo, no lo toques
- **Torvalds**: autonomía = verificación automática + botón de retroceso
- **Karpathy**: frontera jagged; autonomía segura solo con señal de error automática
- **Sutskever**: autonomía sin verificación = transición de fase peligrosa; reversibilidad = opción de no morir
- **Kahneman**: planning fallacy + complejidad = error dominante; reversibilidad neutraliza aversión
- **Meadows**: reversibilidad es el punto de apalancamiento, no cantidad de actores
- **Munger**: para garantizar fracaso, añade agentes que nadie vigila y quita "deshacer"
- **Taleb**: Extremistan; reversibilidad = antifragilidad; via negativa elimina acoplamientos ocultos
- **Rams**: un agente, verificación, reversibilidad = lo mínimo que respeta al usuario

## Siguiente paso concreto
Construir prototipo: single-agent (LLM + MCP) + sandbox reversible (Docker + undo) + auto-verificador (2º LLM adversarial + tests) + kill-switch por invariantes. Probar 10 tareas con verificador objetivo. Medir: éxito, falsos negativos del verificador, tiempo de recuperación.

---
*Generado por /council --full (18 miembros, 3 rondas, autonomía máxima) · 5-jul-2026 · open-pax/documentos/14*
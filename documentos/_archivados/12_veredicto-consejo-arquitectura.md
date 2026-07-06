# Veredicto del Consejo — Arquitectura open-pax

> **Council of High Intelligence** · 6 miembros · 3 rondas · 5-jul-2026
> Fuente única de verdad sobre la decisión de arquitectura.

---

## Veredicto

🔴 **La arquitectura de 4 capas fue rechazada unánimemente.** Sobre-ingeniería para el hardware de Erik (7.7 GB RAM, 4 GB VRAM), presupuesto ~$0, operador principiante.

🟢 **Decisión óptima: 2 capas — n8n + LiteLLM/cerebropax.**

1. **n8n** — orquestación visual (R4: Erik ve el flujo). Cubre 91 tipo A + gran parte A+R vía HTTP.
2. **LiteLLM/cerebropax** — router único de modelos (laptop ≤4B + 2do equipo 14b + APIs free). Cubre 74 tipo R.

**LangChain, CrewAI y Letta se ELIMINAN como capas base.** Se añaden solo con evidencia medible de una capacidad real que los exija.

## Votación

| Opción | Peso | Votantes | Umbral |
|---|---|---|---|
| **2 capas (n8n+LiteLLM)** | 5.0 | Aristotle, Ada, Feynman, Torvalds, Meadows | ✅ 4.333 superado |
| 1 router (LiteLLM) | 1.5 | Karpathy [1.5× dominio] | |
| W_total 6.5 · umbral 4.333 · **consenso alcanzado** | | | |

## Compromisos aceptables
- Sin memoria episódica persistente al inicio (Letta postergado; emular con pgvector + archivos)
- RAG se escribe a mano (n8n + HTTP LiteLLM + pgvector)
- Multi-agente diferido (CrewAI → 1 LLM + prompt de roles)

## Criterios de eliminación (falsables)
- Si 3+ de 10 caps reales requieren memoria episódica que pgvector no resuelve → añadir Letta (antes 30-sep-2026)
- Si 1 cap A+R compleja no se resuelve con n8n+LiteLLM en 3 intentos → evaluar LangChain puntual (antes 15-oct-2026)
- Si n8n+LiteLLM superan 5 GB RAM residentes → recortar (al desplegar)

## Siguiente paso concreto
**Desplegar cerebropax (LiteLLM) en nube2 Frankfurt antes del 20-jul-2026.** Activa las 2 capas y permite implementar caps reales con evidencia.

## Pasos siguientes
1. Desplegar LiteLLM/cerebropax en nube2 (prioridad #1)
2. Reconectar n8n al endpoint LiteLLM
3. Erik elige 10 caps de mayor valor → implementar con n8n+LiteLLM puro
4. Medir: RAM, latencia, tasa de éxito por cap
5. Solo si una cap falla 3 veces → evaluar Letta o LangChain puntual

## Reglas de diseño adoptadas del consejo
- **Regla anti-inversión** (Meadows): workflows n8n llaman al cerebro LiteLLM; el cerebro NUNCA orquesta workflows. Una sola dirección de flecha. Verificable con grep.
- **Carga de prueba en quien añade complejidad** (Feynman/Torvalds): no se añade una capa/framework sin evidencia medible de que se necesita.
- **Scope inicial ~30 caps verificadas** (Meadows): no 316. Reducir al conjunto que Erik realmente usa.

## Disidencia registrada
**Karpathy (1.5×, asiento de dominio)**: la frontera A/R es borrosa y se mueve con prompt/modelo. Propuso 1 sola capa (router LiteLLM con degradación 4B→14B→API). No es dealbreaker, pero es la hipótesis a vigilar: si el router LLM bate workflows deterministas, n8n sería peso innecesario.

## Miembros y aportes clave
- **Aristotle**: la reclasificación 316-caps clasifica por método, no por naturaleza — riesgo de circularidad.
- **Ada**: LangChain y Letta+CrewAI son el mismo nivel formal (stateful transducers sobre LLM). Mínima cardinalidad = 2.
- **Feynman**: el solapamiento numérico (163+104+38+24 > 259) prueba no-ortogonalidad. Cada dependencia extra = RAM + debug.
- **Torvalds**: 4 capas = 4 stacks + 4 puntos de fallo para un principiante solo. Ship pequeño, medir, expandir.
- **Karpathy**: frontera A/R borrosa; router con degradación optimiza pérdida real, no taxonomía estática.
- **Meadows**: deuda de integración es el stock que colapsa el sistema. Reducir scope > elegir stack. Regla anti-inversión.

## Preguntas sin resolver (para Erik)
- ¿Qué 10 caps se implementan primero? (El consejo no las eligió — Erik decide por valor personal)
- ¿Letta ya desplegado se apaga o se mantiene como experimento?
- ¿La frontera A/R es nítida o borrosa? (Solo medible con caps reales)

---
*Generado por /council · 6 miembros · 3 rondas · 5-jul-2026 · open-pax/documentos/12*
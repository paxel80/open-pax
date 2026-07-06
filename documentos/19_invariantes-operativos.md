# Invariantes operativos

> Valores numéricos que el watchdog verifica automáticamente (R4).
> Definidos como **valores provisionales** — recalibrar tras primer loop autónomo.
> Creado: 5-jul-2026 · documentos/19

---

## Invariantes activos (Fase 1 — provisionales)

| # | Invariante | Valor inicial | Qué dispara el kill-switch | Recalibración |
|---|---|---|---|---|
| **I1** | Presupuesto diario de APIs | **$12 USD/día** (~$370/mes ÷ 30) | Pausar agente + notificar Erik por Telegram | Tras 7 días de uso real |
| **I2** | Blast radius (archivos tocables por acción) | **20 archivos por acción** | Bloquear acción + revertir sandbox | Tras primer loop end-to-end |
| **I3** | Tasa de error del verificador | **<15% falsos negativos** | Escalar a modo asistido (cola diferida) | Semanal |
| **I4** | Tasa de error del agente (acciones que requieren revert) | **<30% en ventana de 24h** | Pausar agente + auditoría ex-post de Erik | Diario |
| **I5** | Blast radius irreversibles | **0 por defecto** | Bloquear hasta definir dead-man's switch | Solo al añadir acciones irreversibles |

---

## Regla del verificador: familias distintas

> **Meadows (Consejo de pulido):** el auto-verificador adversarial y el actor deben ser **familias distintas de modelo**. Si ambos son Qwen3, el adversarial comparte sesgos y es teatro.

| Rol | Familia recomendada | Ejemplo |
|---|---|---|
| **Actor** (ejecuta) | Qwen3-abliterated | qwen3-abliterated:4b (local) o 14b (2do equipo) |
| **Verificador** (refuta) | Llama / DeepSeek / Claude | Groq llama-3.3-70b o DeepSeek-V3 o Claude Haiku |

El verificador NUNCA debe ser de la misma familia que el actor en la misma acción.

---

## DAG de dependencias de Fase 1

> El Consejo detectó que los 6 checkboxes de Fase 1 tienen un orden implícito no declarado.

```
1. Desplegar LiteLLM/cerebropax en nube2
   ↓ (sin esto no hay router de modelos)
2. Conectar Letta → LiteLLM (unificar gateway)
   ↓ (sin esto el agente no enruta)
3. Implementar sandbox reversible (Docker + git checkpoint)
   ↓ (sin esto no hay reversibilidad)
4. Implementar 1 tool MCP reversible mínimo (write_file con undo)
   ↓ (sin esto el agente no actúa)
5. Implementar auto-verificador (2º LLM adversarial + ruff/eval)
   ↓ (sin esto no hay verificación)
6. Implementar watchdog con invariantes (I1-I5 de esta tabla)
   ↓ (sin esto no hay kill-switch)
→ HITO: agente ejecuta tarea mínima autónoma end-to-end
```

---

## Tarea mínima de referencia (caso de prueba de Fase 1)

> Definida por el Consejo: 1 tarea concreta para validar el paradigma completo en miniature.

**Tarea:** "Crea un archivo `hola.py` con un print, pasa `ruff check`, si falla revierte con git, notifica resultado a Telegram."

| Paso | Componente | Verificador |
|---|---|---|
| 1. Erik envía "crea hola.py" por Telegram | Percibir (Letta) | Mensaje recibido |
| 2. Agente razona "necesito escribir archivo" | Razonar (LLM núcleo) | Plan generado |
| 3. Agente llama `write_file` tool | Actuar (MCP) | Archivo creado en sandbox |
| 4. Auto-verificador corre `ruff check` | Verificar | Resultado OK/fail |
| 5. Si fail → `git checkout` revierte | Reversibilidad | Archivo eliminado |
| 6. Agente notifica resultado a Telegram | Reportar | Mensaje enviado |

**Definición de "done" para Fase 1:** este loop se completa sin intervención humana, con trazas legibles en memoria, y el watchdog registra invariantes I1-I5 sin violaciones.

---

*documentos/19 · 5-jul-2026 · Invariantes provisionales — recalibrar tras primer loop*
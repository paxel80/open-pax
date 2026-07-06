# Roadmap de Ejecución — Fase 1: Núcleo autónomo

> **Fuente:** Veredicto del Consejo quick-mode (Torvalds 1.5× + Musashi + Feynman, 5-jul-2026).
> **Regla de Oro:** este documento va a disco. Nada se queda en la conversación.
> Creado: 5-jul-2026 · documentos/20

---

## Principios del roadmap (del Consejo)

1. **Cerebro antes que cuerpo** — sin LiteLLM desplegado y cableado a Letta, no hay agente que probar.
2. **Sandbox antes que tool** — la tool `write_file` escribe EN el sandbox; sin sandbox, violas I5 desde el día cero.
3. **Verificador determinista primero** — `ruff` cuesta $0 y no miente. El LLM adversarial miente ~15% (justo I3), así que va en Fase 2.
4. **Watchdog último, siempre** — un watchdog sin verificador que consultar es una alarma que no apaga nada, y peor, da falsa sensación de seguridad.
5. **Git es la reversibilidad** — todo el sandbox reversible se reduce a `git init` + `git reset --hard HEAD~1`. Docker con aislamiento completo va en Fase 2.
6. **0 paralelismo en 1A** — el cerebro es topología mecánica, no estratégica. 3a y 3b sí paralelizables (mismo builder, mismo filesystem).

---

## Orden de ejecución

```
FASE 1A — CEREBRO (secuencial, bloqueante)
  1. Desplegar LiteLLM/cerebropax en nube2
  2. Cablear Letta→LiteLLM
  → HITO: agente piensa con 12 proveedores vía gateway unificado

FASE 1B — CUERPO (paralelo, mismo bootstrap-builder)
  3a. Sandbox reversible (git init + cwd restricto)
  3b. Tool MCP write_file + undo (git reset --hard HEAD~1)
  → HITO: "crea hola.py" llega a disco y se puede revertir

FASE 1C — JUICIO MÍNIMO (secuencial tras 1B)
  4. Auto-verificador: subprocess ruff check
  ⚠️ LLM adversarial → Fase 2 (no bloquea Fase 1)
  → HITO: loop detectar→escribir→verificar→revertir→avisar CIERRA

FASE 1D — DEFENSA MÍNIMA (secuencial tras 1C)
  5. Watchdog mínimo: I5 (0 irreversibles) + logging
  ⚠️ Invariantes I1-I4 completos → Fase 2
  → ★ DEFINICIÓN DE "DONE": tarea mínima sin intervención humana
```

---

## Detalle por paso

### Paso 1 — Desplegar LiteLLM/cerebropax
- **Quién lo ejecuta:** bootstrap-builder (agente IA), no Erik
- **Dónde:** nube2 (Oracle Frankfurt 4vCPU ARM / 24GB)
- **Archivos ya listos:** `codigo/cerebropax/` (.env.example, config.yaml, docker-compose.yml, deploy.sh, test-cerebros.sh)
- **Qué falta:**
  1. Rellenar `.env` con claves reales (fuente: `recursos/bitacora/01_apis-llm.md`)
  2. Generar `LITELLM_MASTER_KEY` y `LITELLM_SALT_KEY`
  3. Ejecutar `bash deploy.sh` en nube2 vía Tailscale SSH
- **Verificación de éxito:** `curl http://<nube2>:4000/v1/models` responde con 23 modelos
- **Trampa a evitar:** desplegar sin `.env` real → placeholder vacío → proveedores fallan silenciosamente
- **Tiempo estimado:** ~30 min

### Paso 2 — Cablear Letta→LiteLLM
- **Quién lo ejecuta:** bootstrap-builder
- **Dónde:** nube1 (Oracle São Paulo)
- **Qué hacer:**
  1. En `codigo/letta/.env`, cambiar endpoint del modelo a `http://<nube2-tailscale-ip>:4000/v1`
  2. Cambiar API key a `LITELLM_MASTER_KEY` de cerebropax
  3. `docker compose restart letta` en nube1
- **Verificación de éxito:** Letta responde un chat usando un modelo de cerebropax (verificar en logs que enruta a 4000, no a OpenAI directo)
- **Trampa a evitar:** no verificar conectividad Tailscale entre nube1↔nube2 primero → timeout silencioso
- **Tiempo estimado:** ~2h (incluye debug de red si Tailscale falla)

### Paso 3a — Sandbox reversible
- **Quién lo ejecuta:** bootstrap-builder
- **Dónde:** nube2 (workspace con más RAM)
- **Qué crear:** `codigo/sandbox/` con:
  1. `git init` en un directorio `workspace/`
  2. Config restricta: el agente solo puede escribir dentro de `workspace/`
  3. Script `checkpoint.sh` que hace `git add -A && git commit -m "checkpoint $(date)"`
- **Verificación de éxito:** un write dentro de `workspace/` se puede deshacer con `git reset --hard HEAD~1`
- **Versión务工:** NO es Docker completo todavía. Es `git init` + cwd restricto. Docker con aislamiento de red va en Fase 2.
- **Trampa a evitar:** construir Docker completo ahora → over-engineering, pierdes 1 día (Feynman: "decorar la jaula antes de tener al animal")
- **Tiempo estimado:** ~1h

### Paso 3b — Tool MCP `write_file` + `undo`
- **Quién lo ejecuta:** bootstrap-builder
- **Dónde:** nube2, dentro de `codigo/mcp/` (crear carpeta)
- **Qué crear:** un servidor MCP mínimo en Python con 2 tools:
  - `write_file(path, content)` — escribe archivo dentro de `workspace/`, hace checkpoint
  - `undo()` — ejecuta `git reset --hard HEAD~1` para deshacer la última acción
- **Restricciones:**
  - `write_file` rechaza cualquier path fuera de `workspace/` (invariante I2: blast radius)
  - Llamada a `undo` registrada en log (invariante I5: 0 irreversibles)
- **Verificación de éxito:** desde el LLM núcleo, puedo llamar `write_file` y luego `undo` y el archivo desaparece
- **Tiempo estimado:** ~2h
- **Paralelizable con:** 3a (mismo builder, mismo filesystem — Musashi)

### Paso 4 — Auto-verificador (ruff solamente)
- **Quién lo ejecuta:** bootstrap-builder
- **Qué crear:** función `verify_py(filepath)` que:
  1. Corre `subprocess.run(["ruff", "check", filepath])`
  2. Retorna `{"pass": bool, "errors": [...]}`
- **Dónde se integra:** el LLM núcleo llama `verify_py` antes de declarar "done" una acción de escritura de código
- **Versión务工:** solo `ruff`. El 2º LLM adversarial (LLM-as-judge) va en Fase 2 — Feynman: el LLM miente 15%, ruff no miente y cuesta $0.
- **Verificación de éxito:** agente escribe `hola.py` con bug → `ruff` lo detecta → agente revierte con `undo` → notifica "fallo, revertido"
- **Trampa a evitar:** inventar los tests con LLM → deriva. ruff es determinista.
- **Tiempo estimado:** ~1h

### Paso 5 — Watchdog mínimo
- **Quién lo ejecuta:** bootstrap-builder
- **Qué crear:** `codigo/watchdog/` con:
  1. Hook que se ejecuta antes de cualquier `write_file`: verifica que el path esté en `workspace/` (I5: 0 irreversibles)
  2. `logging` estructurado de cada acción: timestamp, tool, args, resultado
- **Versión务工:** solo I5 + logging. Los invariantes I1 (presupuesto), I2 (blast radius full), I3 (falsos negativos del verificador LLM), I4 (tasa error 24h) requieren el verificador LLM adversarial → Fase 2.
- **Verificación de éxito:** intento de escribir fuera de `workspace/` se bloquea y se registra
- **Tiempo estimado:** ~1h

---

## Definición de "DONE" de Fase 1

La **tarea mínima de referencia** (`documentos/19`):

> "Erik envía por Telegram: 'crea hola.py con print'. El agente:
> 1. percibe el mensaje (Letta)
> 2. razona 'necesito escribir un archivo' (LLM núcleo vía cerebropax)
> 3. llama `write_file` (tool MCP) → escribe en sandbox
> 4. corre `ruff check` (auto-verificador)
> 5. si FAIL → llama `undo` (revierte) → notifica Telegram 'fallo, revertido'
> 6. si PASS → notifica Telegram 'done: hola.py creado'"
>
> **Sin intervención humana. Con trazas en memoria. Sin violar I5.**

**Tiempo total estimado:** ~7-8h de trabajo del bootstrap-builder.

---

## Qué NO hacer en Fase 1 (anti-over-engineering)

| ❌ No | Razón | Cuándo |
|---|---|---|
| Docker con aislamiento de red completo | git init + cwd basta para reversibilidad | Fase 2 |
| LLM adversarial (2º modelo que refuta) | miente 15%, ruff no miente y cuesta $0 | Fase 2 |
| Invariantes I1-I4 completos (presupuesto, blast radius, falsos negativos, tasa error) | requieren el verificador LLM para medirse | Fase 2 |
| Sub-agentes / multi-agente | un solo loop basta para "done" | Fase 2+ |
| Qdrant, LLaVA, LiveKit, browser-use | percepción/capacidad avanzada | Fase 2+ |
| UI / dashboard | Telegram es el panel de control de Erik | nunca (R11: TDAH) |

---

## Sesión del Consejo (metadatos)

```
schema_version: 1
mode: quick
panel_size: 3
rounds_run: 1  # tower/Musashi/Feynman convergieron en R1, no requirió R2
tools_used: yes  # agentes leyeron archivos del repo
input_tokens_estimate: ~8k
output_tokens_estimate: ~3k
duration_seconds: ~180
provider_count: 1  # Claude fallback (Windows, no routing)
fallbacks_triggered: none
chairman: coordinator fallback (single-provider)
domain_weight_seat: Torvalds (1.5×) — pura ingeniería/shipping
```

---

*documentos/20 · 5-jul-2026 · Roadmap de ejecución Fase 1 · Consejo quick (Torvalds 1.5× + Musashi + Feynman)*

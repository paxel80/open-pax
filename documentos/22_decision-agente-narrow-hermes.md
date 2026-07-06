# 22 · Decisión — agente narrow sobre Hermes (no Letta, no OpenClaw)

> **Fecha:** 6-jul-2026 · **Reencuadra** la decisión `04_decision-letta.md` (5-jul) porque el propósito de open-pax se aclaró: es el **asistente personal de Erik para ejecución+seguimiento de tareas** (TDAH + Altas Capacidades Cognitivas), NO un agente autónomo de 316 capacidades.

---

## 🎯 Propósito real de open-pax (re-encuadre)

Erik es **ACC (Altas Capacidades Cognitivas) + TDAH**:
- 🟢 Cerebro muy rápido generando ideas y conexiones (ACC).
- 🔴 Dificultad para **arrancar** tareas y **seguirlas** hasta cerrarlas (TDAH).

**open-pax = el empujón externo** que: (1) saca la 1 tarea que toca, (2) la parte en pasos cortos, (3) avisa por Telegram cada X minutos, (4) recuerda en qué quedó, (5) celebra lo cerrado. **No piensa por Erik — lo empuja a cerrar.**

Esto estrecha open-pax de 316 capacidades → **5 capacidades narrow de ejecución+seguimiento**, exactamente lo que el Council (doc 21) recomendó.

---

## 🥊 Comparación verificada en disco (rastreador, 6-jul-2026)

| | **Letta** | **OpenClaw** | **Hermes** ✅ |
|---|---|---|---|
| Qué es | Framework agentes con memoria (ex-MemGPT) | Predecesor de Hermes (Nous Research) | Sucesor de OpenClaw (Nous Research) |
| Estado en disco | Código listo, **NO desplegado** | **NO instalado**, solo guías + atajo .lnk roto | **🟢 INSTALADO** en `AppData\Local\hermes\` |
| Memoria persistente | 🟢 (pgvector) | — | 🟢 `state.db` + `memories\` vivos |
| Gateway Telegram nativo | 🔴 hay que construir `telegram-bridge.py` (🔴 dev-mode abierto) | — | 🟢 nativo (TG, Discord, Slack, WhatsApp, Signal) |
| **Cron (avisos TDAH)** | 🔴 construir | — | 🟢 nativo (`cron\`) |
| Sandboxes / kill-switches | 🔴 construir | — | 🟢 nativo (`sandboxes\`) |
| Skills auto-mejorables | 🔴 | — | 🟢 nativo (`skills\`) |
| Conectado a Zed (ACP) | 🔴 | — | 🟢 ya configurado |
| Costo de cambio | desplegar + construir bridge | instalar + migrar | **0 — ya está** |
| $0 / self-hosted | 🟢 | 🟢 | 🟢 |

**Veredicto técnico:** Hermes gana por knockout. Ya está instalado, hace nativamente todo lo que Letta+custom bridge tendrían que construir, y es el sucesor del OpenClaw que se evaluó como alternativa.

---

## ✅ Decisión: **Hermes** es el motor de open-pax

open-pax deja de ser "Letta + Telegram bridge custom + sandbox + watchdog a construir" y pasa a ser **"Hermes configurado para las 5 capacidades narrow de ejecución+seguimiento de Erik"**.

### Las 5 capacidades narrow (sobre Yésika primero, para empezar)

| # | Capacidad | Cómo vence TDAH+ACC | En Hermes |
|---|---|---|---|
| 1 | 📌 Sacar de `mi-tablero.html` la 1 tarea que toca hoy | quita "¿por dónde empiezo?" | skill que lee el tablero |
| 2 | 🪜 Partirla en pasos de 5-10 min | vence "no arranco porque es muy grande" | skill de planning loop |
| 3 | ⏰ Avisar por Telegram cada X min si no avanza | vence "me distraigo y se va el día" | **cron nativo** |
| 4 | 📝 Guardar en qué quedó entre sesiones | vence "mañana no recuerdo dónde iba" | **memoria persistente nativa** |
| 5 | ✅ Marcar hecho + celebrar + actualizar tablero | vence "no siento que avanzo" | skill que escribe en el tablero |

### El barbell 90/10 (sigue vigente, pero ahora sinérgico)

- **90% Yésika** = tu ingreso real ($3-5k/sem). Hermes te ayuda a **ejecutarla mejor**.
- **10% open-pax** = configurar Hermes para esas 5 capacidades, no construir infra.

**open-pax no compite con Yésika — la potencia.** Si Hermes te hace avanzar más rápido en Yésika, gana su lugar.

---

## 🚦 Plan de migración Letta → Hermes (pasos para TDAH, 1 a la vez)

> ⚠️ **Regla anti-TDAH:** no hagas los 5 pasos de golpe. **Uno por día**, marcado en `mi-tablero.html`. Si no cierras uno, no pases al siguiente.

### 🔴 Paso 0 (HOY, 10 min, independiente de Hermes) — cerrar Ollama 11434
El hallazgo explotable de la auditoría (doc 21). No cambia por esta decisión.
- `codigo/letta/docker-compose.yml:48-49` → `"127.0.0.0:11434:11434"`
- `letta/deploy.sh` → `sudo ufw deny 11434`
- 🔴 Si decides NO desplegar Letta (ver paso 4), esto queda como nota histórica.

### 🟢 Paso 1 — Verificar que Hermes gateway a Telegram está configurado
Verificar (no instalar — ya está):
```powershell
# Ver si Hermes tiene Telegram configurado
Get-Content "$env:LOCALAPPDATA\hermes\config.yaml" | Select-String -Pattern "telegram|channel|gateway"
# Ver si el gateway está corriendo
Get-Process | Where-Object Name -like "*hermes*"
```
- 🟢 Si Telegram está configurado → saltar al Paso 3.
- 🟡 Si no → Paso 2.

### 🟢 Paso 2 (solo si falta) — Conectar Hermes gateway a Telegram
Usar el bot que YA tienes (`@LaInconclusa80_bot`) pero con **token regenerado** (ver doc 21, 🔴 regenerar hoy).
- `hermes` CLI → configurar channel Telegram con el token nuevo.
- Probar: escribirle al bot desde tu Telegram, ver si responde.

### 🟢 Paso 3 — Crear la skill #1 de open-pax: "¿qué toca hoy?"
La capacidad más valiosa para tu TDAH. Skill que:
1. Lee `mi-tablero.html` (tu Kanban localStorage).
2. Saca la 1 tarea en "En progreso" o la más prioritaria de "Pendiente".
3. Te la manda por Telegram: *"Erik, hoy toca: [tarea]. ¿La parto en pasos? (sí/no)"*.
4. Si dices sí → skill #2 (partir en pasos de 5-10 min).

### 🟢 Paso 4 — Decidir qué hacer con Letta
Dos caminos, **UNA sola opción recomendada: archivar Letta**.
- 🟢 **Recomendado:** archivar `codigo/letta/` a `_archivados/letta-no-desplegado/` (no borrar, mover). Razón: Hermes ya hace todo lo que Letta haría, sin construir bridge custom.
- 🟡 Alternativa (solo si quieres 24/7 sin depender de laptop): desplegar Letta en VM Oracle SP. Pero Hermes también puede correr en VPS → mejor desplegar Hermes en VM si necesitas 24/7.
- 🔴 No recomendado: mantener los dos en paralelo = dispersión anti-TDAH.

### 🟢 Paso 5 — Conectar Hermes a `AGENTS.md` (Contexto-IA)
Para que Hermes sepa quién es Erik, sus proyectos, sus reglas. Skill que carga `paxel80\Contexto-IA\AGENTS.md` como system prompt.

---

## ⚠️ Cómo revisa esta decisión la auditoría (doc 21)

| Hallazgo auditoría (doc 21) | Con Hermes |
|---|---|
| 🔴 Ollama expuesto 11434 | Si archivas Letta → ya no aplica. Si no, sigue el Paso 0. |
| 🔴 `telegram-bridge.py` dev-mode abierto | 🟢 **desaparece** — Hermes tiene gateway nativo seguro |
| 🔴 `setup-agent.py` delete sin backup | 🟢 **desaparece** — no hay setup destructivo |
| 🔴 Letta endpoint 8283 sin auth | 🟢 **desaparece** |
| 🟢 Kill-switches/sandbox/watchdog a construir | 🟢 **ya vienen con Hermes** (`sandboxes\`, `cron\`, permisos) |
| 🔴 Regenerar claves (Telegram, OpenRouter, OpenCode) | 🟡 **sigue valiendo** — regenerar el bot token antes de conectarlo a Hermes |

**Conclusión:** mudar a Hermes **elimina 4 de los 6 hallazgos críticos** de la auditoría técnica porque no construyes el código inseguro — ya está hecho y maduro.

---

## 🗂️ Relación con tu ecosistema existente

```
   TU CEREBRO (ACC: ideas)
        │
        ▼
   LA ENCARGADA + 4 manos (eligen la tarea) ← ya las tienes en .claude/
        │
        ▼
   HERMES (motor de open-pax) ← este doc lo promueve a motor
   ├── memoria (recuerda en qué quedaste)        ← vence TDAH #4
   ├── cron (te avisa por Telegram)               ← vence TDAH #3
   ├── skills (parte en pasos / celebra)          ← vence TDAH #2,#5
   └── gateway Telegram (te llega al celular)     ← canal TDAH
        │
        ▼
   mi-tablero.html (tu Kanban) + AGENTS.md (verdad universal)
        │
        ▼
   RESULTADO (Yésika crece, otros proyectos no se pierden)
```

---

## ❓ Pendientes a verificar en la próxima sesión

1. ¿Hermes gateway a Telegram ya configurado o hay que hacerlo? (Paso 1-2)
2. ¿Hermes puede leer/escribir `mi-tablero.html` (localStorage) o necesita una API? Quizá haya que exponer el tablero como JSON.
3. ¿Hermes corriendo en laptop (se apaga de noche) o se muda a VM Oracle para 24/7?
4. ¿El vault `Hermes-brain` (OneDrive\Documents) es el plano a seguir? Releer su Roadmap.

---

## 📌 Estado de la decisión

- **Aprobado por auditoría:** esta decisión alinea técnica (ECC) + estrategia (Council) + propósito real (TDAH+ACC).
- **Reemplaza:** la elección de Letta en `04_decision-letta.md` (que queda como histórico de la evaluación original).
- **No toca:** la decisión de cerrar Ollama 11434 y regenerar claves del doc 21 — esas siguen vigentes HOY.

*22_decision-agente-narrow-hermes.md · 6-jul-2026 · Regla de Oro: nada en conversación, todo a disco.*
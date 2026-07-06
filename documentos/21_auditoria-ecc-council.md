# 21 · Auditoría open-pax — ECC (técnica) + Council (estratégica)

> **Fecha:** 6-jul-2026 · **Quién auditó:** framework ECC (subagentes especializados) + Council of High Intelligence (3 sabios + Chairman opus) · **Objeto:** paradigma open-pax (repo público `paxel80/open-pax`).
> **Aclaración de Erik:** tiene **4 nodos disponibles**, no 2: las 2 VMs Oracle Always Free (cuentas ajenas de amigos) **+ su celular (Xiaomi 14T Pro, nodo Tailscale) + su laptop (RTX 3050)**. Los 2 últimos son **propios**, no ajenos.

---

## 🎯 Panorama en 30 segundos (nivel "niño de 10 años")

Imagina que open-pax es un **robot aprendiz** que quieres dejar trabajando solo en un taller. Tres inspectores revisaron el taller y el robot por separado:

- 🟢 **El proyecto está bien pensado en el papel** (paradigma limpio, roadmap ordenado, secretos NO tirados a la calle).
- 🔴 **El taller tiene una puerta abierta al internet** (Ollama expuesto) y **claves tiradas por los muebles** (varias regenerables).
- 🔴 **El robot aún no tiene cinturón de seguridad** (no hay kill-switch, ni auto-verificador, ni watchdog implementados — todo está en Fase 1, pendiente).
- 🟡 **Yésika gana dinero real HOY** ($3-5k/sem); open-pax genera $0. El tiempo de Erik es el recurso más escaso.

**Una sola opción recomendada →** Ver final (sección 🎯 Veredicto único).

---

## 🧭 Mapa de los 4 nodos de Erik (corrección del sustrato)

```
                  ┌───────────────────────────────────────────┐
                  │            MALLA TAILSCALE (privada)        │
                  └───────────────────────────────────────────┘
   🟢 PROPIO          🟢 PROPIO           🟡 AJENO (amigo)         🟡 AJENO (amigo)
   LAPTOP             CELULAR             VM ORACLE SP             VM ORACLE FRA
   RTX 3050 4GB       Xiaomi 14T          A1 4/24 ARM              A1 4/24 ARM
   qwen3-ablit:4b     3.6GB RAM           Letta+memoria 🟥SPoF    LiteLLM (cerebropax)
   40-60 t/s          nodo ligero         Ollama expuesto 🔴       23 modelos
   (se apaga noche)   (siempre on)        (baneable)               (baneable)
```

- 🟢 **Laptop + celular = sustrato PROPIO** → aquí caben experimentos reversibles sin pedir permiso a nadie.
- 🟡 **2 VMs Oracle = sustrato AJENO y revocable** (cuentas de amigos; Always Free baneable sin aviso).
- 🟥 **Single Point of Failure real:** la memoria del agente (Letta + pgvector) vive **solo en SP**. Si SP cae, el agente pierde la memoria.

> **Implicancia para el veredicto:** la fragilidad "de sustrato" que Taleb marcó como dealbreaker **se mitiga** — Erik tiene 2 nodos propios donde experimentar sin depender de los ajenos. Pero la VM propia **barata y 24/7** no existe aún (la laptop se apaga de noche); ahí sí sigue la recomendación de migrar lo irreversible a sustrato propio antes de desplegarlo.

---

## 🔒 DIMENSIÓN TÉCNICA — ECC (subagentes)

### 🧱 Arquitectura (ecc:architect)

| Pilar del paradigma | En producción hoy | Semáforo |
|---|---|---|
| Single-agent + memoria legible | Letta desplegado en SP ✅ | 🟢 |
| Tool-calling MCP | No cableado aún | 🔴 pendiente Fase 1B |
| Auto-verificador adversarial (familia distinta) | No existe | 🔴 pendiente Fase 1C |
| Sandbox reversible | No existe (solo `git init` planeado) | 🟡 pendiente Fase 1B |
| Kill-switches por invariantes (I1-I5) | No implementados | 🔴 pendiente Fase 1D |

- **Coherencia paradigma-vs-desplegado:** 🟡 solo 2/5 pilares en producción. El paradigma es ambicioso; el código está en Fase 0→1.
- **Single points of failure:** 🔴 (a) nube1 SP concentra Letta + memoria; (b) guard de presupuesto I1 ausente en Fase 1.
- **Roadmap:** 🟢 bien ordenado (LiteLLM → Letta↔LiteLLM → sandbox → tool → ruff → watchdog).
- **Escalabilidad del single-agent:** 🟡 razonable hasta ~50-80 capacidades; 316 es hubris.

### 🐍 Código Python (ecc:python-reviewer) — veredicto: BLOQUEAR Fase 1

| Invariante | Estado | Hallazgo crítico |
|---|---|---|
| Reversibilidad | 🔴 | `setup-agent.py:79-83` y `setup-agent-remote.py:79-83` hacen `client.delete(f"/v1/agents/{old_id}/")` **sin backup** = destrucción irreversible de memoria. |
| Auto-verificación | 🔴 | No existe todavía (esperable, Fase 1C). |
| Kill-switch | 🔴 | Telegram bridge sin kill-switch, sin rate-limit, sin guard de presupuesto. |
| Idempotencia | 🟡 | Race condition en `_agent_id`; `httpx.AsyncClient` nunca cerrado. |
| Robustez | 🔴 | `add_model_internal.py:13-28` AttributeError garantizado si provider ollama no existe; `setup-model.py` sin `raise_for_status` ni try/except. |
| Cadena de suministro | 🔴 | `letta/deploy.sh:25` ejecuta `curl -fsSL https://get.docker.com \| sh` (pipe-to-shell desde internet). |

### 🔐 Seguridad (ecc:security-reviewer) — el informe más duro

**Lo bueno (🟢):**
- `.gitignore` correcto: excluye `.env`, `*.key`, `*.pem`. Verificado: los `.env` reales **NO están commiteados**.
- Historial git **limpio de claves reales** (137 blobs revisados en 8 commits; solo `.env.example` con placeholders).
- LiteLLM con `master_key` + `ui_token` ✅.
- `cerebropax/deploy.sh` restringe puerto 4000 a Tailscale con ufw ✅.

**Lo malo (🔴 crítico, explotable AHORA):**

| # | Hallazgo | Dónde | Severidad |
|---|---|---|---|
| S1 | **Ollama expuesto al internet público** (`11434:11434` en `0.0.0.0`, sin ufw). Cualquiera en internet puede usar tu CPU ARM, cargar modelos, llenar el disco. | `letta/docker-compose.yml:48-49` | 🔴 EXPLOTABLE HOY |
| S2 | `telegram-bridge.py` en "dev mode abierto": si `ALLOWED_USERS` está vacío, **TODOS** controlan el agente autónomo. | `telegram-bridge.py:130` | 🔴 |
| S3 | Letta endpoint 8283 **sin auth** (solo `127.0.0.1` lo protege; dentro de la red Docker está abierto). | `letta/docker-compose.yml` | 🔴 |

**Lo regular (🟡):**
- `.env` reales en disco con **14+ secretos** — no están en git, pero un `git add .` accidental los publicaría al repo público (y ya le pasó con OpenRouter).
- `POSTGRES_PASSWORD=paxel_secure_db_letta_2026` — débil y adivinable.
- `recursos/bitacora/01_apis-llm.md` (commiteado) filtra **metadatos**: rutas absolutas del disco de Erik, número de claves por proveedor, mención de "clave expuesta en git histórico". Es **inteligencia de objetivo** para un atacante.
- Sin rate-limiting en el bot → vector de gasto de saldo.

**Claves que hay que regenerar (orden por urgencia):**
1. 🔴 `TELEGRAM_BOT_TOKEN` (controla el agente autónomo) → `@BotFather`, revocar y recrear.
2. 🔴 `OPENROUTER_API_KEY` (tu bitácora la marca como expuesta en histórico) → openrouter.ai/keys.
3. 🔴 `OPENCODE_API_KEY` (letta/.env) → regenerar.
4. 🔴 LITELLM_MASTER_KEY, LITELLM_UI_TOKEN, LITELLM_SALT_KEY, LITELLM_DB_PASSWORD → rotar.
5. 🟡 Las 11 claves LLM de `cerebropax/.env` (Groq×2, NVIDIA, DeepSeek, Gemini, Cerebras, Mistral, Cohere, HF, OpenAI) → regenerar por higiene.

> **Próximo paso técnico único:** cerrar Ollama 11434 al internet. Es el único hallazgo explotable **ahora mismo sin que Erik cometa un error futuro**. Cambio de 1 línea en el compose + 1 regla ufw.

---

## 🧠 DIMENSIÓN ESTRATÉGICA — Council of High Intelligence

**Panel (modo quick, 2 rondas):** Sutskever (scaling + AI safety, asiento 1.5× de dominio) · Taleb (antifragilidad + tail risk) · Munger (multi-model + economía). **Chairman:** opus.

### Veredicto unánime sustantivo (los 3 coinciden)
1. Propósito general 316-capacidades = **hubris en 2026**.
2. open-pax solo como **laboratorio supervisado de loop corto (1-5 pasos reversibles)**, no agente autónomo fuera del lazo.
3. **Erik DENTRO del lazo** hasta que el watchdog sobreviva 30 días adversariales.
4. **Yésika prioritario** en tiempo y dinero (barbell 90/10).
5. **Regenerar las claves YA** — anterior a todo lo demás.

### Split real (lo que no decidieron)
**¿Exigir VM propia antes de Fase 1, o solo antes de despliegue irreversible?**
- Taleb: sí (fragilidad en el sustrato revocable). Dealbreaker.
- Sutskever: no (confunde riesgo de despliegue con riesgo de investigación; para reversibles, el blast radius son las credenciales, no la VM).
- Munger: split — irreversible sí, reversible no.

**El Consejo no lo decide** porque falta un dato: **¿cuánto cuesta/demora migrar a VM propia vs. probabilidad real de baneo en 30-60 días?**

### Cómo cambia la aclaración de Erik (4 nodos, no 2)
Con laptop + celular propios disponibles, **la postura de Sutskever gana peso**: Erik puede correr experimentos reversibles en sustrato propio (laptop) sin tocar las VMs ajenas. El dealbreaker de Taleb se suaviza — **no** exige migrar toda Fase 1 a VM propia, solo lo irreversible. La laptop se apaga de noche, así que para 24/7 sí se necesita la VM, pero para aprender el paradigma basta el sustrato propio diurno.

### Vote Tally (Sutskever 1.5×)
- `open-pax-barbell-90-10` — 2.0 (Taleb, Munger)
- `open-pax-laboratorio-loop-corto` — 1.5 (Sutskever [1.5×])
- W_total 3.5 · umbral 2/3 = 2.333 · **ninguna supera → split en el label, consenso en el contenido**.

### Kill Criteria del Council
Si para 2026-08-06 (30 días) ocurre cualquiera: (a) watchdog no sobrevive 30 días adversariales sin intervención humana; (b) open-pax consume >10% del tiempo de Erik sin aprendizajes transferibles a Yésika; (c) una VM Always Free baneada sin redundancia; (d) claves expuestas siguen sin regenerar → **veredicto invalidado, pausar open-pax, 100% a Yésika**.

---

## 🎯 Veredicto único (la UNICA opción recomendada)

> **Barbell 90/10 + estrechar open-pax a agente narrow de ≤5 capacidades sobre Yésika, en sustrato propio (laptop) para reversibles y VM propia solo para lo irreversible.**

**Tres pasos en orden, el primero hoy:**

1. 🔴 **HOY (10 min):** cerrar Ollama 11434 al internet en la VM SP.
   - Editar `codigo/letta/docker-compose.yml:48-49` → `"127.0.0.1:11434:11434"` (o quitar `ports:`).
   - Sumar `sudo ufw deny 11434` en `letta/deploy.sh`.
2. 🔴 **ESTA SEMANA:** regenerar Telegram bot token + OpenRouter key + OpenCode key + rotar las 4 LITELLM_*. Mover Anthropic a un vault fuera del repo.
3. 🟢 **DESPUÉS:** construir **1 agente narrow de 5 capacidades sobre Yésika** (no 316), en la laptop primero (sustrato propio, reversible), con Erik dentro del lazo, watchdog con kill-switch I1-I5, y solo cuando el watchdog pase 30 días adversariales → considerar migrar lo irreversible a una VM propia.

### Lo que este veredicto sacrifica (lo aceptas al aceptar el veredicto)
- La ambición de "propósito general 316-capacidades" — se estrecha a 5.
- La velocidad de Fase 1 — el loop corto 1-5 pasos y Erik en el lazo reducen el throughput.
- El valor de aprendizaje de un despliegue irreversible temprano — se pospone hasta watchdog probado.

### Kill switch del propio veredicto
Si en 30 días (2026-08-06): open-pax se traga >10% de tu tiempo sin transferir aprendizaje a Yésika, O se banea una VM sin redundancia, O las claves siguen sin regenerar → **pausa open-pax por completo, 100% a Yésika.**

---

## 📌 Estado global por semáforo

| Área | Estado | Acción inmediata |
|---|---|---|
| Secretos en git | 🟢 limpios | — |
| Ollama expuesto | 🔴 explotable hoy | **cerrar puerto hoy** |
| Telegram dev-mode | 🔴 | invertir lógica `is_authorized` |
| Claves en disco | 🔴 regenerables | regenerar esta semana |
| Paradigma (papel) | 🟢 coherente | mantener |
| Pilares en producción | 🟡 2/5 | seguir Fase 1 |
| Código Python robustez | 🔴 bloquear | arreglar delete sin backup, errores sin try |
| Estrategia (Council) | 🟢 consenso | barbell 90/10, agente narrow, Yésika primero |
| Sustrato | 🟡 mixto | laptop+célular propios para reversibles |

---

## 🗂️ Anexos (evidencia en disco)

- **ECC arquitecto:** dictamen de coherencia paradigma-vs-desplegado, SPOFs, roadmap.
- **ECC python-reviewer:** veredicto BLOQUEAR Fase 1, tabla de invariantes, hallazgos por archivo:línea.
- **ECC security-reviewer:** 14 acciones priorizadas, inventario de 14+ secretos, rutas absolutas.
- **Council Chairman (opus):** Quick Verdict completo con Kill Criteria, Concrete Next Step, Acceptable Compromises.
- **Scan git propio:** confirmación de que los `.env` reales NO están commiteados (solo `.env.example` con placeholders).

**Archivos clave referenciados:**
- `C:\Users\erikj\Laboratorio\open-pax\codigo\letta\docker-compose.yml:48-49` (Ollama expuesto)
- `C:\Users\erikj\Laboratorio\open-pax\codigo\letta\telegram-bridge.py:130` (dev-mode)
- `C:\Users\erikj\Laboratorio\open-pax\codigo\letta\setup-agent.py:79-83` (delete irreversible)
- `C:\Users\erikj\Laboratorio\open-pax\codigo\letta\setup-agent-remote.py:79-83` (idem)
- `C:\Users\erikj\Laboratorio\open-pax\codigo\letta\add_model_internal.py:13-28` (AttributeError)
- `C:\Users\erikj\Laboratorio\open-pax\codigo\letta\setup-model.py:8-49` (sin raise_for_status)
- `C:\Users\erikj\Laboratorio\open-pax\codigo\letta\deploy.sh:25` (pipe-to-shell)
- `C:\Users\erikj\Laboratorio\open-pax\codigo\cerebropax\docker-compose.yml:24` (puerto 4000)
- `C:\Users\erikj\Laboratorio\open-pax\recursos\bitacora\01_apis-llm.md` (metadata sensible commiteada)

---

### Session Metadata (Council)
```
schema_version: 1
mode: quick
panel_size: 3
rounds_run: 2
tools_used: no
provider_count: 1
fallbacks_triggered: none
chairman: opus (anthropic · opus · single-provider fallback · Claude Max costo marginal ~$0)
```

*21_auditoria-ecc-council.md · 6-jul-2026 · Regla de Oro: nada en conversación, todo a disco.*
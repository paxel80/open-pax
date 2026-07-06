# 🧠 Ficha 1 — APIs de cerebros (LLM)

> **recursospax / bitacora** — Registro maestro de todas las APIs de modelos
> de lenguaje disponibles para open-pax.
> Última actualización: **6-jul-2026** (claves regeneradas + verificadas vía LiteLLM)

---

## 📋 Resumen rápido

| # | Proveedor | Tipo | Costo | Clave(s) encontrada(s) | Dónde está | Semáforo |
|---|---|---|---|---|---|---|
| 1 | **Groq** | Gratis | $0 | ✅ regenerada | `/opt/cerebropax/.env` | 🟢 verificado vía LiteLLM |
| 2 | **NVIDIA NIM** | Gratis | $0 | ⚠️ 2 claves distintas | `.nvidia/nvidia.env` + `keys.env` | 🟡 por probar |
| 3 | **DeepSeek** | Pago prepago | centavos | ✅ regenerada | `/opt/cerebropax/.env` | 🟢 verificado vía LiteLLM |
| 4 | **Google Gemini** | Free tier | $0 | ✅ 6 claves regeneradas | `/opt/cerebropax/.env` | 🟡 claves válidas, quota 429 (se renueva) |
| 5 | **Cerebras** | Gratis | $0 | ✅ verificada | `/opt/cerebropax/.env` | 🟢 verificado vía LiteLLM (modelos: gpt-oss-120b, zai-glm-4.7, gemma-4-31b) |
| 6 | **Mistral** | Free tier | $0 | ✅ 1 clave | `keys.env` | 🟡 por probar |
| 7 | **Cohere** | Trial | $0 | ✅ 1 clave | `keys.env` | 🟡 por probar |
| 8 | **HuggingFace** | Gratis | $0 | ✅ 1 clave | `keys.env` | 🟡 por probar |
| 9 | **OpenRouter** | Free + pago | variable | ✅ 1 clave | `keys.env` | 🟡 (⚠️ expuesta en histórico git, regenerar) |
| 10 | **OpenAI** | Pago prepago | $-$$$ | ✅ 1 clave | `PentAGI/.env` | 🔴 no sabemos saldo |
| 11 | **Anthropic** | Pago prepago | $$-$$$ | ✅ 1 clave | `curl revelation` (5-jul) ← NUNCA en git | 🟡 clave existe, sin saldo conocido |
| 12 | **Ollama SP** | Local | $0 | — (sin clave) | Oracle SP, llama3.1:8b | 🟢 corriendo |
| 13 | **Ollama laptop** | Local | $0 | — (sin clave) | RTX 3050, qwen3-abliterated:4b | 🟢 corriendo |

---

## 🔍 Ficha por proveedor

### 1. Groq 🟡

| Campo | Valor |
|---|---|
| **Plataforma** | [console.groq.com](https://console.groq.com) |
| **Modelos principales** | `llama-3.3-70b-versatile`, `llama-3.1-8b-instant`, `mixtral-8x7b-32768` |
| **Tipo de cuenta** | Free tier (límite por minuto/día, generoso) |
| **Costo** | $0 |
| **Límite de uso** | ~30 RPM / ~14k TPM (aproximado, ver portal) |
| **Saldo** | N/A (gratuito) |
| **Cuenta creada** | ⚠️ fecha desconocida — revisar `console.groq.com` |
| **Última verificación** | 🔴 nunca probada desde LiteLLM |
| **Llave detectada** | ✅ `GROQ_API_KEY` presente |
| **Dónde está la clave** | **2 lugares:** |
| | 1. `C:\Users\erikj\Laboratorio\open-pax\codigo\letta\.env` ← **en uso por Letta hoy** |
| | 2. ~~`keys.env`~~ ← ⚠️ NO aparece en `keys.env` (era esperada) |
| **Clave canónica** | La de `letta/.env` (está funcionando con Letta ya) |
| **⚠️ Notas** | Letta ya la usa para responder por Telegram. Si la misma clave se usa en LiteLLM + Letta simultáneamente puede pegarle al rate limit compartido. LiteLLM debería usar su propia copia en `/opt/cerebropax/.env`. |

### 2. NVIDIA NIM 🟡

| Campo | Valor |
|---|---|
| **Plataforma** | [build.nvidia.com](https://build.nvidia.com) |
| **Modelos principales** | `qwen/qwen3-next-80b-a3b-instruct`, `nvidia/llama-3.1-nemotron-70b-instruct` (~121 modelos gratis) |
| **Tipo de cuenta** | Free tier (créditos gratuitos generosos) |
| **Costo** | $0 |
| **Límite de uso** | ⚠️ revisar portal (créditos gratis renovables) |
| **Saldo** | ⚠️ desconocido — revisar `build.nvidia.com` |
| **Cuenta creada** | ⚠️ fecha desconocida |
| **Última verificación** | 🔴 nunca probada desde LiteLLM |
| **Llave detectada** | ✅ `NVIDIA_API_KEY` presente — ⚠️ pero **hay 2 claves distintas** |
| **Dónde está la clave** | **2 fuentes, 2 claves DIFERENTES:** |
| | 1. `C:\Users\erikj\.nvidia\nvidia.env` → `nvapi-OF-...` ← la más reciente/usada |
| | 2. `C:\Users\erikj\.llmkeys\keys.env` → `nvapi-DQ...` |
| **Clave canónica** | **La de `.nvidia/nvidia.env`** (`.nvidia/nvidia.env` tiene además `NVIDIA_BASE_URL`, parece la configuración completa) |
| **⚠️ Notas** | ⚠️ 2 claves distintas = 2 cuentas o 1 cuenta con 2 keys rotadas. La de `.nvidia` es la recomendada para LiteLLM. La de `keys.env` puede ser vieja o de otra cuenta. Verificar cuál funciona primero. |

### 3. DeepSeek 🟡

| Campo | Valor |
|---|---|
| **Plataforma** | [platform.deepseek.com](https://platform.deepseek.com) |
| **Modelos principales** | `deepseek-chat`, `deepseek-coder`, `deepseek-reasoner` |
| **Tipo de cuenta** | Prepago (recargas en yuanes CNY) |
| **Costo** | ~$0.14/M tokens input, ~$0.28/M tokens output |
| **Límite de uso** | Hasta que se acabe el saldo |
| **Saldo** | 🔴 **desconocido** — revisar en `platform.deepseek.com` → Billing |
| **Cuenta creada** | ⚠️ fecha desconocida — revisar portal |
| **Última recarga** | 🔴 desconocido |
| **Gasto promedio/mes** | 🔴 desconocido (nunca se midió, era uso manual esporádico) |
| **Última verificación** | 🔴 nunca probada desde LiteLLM |
| **Llave detectada** | ✅ `DEEPSEEK_API_KEY` presente — ⚠️ **hay 2 claves distintas** |
| **Dónde está la clave** | **2 fuentes, 2 claves DIFERENTES:** |
| | 1. `C:\Users\erikj\.llmkeys\keys.env` → `sk-6112...` |
| | 2. `C:\Users\erikj\Downloads\installer-latest\.env` (PentAGI) → `sk-9272...` |
| **Clave canónica** | **Pendiente decidir:** probar ambas con LiteLLM y ver cuál tiene saldo. La de `keys.env` es la más antigua documentada. |
| **⚠️ Notas** | Gasta centavos reales. ⚠️ Regel R2: "si rinde 10x se usa, si no, se descarta". Correr `test-cerebros.sh` para DeepSeek nos dirá si la clave funciona. Luego entrar al portal a ver saldo. |

### 4. Google Gemini 🟡

| Campo | Valor |
|---|---|
| **Plataforma** | [aistudio.google.com](https://aistudio.google.com) / [makersuite.google.com](https://makersuite.google.com) |
| **Modelos principales** | `gemini-2.0-flash-001`, `gemini-2.5-flash` |
| **Tipo de cuenta** | Free tier (generoso, límite por día) |
| **Costo** | $0 |
| **Límite de uso** | ~1500 RPM / ~1M TPM (aproximado en free tier) |
| **Saldo** | N/A (gratuito) |
| **Cuenta creada** | ⚠️ fecha desconocida |
| **Última verificación** | 🔴 nunca probada desde LiteLLM |
| **Llave detectada** | ✅ `GEMINI_API_KEY` presente |
| **Dónde está la clave** | **1 lugar:** `C:\Users\erikj\Downloads\installer-latest\.env` (PentAGI) |
| **Clave canónica** | La de PentAGI `.env` (única encontrada) |
| **⚠️ Notas** | Único cerebro que ve imágenes (multimodal). Clave solo en carpeta Downloads — respaldar a `/opt/cerebropax/.env`. PentAGI puede estar usando la misma clave si corre. |

### 5. Cerebras 🟡

| Campo | Valor |
|---|---|
| **Plataforma** | [cloud.cerebras.ai](https://cloud.cerebras.ai) |
| **Modelos principales** | `llama3.1-8b`, `llama3.1-70b` |
| **Tipo de cuenta** | Free tier (beta abierta) |
| **Costo** | $0 |
| **Límite de uso** | ⚠️ revisar portal (generoso en beta) |
| **Saldo** | N/A (gratuito) |
| **Cuenta creada** | ⚠️ fecha desconocida |
| **Última verificación** | 🔴 nunca probada desde LiteLLM |
| **Llave detectada** | ✅ `CEREBRAS_API_KEY` presente |
| **Dónde está la clave** | **1 lugar:** `C:\Users\erikj\.llmkeys\keys.env` |
| **Clave canónica** | La de `keys.env` |
| **⚠️ Notas** | Rival de Groq en velocidad. Si Groq cae, Cerebras es el failback rápido. |

### 6. Mistral 🟡

| Campo | Valor |
|---|---|
| **Plataforma** | [console.mistral.ai](https://console.mistral.ai) |
| **Modelos principales** | `mistral-large-latest`, `codestral-latest` |
| **Tipo de cuenta** | Free tier (plan "Experiment") |
| **Costo** | $0 |
| **Límite de uso** | 1 request/sec, límite tokens gratis |
| **Saldo** | N/A (gratuito) |
| **Cuenta creada** | ⚠️ fecha desconocida |
| **Última verificación** | 🔴 nunca probada desde LiteLLM |
| **Llave detectada** | ✅ `MISTRAL_API_KEY` presente |
| **Dónde está la clave** | **1 lugar:** `C:\Users\erikj\.llmkeys\keys.env` |
| **Clave canónica** | La de `keys.env` |
| **⚠️ Notas** | Europeo. `codestral` es bueno para código. Free tier limitado pero útil como respaldo de código. |

### 7. Cohere 🟡

| Campo | Valor |
|---|---|
| **Plataforma** | [dashboard.cohere.com](https://dashboard.cohere.com) |
| **Modelos principales** | `command-r-plus`, `command-r` |
| **Tipo de cuenta** | Trial (créditos gratuitos limitados) |
| **Costo** | $0 (trial) → después pago |
| **Límite de uso** | ⚠️ créditos de trial — revisar cuánto queda |
| **Saldo** | 🔴 **desconocido** — revisar dashboard.cohere.com |
| **Cuenta creada** | ⚠️ fecha desconocida |
| **Caducidad trial** | 🔴 **desconocida** — revisar dashboard |
| **Última verificación** | 🔴 nunca probada desde LiteLLM |
| **Llave detectada** | ✅ `COHERE_API_KEY` presente |
| **Dónde está la clave** | **1 lugar:** `C:\Users\erikj\.llmkeys\keys.env` |
| **Clave canónica** | La de `keys.env` |
| **⚠️ Notas** | Trial → algún día caduca o se acaban los créditos. Bueno para RAG y embeddings pero **no crítico**. Si se muere no pasa nada. |

### 8. HuggingFace 🟡

| Campo | Valor |
|---|---|
| **Plataforma** | [huggingface.co/settings/tokens](https://huggingface.co/settings/tokens) |
| **Modelos principales** | `mistralai/Mistral-7B-Instruct-v0.3` (via Inference API) |
| **Tipo de cuenta** | Gratis (Inference API free tier, rate limit bajo) |
| **Costo** | $0 |
| **Límite de uso** | ~30k tokens/mes gratis, lento |
| **Saldo** | N/A (gratuito) |
| **Cuenta creada** | ⚠️ fecha desconocida |
| **Última verificación** | 🔴 nunca probada desde LiteLLM |
| **Llave detectada** | ✅ `HUGGINGFACE_API_KEY` presente |
| **Dónde está la clave** | **1 lugar:** `C:\Users\erikj\.llmkeys\keys.env` |
| **Clave canónica** | La de `keys.env` |
| **⚠️ Notas** | Muy lento y limitado. Solo para experimentos o modelos raros que no están en OpenRouter. **No usar para producción.** |

### 9. OpenRouter 🟡 (⚠️ expuesta)

| Campo | Valor |
|---|---|
| **Plataforma** | [openrouter.ai/keys](https://openrouter.ai/keys) |
| **Modelos principales** | 100+ modelos (auto-router, Claude, Llama, etc.) |
| **Tipo de cuenta** | Free tier + pago por uso |
| **Costo** | Variable (modelos gratis = $0, modelos pago = margen OpenRouter) |
| **Límite de uso** | Ilimitado para modelos gratis, crédito para pagos |
| **Saldo** | 🔴 **desconocido** — revisar `openrouter.ai/settings/billing` |
| **Cuenta creada** | ⚠️ fecha desconocida |
| **Última verificación** | 🔴 nunca probada desde LiteLLM |
| **Llave detectada** | ✅ `OPENROUTER_API_KEY` presente |
| **Dónde está la clave** | **1 lugar:** `C:\Users\erikj\.llmkeys\keys.env` |
| **Clave canónica** | La de `keys.env` |
| **🚨 ALERTA DE SEGURIDAD** | Esta clave aparece en `keys.env` (archivo local) pero según la sesión 1 de cerebropax: **⚠️ "clave expuesta en git histórico, regenerar"**. Si alguna vez se commiteó un `.env` con esta clave a GitHub, **cualquiera puede estar usándola**. |
| **⚠️ Acción urgente** | 1. Entrar a [openrouter.ai/keys](https://openrouter.ai/keys). 2. **Revocar** la clave actual. 3. **Generar** una nueva. 4. Actualizar `keys.env` y `/opt/cerebropax/.env`. 5. Verificar billing por si hubo uso no autorizado. |
| **⚠️ Notas** | "El súper mercado": cubre modelos que no tenemos directo (Anthropic Claude, Llama 405B, etc.). Pero los modelos directos (Groq, NVIDIA) no pagan margen → mejor usar directo cuando se pueda. |

### 10. OpenAI 🟡 (pago, saldo desconocido)

| Campo | Valor |
|---|---|
| **Plataforma** | [platform.openai.com](https://platform.openai.com) |
| **Modelos principales** | `gpt-4o`, `gpt-4o-mini` |
| **Tipo de cuenta** | Prepago (pay-as-you-go) |
| **Costo** | $5-15/M tokens (caro) |
| **Límite de uso** | Hasta que se acabe el saldo o el límite mensual |
| **Saldo** | 🔴 **desconocido** — revisar `platform.openai.com/settings/organization/billing` |
| **Cuenta creada** | ⚠️ fecha desconocida |
| **Última recarga** | 🔴 desconocido |
| **Gasto promedio/mes** | 🔴 desconocido |
| **Última verificación** | 🔴 nunca probada desde LiteLLM |
| **Llave detectada** | ✅ `OPEN_AI_KEY` presente |
| **Dónde está la clave** | **1 lugar:** `C:\Users\erikj\Downloads\installer-latest\.env` (PentAGI) |
| | ⚠️ El nombre de variable es `OPEN_AI_KEY` (no `OPENAI_API_KEY`). En `cerebropax/config.yaml` se espera `${OPENAI_API_KEY}` → hay que alinear nombres. |
| **Clave canónica** | La de PentAGI `.env` (única encontrada) |
| **⚠️ Notas** | ⚠️ **Es la única API que cuesta dinero real.** Usar solo con `interrupt_on` (R6) y solo para tareas calidad-tope que lo justifiquen. El expediente padre estima $5-25 por sesión de construcción. ⚠️ Verificar saldo antes de usar. |

### 11. Anthropic 🟡 (pago, saldo desconocido)

| Campo | Valor |
|---|---|
| **Plataforma** | [console.anthropic.com](https://console.anthropic.com) |
| **Modelos principales** | `claude-sonnet-4-6`, `claude-opus-4-6`, `claude-haiku` (según API key plan) |
| **Tipo de cuenta** | Prepago (pay-as-you-go) |
| **Costo** | Sonnet ~$3/$15 M tokens (in/out), Opus ~$15/$75 M tokens (caro) |
| **Límite de uso** | Hasta que se acabe el saldo o el límite de tier |
| **Saldo** | 🔴 **desconocido** — revisar `console.anthropic.com/settings/billing` |
| **Cuenta creada** | ⚠️ fecha desconocida |
| **Última recarga** | 🔴 desconocido |
| **Gasto promedio/mes** | 🔴 desconocido |
| **Última verificación** | 5-jul-2026: Erik confirmó que la clave existe y contestó a `claude-sonnet-4-6` via curl |
| **Llave detectada** | ✅ `x-api-key` presente (formato `sk-ant-api03-...`) |
| **Dónde está la clave** | 🚨 **NO está en ningún `.env` del disco.** Erik la reveló por curl en esta sesión (5-jul-2026). Según expediente v1 de cerebropax: "⚠️ sin key (solo suscripción)". |
| **Clave canónica** | La del curl de Erik. ⚠️ **Guardar YA en `/opt/cerebropax/.env` como `ANTHROPIC_API_KEY`** antes de que se pierda. |
| **⚠️ Notas** | ⚠️ **API cara.** Claude es calidad tope pero cuesta. Usar solo para lo muy difícil que Groq/NVIDIA/DeepSeek no pueden. ⚠️ El curl probado usó `claude-sonnet-4-6` — verificar si la cuenta tiene acceso a Opus. ⚠️ La clave está SUELTA (no en .env) → **riesgo de pérdida inminente**. Acción urgente: guardar en `.env`. |

---

## 🖥️ Modelos locales (sin clave, sin costo)

### 12. Ollama SP (São Paulo) 🟢

| Campo | Valor |
|---|---|
| **Máquina** | Oracle SP (`central`, 100.108.105.27) |
| **Modelos cargados** | `llama3.1:8b`, `llama3:8b` |
| **Acceso** | `http://central:11434` (Tailscale) |
| **VRAM usada** | ~4-5 GB RAM del sistema (ARM sin GPU) |
| **Velocidad** | 🟡 Lenta (~2-10 t/s en ARM) |
| **Rol** | Respaldo 24/7 si APIs caen. Letta lo usa hoy como modelo principal (hasta migrar a LiteLLM → Groq). |

### 13. Ollama laptop 🟢

| Campo | Valor |
|---|---|
| **Máquina** | ASUS TUF, RTX 3050 4 GB VRAM |
| **Modelos cargados** | `huihui_ai/qwen3-abliterated:4b-instruct-2507-q4_K_M` (~4B Q4) |
| **Acceso** | Solo local (no expuesto vía LiteLLM todavía) |
| **VRAM usada** | ~4 GB (toda la GPU) |
| **Velocidad** | 🟢 Rápida (40-60 t/s en GPU) |
| **Rol** | Sin censura, rápido, GPU. Exponer vía LiteLLM si se necesita sin censura 24/7. ⚠️ La laptop se apaga de noche. |

---

## 🔑 Claves extra encontradas (no-LLM — irán a ficha 4 `api-tokens`)

Estas claves aparecieron en los archivos leídos pero **no son APIs de cerebros**. Se registran aquí para no perderlas, y su ficha detallada va en `04_api-tokens.md`:

| Variable | Para qué | Dónde |
|---|---|---|
| `TELEGRAM_BOT_TOKEN` | @LaInconclusa80_bot (repetida en 2 .env) | `letta/.env` + `keys.env` |
| `N8N_API_KEY` | n8n (caído con Hetzner) | `keys.env` |
| `LANGFUSE_PUBLIC/SECRET_KEY` | Observabilidad (2 juegos: uno en SP, otro en PentAGI) | `keys.env` + `PentAGI/.env` |
| `VERCEL_TOKEN` | Despliegues Vercel | `keys.env` |
| `SCW_ACCESS/SECRET_KEY` | Scaleway (cloud europea) | `keys.env` |
| `TAVILY_API_KEY` | Búsqueda web | `PentAGI/.env` |
| `OPENCODE_API_KEY` | OpenCode Zen (modelo gratis via API) | `letta/.env` ← ⚠️ nuevo, no documentado antes |

---

## 🚨 Alertas urgentes

| # | Alerta | Acción |
|---|---|---|
| 1 | 🔴 **OpenRouter key expuesta en histórico git** — cualquiera pudo usarla | Regenerar YA en openrouter.ai/keys. Revisar billing por uso indebido. |
| 2 | 🔴 **No sabemos el saldo de DeepSeek ni OpenAI** — podemos estar gastando sin saber | Entrar al portal de cada uno y anotar saldo real. |
| 3 | 🟡 **NVIDIA tiene 2 claves distintas** — no sabemos cuál funciona | Probar ambas con `test-cerebros.sh`. Usar la de `.nvidia/nvidia.env`. |
| 4 | 🟡 **DeepSeek tiene 2 claves distintas** — posiblemente 2 cuentas | Probar ambas. Quedarnos con la que tenga saldo. |
| 5 | 🟡 **Cohere trial** — caduca algún día sin aviso | Revisar dashboard.cohere.com por fecha de expiración. |
| 6 | 🟡 **Claves dispersas en 4 archivos** — error humano fácil | Centralizar en `/opt/cerebropax/.env` (Fase 1 de cerebropax). |
| 7 | 🔵 **OPENCODE_API_KEY** (OpenCode Zen) — proveedor no listado antes | Investigar: ¿qué modelos da? ¿gratis? ¿vale la pena agregarlo a `config.yaml`? |

---

## 📊 Auditoría de duplicados

| API | Claves encontradas | Duplicadas | Decisión |
|---|---|---|---|
| Groq | 1 | No | Usar la de `letta/.env` |
| NVIDIA | 2 ⚠️ | Sí — 2 claves distintas | Probar, usar `.nvidia/nvidia.env` |
| DeepSeek | 2 ⚠️ | Sí — 2 claves distintas | Probar, usar la que tenga saldo |
| Gemini | 1 | No | Usar la de PentAGI `.env` |
| Cerebras | 1 | No | Usar `keys.env` |
| Mistral | 1 | No | Usar `keys.env` |
| Cohere | 1 | No | Usar `keys.env` |
| HuggingFace | 1 | No | Usar `keys.env` |
| OpenRouter | 1 | No | 🚨 Regenerar antes de usar |
| OpenAI | 1 | No | Usar PentAGI `.env` (alinear nombre var) |
| Anthropic | 1 | No | 🚨 Clave SUELTA — guardar YA en `.env` |
| Ollama SP | — | — | Ya corriendo, sin clave |
| Ollama laptop | — | — | Ya corriendo, sin clave |
| **Telegram** | 2 ⚠️ | Sí — mismo token en 2 .env | Normal (mismo bot). Usar cualquiera. |
| **Langfuse** | 2 ⚠️ | Sí — 2 proyectos distintos | SP (`keys.env`) y PentAGI (`PentAGI/.env`) |

---

## 📎 Fuentes de extracción (archivos leídos 5-jul-2026)

| # | Archivo | Tamaño | APIs LLM encontradas |
|---|---|---|---|
| 1 | `C:\Users\erikj\.llmkeys\keys.env` | 1362 bytes | DeepSeek, Cerebras, OpenRouter, Mistral, HuggingFace, NVIDIA, Cohere (7) + tokens no-LLM |
| 2 | `C:\Users\erikj\.nvidia\nvidia.env` | 375 bytes | NVIDIA (segunda clave distinta) |
| 3 | `C:\Users\erikj\Laboratorio\open-pax\codigo\letta\.env` | 637 bytes | Groq, OpenCode Zen + Telegram + DB password |
| 4 | `C:\Users\erikj\Downloads\installer-latest\.env` | 10596 bytes | OpenAI, Gemini, DeepSeek (segunda), Tavily + Langfuse PentAGI + Grafana + DBs + scraper |
| 5 | `C:\Users\erikj\Laboratorio\open-pax\cerebropax\codigo\.env.example` | 1243 bytes | Plantilla (sin claves reales, solo nombres de variables) |

> **Total APIs LLM únicas encontradas: 11 proveedores cloud + 2 locales = 13 cerebros.**
> + Anthropic (descubierta por curl, 5-jul-2026, misma sesión).
> Auditoría completada 5-jul-2026.
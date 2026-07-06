# 🗃️ recursospax — EXPEDIENTE-MAESTRO v1

> **Subproyecto de open-pax.** Fuente única de verdad de la gestión de recursos.
> Padre: [`../EXPEDIENTE-MAESTRO.md`](../EXPEDIENTE-MAESTRO.md) (open-pax).
> Hermano: [`../cerebropax/`](../cerebropax/) (banco de cerebros — recurso gestionado por aquí).
> Creado: 5-jul-2026. **Sujeto a cambios continuos. Nada es dogma.**

---

## ¿Qué es recursospax? (para un niño de 10 años)

Imagina que tienes una **caja fuerte digital** donde guardas todas las llaves,
contraseñas, tarjetas y herramientas de tu casa. Pero no solo las guardas: llevas
un **cuaderno** donde anotas cuándo conseguiste cada cosa, cuándo caduca, cuánto
saldo le queda, y quién la está usando.

**recursospax** es ese cuaderno + caja fuerte, pero **solo para los recursos
técnicos de open-pax**: APIs de inteligencia artificial, tokens de acceso, cuentas
de servicios cloud, modelos locales, claves SSH, herramientas MCP. No gestiona
tus cosas personales (banco, Netflix, Spotify) — eso va al área `💚 Personal` de
open-pax, no aquí.

**Una frase:** recursospax = la bitácora y caja fuerte de todos los recursos
técnicos que open-pax consume para funcionar.

---

## 🎯 Objetivo actual (definido por Erik, 5-jul-2026)

**recursospax = bitácora centralizada + monitoreo por fases de los recursos
técnicos de open-pax.**

Hoy, Fase 1: **bitácora escrita**, un solo documento donde está TODO con fechas
de vencimiento, saldo y estado. Después: comprobación automática, y más adelante
alertas por Telegram cuando algo caduca o se gasta de más.

---

## 🌟 Reglas de Oro

### RR1 — Solo recursos técnicos de open-pax
APIs, tokens, cuentas cloud, modelos, claves SSH, herramientas MCP. **No** lo
personal (banco, suscripciones de entretenimiento, contraseñas de redes sociales).
Eso va al área `💚 Personal`.

### RR2 — Fechas absolutas siempre
Toda fecha de vencimiento, creación o último chequeo se escribe en formato real
(`5-jul-2026`), nunca "en 30 días". Si no sabemos la fecha exacta, se anota
"⚠️ desconocida" con la mejor estimación.

### RR3 — Honestidad sobre lo que no sabemos
Si no sabemos el saldo de una API prepago, se dice "🔴 desconocido". Si no sabemos
cuándo caduca un trial, se dice "⚠️ revisar portal del proveedor". No inventar.

### RR4 — Las claves NUNCA en git
La bitácora **referencia** que la clave existe y dónde está (p. ej. "en
`cerebropax/codigo/.env`"), pero **jamás contiene la clave misma**.

### RR5 — Un solo lugar
No más claves dispersas en 4 archivos `.env` de la laptop. Todo recurso se
registra aquí. Si existe en otro lado, se anota la ubicación pero **este es el
catálogo maestro**.

---

## 📦 Las 7 categorías de recursos

| # | Categoría | Qué contiene | Ejemplos |
|---|---|---|---|
| 1 | 🧠 **Cerebros (APIs LLM)** | APIs de modelos de lenguaje, gratuitas y de pago | Groq, NVIDIA NIM, DeepSeek, Gemini, Cerebras, Mistral, Cohere, HuggingFace, OpenRouter, OpenAI |
| 2 | 🏦 **Cuentas cloud** | Cuentas en servicios de infraestructura | Oracle Cloud (2 tenancies), Cloudflare, GitHub, Supabase, Northflank |
| 3 | 🔌 **MCP (Model Context Protocol)** | Servidores MCP que amplían capacidades de los agentes | Pieces, CodeGraph, Brave Search, etc. |
| 4 | 🎫 **API tokens y keys** | Tokens de servicios no-LLM | Telegram Bot Token, WhatsApp Business API, Ngrok, Langfuse, Pipedream |
| 5 | 🖥️ **Modelos locales** | Modelos de IA corriendo en hardware propio | Ollama laptop (qwen3-abliterated:4b), Ollama SP (llama3.1:8b) |
| 6 | 🔑 **Claves SSH y acceso** | Llaves de acceso a servidores | `oci_paxel` (SP), `oci_amigo` (FRA), `termux_phone` (celular) |
| 7 | 💉 **Inyección / prepago** | APIs con saldo prepago que se consume | DeepSeek (saldo en CNY), OpenAI (saldo en USD) |

---

## 🚧 Hoja de ruta (fluida)

### Fase 0 — Crear el subproyecto 🟢 COMPLETA (esta sesión)
- [x] Erik definió recursospax como nuevo subproyecto
- [x] Reglas de Oro establecidas (RR1-RR5)
- [x] 7 categorías de recursos definidas
- [x] Carpeta + estructura creada (`recursospax/`)
- [x] EXPEDIENTE-MAESTRO.md creado (este archivo)

### Fase 1 — Bitácora escrita (el cuaderno) 🟡 EN PROGRESO
> Un solo archivo markdown con TODOS los recursos, sus fechas, su estado, y
> dónde está cada clave. Se actualiza a mano por ahora.

- [ ] **1.1** Crear `bitacora/01_apis-llm.md` — todas las APIs de cerebros
      (10 proveedores). Fecha de creación de cuenta, free tier vs pago, límite
      de cuota, gasto del mes, dónde está la clave, nota si hay que regenerar
- [ ] **1.2** Crear `bitacora/02_cuentas-cloud.md` — Oracle SP, Oracle FRA,
      Cloudflare, GitHub, Supabase. Tipo de cuenta, trial/permanente, fecha de
      vencimiento, dueño (tuya/ajena), warnings
- [ ] **1.3** Crear `bitacora/03_mcp.md` — servidores MCP disponibles, dónde
      corren, qué herramientas dan, estado
- [ ] **1.4** Crear `bitacora/04_api-tokens.md` — Telegram bot, WhatsApp, Ngrok,
      Langfuse, etc. Dónde está el token, fecha de creación, si rota solo
- [ ] **1.5** Crear `bitacora/05_modelos-locales.md` — cada modelo Ollama, en qué
      máquina, tamaño, VRAM que ocupa, descargado o pendiente
- [ ] **1.6** Crear `bitacora/06_claves-ssh.md` — cada llave SSH, para qué
      servidor, algoritmo, dónde está el archivo .pem
- [ ] **1.7** Crear `bitacora/07_saldo-prepago.md` — APIs con saldo: DeepSeek
      (CNY), OpenAI (USD). Saldo actual, última recarga, gasto promedio/mes
- [ ] **1.8** Crear `bitacora/README.md` — índice de la bitácora
- [ ] **Hito:** abrir `bitacora/README.md` y ver las 7 fichas; buscar cualquier
      recurso en <10 segundos

### Fase 2 — Comprobación automática ⏳
> Un script que corre cada X horas y verifica el estado real de cada recurso.

- [ ] Script `codigo/check-recursos.sh` que prueba cada API (como `test-cerebros.sh`)
- [ ] Script `codigo/check-ssh.sh` que intenta conectar a cada host y reporta
- [ ] Script `codigo/check-modelos-locales.sh` que verifica qué modelos están en Ollama
- [ ] Cron en Frankfurt que corre los checks y escribe un reporte `bitacora/_REPORTE-AUTO.md`
- [ ] **Hito:** un archivo `_REPORTE-AUTO.md` aparecé solo cada 6h con semáforos frescos

### Fase 3 — Monitoreo vivo + alertas 🔮 Visión-futura
> El sistema te avisa proactivamente por Telegram cuando algo anda mal.

- [ ] Base de datos de eventos (SQLite o PostgreSQL) para historial de cambios
- [ ] Servicio background en Frankfurt que corre checks y compara con el día anterior
- [ ] Integración con Letta: si algo caduca en <7 días, Letta te manda un Telegram
- [ ] Dashboard simple (HTML o panel LiteLLM-style) con semáforos en vivo
- [ ] **Hito:** "Erik, tu trial de Oracle Frankfurt vence en 4 días" llega por Telegram

### Fase 4+ — 🔮 Visión-futura (registrada para no perder)
- Catálogo de costos reales por recurso (cuánto gasta open-pax al mes)
- Detección de anomalías (gasto de API se disparó → ¿es ataque o proyecto intenso?)
- Rotación automática de tokens que lo permitan
- Integración con el presupuesto mensual de open-pax

---

## 📚 Documentos del subproyecto

| Documento | Qué es |
|---|---|
| `EXPEDIENTE-MAESTRO.md` | Fuente única de verdad (este archivo) |
| `bitacora/README.md` | Índice de las 7 fichas de recursos |
| `bitacora/01_apis-llm.md` | APIs de cerebros (las 10 de cerebropax) |
| `bitacora/02_cuentas-cloud.md` | Cuentas de infraestructura |
| `bitacora/03_mcp.md` | Servidores MCP |
| `bitacora/04_api-tokens.md` | Tokens y keys no-LLM |
| `bitacora/05_modelos-locales.md` | Modelos en Ollama |
| `bitacora/06_claves-ssh.md` | Llaves SSH |
| `bitacora/07_saldo-prepago.md` | APIs con saldo consumible |
| `documentos/01_por-que-recursospax.md` | Por qué un subproyecto aparte y no solo una carpeta |
| `codigo/check-recursos.sh` | Script de comprobación (Fase 2) |
| `diagramas/01_panorama-recursospax.svg` | Las 7 categorías y su relación |

---

## ⚠️ Honestidad

1. 🟢 **La información YA EXISTE** en `recursos/infraestructura/01_inventario-infraestructura.md` y en `cerebropax/EXPEDIENTE-MAESTRO.md`. No inventamos nada: la extraemos, la organizamos y le ponemos fechas.
2. 🟡 **No sabemos el saldo exacto** de DeepSeek ni OpenAI. Toca entrar al portal del proveedor a consultarlo. Se anota "🔴 desconocido" mientras.
3. 🟡 **Algunas fechas de vencimiento son desconocidas** (trials, free tiers que "algún día" caducan). Se anota la mejor estimación con warning.
4. 🟢 **Costo $0.** Es documentación markdown. La Fase 2-3 usará scripts en Frankfurt (gratis).
5. 🔵 **Este documento cambia.** Hoy es 7 categorías. Mañana pueden ser 8 si aparece un nuevo tipo de recurso.

---

## 🔗 Conexión con otros subproyectos

| Subproyecto | Relación con recursospax |
|---|---|
| **cerebropax** | Los cerebros (APIs LLM) que gestiona cerebropax están **registrados aquí** en `bitacora/01_apis-llm.md`. cerebropax = el que los usa; recursospax = el que lleva la bitácora y el monitoreo. |
| **open-pax padre** | recursospax es el "departamento de recursos" de open-pax. El expediente padre referencia este subproyecto en su tabla de subproyectos. |
| **Área Personal** | Los recursos personales de Erik (banco, suscripciones, Netflix) NO van aquí. Van al área `💚 Personal`. Aquí solo lo técnico. |
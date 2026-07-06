# 🧠 cerebropax — EXPEDIENTE-MAESTRO v2

> **Subproyecto de open-pax.** Fuente única de verdad del "banco de cerebros".
> Padre: [`../EXPEDIENTE-MAESTRO.md`](../EXPEDIENTE-MAESTRO.md) (open-pax).
> Creado: 5-jul-2026. **Sujeto a cambios continuos. Nada es dogma.**
> **v2 (5-jul-2026, misma sesión):** Erik definió el objetivo actual como una
> **base de cerebros categorizada y ordenada por tarea**. El sistema de
> aprendizaje/duelos Elo queda como **visión-futura** (no para esta sesión). Ver § Visión.

---

## 🎯 Objetivo actual (definido por Erik, 5-jul-2026)

**cerebropax = una base de cerebros categorizada y ordenada para diversas tareas.**

Hoy lo que necesitamos es simple y concreto: tener un solo lugar donde están
**todos los cerebros disponibles, agrupados por tipo de tarea, listos para usar**.
Una caja organizada, no una caja caótica. Nada de aprendizaje automático todavía.

### Objetivo, en una frase
> "Que cualquier programa de open-pax pueda pedir el cerebro adecuado para una
> tarea, sabiendo de antemano qué categorías existen y qué cerebro hay en cada una."

### Categorías de tarea (la forma de ordenar la caja)
 Cada cerebro queda en una (o varias) de estas cajas:

| Categoría | Para qué | Cerebros asignados (default + respaldos) |
|---|---|---|
| 🗣️ **chat-rapido** | Respuestas instantáneas por Telegram, charla corta | Groq 8B → Cerebras 8B → Gemini Flash |
| 🧠 **chat-inteligente** | Charla larga, razonar conversando, decisiones | Groq 70b → NVIDIA qwen3-80b → Cerebras 70b |
| 💻 **codigo** | Escribir código, completar funciones | DeepSeek-coder → Mistral-codestral → DeepSeek-chat |
| 🔬 **razonamiento** | Analizar, planificar paso a paso, problemas difíciles | DeepSeek-reasoner → NVIDIA nemotron-70b |
| 📝 **resumen** | Resumir papers, artículos, conversaciones largas | Gemini Flash → Groq 70b → Mistral Large |
| 👁️ **vision** | Describir imágenes, multimodal | Gemini 2.0-flash → Gemini 2.5-flash |
| 🏠 **respaldo-local** | Si las APIs caen, seguir funcionando 24/7 | Ollama SP → Ollama laptop |
| 🎛️ **todo-el-mercado** | Lo que no tengamos directo, vía OpenRouter | OpenRouter auto |
| 🏆 **calidad-tope** | Solo para lo muy difícil, pago por uso | Anthropic Sonnet 4-6 → OpenAI gpt-4o → Anthropic Haiku |

> Actualizado 5-jul-2026: las **9 categorías del router_groups en `config.yaml`**
> están completas (antes tenía solo 5). Anthropic añadida con clave revelada por
> curl en esta sesión (ver `recursospax/bitacora/01_apis-llm.md`).

### Quién usa cerebropax (los consumidores)
- **Letta (SP)** — cuando responde a Erik por Telegram, pide el cerebro a cerebropax.
- **La Fábrica (laptop)** — cuando sus obreros escriben código, piden el cerebro.
- **Otros agentes futuros** (LangGraph, Mem0, research agent) — todos consumen de aquí.
- **Erik manualmente** — puede entrar al panel `workspace:4000/ui` a probar modelos.

---

## 🔮 Visión-futura (NO para esta sesión — registrada para no perderla)

Más adelante cerebropax puede **evolucionar** a un sistema que aprende. Queda
anotado aquí para que no se pierda la idea, pero **NO es el objetivo de hoy**:

- **Capacidad A — Aprender qué cerebro rinde mejor por tarea**: medir con
  👍/👎 primero, y después con **duelos A vs B a ciegas + ranking Elo** (estilo
  LMSYS Chatbot Arena). El cerebro con mejor Elo en cada categoría gana prioridad.
- **Capacidad B — Combinar varios cerebros en cadena**: uno bosqueja, otro
  escribe, otro corrige, otro critica. Para tareas difíciles.

Cuando Erick quiera activar esto, se cambia el objetivo del expediente y se
trabaja por sesiones. Hasta entonces, cerebropax es solo una **base ordenada**.

---

## ¿Qué es cerebropax? (para un niño de 10 años)

Imagina que tienes una **caja de cerebros** como las del Monopoly. Cada cerebro es
bueno para algo distinto: uno es rapidísimo para chatear, otro escribe código
baratísimo, otro es muy listo para tareas difíciles.

**cerebropax** es la caja donde guardas todos esos cerebros, **ordenados por tipo
de tarea**: un compartimento para los rápidos, otro para los que escriben código,
otro para los列表 listos, otro para los que ven imágenes. Cada compartimento tiene
una etiqueta: "para charlar", "para código", "para pensar", "para ver".

Y tiene **una sola puerta**: cualquier programa de open-pax (Letta, La Fábrica, o
vos mismo) entra por esa puerta y dice "necesito un cerebro para código" —y
cerebropax le entrega el cerebro correcto de ese compartimento. Si el primero
falla (la API está caída), le da el de respaldo del mismo compartimento. Así nadie
tiene que saber qué proveedor ni qué llave usar: cerebropax lo sabe por él.

Tú (o cualquier programa de open-pax) hablas con **una sola dirección**:
`http://workspace:4000`. Detrás, cerebropax reparte entre todos los cerebros que
tengamos disponibles (APIs gratuitas + modelos locales).

**Una frase:** cerebropax = la base de cerebros de open-pax, **categorizada y
ordenada por tarea**, una sola puerta para entrar, gratis, por Tailscale.

---

## 🌟 Reglas de Oro (heredadas de open-pax)

> Solo las que aplican a cerebropax. Las generales están en el expediente padre.

### CR1 — Una sola puerta
Todo consumidor (Letta, La Fábrica, Constelación, scripts) habla con **una sola
URL**: `http://<host-tailscale>:4000`. Nunca con los proveedores directo. Así, si
cambiamos de proveedor, nadie se entera.

### CR2 — Gratis primero, pago solo si rinde 10x
Prioridad: APIs gratuitas → modelos locales (Ollama) → pago por uso (DeepSeek
centavos, Anthropic solo para calidad tope). **$0/mes es el objetivo.**

### CR3 — Por Tailscale, nunca público
LiteLLM escucha **solo en la red Tailscale** (`0.0.0.0:4000` alcanzable solo por
los nodos). No exponemos llaves ni el panel al internet público. Si hace falta
acceso externo, va por Cloudflare Tunnel con auth.

### CR4 — Semáforos siempre
Si un proveedor está caído o lento, el semáforo pasa a 🔴 y LiteLLM hace failover
automático al siguiente cerebro de la lista. **Honestidad radical sobre qué
funciona.**

### CR5 — Nada se queda en la conversación
Todo estado (qué modelos hay, qué claves funcionan, qué probamos) va a disco en
este expediente y en `documentos/`.

---

## 🔩 ¿Qué cerebros tenemos? (inventario de modelos)

> Estado verificado 5-jul-2026. **Todas las claves existen y están guardadas en
> `codigo/.env` (NUNCA subir a git).**

### APIs gratuitas (cloud, $0)

| # | Proveedor | Modelos estrella | Para qué sirve | Costo | Estado |
|---|---|---|---|---|---|
| 1 | **Groq** | `llama-3.1-8b-instant`, `llama-3.3-70b`, `mixtral-8x7b` | ⚡ Lo más rápido que existe (chat, respuestas instantáneas) | $0 | 🟢 |
| 2 | **NVIDIA NIM** | `qwen/qwen3-next-80b-a3b-instruct` + ~120 modelos | 🧠 Modelos grandes gratis, muy capaces | $0 | 🟢 |
| 3 | **Google Gemini** | `gemini-2.0-flash`, `gemini-2.5-flash` | 👁️ Ve imágenes + texto, free tier amplio | $0 | 🟢 |
| 4 | **Cerebras** | `llama-3.1-8b`, `llama3.1-70b` | ⚡ Rival de Groq en velocidad (gratis) | $0 | 🟢 |
| 5 | **Mistral** | `mistral-large-latest`, `codestral` | 💻 Bueno para código, europeo | $0 free tier | 🟢 |
| 6 | **Cohere** | `command-r-plus`, `command-r` | 📚 RAG, embeddings, comandos | $0 trial | 🟢 |
| 7 | **HuggingFace** | miles de modelos via Inference API | 🧪 Experimentos, modelos raros | $0 | 🟢 |
| 8 | **OpenRouter** | 100+ modelos (1 llave, free + paid) | 🎛️ "El súper mercado": lo que no tengas directo | variable | 🟢 |

### APIs de pago barato (centavos)

| # | Proveedor | Modelo estrella | Para qué | Costo aprox | Estado |
|---|---|---|---|---|---|
| 9 | **DeepSeek** | `deepseek-chat`, `deepseek-coder`, `deepseek-reasoner` | 💻 Código baratísimo + razonamiento | ~$0.14/M tokens | 🟢 |
| 10 | **OpenAI** | `gpt-4o`, `gpt-4o-mini` | 🏆 Calidad tope (solo para lo difícil) | ~$5-25/sesión | 🟡 clave existe, pagar por uso |

### Modelos locales (sin censura, $0)

| # | Dónde | Modelo | Para qué | Estado |
|---|---|---|---|---|
| 11 | Oracle SP (Ollama en Letta) | `llama3.1:8b`, `llama3:8b` | Respaldo 24/7 si APIs caen | 🟢 ya corriendo |
| 12 | Laptop (RTX 3050) | `qwen3-abliterated:4b` | Sin censura, GPU, rápido | 🟢 local |
| 13 | Oracle FRA (pendiente) | 14b/27b | Pesado, sin censura, 24/7 | 🔴 pendiente descargar |

---

## 🧩 Arquitectura

### Los personajes

| Emoji | Nombre | Dónde vive | Rol |
|---|---|---|---|
| 🧠 | **LiteLLM Gateway** | Oracle Frankfurt (`workspace`, 100.70.241.65) | El conmutador: recibe pedidos y reparte a los cerebros |
| 🔑 | **Banco de claves** | `/opt/cerebropax/.env` (FRA, chmod 600) | Las llaves de cada API, nunca en git |
| 📊 | **Panel LiteLLM** | `http://workspace:4000/ui` (Tailscale) | Ver qué modelos hay, gastar, probar |
| 👥 | **Consumidores** | SP (Letta), laptop (Fábrica), etc. | Los que piden cerebros |
| 🌐 | **Tailscale** | malla 4 nodos | La red privada por donde todo viaja |

### Diagrama

```
   Consumidores (piden cerebros)        Banco de cerebros (FRA:4000)
   ┌─────────────────────────┐          ┌──────────────────────────┐
   │ Letta (SP)        :8283  │──┐       │  LiteLLM Gateway          │
   │ La Fábrica (laptop)      │──┼──────▶│  http://workspace:4000    │
   │ Constelación (laptop)   │──┤       │  (Oracle Frankfurt)       │
   │ scripts / Erik / ...    │──┘       └─────────────┬────────────┘
   └─────────────────────────┘                      │
        una sola URL, una sola llave                │ reparte a:
                                                   ▼
   ┌──────────────┬──────────────┬──────────────┬──────────────┐
   ▼              ▼              ▼              ▼              ▼
 Groq API    NVIDIA NIM    DeepSeek API   Gemini API   OpenRouter ...
 (gratis,    (120 modelos  (centavos,     (gratis,     (100+ modelos
  rapidísimo) gratis)      código)        vision)      1 llave)

   + respaldo local: Ollama SP (llama3.1:8b) ──────┘
   + sin censura:    Ollama laptop (qwen3-abliterated:4b) ──┘
```

### Flujo de un pedido de cerebro

```
1. Letta (SP) quiere responder a Erik por Telegram.
2. Letta pregunta a LiteLLM: "dame el modelo groq/llama-3.3-70b"
   → POST http://workspace:4000/v1/chat/completions
   → Header: Authorization: Bearer <llave-maestra-cerebropax>
3. LiteLLM mira su config, ve que "groq/..." va con la llave de Groq.
4. LiteLLM reenvía a api.groq.com con la llave correcta.
5. Groq responde en ~1s. LiteLLM se lo pasa a Letta.
6. Letta contesta a Erik por Telegram. ✅

Si Groq está caído → LiteLLM usa el siguiente (Cerebras/NVIDIA) automáticamente.
```

---

## 🚧 Hoja de ruta (fluida — redefinida v2)

> La ruta se ajustó en 5-jul-2026 al objetivo real de Erik: **base de cerebros
> categorizada y ordenada** (no el sistema de aprendizaje, que queda como
> visión-futura al final).

### Fase 0 — Fundación 🟢 CASI COMPLETA
- [x] Oracle Frankfurt vivo, Docker listo, Tailscale OK (verificado 5-jul)
- [x] Inventario de claves API hecho (8 proveedores en `codigo/.env`)
- [x] Diseño del subproyecto definido (expediente v1)
- [x] **Objetivo redefinido con Erik: "base de cerebros categorizada"** (v2, esta sesión)
- [ ] Subir `.env` y `config.yaml` a Frankfurt
- [ ] **Corregir bug en `docker-compose.yml`** (línea 23: `environment_file` no es
      clave válida de Compose — dejar solo `env_file: .env`)

### Fase 1 — La base categorizada y ordenada 🟡 EN PROGRESO
> **El objetivo actual completo.** Que la caja tenga compartimentos claros, cada
> compartimento con su cerebro principal y su(s) respaldo(s), todo desplegado y
> testeado desde la puerta única `workspace:4000`.

- [x] **1.1 `config.yaml` revisado y completo** — las 9 categorías están en
      `router_groups` (chat-rapido, chat-inteligente, codigo, razonamiento,
      resumen, vision, respaldo-local, todo-el-mercado, calidad-tope). Hecho
      el 5-jul-2026 en misma sesión.
- [x] 1.2 Cada `group_alias` tiene `[principal, respaldo1, respaldo2]` en orden
- [x] Anthropic agregado al `model_list` + `router_groups` + `fallbacks` (claude-sonnet-4-6 verificado por curl el 5-jul-2026)
- [x] `.env.example` actualizado con `ANTHROPIC_API_KEY`
- [x] 1.3 Corregir bug `docker-compose.yml` (quitar `environment_file` inválido) ← hecho 5-jul
- [x] 1.4 `.env.example` mejorado con notas de claves canónicas y advertencias
- [x] 1.5 `deploy.sh` mejorado: ufw, verificación de vacíos en .env, conteo modelos
- [x] `config.yaml` + `docker-compose.yml` validados con Python (YAML OK, 24 modelos, 9 grupos)
- [ ] 1.6 Subir `codigo/` a Frankfurt (scp o rsync)
- [ ] 1.7 Crear `/opt/cerebropax/.env` con las 11 claves reales (chmod 600) ← aplicar lo auditado en recursospax
- [ ] 1.8 Generar `LITELLM_MASTER_KEY` + `LITELLM_SALT_KEY` + `LITELLM_DB_PASSWORD` reales
- [ ] 1.9 🚨 Acción humana: regenerar OpenRouter key + guardar Anthropic key en .env
- [ ] 1.10 Ejecutar `deploy.sh` en Frankfurt (configura ufw, levanta Docker, verifica)
- [ ] 1.11 Correr `test-cerebros.sh` → anotar semáforos reales por proveedor aquí
- [ ] 1.12 Abrir panel `workspace:4000/ui` y verificar modelos listados
- [ ] **Hito:** `curl http://workspace:4000/v1/models` devuelve los **13 cerebros**,
      y pedir `anthropic/claude-sonnet-4-6` responde OK. Base categorizada viva.

### Fase 2 — Conectar a los primeros consumidores 🔴 pendiente
> La base ya categorizada se la conectamos a quienes la van a usar.

- [ ] Cambiar Letta (SP) para que pida cerebros a `workspace:4000` en vez de
      Ollama directo (cambio mínimo: mismo formato OpenAI)
- [ ] Letta elige la categoría `chat-rapido` por defecto → recibe Groq
- [ ] Probar que Letta responde más rápido (Groq vs Ollama local en ARM)
- [ ] Configurar La Fábrica (laptop) para que pida cerebros a `workspace:4000`
      usando categoría `codigo` → DeepSeek-coder
- [ ] **Hito:** "Erik manda Telegram → responde con Groq en <2s (vía Letta)" +
      "La Fábrica escribe código con DeepSeek-coder (vía cerebropax)"

### Fase 3 — Hardening 🔴 pendiente
- [ ] Llave maestra rotativa, HMAC
- [ ] Cuotas y presupuestos (alertar si se gasta más de X)
- [ ] Watchdog: si LiteLLM cae → reinicia solo (`restart: unless-stopped` ya puesto)
- [ ] Backup de `config.yaml` y `.env` (cifrado) a R2

### Fase 4+ — Visión-futura (NO para ahora 🔮)
>registrada para no perder ideas de Erik. Activar solo si él lo pide.

- **Capacidad A — Aprender qué cerebro rinde mejor por tarea** (medición 👍/👎
  → duelos A vs B a ciegas + ranking Elo estilo LMSYS Chatbot Arena).
- **Capacidad B — Combinar cerebros en cadena** (bosqueja → escribe → corrige →
  critica) para tareas difíciles.
- Embeddings unificados (para Mem0), modelos de voz, juez IA automático.

---

## 📚 Documentos del subproyecto

| Documento | Qué es |
|---|---|
| `EXPEDIENTE-MAESTRO.md` | Fuente única de verdad (este archivo) |
| `documentos/01_por-que-litellm.md` | Por qué LiteLLM y no alternativas |
| `documentos/02_catalogo-cerebros.md` | Catálogo detallado de cada modelo y su mejor uso |
| `documentos/03_guia-despliegue.md` | Cómo desplegar paso a paso (V1: el cómo) |
| `codigo/docker-compose.yml` | Stack Docker del gateway |
| `codigo/config.yaml` | Configuración de LiteLLM (modelos, llaves, routing) |
| `codigo/.env.example` | Plantilla de variables (las reales NUNCA a git) |
| `codigo/deploy.sh` | Script de despliegue en Frankfurt |
| `codigo/test-cerebros.sh` | Script para probar que cada cerebro responde |
| `diagramas/01_arquitectura.svg` | Diagrama de la arquitectura |

---

## ⚠️ Honestidad

1. 🟢 **El 90% de los cerebros es gratis.** Solo OpenAI es pago y se usa por
   excepción (calidad tope para lo muy difícil).
2. 🟢 **Frankfurt está vacío y sobrado** (36 GB disco, 22 GB RAM libre). LiteLLM
   consume ~200 MB RAM. No hay problema de recursos.
3. 🟡 **Las claves están dispersas** en varios `.env` de la laptop. Las
   centralizamos en `codigo/.env` en Frankfurt (chmod 600, nunca a git).
4. 🟡 **Ollama en ARM (SP) es lento** para `llama3.1:8b`. Por eso conviene enrutar
   Letta a Groq (que es lo mismo pero 10x más rápido y gratis).
5. 🔴 **Algunas claves pueden haber expirado** (no se han probado todas juntas
   hace meses). El script `test-cerebros.sh` las verifica todas de una vez.
6. 🔵 **Este documento cambia.** Si mañana sale un proveedor mejor, se migra sin
   culpa. La caja de cerebros evoluciona.

---

## 🔗 Conexión con el expediente padre

Este subproyecto **sustituye la pieza "LiteLLM"** que open-pax tenía en su tabla de
software mínimo (estado `⏳ Fase 2`). Al completar cerebropax Fase 1, esa fila del
expediente padre pasa a 🟢.

| En open-pax padre | En cerebropax (este) |
|---|---|
| "LiteLLM — Banco de cerebros" | = Este subproyecto completo |
| Fase 2: "LangGraph + Mem0 en FRA" | Depende de que Fase 1 aquí esté lista |
| Fase 3: "Mem0" | Usará los embeddings unificados de aquí (Fase 5+) |

---
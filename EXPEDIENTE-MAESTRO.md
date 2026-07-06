# 🧠 open-pax — EXPEDIENTE-MAESTRO v4

> **Fuente única de verdad.** Re-encuadrado 6-jul-2026 (docs 21-24): open-pax = **lóbulo frontal externo de Erik** (no agente autónomo de 316 caps).
> Repo: https://github.com/paxel80/open-pax
> **El objetivo es vencer el TDAH de Erik con andamiaje, no sustituir su función frontal.**

---

## ¿Qué es open-pax?

**El lóbulo frontal externo de Erik.** Erik tiene ACC (Altas Capacidades Cognitivas) + TDAH. Su cerebro genera ideas potentes pero la función ejecutiva (iniciación, seguimiento, priorización) falla por hipofrontalidad. open-pax es el andamiaje externo que **dirige y recuerda**, no ejecuta por Erik.

| Función frontal | TDAH la rompe | open-pax la cubre |
|---|---|---|
| 📌 **Iniciación** | "no me dan ganas de arrancar" | partir la tarea en pasos de 5-10 min |
| 🧠 **Memoria de trabajo** | "¿en qué iba ayer?" | recordar contexto entre sesiones |
| 🎯 **Planificación** | "todo es urgente o nada" | leer tablero, elegir 1 sola tarea |
| 🔄 **Flexibilidad** | "me clavo horas en una" | cron que avisa si llevas mucho tiempo |
| 🛑 **Inhibición** | "se me ocurre idea Y y me voy" | cajón-ideas: "¿la anoto para el domingo?" |
| ✅ **Seguimiento** | "no siento que avanzo" | bitácora de cerrados + celebración |
| 💚 **Reg. emocional** 🟡 | "me frustro y lo dejo" | solo contención suave, NO terapia |

**Erik = ejecuta.** open-pax = dirige + recuerda + frena (andamiaje, no muleta).
**Motor = Hermes** (no Letta). Ver docs 22-24.

---

## 🎯 OBJETIVO — El lóbulo frontal (re-encuadre docs 21-24)

> **Re-encuadrado 6-jul-2026.** El paradigma single-agent+autoverify+reversible (doc 14) sigue como arquitectura,
> pero el PROPÓSITO cambió de "agente autónomo 316 caps" a "lóbulo frontal de Erik en Hermes".
> Ver: `documentos/23_lobulo-frontal-spec.md` (encuadre fundacional)

### Andamiaje, no muleta

| Muleta (prohibido) | Andamiaje (obligatorio) |
|---|---|
| "Hermes, hazme la tarea" | "Hermes, ¿qué toca? ¿la partimos? avísame cada 20 min" |
| Hermes ejecuta, Erik mira | Erik ejecuta, Hermes dirige + recuerda |
| Atrofia el lóbulo frontal real | Entrena el lóbulo frontal real |
| Dependencia creciente | Autonomía creciente (andamiaje se retira gradual) |

### Barbell 90/10 (doc 21)

- **90% Yésika** = ingreso real de Erik ($3-5k/sem). open-pax potencia Yésika, no compite.
- **10% open-pax** = configurar Hermes para las 7 funciones frontales, no construir infra.
- **Kill switch del veredicto:** si en 30 días open-pax consume >10% del tiempo de Erik sin transferir a Yésika → pausar open-pax, 100% a Yésika.

### Single-agent + Autoverify + Reversible

Un único LLM con:

1. **Tool-calling robusto** (vía MCP como estándar de herramientas)
2. **Memoria persistente legible** (vectorial + estructurada, auditable)
3. **Auto-verificador interno** (2º pase adversarial + tests deterministas)
4. **Reversibilidad por diseño** (sandbox, dry-run, undo, dead-man's switch)
5. **Kill-switches automáticos** disparados por invariantes — **no por humanos**

### El humano NO está en el lazo

```
DISEÑADOR EX-ANTE (Erik, una vez)
  define: objetivos · invariantes · perímetros · umbrales
        ↓
┌─────────────────────────────────────────────┐
│           AGENTE AUTÓNOMO                    │
│                                             │
│  ┌─────────┐   ┌──────────┐   ┌─────────┐   │
│  │  LLM    │→  │ Tool-call │→  │ Sandbox │   │
│  │ (núcleo)│   │  (MCP)   │   │(reverso)│   │
│  └────┬────┘   └──────────┘   └────┬────┘   │
│       ↓                             ↓        │
│  ┌──────────────────────────────────────┐   │
│  │       AUTO-VERIFICADOR               │   │
│  │  • 2º pase adversarial (LLM-judge)  │   │
│  │  • Tests deterministas (lint,test)   │   │
│  │  • Dry-run → comparar con esperado   │   │
│  └─────────────────┬────────────────────┘   │
│                    ↓                         │
│  ┌────────────────────────────────────────┐ │
│  │    KILL-SWITCH AUTOMÁTICO              │ │
│  │    Disparado por invariantes (NO Erik) │ │
│  └────────────────────────────────────────┘ │
│                                              │
│  ┌────────────────────────────────────────┐ │
│  │    MEMORIA LEGIBLE (audit trail)        │ │
│  │  vectorial + estructurada + logs        │ │
│  └────────────────────────────────────────┘ │
└─────────────────┬───────────────────────────┘
                  ↓ (trazas asíncronas)
AUDITOR EX-POST (Erik, revisa después)
  ajusta: invariantes · umbrales · objetivos
```

### Lo que reemplaza al human-in-loop (4 sustitutos mecánicos)

| # | Mecanismo                                                                                | Qué reemplaza del humano  |
| - | ---------------------------------------------------------------------------------------- | -------------------------- |
| 1 | **Auto-verificador adversarial** — 2º LLM con instrucción de refutar la acción | La duda humana             |
| 2 | **Reversibilidad por diseño** — toda acción es compensable o sandboxed          | La intercepción del error |
| 3 | **Kill-switches automáticos** — watchdog por invariantes violadas                | El "botón de pánico"     |
| 4 | **Memoria como espejo** — el agente lee su historial y se autocorrige             | La supervisión continua   |

---

## 🌟 Reglas de Oro (v3 — alineadas a autonomía máxima)

> Las Reglas de Oro v2 quedan sin efecto. Estas son las únicas que rigen open-pax.
> **4 reglas esenciales** (definen el paradigma) + **7 derivadas** (práctica operativa).

### ESENCIALES — El paradigma en 4 reglas

#### R1 — Autonomía es el objetivo, no una mejora

open-pax debe operar **sin supervisión humana continua**. El humano diseña ex-ante (objetivos, invariantes, perímetros) y audita ex-post (trazas). **No aprueba cada acción.** Toda regla, componente o decisión que introduzca human-in-loop como dependencia permanente viola el objetivo.

#### R2 — Reversibilidad por defecto

Toda acción del agente debe ser **reversible o confinada a sandbox**. Si una acción no puede deshacerse, se bloquea por defecto hasta que se defina un kill-switch automático. El error no necesita intercepción humana — se deshace solo. La irreversibilidad es la excepción que requiere dead-man's switch, no la regla.

#### R3 — Auto-verificación obligatoria

Antes de ejecutar cualquier acción, el agente debe pasar por su **auto-verificador**: un segundo pase adversarial (LLM con instrucción de refutar, **familia distinta de modelo**) + tests deterministas (lint, typecheck, dry-run). Si el verificador no aprueba, la acción no se ejecuta — se reescribe o se aborta. Sin verificador, no hay acción.

#### R4 — Kill-switch por invariantes, no por humanos

Los kill-switches se disparan cuando los **invariantes numéricos** (presupuesto, tasa de error, blast radius, permisos) se violan — automáticamente. El humano no es el interruptor; el invariante lo es. Erik define los invariantes una vez, antes del despliegue. El watchdog los ejecuta.

### DERIVADAS — Cómo se opera

#### R5 — Resultado sobre método

Se puede implementar y combinar cualquier cosa. No importa el método, lo ortodoxo o lo complejo. **Importa el resultado autónomo.** Si juntar 7 herramientas raras logra la capacidad autónoma, se juntan.

#### R6 — Sin limitantes artificiales

No hay límites técnicos ni económicos pre-establecidos. La única restricción: no hacer gastos innecesarios. $0 es deseable, $1,500 MXN/sem que rinda 100x es aceptable. El presupuesto compra mejores modelos, no más capas.

#### R7 — Todo sujeto a cambio

Nada es dogma excepto el objetivo (autonomía). Si mañana sale una tecnología que mejora la auto-verificación, la reversibilidad o la memoria, se migra. Si un enfoque no produce autonomía, se descarta sin culpa.

#### R8 — Tú imaginas, el sistema construye

Erik no programa. Erik es el cerebro creativo que imagina y decide objetivos. open-pax (construido por cualquier agente de IA) escribe el código, lo ejecuta, lo prueba, se auto-verifica y se lo entrega a Erik como un electrodoméstico autónomo: funciona solo. **El paradigma incluye género bootstrap-builder:** un agente externo construye los componentes de Fase 1 inicialmente.

#### R9 — Tolerancia cero a la amnesia

Todo estado importante va a disco. El sistema sobrevive a reinicios, caídas de luz y cambio de sesión. La memoria es legible y auditable — Erik puede reconstruir causalmente cualquier decisión del agente. Nada se queda en la conversación. Las trazas de R9 y R10 (audit trail) alimentan al watchdog como insumo.

#### R10 — Honestidad radical

Semáforos 🟢🟡🔴 siempre. Si una capacidad está al 60%, se dice 60%. Si algo viola TOS, se documenta. Si algo no es posible autónomamente hoy, se dice. Si el auto-verificador tiene falsos negativos, se mide y se reporta. La confianza en el expediente es absoluta.

#### R11 — Diseñado para TDAH

UN solo siguiente paso para Erik. Sin listas abrumadoras. El sistema autónomo prioriza, ejecuta y reporta: "hice esto, aquí está el resultado". Sin culpa por lo que no se hizo — el sistema lo retomará.

---

## 🔩 Hardware y servicios

### Hardware

| Recurso                   | Especificación                                      | Estado                                              |
| ------------------------- | ---------------------------------------------------- | --------------------------------------------------- |
| Laptop ASUS               | i5-11400H, 7.7 GB RAM, RTX 3050 4 GB VRAM            | 🟢 Activa · **Hermes instalado** (AppData\Local\hermes) |
| Xiaomi 14T Pro            | Nodo Tailscale, panel de control                     | 🟢 Activo · Erik habla con Hermes por Telegram |
| Oracle nube2 (Frankfurt)  | 4 vCPU ARM, 24 GB RAM                                | 🟢 Viva, Tailscale, LiteLLM desplegado (cerebropax, 25 modelos) |
| Oracle nube1 (São Paulo) | 4 vCPU ARM, 24 GB RAM                                | 🟡 Viva, Tailscale · Letta archivado (doc 22) |
| 2do equipo Tailscale      | Ollama con qwen3-abliterated:14b + embeddings bge-m3 | 🟢 Accesible                                        |

### APIs y servicios

| Servicio         | Para qué                        | Costo    | Estado                 |
| ---------------- | -------------------------------- | -------- | ---------------------- |
| Groq API         | Cerebro rápido gratis (Llama 3) | $0       | 🟢                     |
| NVIDIA NIM       | ~121 modelos gratis              | $0       | 🟢                     |
| DeepSeek API     | Código barato                   | centavos | 🟡                     |
| Google Gemini    | Free tier                        | $0       | 🟢                     |
| Anthropic API    | Claude (calidad tope)            |
$$
-$
$$

    | 🟡                     |
| OpenRouter       | 100+ modelos, 1 llave            | variable | 🟡 (regenerar key)     |
| Telegram Bot API | Interfaz con Erik                | $0       | 🟢 @LaInconclusa80_bot |
| Cloudflare       | DNS + Tunnel + R2                | $0       | 🟢                     |
| Tailscale        | Malla privada                    | $0       | 🟢                     |
| GitHub           | Repos + Pages + Actions          | $0       | 🟢                     |
| Supabase         | DB + auth                        | $0       | 🟢                     |

### Presupuesto operativo

- $1,500 MXN/sem ≈ $370 USD/mes para APIs pagas
- Distribución: ~$80 API económica (Groq/DeepSeek) · ~$200 API premium (GPT-4o-mini/Haiku) · ~$90 reserva

---

## 🏗️ Arquitectura (re-encuadrada: Hermes + LiteLLM)

> **Re-encuadre 6-jul-2026 (docs 22-24):** motor = Hermes (no Letta). LiteLLM sigue como router de modelos.

### Componentes actuales

| Componente | Rol | Estado | Dónde |
|---|---|---|---|
| **Hermes** | Lóbulo frontal: cognición, memoria, skills, cron, gateway TG | 🟢 Instalado, 22 skills, state.db 68MB | Laptop (AppData\Local\hermes) |
| **LiteLLM/cerebropax** | Router de 25 modelos (12 proveedores) | 🟢 Desplegado, 4 proveedores verificados | nube2 (Frankfurt) |
| **Telegram gateway** | Canal de comunicación con Erik | 🟢 Configurado en Hermes (token descomentado) | Laptop → @LaInconclusa80_bot |
| **mi-tablero.html** | Kanban de Erik (localStorage) | 🟢 Activo, 17KB | paxel80\Contexto-IA\ |
| **tablero.json** | Export del tablero para Hermes | 🟢 Creado (seed inicial) | paxel80\Contexto-IA\ |
| **SOUL.md** | Identidad del agente = lóbulo frontal de Erik | 🟢 Personalizado | AppData\Local\hermes\ |
| **Letta** | ~~Motor del agente~~ | 🔴 Archivado (doc 22) | documentos/_archivados/letta-no-desplegado/ |

### Asignación a nodos (docs 22-24)

| Nodo | Aloja | Por qué |
|---|---|---|
| **Laptop** (propio) | Hermes + skills + sesión de día | Sustrato propio, reversible, GPU local |
| **Xiaomi** (propio) | Erik habla con Hermes por Telegram | Siempre con Erik |
| nube2 (FRA, ajeno) | LiteLLM/cerebropax (router modelos) | 24GB RAM, Tailscale |
| nube1 (SP, ajeno) | (futuro) Hermes 24/7 o n8n Fase 2 | Letta archivado |

### n8n (Fase 2, NO ahora)

> Doc 24: n8n se despliega solo cuando una skill de Hermes necesite una API externa que no tenga nativa.
> Vive en VM Oracle (no laptop — 7.7GB RAM al límite). Webhook interno solo por Tailscale.

---

## 📊 Frontera de capacidades (estado del arte 2026)

> Fuente: Veredicto del Consejo (documentos/14)

| Capacidad                       | Estado       | Notas                                          |
| ------------------------------- | ------------ | ---------------------------------------------- |
| Cognición/razonamiento acotado | 🟢 Alta      | Fiable en dominios delimitados                 |
| Comunicación (texto, voz)      | 🟢 Alta      | TTS/STT maduros                                |
| Acción digital (tool-calling)  | 🟢 Alta      | MCP como estándar                             |
| Memoria (RAG, vectorial)        | 🟢 Alta      | Funcional; poda automática pendiente (Fase 2) |
| Percepción multimodal          | 🟡 Media     | Madura puntual, no continua                    |
| Creatividad                     | 🟡 Media     | Recombinación, no extrapolación              |
| Planificación >5-10 pasos      | 🔴 Baja      | Error acumula exponencialmente                 |
| Acción física general         | 🔴 Imposible | Robótica = investigación                     |
| Juicio ético autónomo         | 🔴 Imposible | Simulado, no fundamentado                      |
| Auto-mejora sin deriva          | 🔴 Imposible | Problema abierto                               |
| Aprendizaje en pesos            | 🔴 Imposible | No demostrado                                  |

### Regla de autonomía por capacidad

- 🟢 Autonomía plena donde hay **verificador objetivo** (tests, dry-run, validadores)
- 🟡 Autonomía con supervisión donde el verificador es LLM-as-judge (puede alucinar)
- 🔴 Sin autonomía donde no hay verificador — modo asistido (cola diferida)

---

## 🚧 Hoja de ruta (re-encuadrada: lóbulo frontal en Hermes)

### Fase 0 — Fundación 🟢 COMPLETA
- [x] 2 VMs Oracle A1 4/24 ARM vivas, Tailscale
- [x] Xiaomi 14T Pro como nodo Tailscale
- [x] LiteLLM/cerebropax desplegado en nube2 (25 modelos, 4 proveedores verificados)
- [x] Hermes instalado en laptop (22 skills, state.db 68MB, memories, cron)

### Fase 1 — Lóbulo frontal en Hermes ⏳ ACTUAL

> Docs 22-24. Fase 1 = SOLO Hermes, sin n8n. 7 funciones frontales con skills nativas.

- [x] SOUL.md personalizado (lóbulo frontal de Erik, no asistente genérico)
- [x] Telegram configurado en Hermes (token descomentado del .env)
- [x] tablero.json creado (seed inicial del tablero Kanban)
- [x] Skill #1 `que-toca-hoy` creada y verificada (lee tablero.json, devuelve 1 tarea)
- [x] Letta archivado a `_archivados/letta-no-desplegado/` (doc 22 Paso 4)
- [ ] Skill #2 `partir-en-pasos` (parte tarea en 5-10 min)
- [ ] Cron de avisos TDAH (avisa cada X min si no avanza)
- [ ] Skill #3 `bitacora-cierre` (celebrar cerrados + actualizar tablero)
- [ ] Skill #4 `cajon-ideas` (inhibición de impulsos)
- [ ] Conectar Hermes a AGENTS.md como system prompt (doc 22 Paso 5)
- [ ] **Hito:** Erik pregunta "¿qué toca?" por Telegram → Hermes responde con 1 tarea → Erik la parte en pasos → cron avisa → Erik cierra → Hermes celebra

### Fase 2 — Hermes + n8n (cuando lo necesites, ~mes 2)
- [ ] Desplegar n8n en VM Oracle (no laptop — RAM)
- [ ] Conectar Hermes ↔ n8n vía webhook (Tailscale, no internet)
- [ ] n8n solo para integraciones que Hermes no tenga nativas (Gmail, Calendar, Notion)
- [ ] **Regla de activación:** solo cuando una skill necesite una API externa

### Fase 3 — 24/7 (cuando la laptop se quede corta)
- [ ] Migrar Hermes a VM Oracle para 24/7
- [ ] Sync de memories entre laptop y VM
- [ ] Watchdog con invariantes I1-I5 (doc 19)

- [ ] 5. Watchdog mínimo: I5 (0 irreversibles) + logging (I1-I4 → Fase 2)

**Hito Fase 1:** Erik pregunta "¿qué toca?" por Telegram → Hermes responde con 1 tarea → Erik la parte en pasos → cron avisa → Erik cierra → Hermes celebra.

---

## 📚 Documentos del proyecto

| Documento | Qué es |
|---|---|
| `EXPEDIENTE-MAESTRO.md` | Fuente única de verdad (este archivo, v4) |
| `SIGUIENTE-PASO.md`                                         | 1 archivo, 1 comando — lo que Erik ejecuta hoy para avanzar                                                |
| `documentos/06_capacidades-humanas-universales.md`          | Taxonomía: 316 capacidades en 18 grupos                                                                    |
| `documentos/07_capacidades-cuerpo-fisico-filtro.md`         | Filtro: 48 capacidades que requieren cuerpo físico                                                         |
| `documentos/08_metodo-implementacion.md`                    | Reclasificación A (workflow) · R (recurso) · A+R (mixto) · N/A                                          |
| `documentos/09_frameworks-tipo-A.md`                        | Framework óptimo para 91 capacidades tipo A                                                                |
| `documentos/10_recursos-proveedores-tipo-R.md`              | Recurso + proveedor para 74 capacidades tipo R                                                              |
| `documentos/11_frameworks-tipo-AR.md`                       | Framework + recurso para 94 capacidades tipo A+R                                                            |
| `documentos/_archivados/`                                   | Documentos obsoletos (12, 13, 01-05 originales) — conservados como histórico                              |
| `documentos/14_veredicto-consejo-estado-del-arte.md`        | **Veredicto --full (18 miembros, autonomía): single-agent+autoverify+reversible. OBJETIVO MÁXIMO.** |
| `documentos/15_expediente-cerebropax.md`                    | Expediente histórico: banco de cerebros (LiteLLM) — ahora integrado como`codigo/cerebropax/`            |
| `documentos/16_prompts-arranque-cerebropax.md`              | Prompts copy-paste para sesiones de cerebropax                                                              |
| `documentos/17_expediente-recursospax.md`                   | Expediente histórico: gestión de recursos — ahora integrado como`recursos/bitacora/`                   |
| `documentos/18_expediente-personalpax.md`                   | Expediente histórico: área personal — ahora integrado como capacidades del agente                        |
| `documentos/19_invariantes-operativos.md`                   | Invariantes numéricos (presupuesto, blast radius, tasa error) + DAG de Fase 1                              |
| `documentos/20_roadmap-fase-1.md`                           | **Roadmap de ejecución de Fase 1** — orden de los 6 pasos, qué paralelizar, anti-over-engineering  |
| `documentos/21_auditoria-ecc-council.md`                    | **Auditoría ECC + Council:** barbell 90/10, agente narrow, Yésika primero, regenerar claves |
| `documentos/22_decision-agente-narrow-hermes.md`            | **Decisión: Hermes reemplaza Letta** — 5 capacidades narrow, gateway TG nativo |
| `documentos/23_lobulo-frontal-spec.md`                      | **Encuadre fundacional:** open-pax = lóbulo frontal de Erik (7 funciones frontales, no 316 caps) |
| `documentos/24_hermes-mas-n8n-arquitectura.md`              | Hermes + n8n (cerebro + manos) — Fase 1 solo Hermes, n8n en Fase 2 |
| `codigo/letta/`                                             | Stack Letta: Docker Compose + Telegram bridge + setup                                                       |
| `codigo/cerebropax/`                                        | LiteLLM: config.yaml + docker-compose + deploy + test                                                       |
| `recursos/bitacora/`                                        | Bitácora de APIs LLM (claves, saldos, canónicas)                                                          |
| `recursos/infraestructura/01_inventario-infraestructura.md` | Inventario completo de hardware, cuentas, APIs                                                              |
| `recursos/infraestructura/02_topologia-red.svg`             | Diagrama de la red                                                                                          |
| `diagramas/01_panorama-vision-erik.svg`                     | Visión general: 4 áreas                                                                                   |
| `diagramas/02_ciclo-diario.svg`                             | Ciclo autónomo diario                                                                                      |
| `diagramas/03_arquitectura-capas.svg`                       | Arquitectura por capas                                                                                      |
| `diagramas/04_proyectos-reales-flujo.svg`                   | Flujo de proyectos reales                                                                                   |
| `diagramas/05_hoja-de-ruta.svg`                             | Fases visuales con semáforos                                                                               |
| `diagramas/06_arquitectura-cerebropax.svg`                  | Arquitectura original del banco de cerebros                                                                 |
| `diagramas/07_panorama-personalpax.svg`                     | Panorama original del área personal                                                                        |
| `visual/analisis-frameworks-capacidades.docx`               | Word: 316 capacidades × frameworks                                                                         |
| `visual/reporte-capacidades-pdf.html`                       | HTML: 316 capacidades por grupo                                                                             |
| `visual/reporte-metodo-implementacion.html`                 | HTML: 316 capacidades por método                                                                           |
| `visual/reporte-frameworks-tipo-A.html`                     | HTML: 91 tipo A con framework óptimo                                                                       |
| `visual/reporte-recursos-tipo-R.html`                       | HTML: 74 tipo R con recurso + proveedor                                                                     |
| `visual/reporte-frameworks-tipo-AR.html`                    | HTML: 94 tipo A+R con framework + recurso                                                                   |

## 🧩 Componentes (ex-subproyectos fusionados)

> Los subproyectos `cerebropax`, `recursospax` y `personalpax` fueron **fusionados** en el árbol único. Ya no son carpetas separadas — son componentes del sistema.

| Componente                             | Vive en                                       | Función                                                        |
| -------------------------------------- | --------------------------------------------- | --------------------------------------------------------------- |
| **cerebropax** (LiteLLM/router)  | `codigo/cerebropax/` + `documentos/15-16` | Núcleo LLM del agente — enruta modelos gratis+baratos+premium |
| **recursospax** (gestión APIs)  | `recursos/bitacora/` + `documentos/17`    | APIs, cuentas, claves, saldos — bitácora viva                 |
| **personalpax** (área personal) | `documentos/18` + capacidades del agente    | Área 💚 Personal: dominio de capacidades del agente            |

> La tabla de **Documentos del proyecto** arriba contiene la ubicación exacta de cada archivo.

---

## ⚠️ Honestidad (R10)

1. 🟢 **El paradigma está definido** por un Consejo de 18 perspectivas ortogonales (15/16 unánime).
2. 🟡 **No existe aún** el auto-verificador, el sandbox reversible ni el watchdog — son Fase 1. Los invariantes numéricos están definidos provisionalmente en `documentos/19`. LiteLLM desplegado en nube2 (24 modelos cargados), pero las claves cloud API están invalidadas — necesitan regeneración (problema de `recursospax`). Solo Ollama local funciona como modelo real de momento.
3. 🟡 **La autonomía plena** es alcanzable solo donde hay verificador objetivo (tests, dry-run). Sin verificador, es ilusoria.
4. 🔴 **Imposible autónomamente hoy:** acción física, juicio ético fundamentado, auto-mejora sin deriva, planificación >5-10 pasos.
5. 🔵 **Este documento es v3.** Reemplaza v2. El paradigma (single-agent+autoverify+reversible) es el objetivo máximo — todo lo demás se subordina a él.

---

## 🔍 Auditoría ECC + Council (6-jul-2026) — ver `documentos/21`

> Auditoría externa al paradigma con dos frameworks de Erik: **ECC** (dimensión técnica: arquitecto + python-reviewer + security-reviewer) y **Council** (dimensión estratégica: Sutskever + Taleb + Munger, Chairman opus, modo quick 2 rondas).

**Resultado consolidado (un único veredicto):** *Barbell 90/10* — 90% Yésika (ingreso cierto $3-5k/sem), 10% open-pax **estrechado de 316 capacidades a ≤5 capacidades narrow sobre Yésika**, en sustrato propio (laptop + celular) para lo reversible y VM propia solo para lo irreversible, con Erik dentro del lazo hasta watchdog probado 30 días.

**Hallazgos técnicos críticos (ECC):**
- 🔴 **Ollama expuesto al internet público** en VM SP (`letta/docker-compose.yml:48-49`). Único hallazgo explotable HOY sin error humano → **cerrar puerto HOY**.
- 🔴 `telegram-bridge.py:130` en dev-mode abierto (si `ALLOWED_USERS` vacío = acceso libre al agente autónomo).
- 🔴 `setup-agent.py:79-83` y `setup-agent-remote.py:79-83` hacen `delete` del agente **sin backup** = destrucción irreversible de memoria.
- 🔴 Letta endpoint 8283 sin auth; `add_model_internal.py` AttributeError garantizado; `setup-model.py` sin `raise_for_status`; `letta/deploy.sh:25` pipe-to-shell `get.docker.com`.
- 🟢 Secretos en git históricos **limpios** (137 blobs revisados, solo `.env.example` con placeholders). Riesgo real = un `git add .` futuro.
- 🟡 `recursos/bitacora/01_apis-llm.md` (commiteado) filtra metadatos: rutas absolutas del disco de Erik, conteo de claves. Inteligencia de objetivo.

**Claves a regenerar (orden):** Telegram bot token → OpenRouter → OpenCode → 4× LITELLM_* → 11 claves LLM de cerebropax. Anthropic está **suelta** (no en ningún `.env`), guardar en vault.

**Council — split real sin resolver:** ¿VM propia antes de Fase 1 (Taleb: sí, dealbreaker) o solo antes de lo irreversible (Sutskever: no; Munger: split)? Con los **4 nodos propios de Erik** (laptop + celular + 2 VM Oracle), la postura de Sutskever gana peso: los reversibles caben en sustrato propio diurno. Falta dato: costo de migrar a VM propia vs. probabilidad real de baneo en 30-60 días.

**Kill switch del veredicto:** si para 2026-08-06 open-pax consume >10% del tiempo sin transferir aprendizaje a Yésika, O se banea una VM sin redundancia, O las claves siguen sin regenerar → pausar open-pax, 100% a Yésika.

---

## 🧠 Re-encuadre del propósito (6-jul-2026) — ver `documentos/22`, `23`, `24`

> Tras la auditoría, Erik aclaró el propósito real: open-pax NO es un agente autónomo de 316 capacidades — es su **asistente personal para ejecución+seguimiento de tareas** (TDAH + Altas Capacidades Cognitivas), re-encuadrado como su **lóbulo frontal externo** (TDAH = hipofrontalidad).

**Tres decisiones en cadena (todas a disco):**

- **`documentos/22` — Motor: Hermes, no Letta, no OpenClaw.** Hermes ya está instalado en `AppData\Local\hermes\` con `state.db`, `memories\`, `cron\`, `skills\`, `sandboxes\` vivos + gateway nativo a Telegram/Discord/Slack/WhatsApp/Signal. Hace nativamente todo lo que Letta+bridge custom construirían → elimina 4 de 6 hallazgos 🔴 de la auditoría. Costo de cambio = 0.

- **`documentos/23` — Spec fundacional: open-pax = lóbulo frontal de Erik.** 7 funciones frontales (iniciación, memoria de trabajo, planificación, flexibilidad, inhibición, seguimiento, regulación emocional 🟡límite-ético). Principio de diseño #1: **andamiaje, no muleta** — Hermes dirige/recuerda/frena (entrena el lóbulo frontal real), NUNCA ejecuta por Erik (lo atrofiaría). Sigue el paradigma single-agent+autoverify+reversible como arquitectura, pero el propósito cambia de "robot autónomo 316 caps" a "lóbulo frontal de Erik implementado en Hermes".

- **`documentos/24` — Arquitectura: Hermes + n8n (cerebro + manos).** n8n (orquestador de workflows determinista) complementa a Hermes (cognición). Patrón: `Erik → Hermes (decide) → n8n (ejecuta APIs) → Hermes (interpreta) → Erik`. Anti-TDAH: **fasear, NO sumar de golpe** — Fase 1 = solo Hermes (80% del valor), Fase 2 = n8n SOLO cuando una skill de Hermes necesite una API externa que no tenga nativa. n8n ya existió en el Hetzner (caído 2-jul); `N8N_API_KEY` aún en `keys.env` pero sin instancia. Desplegar en VM Oracle (NO laptop, RAM al límite), webhook interno solo por Tailscale.

**Pendientes vigentes (de la cadena 22-24):**
1. Verificar si Hermes gateway a Telegram ya está configurado (doc 22 Paso 1).
2. Conectar Hermes a `AGENTS.md` (Contexto-IA) para que sepa quién es Erik.
3. Construir skill #1 "¿qué toca hoy?" (función frontal #3, lee `mi-tablero.html`).
4. Archivar `codigo/letta/` a `_archivados/letta-no-desplegado/` (mover, no borrar).
5. Mini-autodiagnóstico de las 7 funciones frontales (decide cuál skill construir primero).
6. 🔴 HOY: cerrar Ollama 11434 al internet (doc 21 Paso 1) + regenerar claves.

---

*open-pax v3 · 5-jul-2026 (actualizado 6-jul-2026 con re-encuadre lóbulo frontal docs 22-24) · Paradigma: single-agent + autoverify + reversible · Motor: Hermes · Orquestador: n8n (Fase 2) · Consejo de 18 miembros*

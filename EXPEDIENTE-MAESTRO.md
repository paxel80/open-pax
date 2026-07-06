# 🧠 open-pax — EXPEDIENTE-MAESTRO v3

> **Fuente única de verdad.** Rediseñado 5-jul-2026 desde el veredicto del Consejo de 18 miembros.
> Repo: https://github.com/paxel80/open-pax
> **El objetivo máximo es la autonomía. Nada es dogma, excepto el objetivo.**

---

## ¿Qué es open-pax?

**Un agente autónomo de propósito general** que opera sin supervisión humana continua.
Aspira a adquirir/replicar un espectro amplio de capacidades humanas — cognición, comunicación, percepción, memoria, acción digital, creatividad, aprendizaje, autogestión, razonamiento social, juicio ético.

| Área | Qué cubre |
|---|---|
| 🗂️ **Organización** | Proyectos, priorización, deadlines, conexiones |
| 🔬 **Investigación** | Escaneo de tendencias 24/7, alerta de obsolescencia, validación |
| 🛠️ **Trabajo** | Construcción de código, dossiers, proyectos reales |
| 💚 **Personal** | Finanzas, salud mental (TDAH/ACC), agenda, hábitos, relaciones |

**Erik = diseñador ex-ante + auditor ex-post.** Define objetivos e invariantes una vez, revisa trazas después.
**open-pax = agente autónomo.** Razona, actúa, se verifica y se corrige solo, dentro de un perímetro de acciones reversibles.

---

## 🎯 OBJETIVO MÁXIMO — El Paradigma

> **Establecido por el Consejo de 18 miembros (15/16 unánime, 3 rondas, autonomía máxima).**
> Ver veredicto completo: `documentos/14_veredicto-consejo-estado-del-arte.md`

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

| # | Mecanismo | Qué reemplaza del humano |
|---|---|---|
| 1 | **Auto-verificador adversarial** — 2º LLM con instrucción de refutar la acción | La duda humana |
| 2 | **Reversibilidad por diseño** — toda acción es compensable o sandboxed | La intercepción del error |
| 3 | **Kill-switches automáticos** — watchdog por invariantes violadas | El "botón de pánico" |
| 4 | **Memoria como espejo** — el agente lee su historial y se autocorrige | La supervisión continua |

---

## 🌟 Reglas de Oro (v3 — alineadas a autonomía máxima)

> Las Reglas de Oro v2 quedan sin efecto. Estas son las únicas que rigen open-pax.

### R1 — Autonomía es el objetivo, no una mejora
open-pax debe operar **sin supervisión humana continua**. El humano diseña ex-ante (objetivos, invariantes, perímetros) y audita ex-post (trazas). **No aprueba cada acción.** Toda regla, componente o decisión que introduzca human-in-loop como dependencia permanente viola el objetivo.

### R2 — Reversibilidad por defecto
Toda acción del agente debe ser **reversible o confinada a sandbox**. Si una acción no puede deshacerse, se bloquea por defecto hasta que se defina un kill-switch automático. El error no necesita intercepción humana — se deshace solo. La irreversibilidad es la excepción que requiere dead-man's switch, no la regla.

### R3 — Auto-verificación obligatoria
Antes de ejecutar cualquier acción, el agente debe pasar por su **auto-verificador**: un segundo pase adversarial (LLM con instrucción de refutar) + tests deterministas (lint, typecheck, dry-run). Si el verificador no aprueba, la acción no se ejecuta — se reescribe o se aborta. Sin verificador, no hay acción.

### R4 — Kill-switch por invariantes, no por humanos
Los kill-switches se disparan cuando los **invariantes** (presupuesto, tasa de error, blast radius, permisos) se violan — automáticamente. El humano no es el interruptor; el invariante lo es. Erik define los invariantes una vez, antes del despliegue. El watchdog los ejecuta.

### R5 — Resultado sobre método
Se puede implementar y combinar cualquier cosa. No importa el método, lo ortodoxo o lo complejo. **Importa el resultado autónomo.** Si juntar 7 herramientas raras logra la capacidad autónoma, se juntan.

### R6 — Sin limitantes artificiales
No hay límites técnicos ni económicos pre-establecidos. La única restricción: no hacer gastos innecesarios. $0 es deseable, $1,500 MXN/sem que rinda 100x es aceptable. El presupuesto compra mejores modelos, no más capas.

### R7 — Todo sujeto a cambio
Nada es dogma excepto el objetivo (autonomía). Si mañana sale una tecnología que mejora la auto-verificación, la reversibilidad o la memoria, se migra. Si un enfoque no produce autonomía, se descarta sin culpa.

### R8 — Tú imaginas, el sistema construye
Erik no programa. Erik es el cerebro creativo que imagina y decide objetivos. open-pax (construido por cualquier agente de IA) escribe el código, lo ejecuta, lo prueba, se auto-verifica y se lo entrega a Erik como un electrodoméstico autónomo: funciona solo.

### R9 — Tolerancia cero a la amnesia
Todo estado importante va a disco. El sistema sobrevive a reinicios, caídas de luz y cambio de sesión. La memoria es legible y auditable — Erik puede reconstruir causalmente cualquier decisión del agente. Nada se queda en la conversación.

### R10 — Honestidad radical
Semáforos 🟢🟡🔴 siempre. Si una capacidad está al 60%, se dice 60%. Si algo viola TOS, se documenta. Si algo no es posible autónomamente hoy, se dice. Si el auto-verificador tiene falsos negativos, se mide y se reporta. La confianza en el expediente es absoluta.

### R11 — Diseñado para TDAH
UN solo siguiente paso para Erik. Sin listas abrumadoras. El sistema autónomo prioriza, ejecuta y reporta: "hice esto, aquí está el resultado". Sin culpa por lo que no se hizo — el sistema lo retomará.

---

## 🔩 Hardware y servicios

### Hardware
| Recurso | Especificación | Estado |
|---|---|---|
| Oracle nube1 (São Paulo) | 4 vCPU ARM, 24 GB RAM | 🟢 Viva, Tailscale, Letta desplegado |
| Oracle nube2 (Frankfurt) | 4 vCPU ARM, 24 GB RAM | 🟢 Viva, Tailscale, workspace |
| Laptop ASUS | i5-11400H, 7.7 GB RAM, RTX 3050 4 GB VRAM | 🟢 Activa |
| 2do equipo Tailscale | Ollama con qwen3-abliterated:14b + embeddings bge-m3 | 🟢 Accesible |
| Xiaomi 14T Pro | Nodo Tailscale, panel de control | 🟢 Activo |

### APIs y servicios
| Servicio | Para qué | Costo | Estado |
|---|---|---|---|
| Groq API | Cerebro rápido gratis (Llama 3) | $0 | 🟢 |
| NVIDIA NIM | ~121 modelos gratis | $0 | 🟢 |
| DeepSeek API | Código barato | centavos | 🟡 |
| Google Gemini | Free tier | $0 | 🟢 |
| Anthropic API | Claude (calidad tope) | $$-$$$ | 🟡 |
| OpenRouter | 100+ modelos, 1 llave | variable | 🟡 (regenerar key) |
| Telegram Bot API | Interfaz con Erik | $0 | 🟢 @LaInconclusa80_bot |
| Cloudflare | DNS + Tunnel + R2 | $0 | 🟢 |
| Tailscale | Malla privada | $0 | 🟢 |
| GitHub | Repos + Pages + Actions | $0 | 🟢 |
| Supabase | DB + auth | $0 | 🟢 |

### Presupuesto operativo
- $1,500 MXN/sem ≈ $370 USD/mes para APIs pagas
- Distribución: ~$80 API económica (Groq/DeepSeek) · ~$200 API premium (GPT-4o-mini/Haiku) · ~$90 reserva

---

## 🏗️ Arquitectura objetivo (alineada al paradigma)

### Componentes del paradigma single-agent+autoverify+reversible

| Componente | Rol | Estado actual | Estado objetivo |
|---|---|---|---|
| **LLM núcleo** | Razonamiento + tool-calling | Letta con OpenCode Zen big-pickle | LiteLLM/cerebropax enruta a Qwen3/Llama-4 + APIs |
| **Tool-calling (MCP)** | Estándar de herramientas | Pendiente | MCP server con tools reversibles |
| **Memoria legible** | Audit trail + contexto | pgvector (Letta) | pgvector + Qdrant + logs estructurados |
| **Auto-verificador** | 2º pase adversarial + tests | Pendiente | LLM-as-judge (modelo distinto) + eval suite |
| **Sandbox reversible** | Ejecución con undo | Pendiente | Docker + git checkpoint + dry-run |
| **Kill-switch automático** | Watchdog por invariantes | Pendiente | Watchdog determinista por invariantes |

### Asignación a nodos

| Nodo | Aloja | Por qué |
|---|---|---|
| nube1 (SP, 24 GB) | Letta (agente + memoria) | Ya desplegado, memoria activa |
| nube2 (FRA, 24 GB) | LiteLLM/cerebropax + sandbox + watchdog | Workspace, más RAM disponible |
| Laptop | Modelos locales (Qwen3:4b) + SD + Whisper | GPU local |
| 2do equipo | Modelos grandes (Qwen3:14b) | Más VRAM/cómputo |
| Xiaomi | Panel de control + notificaciones | Siempre con Erik |

---

## 📊 Frontera de capacidades (estado del arte 2026)

> Fuente: Veredicto del Consejo (documentos/14)

| Capacidad | Estado | Notas |
|---|---|---|
| Cognición/razonamiento acotado | 🟢 Alta | Fiable en dominios delimitados |
| Comunicación (texto, voz) | 🟢 Alta | TTS/STT maduros |
| Acción digital (tool-calling) | 🟢 Alta | MCP como estándar |
| Memoria (RAG, vectorial) | 🟡 Media | Frágil a escala, requiere poda |
| Percepción multimodal | 🟡 Media | Madura puntual, no continua |
| Creatividad | 🟡 Media | Recombinación, no extrapolación |
| Planificación >5-10 pasos | 🔴 Baja | Error acumula exponencialmente |
| Acción física general | 🔴 Imposible | Robótica = investigación |
| Juicio ético autónomo | 🔴 Imposible | Simulado, no fundamentado |
| Auto-mejora sin deriva | 🔴 Imposible | Problema abierto |
| Aprendizaje en pesos | 🔴 Imposible | No demostrado |

### Regla de autonomía por capacidad
- 🟢 Autonomía plena donde hay **verificador objetivo** (tests, dry-run, validadores)
- 🟡 Autonomía con supervisión donde el verificador es LLM-as-judge (puede alucinar)
- 🔴 Sin autonomía donde no hay verificador — modo asistido (cola diferida)

---

## 🚧 Hoja de ruta (alineada al paradigma)

### Fase 0 — Fundación 🟢 COMPLETA
- [x] 2 VMs Oracle A1 4/24 ARM vivas, Tailscale
- [x] Xiaomi 14T Pro como nodo Tailscale
- [x] Letta desplegado en nube1 con pgvector + Telegram bridge
- [x] Timeout resuelto (migrado a OpenCode Zen big-pickle)

### Fase 1 — Núcleo autónomo ⏳ ACTUAL
- [ ] Desplegar LiteLLM/cerebropax en nube2 (router de modelos)
- [ ] Implementar MCP server con tools reversibles
- [ ] Implementar auto-verificador (2º LLM adversarial + eval suite)
- [ ] Implementar sandbox reversible (Docker + git checkpoint + dry-run)
- [ ] Implementar watchdog con invariantes (presupuesto, blast radius, tasa error)
- [ ] Conectar Letta → LiteLLM (unificar gateway de modelos)
- [ ] **Hito:** agente ejecuta una tarea autónoma, se auto-verifica, revierte si falla, reporta resultado a Erik por Telegram — sin intervención humana

### Fase 2 — Capacidades autónomas ⏳
- [ ] 10 capacidades tipo A con verificador objetivo (código, configs, SQL)
- [ ] Memoria legible con poda automática
- [ ] Sub-agentes para tareas acotadas (research, finanzas, organización)
- [ ] **Hito:** "investiga X y dame el reporte" → autónomo end-to-end

### Fase 3 — Profundidad ⏳
- [ ] Capacidades tipo A+R (mixto) con auto-verificación
- [ ] Voz natural (TTS/STT) integrada al agente
- [ ] Salud mental autónoma (recordatorios, tracking, alertas)
- [ ] **Hito:** "gestiona mi agenda esta semana" → autónomo

### Fase 4 — Percepción ⏳
- [ ] Visión multimodal (cámara + LLaVA)
- [ ] browser-use integrado como tool reversible
- [ ] **Hito:** "lee esta página y extrae los datos" → autónomo

### Fase 5 — Hardening antifragil ⏳
- [ ] Barbell: 90% reversible + 10% irreversible con dead-man's switch
- [ ] Telemetría de falsos negativos del verificador
- [ ] Auto-recalibración de umbrales por tasa de error
- [ ] **Hito:** sistema opera 30 días sin intervención, auditando sus propias trazas

### Fase 6+ — Lo que descubramos 🔮
- [ ] Lo que el estado del arte permita cuando lleguemos

---

## 📚 Documentos del proyecto

| Documento | Qué es |
|---|---|
| `EXPEDIENTE-MAESTRO.md` | Fuente única de verdad (este archivo, v3) |
| `documentos/06_capacidades-humanas-universales.md` | Taxonomía: 316 capacidades en 18 grupos |
| `documentos/07_capacidades-cuerpo-fisico-filtro.md` | Filtro: 48 capacidades que requieren cuerpo físico |
| `documentos/08_metodo-implementacion.md` | Reclasificación A (workflow) · R (recurso) · A+R (mixto) · N/A |
| `documentos/09_frameworks-tipo-A.md` | Framework óptimo para 91 capacidades tipo A |
| `documentos/10_recursos-proveedores-tipo-R.md` | Recurso + proveedor para 74 capacidades tipo R |
| `documentos/11_frameworks-tipo-AR.md` | Framework + recurso para 94 capacidades tipo A+R |
| `documentos/12_veredicto-consejo-arquitectura.md` | Veredicto v1 ($0+7.7GB): 2 capas. SUPERSEDEDO |
| `documentos/13_veredicto-consejo-arquitectura-v2.md` | Veredicto v2 (48GB+$370): 3 capas. SUPERSEDEDO |
| `documentos/14_veredicto-consejo-estado-del-arte.md` | **Veredicto --full (18 miembros, autonomía): single-agent+autoverify+reversible. OBJETIVO MÁXIMO.** |
| `codigo/letta/` | Stack Letta: Docker Compose + Telegram bridge + setup |
| `recursos/infraestructura/01_inventario-infraestructura.md` | Inventario completo de hardware, cuentas, APIs |
| `recursos/infraestructura/02_topologia-red.svg` | Diagrama de la red |
| `diagramas/01_panorama-vision-erik.svg` | Visión general: 4 áreas |
| `diagramas/02_ciclo-diario.svg` | Ciclo autónomo diario |
| `diagramas/03_arquitectura-capas.svg` | Arquitectura por capas |
| `diagramas/04_proyectos-reales-flujo.svg` | Flujo de proyectos reales |
| `diagramas/05_hoja-de-ruta.svg` | Fases visuales con semáforos |
| `visual/analisis-frameworks-capacidades.docx` | Word: 316 capacidades × frameworks |
| `visual/reporte-capacidades-pdf.html` | HTML: 316 capacidades por grupo |
| `visual/reporte-metodo-implementacion.html` | HTML: 316 capacidades por método |
| `visual/reporte-frameworks-tipo-A.html` | HTML: 91 tipo A con framework óptimo |
| `visual/reporte-recursos-tipo-R.html` | HTML: 74 tipo R con recurso + proveedor |
| `visual/reporte-frameworks-tipo-AR.html` | HTML: 94 tipo A+R con framework + recurso |

## 🧩 Subproyectos

| Subproyecto | Qué es | Estado | Expediente |
|---|---|---|---|
| **recursospax** | Gestión centralizada de recursos técnicos: APIs, cuentas, tokens, modelos, claves | 🟡 Fase 1 en progreso | `recursospax/EXPEDIENTE-MAESTRO.md` |
| **cerebropax** | Banco de cerebros (LiteLLM): router único de modelos → componente del núcleo LLM | 🟡 Fase 1 en progreso | `cerebropax/EXPEDIENTE-MAESTRO.md` |
| **personalpax** | Área 💚 Personal: finanzas + salud mental + agenda + hábitos | 🟡 Fase 0 completa | `personalpax/EXPEDIENTE-MAESTRO.md` |

> **Nota:** Los subproyectos se reorientan al paradigma. cerebropax = el núcleo LLM. recursospax = provisión de recursos. personalpax = dominio de capacidades. El auto-verificador, sandbox y watchdog son componentes nuevos a crear.

---

## ⚠️ Honestidad (R10)

1. 🟢 **El paradigma está definido** por un Consejo de 18 perspectivas ortogonales (15/16 unánime).
2. 🟡 **No existe aún** el auto-verificador, el sandbox reversible ni el watchdog — son Fase 1.
3. 🟡 **La autonomía plena** es alcanzable solo donde hay verificador objetivo (tests, dry-run). Sin verificador, es ilusoria.
4. 🔴 **Imposible autónomamente hoy:** acción física, juicio ético fundamentado, auto-mejora sin deriva, planificación >5-10 pasos.
5. 🔵 **Este documento es v3.** Reemplaza v2. El paradigma (single-agent+autoverify+reversible) es el objetivo máximo — todo lo demás se subordina a él.

---

*open-pax v3 · 5-jul-2026 · Paradigma: single-agent + autoverify + reversible · Consejo de 18 miembros*
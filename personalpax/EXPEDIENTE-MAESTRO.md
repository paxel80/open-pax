# 💚 personalpax — EXPEDIENTE-MAESTRO v1

> **Subproyecto de open-pax.** Fuente única de verdad del área Personal.
> Padre: [`../EXPEDIENTE-MAESTRO.md`](../EXPEDIENTE-MAESTRO.md) (open-pax).
> Hermanos: [`../cerebropax/`](../cerebropax/) (banco de cerebros), [`../recursospax/`](../recursospax/) (bitácora de recursos).
> Creado: 5-jul-2026. **Sujeto a cambios continuos. Nada es dogma.**

---

## ¿Qué es personalpax? (para un niño de 10 años)

Imagina que tienes un **asistente personal de verdad** como los que usan los
ejecutivos, pero gratis y solo para ti. Es como tener una secretaria + contador +
coach de salud mental en el bolsillo, que te habla por Telegram.

Se encarga de **4 cosas de tu vida diaria**:

| Emoji | Área | Qué hace por ti |
|---|---|---|
| 💵 | **Finanzas** | Anota tus gastos, te dice en qué gastaste, te avisa si te pasas del presupuesto |
| 🧘 | **Salud mental** | Te recuerda tomar tu medicación (TDAH/ACC), te pregunta cómo estás, te sugiere pausas |
| 📅 | **Agenda** | Guarda tus citas, te recuerda lo que tienes hoy, te ayuda a reprogramar |
| 🔁 | **Hábitos** | Sigue tus ritmos (dormir, ejercicio, comida), te anima sin agobiar |

**Una frase:** personalpax = el área 💚 Personal de open-pax, el asistente que
cuida tu dinero, tu mente, tu tiempo y tus hábitos — por Telegram, 24/7.

**La diferencia clave con recursospax:** recursospax lleva la bitácora de los
recursos *técnicos* (claves, APIs, cuentas cloud). personalpax gestiona tu vida
*personal* (dinero, salud, agenda). **Nada se mezcla.**

---

## 🎯 Objetivo actual (definido por Erik, 5-jul-2026)

**personalpax = gestión personal completa**, cubriendo las 4 áreas del expediente
padre: finanzas + salud mental + agenda + hábitos.

Hoy, Fase 1: **bitácora escrita** + primeros flujos por Telegram (recordatorios
de medicación, registro de gastos). Después: automatización creciente y alertas
proactivas.

La **ubicación de la parte 24/7** (qué servidor la corre) se define más adelante,
cuando sepamos qué componentes exactos necesita. Por ahora el foco es el diseño
y la bitácora.

---

## 🌟 Reglas de Oro

### PR1 — Erik es humano, no una máquina de productividad
personalpax NO es un sistema de "maximiza tu rendimiento". Es un sistema de
*"cuida a Erik sin agobiarlo"*. Si Erik no tomó su medicación, se le recuerda
**una vez**, sin culpa ni repetición. Si se saltó un hábito, no hay marca roja
castigadora. **Diseñado para TDAH**: un solo mensaje, una sola pregunta, cero
presión.

### PR2 — Todo por Telegram (por ahora)
El canal principal es Telegram (`@LaInconclusa80_bot`), el mismo bot que ya
funciona. personalpax no crea un nuevo bot ni una app: **usa el canal que Erik ya
tiene abierto**. Los recordatorios, preguntas y reportes llegan ahí. En el
futuro podrán sumarse WhatsApp (vía Constelación) o voz (Fase 4).

### PR3 — La privacidad es absoluta
Los datos personales (gastos, medicación, ánimo, citas) son **lo más sensible
del sistema**. NUNCA van a git, NUNCA se mandan a un LLM sin anonimizar, NUNCA
se exponen públicamente. La bitácora personal vive cifrada, solo accesible por
Erik. El LLM recibe el contexto mínimo necesario para responder, no tu historial
completo de salud.

### PR4 — Las 4 áreas, una a la vez
No se intentan las 4 áreas de golpe. Se avanza una, se estabiliza, y luego la
siguiente. Orden de prioridad (revisable):
1. 🧘 **Salud mental** primero — es la base. Si la medicación y el ánimo están
   OK, todo lo demás fluye.
2. 💵 **Finanzas** segundo — quita el estrés del dinero.
3. 📅 **Agenda** tercero — organiza el tiempo.
4. 🔁 **Hábitos** cuarto — optimiza los ritmos.

### PR5 — Datos honestos, no inventados
Si no sabemos cuánto gastó Erik el mes pasado, se dice "🔴 sin datos". Si el
saldo de la tarjeta es desconocido, se anota. No se estiman números personales
al aire. Lo que no se sabe, se dice que no se sabe.

### PR6 — Supervisión humana (heredada R6)
Gastar dinero, agendar citas médicas, hacer transferencias: el sistema **propone
y Erik decide** con un botón. Nunca ejecuta una acción delicada solo.

---

## 💚 Las 4 áreas en detalle

### 🧘 Salud mental (prioridad 1)

**Por qué primero:** Erik tiene TDAH + Alta Capacidad Cognitiva (ACC). La
medicación y el manejo del ánimo son la base de todo lo demás. Si esto falla, lo
demás no rinde.

| # | Capacidad | Estado | Cómo |
|---|---|---|---|
| 1 | Recordar medicación (TDAH/ACC) | ⏳ | Cron que manda Telegram a la hora de la dosis. Una vez, sin repetir. |
| 2 | Check-in de ánimo diario | ⏳ | Pregunta "¿cómo estás 1-5?" una vez al día. Guarda la respuesta. |
| 3 | Detección de baja sostenida | ⏳ | Si 3 días seguidos <3 → mensaje cálido, no clínico |
| 4 | Pausas sugeridas | ⏳ | Si lleva X horas trabajando → "toma 10 min" |
| 5 | Anclar a sueño | ⏳ | Recordatorio de hora de dormir (el TDAH rompe el ciclo) |

**⚠️ Encuadre honesto:** personalpax **no es terapia**. No diagnostica, no
reemplaza a un profesional. Es un **asistente que recuerda y acompana**. Si
detecta algo serio, sugiere contactar a su médico.

### 💵 Finanzas (prioridad 2)

| # | Capacidad | Estado | Cómo |
|---|---|---|---|
| 1 | Registrar gasto por Telegram | ⏳ | "Gasté 50 en comida" → lo guarda categorizado |
| 2 | Reporte semanal de gastos | ⏳ | Domigo: "gastaste $X esta semana, Y% en comida" |
| 3 | Presupuesto por categoría | ⏳ | Meta mensual + alerta al 80% |
| 4 | Tracking de suscripciones | ⏳ | Lista de recurrentes (Netflix, etc.) + total/mes |
| 5 | Saldo de cuentas | ⏳ | 🔴 requiere integración bancaria (definir API) |

**⚠️ Datos sensibles:** los números de gastos son reales pero NUNCA van a git
ni a un LLM en texto plano. El LLM recibe "gasto de $50 en categoría comida",
no el número de tarjeta ni el nombre del comercio.

### 📅 Agenda (prioridad 3)

| # | Capacidad | Estado | Cómo |
|---|---|---|---|
| 1 | Guardar cita por Telegram | ⏳ | "Cita doctor 8-jul 10am" → la guarda |
| 2 | Recordatorio de hoy | ⏳ | Cada mañana: "hoy tienes: X, Y, Z" |
| 3 | Reprogramar | ⏳ | "reagenda X al viernes" → lo mueve |
| 4 | Sincronizar con calendario | 🔴 | Requiere Google Calendar API (definir) |

### 🔁 Hábitos (prioridad 4)

| # | Capacidad | Estado | Cómo |
|---|---|---|---|
| 1 | Tracker de sueño | ⏳ | "me acosté a las 2am" → lo registra |
| 2 | Streak de hábitos | ⏳ | "ejercicio" → marca el día, sin castigo si falla |
| 3 | Patrones semanales | ⏳ | "esta semana dormiste mejor que la anterior" |
| 4 | Anclaje a ritmos | ⏳ | Detecta cuándo eres más productivo y lo sugiere |

---

## 🧩 Arquitectura (sujeta a evolución)

### Los personajes

| Emoji | Nombre | Dónde vive | Rol |
|---|---|---|---|
| 👑 | Erik | Laptop + Xiaomi | El humano: siente, decide, responde |
| 🧠 | Letta | Oracle SP | Ya responde por Telegram. Aquí se le añaden los flujos personales |
| 💾 | Bitácora personal | 🔴 por definir | Donde se guardan los datos sensibles (cifrada) |
| ⏰ | Cron personal | 🔴 por definir | El que dispara recordatorios a las horas exactas |
| 🔒 | Capa de privacidad | 🔴 por definir | Anonimiza datos antes de mandarlos al LLM |

### Diagrama

```
              Erik (Telegram @LaInconclusa80_bot)
                          │
                          ▼
                ┌─────────────────┐
                │  Letta (SP)     │  ← ya responde, se le añaden flujos
                │  open-pax agent │
                └────────┬────────┘
                         │
            ┌────────────┼────────────┐
            ▼            ▼            ▼
       ┌─────────┐  ┌─────────┐  ┌─────────┐
       │ Salud   │  │ Finanzas│  │ Agenda  │
       │ mental  │  │         │  │         │
       └────┬────┘  └────┬────┘  └────┬────┘
            │            │            │
            └────────────┼────────────┘
                         ▼
                ┌─────────────────┐
                │ Bitácora pers.  │  ← cifrada, NUNCA en git
                │ (datos sensib.) │
                └─────────────────┘
                         │
                         ▼
                ┌─────────────────┐
                │ Cron 24/7       │  ← dispara recordatorios
                │ (por definir)   │
                └─────────────────┘
```

### Flujo de un recordatorio de medicación

```
1. Cron (24/7) dispara a las 9:00, 13:00, 19:00 (horarios ejemplo)
2. Llama a Letta: "recuerda a Erik su medicación de TDAH"
3. Letta manda por Telegram: "🧘 Hora de tu medicación. Un toque. 💚"
4. Si Erik responde "tomada" → Letta lo anota en la bitácora
5. Si Erik NO responde → UN solo recordatorio a los 15 min, y se acaba
6. Los datos de adherencia se guardan cifrados (nunca en git)
```

---

## 🚧 Hoja de ruta (fluida)

### Fase 0 — Crear el subproyecto 🟢 COMPLETA (esta sesión)
- [x] Erik definió personalpax como nuevo subproyecto
- [x] Reglas de Oro establecidas (PR1-PR6)
- [x] 4 áreas definidas con prioridades
- [x] Carpeta + estructura creada (`personalpax/`)
- [x] EXPEDIENTE-MAESTRO.md creado (este archivo)

### Fase 1 — Bitácora escrita + primer flujo 🟡 EN PROGRESO
> Un documento donde está TODO el estado personal (medicación, gastos,
> citas), y el primer recordatorio funcionando por Telegram.

- [ ] **1.1** Definir dónde viven los datos sensibles (cifrados, fuera de git)
- [ ] **1.2** Crear `bitacora/01_medicacion.md` — horarios, dosis, adherencia
- [ ] **1.3** Crear `bitacora/02_gastos.md` — formato de registro, categorías
- [ ] **1.4** Crear `bitacora/03_animo.md` — registro diario de ánimo
- [ ] **1.5** Crear `bitacora/04_citas.md` — agenda simple
- [ ] **1.6** Configurar el primer cron de recordatorio (medicación) en Letta
- [ ] **1.7** Probar: Erik recibe el recordatorio por Telegram y responde
- [ ] **Hito:** el bot le recuerda la medicación a Erik y anota si la tomó

### Fase 2 — Registro de gastos + reportes 🟡
- [ ] Flujo "gasté X en Y" → Letta lo categoriza y guarda
- [ ] Reporte semanal automático (domingo por Telegram)
- [ ] Presupuesto mensual con alerta al 80%
- [ ] Tracking de suscripciones recurrentes
- [ ] **Hito:** "¿cuánto gasté este mes?" → respuesta precisa por Telegram

### Fase 3 — Agenda + check-in de ánimo 🟡
- [ ] Guardar y recordar citas por Telegram
- [ ] Check-in diario de ánimo (1-5) con tendencia
- [ ] Detección de baja sostenida (3 días <3 → mensaje cálido)
- [ ] **Hito:** el asistente conoce el ritmo de Erik y lo cuida

### Fase 4 — Hábitos + patrones 🔮
- [ ] Tracker de sueño y hábitos (sin castigo)
- [ ] Patrones semanales ("dormiste mejor esta semana")
- [ ] Anclaje a horas de mayor productividad
- [ ] **Hito:** "tu mejor hora para trabajar es de 10 a 13"

### Fase 5 — Integración bancaria (opcional) 🔮
- [ ] Investigar API bancaria mexicana (Open Banking / Pluggy / Belvo)
- [ ] Sincronización automática de saldos
- [ ] **Hito:** saldo real sin anotar a mano

### Fase 6+ — Lo que venga 🔮
- [ ] Sincronización con Google Calendar
- [ ] Recordatorios de voz (cuando Fase 4 de open-pax esté lista)
- [ ] Detección de patrones complejos (gasto + ánimo + sueño correlacionados)
- [ ] Lo que descubramos en el camino

---

## 📚 Documentos del subproyecto

| Documento | Qué es |
|---|---|
| `EXPEDIENTE-MAESTRO.md` | Fuente única de verdad (este archivo) |
| `bitacora/01_medicacion.md` | Horarios, dosis, registro de adherencia (Fase 1) |
| `bitacora/02_gastos.md` | Formato de registro de gastos y categorías (Fase 1) |
| `bitacora/03_animo.md` | Registro diario de ánimo (Fase 1) |
| `bitacora/04_citas.md` | Agenda simple (Fase 1) |
| `documentos/01_privacidad-datos.md` | Cómo se anonimizan y cifran los datos sensibles |
| `documentos/02_por-que-salud-mental-primero.md` | Por qué empezamos por TDAH/ACC y no por finanzas |
| `documentos/03_integracion-letta.md` | Cómo se añaden los flujos personales al agente existente |
| `diagramas/01_panorama-personalpax.svg` | Las 4 áreas y su flujo |
| `codigo/setup-cron-medicacion.sh` | Script para configurar el primer cron (Fase 1) |

---

## ⚠️ Honestidad

1. 🟢 **El canal ya existe.** Letta ya responde por Telegram. personalpax solo
   añade flujos a lo que ya funciona. No se construye nada desde cero.
2. 🟡 **Los datos sensibles son lo más delicado.** Gastos, medicación y ánimo
   son íntimos. La Fase 1.1 (dónde y cómo guardarlos) es lo primero que se
   resuelve, antes de registrar nada.
3. 🟡 **personalpax NO es terapia.** Es un asistente que recuerda y acompaña.
   No diagnostica ni reemplaza a un profesional de salud mental.
4. 🟢 **Costo $0.** Telegram + Letta ya corren gratis. La bitácora es markdown.
   Los crons son gratis. La integración bancaria (Fase 5) podría tener costo.
5. 🔵 **La ubicación 24/7 se define después.** Erik pidió no decidirla ahora.
   Cuando sepamos qué componentes exactos necesita (cron, BD, etc.), se elige
   entre Oracle SP (con Letta) o FRA (con cerebropax).
6. 🔵 **Este documento cambia.** Hoy son 4 áreas. Mañana pueden ser 5 o 3 si
   descubrimos que algo sobra o falta.

---

## 🔗 Conexión con otros subproyectos

| Subproyecto | Relación con personalpax |
|---|---|
| **open-pax padre** | personalpax implementa el área `💚 Personal` (una de las 4 áreas de open-pax). El expediente padre referencia este subproyecto. |
| **cerebropax** | Los flujos de personalpax usan los cerebros de cerebropax para entender "gasté 50 en comida" y categorizarlo. |
| **recursospax** | 🟢 **límite claro**: recursospax gestiona recursos *técnicos* (APIs, claves). personalpax gestiona la vida *personal* (dinero, salud). **No se mezclan.** Las suscripciones de entretenimiento (Netflix, Spotify) son un caso límite: si son *gasto personal* van a personalpax/finanzas; si son *recurso técnico* van a recursospax. Criterio: si lo paga Erik para su vida, va a personalpax. |
| **Letta (SP)** | Es el cerebro que ya responde por Telegram. personalpax le añade los flujos personales (crons, tools de registro). |

### Caso límite: ¿Netflix a dónde va?
- Si Netflix lo vemos como **gasto personal de Erik** → `personalpax/bitacora/02_gastos.md`
  (suscripción recurrente en el presupuesto).
- Si Netflix lo vemos como **recurso técnico que open-pax consume** (p. ej. si un
  agente usara la API de Netflix) → `recursospax/bitacora/04_api-tokens.md`.
- **Criterio de Erik (5-jul-2026):** las suscripciones personales de
  entretenimiento son **gasto personal** → van a personalpax. recursospax es
  solo para lo técnico.
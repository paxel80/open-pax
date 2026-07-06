# Frameworks + recursos + proveedores para capacidades tipo A+R

> Asignación uno-a-uno de **framework (orquestador) + recurso + proveedor** para cada una de las 94 capacidades tipo A+R.
> Tipo A+R = mixto: un recurso (LLM, sensor, API, modelo) ejecuta acciones dentro de un workflow.
> Creado: 5-jul-2026 · open-pax/documentos/11

---

## Marco de frameworks

| Framework | Rol | Cuándo se usa |
|---|---|---|
| **n8n** | Orquestación visual sin código | Workflows con APIs, cron, sensores, RPA. Erik ve el flujo (R4). |
| **Letta** | Agente con memoria + tool calling | Conversación, autonomía, TDAH (un solo paso), seguimiento personal. |
| **LangChain** | Cadena LLM + tools programática | RAG complejo, pipelines IA, análisis con tools, investigación. |
| **CrewAI** | Multi-agente (roles que deliberan) | Negociación, debate, defensa legal, diseño colaborativo. |
| **Scripts** | Python/bash dedicado | Matemática, IaC, procesos específicos (invocados desde n8n). |

## Resumen por framework

| Framework | Capacidades | % |
|---|---|---|
| LangChain | 38 | 40% |
| n8n | 32 | 34% |
| Letta | 17 | 18% |
| CrewAI | 7 | 7% |
| **TOTAL** | **94** | 100% |

### Conclusión

- **LangChain domina** con 38 capacidades (29%): A+R es el dominio de los pipelines IA — RAG, tools, análisis.
- **n8n** con 32 (orquesta sensores/APIs/finanzas): el pegamento que conecta recursos.
- **Letta** con 17: el punto de contacto humano (conversación, TDAH, seguimiento personal).
- **CrewAI** con 7: multi-agente para deliberación (negociar, debatir, defensa legal).
- **Aquí LangChain y CrewAI SÍ aparecen** — a diferencia de tipo A (donde no había LLM). Son los frameworks de agentes.
- **Letta + LangChain + CrewAI** = trío de agentes IA; **n8n** = orquestador visual. Juntos cubren las 94 A+R.

---

## Tabla completa (uno a uno)

| # | Capacidad | Framework | Recurso + proveedor | Notas |
|---|---|---|---|---|
| 1.1 | Percibir (notar, darse cuenta) | **n8n** | Sensor (ESP32/IPCámara) + LLaVA vía Ollama (2do equipo) | n8n escucha eventos del sensor → LLaVA interpreta imagen → decision. |
| 1.6 | Consolidar / dormir sobre algo | **n8n** | pgvector + cron batch | Cron nocturno: n8n consolida memorias del día en pgvector. |
| 1.11 | Resolver problemas | **LangChain** | cerebropax (qwen3-abliterated:14b) + tools | Pipeline: LLM planifica → tools ejecutan → LLM evalúa resultado. |
| 1.17 | Analizar (descomponer) | **LangChain** | cerebropax (qwen3:14b) + n8n (extraccion) | LangChain descompone; n8n extrae subdatos; LLM sintetiza. |
| 1.18 | Sintetizar (componer) | **LangChain** | cerebropax (qwen3:14b) + n8n (agregacion) | n8n reúne partes → LangChain sintetiza con LLM. |
| 2.4 | Escribir texto | **Letta** | cerebropax (qwen3:4b) + plantilla | Letta conversa con Erik → genera texto con plantilla. |
| 2.5 | Redactar documentos | **LangChain** | cerebropax (qwen3:14b) + n8n (plantillas) | LangChain redacta por secciones; n8n ensambla documento final. |
| 2.12 | Negociar | **CrewAI** | cerebropax (qwen3:14b) + n8n (comms) | CrewAI: agente vendedor + agente comprador deliberan; n8n envía mensajes. |
| 2.15 | Hacer preguntas | **Letta** | cerebropax (qwen3:4b) + n8n (search tool) | Letta pregunta con tool calling (search, DB); n8n ejecuta tools. |
| 2.16 | Escuchar activamente | **Letta** | faster-whisper (STT) + cerebropax (qwen3:14b) | Letta escucha vía Telegram voice → Whisper transcribe → LLM responde empático. |
| 2.21 | Comunicar por voz (teléfono) | **n8n** | Piper (TTS) + Twilio/LiveKit (free trial) | n8n dispara llamada → Piper sintetiza voz → Twilio conecta. 🟡 Twilio tiene costo. |
| 2.22 | Comunicar por video | **n8n** | Cámara + LiveKit (open source self-hosted) | LiveKit self-hosted en nube2 (free, Docker); n8n orquesta. 🟡 avatar video = 🔴 difícil. |
| 4.5 | Dibujar / ilustrar | **n8n** | Stable Diffusion 1.5 (local) + plotter/impresora | n8n → SD genera imagen → envía a impresora/plotter. 🟡 plotter = hardware. |
| 4.15 | Operar maquinaria | **n8n** | ESP32/relay (IoT) + Home Assistant | n8n → HA → ESP32 actúa relay. DIY económico. |
| 4.16 | Manipular pantallas/dispositivos | **n8n** | Playwright (RPA) + ADB (móvil) | n8n orquesta; Playwright/ADB ejecutan automatización UI. |
| 5.6 | Iniciar sesión en webs | **n8n** | Vaultwarden (credenciales) + Playwright | n8n lee credencial de Vault → Playwright hace login. |
| 5.8 | Crear cuentas en servicios | **n8n** | Vaultwarden + Playwright + email temp | n8n: genera email → Playwright rellena form → Vaultwarden guarda credencial. 🟡 captcha puede bloquear. |
| 5.11 | Programar / escribir código | **Letta** | cerebropax (qwen3:14b) + Docker sandbox | Letta con tool calling: LLM escribe código → sandbox ejecuta → LLM corrige. |
| 5.12 | Depurar código (debug) | **Letta** | cerebropax (qwen3:14b) + Docker sandbox | Letta: LLM analiza error → propone fix → sandbox prueba → iteración. |
| 5.20 | Diseñar (UI/UX, gráficos) | **LangChain** | cerebropax (qwen3:14b) + n8n (Excalidraw/SVG) | LangChain genera specs → n8n renderiza SVG/Excalidraw. |
| 5.21 | Editar imágenes / video / audio | **n8n** | ffmpeg + SD/Whisper (local) | n8n orquesta: ffmpeg corta/une → SD edita frames → Whisper subtitula. |
| 6.6 | Invertir | **LangChain** | API broker (Alpaca/Interactive Brokers) + modelo predictivo | LangChain: modelo predice → LLM decide → API broker ejecuta. 🟡 R6: Erik aprueba trades. |
| 6.7 | Pagar facturas / servicios | **n8n** | API banco (Open Finance MX) + cron | n8n: cron vencimiento → API banco paga → notify. 🟡 R6: confirmar pagos. |
| 6.8 | Transferir dinero | **n8n** | API banco + Vaultwarden | n8n: lee cuenta destino → API banco transfiere. 🟡 R6: confirmar. |
| 6.9 | Monitorear inversiones | **n8n** | API broker + Metabase | n8n: poll API → guarda en DB → Metabase dashboard vivo. |
| 6.14 | Cobrar a clientes | **n8n** | API (Stripe/facturador) + LLM (recordatorios) | n8n: detecta facturas vencidas → LLM redacta recordatorio → envía. |
| 6.15 | Negociar precios / descuentos | **CrewAI** | cerebropax (qwen3:14b) + n8n (comms) | CrewAI: agente vendedor + agente cliente negocian; n8n entrega resultado a Erik. |
| 6.16 | Comprar online | **n8n** | Playwright (RPA) + API pago | n8n: busca producto → Playwright añade al carrito → API pago checkout. 🟡 R6: confirmar. |
| 6.17 | Vender online | **n8n** | API marketplace (MercadoLibre) + LLM (descripciones) | n8n: LLM redacta descripción → API publica → gestiona pedidos. |
| 6.20 | Hacer forecast financiero | **LangChain** | Python (statsmodels) + cerebropax (qwen3:14b) | LangChain: modelo estadístico proyecta → LLM interpreta y explica. |
| 7.9 | Delegar | **n8n** | Router LLM (Letta) + humanos/subagentes | n8n: LLM clasifica tarea → enruta a agente/humano apropiado. |
| 7.15 | Hacer retrospectivas | **LangChain** | cerebropax (qwen3:14b) + pgvector (memoria) | LangChain: consulta historial en pgvector → LLM sintetiza lecciones. |
| 8.2 | Monitorear estado de ánimo | **Letta** | Telegram input + cerebropax (qwen3:4b) | Letta: Erik responde check-in diario → LLM analiza tendencia. |
| 8.3 | Detectar bajones prolongados | **n8n** | cerebropax (qwen3:14b) + pgvector + cron | n8n: cron revisa historial → LLM detecta patrón → alerta a Erik/contacto. |
| 8.6 | Fomentar ejercicio | **Letta** | Nudge LLM (qwen3:4b) + cron | Letta: cron sugiere ejercicio según historial; nudges sin castigo (R7). |
| 8.8 | Trackear alimentación | **Letta** | Telegram log + cerebropax (qwen3:4b) | Letta: Erik foto/log comida → LLM clasifica + analiza patrones. |
| 8.9 | Trackear síntomas físicos | **Letta** | Telegram log + cerebropax (qwen3:14b) | Letta: Erik registra síntoma → LLM correlaciona con historial. |
| 8.10 | Agendar citas médicas | **n8n** | API salud (Docplanner/Medic) + Calendar API | n8n: busca disponibilidad → agenda → reminder. 🟡 API MX limitada. |
| 8.12 | Detectar patrones de salud | **LangChain** | cerebropax (qwen3:14b) + pgvector | LangChain: correlaciona variables → LLM halla patrones → explica. |
| 8.13 | Gestionar estrés | **Letta** | cerebropax (qwen3:14b) + Piper TTS | Letta: detecta estrés → guía respiración vía texto/voz (Piper). |
| 8.14 | Fomentar hábitos (streaks) | **Letta** | Nudge LLM (qwen3:4b) + DB streaks | Letta: tracking racha; sin culpa si se rompe (R7 TDAH). |
| 8.15 | Detectar señales de alarma | **n8n** | cerebropax (qwen3:14b) + cron + notify | n8n: LLM evalúa síntomas → si alarma → notify urgente a Erik/contacto médico. |
| 8.18 | Gestionar crisis de ansiedad | **Letta** | cerebropax (qwen3:14b) + Piper TTS (urgente) | Letta: Erik dispara crisis → LLM guía respiración grounding; modo urgente. |
| 9.5 | Consolar / apoyar emocional | **Letta** | cerebropax (qwen3:14b) empático | Letta: conversa empático; NO reemplaza humano (R6). R8: limitación honesta. |
| 9.7 | Resolver conflictos | **CrewAI** | cerebropax (qwen3:14b) + n8n (comms) | CrewAI: agentes representan partes → median → proponen solución. |
| 9.8 | Dar feedback | **LangChain** | cerebropax (qwen3:14b) + RAG (contexto) | LangChain: RAG recupera contexto → LLM redacta feedback constructivo. |
| 9.9 | Recibir feedback | **Letta** | cerebropax (qwen3:14b) | Letta: recibe feedback → LLM lo procesa + propone acción. |
| 9.10 | Hacer networking | **LangChain** | cerebropax (qwen3:14b) + n8n (LinkedIn API/email) | LangChain: LLM identifica conexiones relevantes → n8n envía mensajes. |
| 9.12 | Organizar eventos sociales | **n8n** | cerebropax (qwen3:14b) + Calendar + invite API | n8n: LLM propone fecha/lugar → envía invites → recopula RSVP. |
| 9.18 | Enseñar / transmitir conocimiento | **LangChain** | cerebropax (qwen3:14b) + RAG | LangChain: RAG recupera material → LLM genera lección adaptada. |
| 9.20 | Detectar soledad / aislamiento | **n8n** | cerebropax (qwen3:14b) + pgvector (log social) | n8n: cron analiza frecuencia de contacto → LLM detecta aislamiento → sugiere. |
| 10.7 | Diseñar estética | **LangChain** | cerebropax (qwen3:14b) + n8n (Excalidraw) | LangChain: LLM propone estética → n8n renderiza preview. |
| 10.10 | Producir video / cine | **LangChain** | Modelo video (CogVideo/Runway free) + ffmpeg + LLM | LangChain: LLM escribe guion → modelo video genera clips → ffmpeg une. 🟡 modelo video pesado → API. |
| 10.11 | Diseñar productos / inventos | **CrewAI** | cerebropax (qwen3:14b) + FreeCAD (paramétrico) | CrewAI: agente diseñador + agente ingeniero deliberan → FreeCAD modela. |
| 10.12 | Estilizar / branded look | **LangChain** | cerebropax (qwen3:14b) + SD (local) | LangChain: LLM define paleta/tipografía → SD genera mocks de marca. |
| 10.13 | Curar / seleccionar lo mejor | **LangChain** | cerebropax (qwen3:14b) + RAG | LangChain: RAG recupera candidatos → LLM ranquea y justifica. |
| 10.14 | Remixar / combinar existente | **LangChain** | cerebropax (qwen3:14b) + SD + n8n | LangChain: LLM propone combinación → SD genera → n8n ensambla. |
| 11.1 | Aprender de la lectura | **LangChain** | RAG (pgvector + qwen3:14b) | LangChain: textbook → chunk → embed → LLM explica + cuestiona. |
| 11.3 | Aprender de la experiencia | **LangChain** | RL feedback loop (qwen3:14b) + log | LangChain: registra resultados → LLM aprende patrones → ajusta estrategia. |
| 11.4 | Aprender de mentor / maestro | **Letta** | cerebropax (qwen3:14b) + RAG | Letta: conversación socrática; LLM actúa como mentor adaptativo. |
| 11.6 | Practicar / entrenar | **LangChain** | cerebropax (qwen3:4b) + spaced repetition + n8n | LangChain: LLM genera ejercicios → n8n programa repaso (SR). |
| 11.7 | Investigar un tema | **LangChain** | Search (Brave/SerpAPI) + scrape (n8n) + qwen3:14b | LangChain: planifica búsqueda → n8n scrapea → LLM sintetiza con citas. |
| 11.9 | Enseñar lo aprendido | **LangChain** | cerebropax (qwen3:14b) + RAG | LangChain: recupera conocimiento aprendido → LLM genera material didáctico. |
| 11.10 | Evaluar propio progreso | **LangChain** | cerebropax (qwen3:14b) + DB progreso | LangChain: consulta DB → LLM mide avance vs objetivos → reporta. |
| 11.11 | Detectar propias debilidades | **LangChain** | cerebropax (qwen3:14b) + log errores | LangChain: analiza historial de errores → LLM identifica patrones de debilidad. |
| 11.12 | Adaptarse a cambios | **LangChain** | cerebropax (qwen3:14b) + RAG entorno | LangChain: RAG sobre nuevo entorno → LLM genera plan de adaptación. |
| 11.13 | Aprender idiomas | **LangChain** | cerebropax (qwen3:14b) + spaced repetition + Whisper | LangChain: LLM genera lecciones → SR repasa → Whisper evalúa pronunciación. |
| 11.16 | Validar información | **LangChain** | Search + scrape (n8n) + qwen3:14b | LangChain: LLM formula búsqueda → n8n scrapea fuentes → LLM verifica con citas. |
| 11.18 | Aprender de errores propios | **LangChain** | cerebropax (qwen3:14b) + pgvector (log errores) | LangChain: consulta log de errores → LLM extrae lección → guarda en memoria. |
| 11.20 | Identificar mentores / modelos | **LangChain** | cerebropax (qwen3:14b) + Search + n8n | LangChain: LLM define criterios → n8n busca perfiles → LLM ranquea. |
| 12.3 | Redactar contratos | **LangChain** | cerebropax (qwen3:14b) + RAG legal MX + plantilla | LangChain: RAG legal + plantilla → LLM redacta cláusulas. 🟡 R6: abogado humano revisa. |
| 12.4 | Firmar documentos legalmente | **n8n** | API e-sign (DocuSign/Hellosign free tier) + Vaultwarden | n8n: prepara doc → API e-sign → guarda firma en vault. 🟡 free tier limitado. |
| 12.5 | Hacer trámites bucráticos | **n8n** | Gov API (SAT/gob.mx) + Playwright RPA | n8n: API o RPA llena formularios → sigue estado. 🟡 R6: Erik confirma. |
| 12.6 | Pagar impuestos | **n8n** | API fiscal (SAT) + Python (cálculo) | n8n: Python calcula → API SAT declara → notify. 🟡 R6: Erik aprueba. |
| 12.7 | Reclamar / defender derechos | **CrewAI** | cerebropax (qwen3:14b) + RAG legal + n8n | CrewAI: agente legal investiga + agente redacta demanda → n8n presenta. 🟡 R6: abogado revisa. |
| 12.14 | Gestionar herencias / testamentos | **LangChain** | cerebropax (qwen3:14b) + RAG legal + Vaultwarden | LangChain: RAG legal + LLM explica pasos. 🟡 R6: notario humano. |
| 13.1 | Planear comidas / menú semanal | **Letta** | cerebropax (qwen3:4b) + DB inventario | Letta: Erik gusta/preferencias → LLM genera menú según inventario. |
| 13.8 | Mantener electrodomésticos | **n8n** | IoT (HA + sensores) + cron diagnóstico | n8n: cron lee sensores → si anómalo → alerta + programa mant. |
| 13.12 | Cuidar plantas / jardín | **n8n** | IoT (sensor humedad ESP32) + cron + HA | n8n: sensor humedad → si bajo → riego auto (relay) o alerta. |
| 13.13 | Cuidar mascotas | **n8n** | Schedule + IoT (dispensador ESP32) + LLM recordatorios | n8n: cron alimentación → dispensador auto → LLM recordatorio vet. |
| 13.15 | Hacer mantenimiento preventivo | **n8n** | Schedule + IoT + LLM (prioridades) | n8n: cron por electrodoméstico → checklist → LLM prioriza urgentes. |
| 14.9 | Reaccionar a emergencias | **n8n** | cerebropax (qwen3:14b) + Frigate + notify urgente | n8n: Frigate detecta intruso → LLM evalúa severidad → notify + protocolo. |
| 14.10 | Verificar identidad de otros | **LangChain** | cerebropax (qwen3:14b) + API identidad (FaceID/InsightFace) | LangChain: LLM evalúa contexto → API比对 → LLM concluye. |
| 14.14 | Defensa legal / reportar delitos | **CrewAI** | cerebropax (qwen3:14b) + RAG legal + n8n | CrewAI: agente investiga + agente redacta denuncia → n8n presenta. 🟡 R6: abogado. |
| 14.15 | Seguro / cobertura de riesgos | **n8n** | API seguros + LLM (comparador) | n8n: LLM compara coberturas → API contrata → notify. 🟡 R6: Erik aprueba. |
| 15.2 | Adaptarse a nuevo entorno | **LangChain** | cerebropax (qwen3:14b) + RAG entorno | LangChain: RAG sobre nuevo entorno → LLM genera plan adaptación. |
| 15.3 | Explorar lo desconocido | **LangChain** | cerebropax (qwen3:14b) + Search (n8n) | LangChain: LLM formula hipótesis → n8n busca → LLM evalúa resultados. |
| 15.4 | Detectar oportunidades | **LangChain** | cerebropax (qwen3:14b) + n8n (scraping tendencias) | LangChain: n8n scrapea tendencias → LLM detecta oportunidades para Erik. |
| 16.2 | Auto-reparación | **Letta** | cerebropax (qwen3:14b) + Docker sandbox | Letta: LLM diagnostica error → sandbox prueba fix → aplica si pasa. |
| 16.3 | Auto-mejora continua | **LangChain** | cerebropax (qwen3:14b) + Metabase (métricas) | LangChain: analiza métricas → LLM propone optimización → aplica + mide. |
| 16.7 | Pedir ayuda / escalar | **n8n** | Router LLM (Letta) + routing humano/agente | n8n: LLM evalúa confianza → si baja → escala a Erik o agente experto. |
| 16.13 | Explicar por qué se hizo algo | **LangChain** | cerebropax (qwen3:14b) + log (pgvector) | LangChain: consulta log de acciones → LLM redacta explicación legible. |
| 17.10 | Ceder / transigir | **CrewAI** | cerebropax (qwen3:14b) + n8n | CrewAI: agentes negocian concesiones → n8n entrega propuesta a Erik. |
| 17.13 | Equilibrar corto vs largo plazo | **LangChain** | cerebropax (qwen3:14b) + pgvector (historial) | LangChain: analiza histórico → LLM equilibra corto/largo → propone estrategia. |

---

## Anexo — Distribución por framework

### n8n (orquestador visual)

- 1.1 Percibir (notar, darse cuenta) → Sensor (ESP32/IPCámara) + LLaVA vía Ollama (2do equipo)
- 1.6 Consolidar / dormir sobre algo → pgvector + cron batch
- 2.21 Comunicar por voz (teléfono) → Piper (TTS) + Twilio/LiveKit (free trial)
- 2.22 Comunicar por video → Cámara + LiveKit (open source self-hosted)
- 4.5 Dibujar / ilustrar → Stable Diffusion 1.5 (local) + plotter/impresora
- 4.15 Operar maquinaria → ESP32/relay (IoT) + Home Assistant
- 4.16 Manipular pantallas/dispositivos → Playwright (RPA) + ADB (móvil)
- 5.6 Iniciar sesión en webs → Vaultwarden (credenciales) + Playwright
- 5.8 Crear cuentas en servicios → Vaultwarden + Playwright + email temp
- 5.21 Editar imágenes / video / audio → ffmpeg + SD/Whisper (local)
- 6.7 Pagar facturas / servicios → API banco (Open Finance MX) + cron
- 6.8 Transferir dinero → API banco + Vaultwarden
- 6.9 Monitorear inversiones → API broker + Metabase
- 6.14 Cobrar a clientes → API (Stripe/facturador) + LLM (recordatorios)
- 6.16 Comprar online → Playwright (RPA) + API pago
- 6.17 Vender online → API marketplace (MercadoLibre) + LLM (descripciones)
- 7.9 Delegar → Router LLM (Letta) + humanos/subagentes
- 8.3 Detectar bajones prolongados → cerebropax (qwen3:14b) + pgvector + cron
- 8.10 Agendar citas médicas → API salud (Docplanner/Medic) + Calendar API
- 8.15 Detectar señales de alarma → cerebropax (qwen3:14b) + cron + notify
- 9.12 Organizar eventos sociales → cerebropax (qwen3:14b) + Calendar + invite API
- 9.20 Detectar soledad / aislamiento → cerebropax (qwen3:14b) + pgvector (log social)
- 12.4 Firmar documentos legalmente → API e-sign (DocuSign/Hellosign free tier) + Vaultwarden
- 12.5 Hacer trámites bucráticos → Gov API (SAT/gob.mx) + Playwright RPA
- 12.6 Pagar impuestos → API fiscal (SAT) + Python (cálculo)
- 13.8 Mantener electrodomésticos → IoT (HA + sensores) + cron diagnóstico
- 13.12 Cuidar plantas / jardín → IoT (sensor humedad ESP32) + cron + HA
- 13.13 Cuidar mascotas → Schedule + IoT (dispensador ESP32) + LLM recordatorios
- 13.15 Hacer mantenimiento preventivo → Schedule + IoT + LLM (prioridades)
- 14.9 Reaccionar a emergencias → cerebropax (qwen3:14b) + Frigate + notify urgente
- 14.15 Seguro / cobertura de riesgos → API seguros + LLM (comparador)
- 16.7 Pedir ayuda / escalar → Router LLM (Letta) + routing humano/agente

### Letta (agente con memoria)

- 2.4 Escribir texto → cerebropax (qwen3:4b) + plantilla
- 2.15 Hacer preguntas → cerebropax (qwen3:4b) + n8n (search tool)
- 2.16 Escuchar activamente → faster-whisper (STT) + cerebropax (qwen3:14b)
- 5.11 Programar / escribir código → cerebropax (qwen3:14b) + Docker sandbox
- 5.12 Depurar código (debug) → cerebropax (qwen3:14b) + Docker sandbox
- 8.2 Monitorear estado de ánimo → Telegram input + cerebropax (qwen3:4b)
- 8.6 Fomentar ejercicio → Nudge LLM (qwen3:4b) + cron
- 8.8 Trackear alimentación → Telegram log + cerebropax (qwen3:4b)
- 8.9 Trackear síntomas físicos → Telegram log + cerebropax (qwen3:14b)
- 8.13 Gestionar estrés → cerebropax (qwen3:14b) + Piper TTS
- 8.14 Fomentar hábitos (streaks) → Nudge LLM (qwen3:4b) + DB streaks
- 8.18 Gestionar crisis de ansiedad → cerebropax (qwen3:14b) + Piper TTS (urgente)
- 9.5 Consolar / apoyar emocional → cerebropax (qwen3:14b) empático
- 9.9 Recibir feedback → cerebropax (qwen3:14b)
- 11.4 Aprender de mentor / maestro → cerebropax (qwen3:14b) + RAG
- 13.1 Planear comidas / menú semanal → cerebropax (qwen3:4b) + DB inventario
- 16.2 Auto-reparación → cerebropax (qwen3:14b) + Docker sandbox

### LangChain (cadena LLM + tools)

- 1.11 Resolver problemas → cerebropax (qwen3-abliterated:14b) + tools
- 1.17 Analizar (descomponer) → cerebropax (qwen3:14b) + n8n (extraccion)
- 1.18 Sintetizar (componer) → cerebropax (qwen3:14b) + n8n (agregacion)
- 2.5 Redactar documentos → cerebropax (qwen3:14b) + n8n (plantillas)
- 5.20 Diseñar (UI/UX, gráficos) → cerebropax (qwen3:14b) + n8n (Excalidraw/SVG)
- 6.6 Invertir → API broker (Alpaca/Interactive Brokers) + modelo predictivo
- 6.20 Hacer forecast financiero → Python (statsmodels) + cerebropax (qwen3:14b)
- 7.15 Hacer retrospectivas → cerebropax (qwen3:14b) + pgvector (memoria)
- 8.12 Detectar patrones de salud → cerebropax (qwen3:14b) + pgvector
- 9.8 Dar feedback → cerebropax (qwen3:14b) + RAG (contexto)
- 9.10 Hacer networking → cerebropax (qwen3:14b) + n8n (LinkedIn API/email)
- 9.18 Enseñar / transmitir conocimiento → cerebropax (qwen3:14b) + RAG
- 10.7 Diseñar estética → cerebropax (qwen3:14b) + n8n (Excalidraw)
- 10.10 Producir video / cine → Modelo video (CogVideo/Runway free) + ffmpeg + LLM
- 10.12 Estilizar / branded look → cerebropax (qwen3:14b) + SD (local)
- 10.13 Curar / seleccionar lo mejor → cerebropax (qwen3:14b) + RAG
- 10.14 Remixar / combinar existente → cerebropax (qwen3:14b) + SD + n8n
- 11.1 Aprender de la lectura → RAG (pgvector + qwen3:14b)
- 11.3 Aprender de la experiencia → RL feedback loop (qwen3:14b) + log
- 11.6 Practicar / entrenar → cerebropax (qwen3:4b) + spaced repetition + n8n
- 11.7 Investigar un tema → Search (Brave/SerpAPI) + scrape (n8n) + qwen3:14b
- 11.9 Enseñar lo aprendido → cerebropax (qwen3:14b) + RAG
- 11.10 Evaluar propio progreso → cerebropax (qwen3:14b) + DB progreso
- 11.11 Detectar propias debilidades → cerebropax (qwen3:14b) + log errores
- 11.12 Adaptarse a cambios → cerebropax (qwen3:14b) + RAG entorno
- 11.13 Aprender idiomas → cerebropax (qwen3:14b) + spaced repetition + Whisper
- 11.16 Validar información → Search + scrape (n8n) + qwen3:14b
- 11.18 Aprender de errores propios → cerebropax (qwen3:14b) + pgvector (log errores)
- 11.20 Identificar mentores / modelos → cerebropax (qwen3:14b) + Search + n8n
- 12.3 Redactar contratos → cerebropax (qwen3:14b) + RAG legal MX + plantilla
- 12.14 Gestionar herencias / testamentos → cerebropax (qwen3:14b) + RAG legal + Vaultwarden
- 14.10 Verificar identidad de otros → cerebropax (qwen3:14b) + API identidad (FaceID/InsightFace)
- 15.2 Adaptarse a nuevo entorno → cerebropax (qwen3:14b) + RAG entorno
- 15.3 Explorar lo desconocido → cerebropax (qwen3:14b) + Search (n8n)
- 15.4 Detectar oportunidades → cerebropax (qwen3:14b) + n8n (scraping tendencias)
- 16.3 Auto-mejora continua → cerebropax (qwen3:14b) + Metabase (métricas)
- 16.13 Explicar por qué se hizo algo → cerebropax (qwen3:14b) + log (pgvector)
- 17.13 Equilibrar corto vs largo plazo → cerebropax (qwen3:14b) + pgvector (historial)

### CrewAI (multi-agente)

- 2.12 Negociar → cerebropax (qwen3:14b) + n8n (comms)
- 6.15 Negociar precios / descuentos → cerebropax (qwen3:14b) + n8n (comms)
- 9.7 Resolver conflictos → cerebropax (qwen3:14b) + n8n (comms)
- 10.11 Diseñar productos / inventos → cerebropax (qwen3:14b) + FreeCAD (paramétrico)
- 12.7 Reclamar / defender derechos → cerebropax (qwen3:14b) + RAG legal + n8n
- 14.14 Defensa legal / reportar delitos → cerebropax (qwen3:14b) + RAG legal + n8n
- 17.10 Ceder / transigir → cerebropax (qwen3:14b) + n8n

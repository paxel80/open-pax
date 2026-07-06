# Capacidades por MÉTODO DE IMPLEMENTACIÓN

> Reclasificación de las 316 capacidades: ¿nacen de una **serie de acciones** (workflow) o son **exclusivas de un recurso** (activo concreto)?

> Propósito: decidir si open-pax debe **construir un workflow** (n8n/Letta/scripts) o **adquirir/provisionar un recurso** (modelo, DB, sensor, API, credencial).
>
> Creado: 5-jul-2026 · open-pax/documentos/08

---

## Marco de clasificación

| Código | Método | Significado | Implicación para open-pax |
|---|---|---|---|
| **A** | Serie de acciones (workflow) | Nace de ejecutar pasos orquestables. Solo lógica + datos + APIs estándar. | Construir workflow en n8n/Letta/scripts. |
| **R** | Exclusiva de un recurso | La otorga poseer un activo concreto (LLM, modelo visión, DB, sensor, API, credencial). Sin ese recurso, imposible. | Adquirir/provisionar el recurso (desplegar modelo, contratar API, comprar sensor). |
| **A+R** | Mixto | Un recurso ejecuta acciones (LLM + workflow, sensor + pipeline). | Ambas: provisionar recurso Y construir orquestación. |
| **N/A** | No replicable | Biológica/corporal/subjetiva humana. | open-pax no la adquiere; a lo mucho la **asiste** o la **delega al humano**. |

## Resumen global

- **Total:** 316 capacidades
- **A — Serie de acciones:** 91  (construir workflow)
- **R — Exclusiva de un recurso:** 74  (provisionar recurso)
- **A+R — Mixto:** 94  (recurso + workflow)
- **N/A — No replicable:** 57  (asistir/delegar)

### Recursos más demandados (en capacidades R y A+R)

| Recurso | Capacidades que lo requieren |
|---|---|
| LLM | 56 |
| LLM + workflow | 14 |
| LLM analítica | 5 |
| Modelo visión | 3 |
| Modelo audio | 3 |
| Log + LLM | 3 |
| LLM + tool | 3 |
| TTS | 2 |
| STT | 2 |
| LLM + plantilla | 2 |
| Modelo multimodal | 2 |
| LLM + sandbox | 2 |
| Generador de imágenes | 2 |
| API banco | 2 |
| API + workflow | 2 |
| Nudge LLM | 2 |
| Wearable | 2 |
| LLM + search | 2 |
| Schedule + IoT | 2 |
| Sensor + modelo multimodal | 1 |
| DB / memoria de sesión | 1 |
| DB vectorial (pgvector) | 1 |
| DB + timestamps | 1 |
| Proceso batch + DB | 1 |
| LLM/MT | 1 |
| STT + LLM | 1 |
| TTS + telefonía API | 1 |
| Cámara + video API | 1 |
| Cámara + modelo visión | 1 |
| OCR/visión | 1 |
| Visión/profundidad | 1 |
| Visión | 1 |
| Micrófono + STT | 1 |
| Micrófono array | 1 |
| Generador de imágenes + plotter | 1 |
| IoT actuador + workflow | 1 |
| RPA/autonomación | 1 |
| Gestor credenciales | 1 |
| Identidad/credencial | 1 |
| Servicio captcha/AI | 1 |
| LLM coder + sandbox | 1 |
| LLM + tool de diseño | 1 |
| ffmpeg + modelos | 1 |
| Sensor/actuador IoT | 1 |
| API broker + algoritmo | 1 |
| API broker | 1 |
| API/RPA + pago | 1 |
| Modelo predictivo | 1 |
| Agente/humano | 1 |
| Input + LLM | 1 |
| API salud | 1 |
| LLM guía | 1 |
| Audio/LLM | 1 |
| LLM empático | 1 |
| LLM de texto/voz | 1 |
| Modelo video + edición | 1 |
| RAG | 1 |
| RL/feedback loop | 1 |
| LLM + ejercicios | 1 |
| Search + scrape + LLM | 1 |
| LLM + app | 1 |
| Search + LLM | 1 |
| API e-sign | 1 |
| Gov API/RPA | 1 |
| API fiscal | 1 |
| Wallet/credencial | 1 |
| IoT diagnóstico | 1 |
| Sensor IoT | 1 |
| IoT + schedule | 1 |
| Cámara/sensor | 1 |
| LLM + API | 1 |
| API seguros | 1 |
| GPS/maps | 1 |
| LLM + métricas | 1 |
| LLM + routing | 1 |
| LLM + log | 1 |

---
## Sección A — Serie de acciones (workflow)

> Capacidades que se obtienen orquestando pasos. No requieren un recurso especial — solo lógica, datos y APIs estándar.

| # | Capacidad | Qué es | Recurso clave |
|---|---|---|---|
| 1.2 | Atender / concentrarse | Foco sostenido en una tarea | — |
| 1.7 | Olvidar selectivamente | Descartar lo irrelevante | — |
| 1.12 | Planificar multi-paso | Secuencia hacia meta | — |
| 1.13 | Tomar decisiones | Elegir entre opciones | — |
| 1.14 | Priorizar | Ordenar por importancia | — |
| 1.15 | Comparar / evaluar | Sopesar alternativas | — |
| 1.19 | Categorizar / clasificar | Agrupar por similitud | — |
| 1.20 | Calcular / matemáticas | Operaciones numéricas | — |
| 2.3 | Leer texto | Decodificar símbolos escritos | — |
| 2.14 | Dar instrucciones | Indicar cómo hacer | — |
| 2.20 | Comunicar por escrito (mensajería) | Chat, email | — |
| 5.1 | Usar computadora | Teclado, ratón, OS | RPA |
| 5.2 | Usar smartphone | Apps, táctil | RPA |
| 5.3 | Navegar internet | Abrir webs, links | browser-use |
| 5.4 | Buscar información web | Google, búsquedas | — |
| 5.5 | Leer contenido web | Extraer info de páginas | Scraping |
| 5.7 | Rellenar formularios web | Escribir campos, seleccionar | — |
| 5.10 | Usar apps específicas | Excel, Notion, etc | RPA/API |
| 5.13 | Ejecutar código y ver resultado | Correr programas | Sandbox |
| 5.14 | Usar git / versionado | Gestionar repositorios | — |
| 5.15 | Manejar bases de datos | Consultar, insertar, actualizar | — |
| 5.16 | Manejar APIs (REST/GraphQL) | Consumir servicios web | — |
| 5.17 | Scraping web | Extraer datos de páginas | — |
| 5.18 | Descargar / subir archivos | Transferir datos | — |
| 5.19 | Configurar servidores / infra | Sistemas, redes | IaC |
| 6.1 | Anotar gastos | Registrar lo que se gasta | DB |
| 6.2 | Categorizar gastos | Clasificar por tipo | — |
| 6.3 | Hacer presupuesto | Planear ingresos/gastos | — |
| 6.4 | Comparar precios | Buscar la mejor oferta | Scraping |
| 6.10 | Calcular impuestos | Determinar obligaciones fiscales | — |
| 6.11 | Generar estados financieros | Balance, P&L, flujo de caja | — |
| 6.12 | Calcular rentabilidad (TIR/VAN) | Evaluación de proyectos | — |
| 6.13 | Hacer facturas | Emitir comprobantes | — |
| 6.18 | Gestionar suscripciones | Alta/baja servicios recurrentes | API |
| 6.19 | Detectar gastos hormiga | Identificar micro-gastos | Analytics |
| 7.1 | Anotar citas / eventos | Registrar en agenda | Calendar API |
| 7.2 | Recordar compromisos | No olvidar lo agendado | Notificaciones |
| 7.3 | Programar recordatorios | Alertas a futuras horas | — |
| 7.4 | Priorizar tareas | Decidir qué antes | — |
| 7.5 | Hacer listas de tareas | Todo list | — |
| 7.7 | Calendarizar / bloquear tiempo | Asignar slots | — |
| 7.8 | Reprogramar | Mover citas/tareas | — |
| 7.10 | Seguir progreso de proyectos | Track de avance | — |
| 7.11 | Detectar retrasos | Notar desviaciones | — |
| 7.12 | Gestionar múltiples proyectos | Coordinar varios frentes | — |
| 7.13 | Sincronizar calendarios | Google, Outlook, etc | API |
| 7.14 | Gestionar zonas horarias | Coordinar entre países | — |
| 8.1 | Recordar medicación | No olvidar tomar pastillas | — |
| 8.4 | Sugerir pausas | Toma 10 min | — |
| 8.5 | Recordar hidratación | Tomar agua | — |
| 8.11 | Recordar seguimientos médicos | Próximas revisiones | — |
| 8.19 | Llevar diario emocional | Registro de sentimientos | DB |
| 8.20 | Recordar chequeos preventivos | Anuales, rutina | — |
| 9.1 | Mantener contacto | Saludar, escribir, llamar | Msg API |
| 9.2 | Recordar cumpleaños / fechas | No olvidar eventos de otros | — |
| 9.3 | Coordinar encuentros | Organizar reuniones | — |
| 9.11 | Mantener relaciones a distancia | Llamadas, mensajes | — |
| 9.13 | Gestión de contactos | CRM personal | DB |
| 11.5 | Memorizar / estudiar | Repaso activo | Spaced repetition |
| 11.14 | Seguir tendencias / novedades | Estar al día | Scraping |
| 12.1 | Cumplir leyes / normativas | Acatar marco legal | Compliance check |
| 12.11 | Archivar documentos importantes | Guardar papeles | Storage |
| 12.13 | Comparar seguros / coberturas | Protección financiera | Scraping |
| 12.15 | Cumplir obligaciones contractuales | Honrar acuerdos | — |
| 13.2 | Hacer lista de compras | Qué comprar | — |
| 13.9 | Gestionar inventario hogar | Saber qué hay | DB |
| 14.3 | Proteger información digital | Seguridad informática | Sec ops |
| 14.5 | Gestionar contraseñas | Credenciales seguras | Vault |
| 14.6 | Hacer backups | Respaldo de datos | — |
| 14.7 | Cifrar / proteger comunicaciones | Privacidad | — |
| 14.8 | Monitorear intrusiones | Detectar accesos no autorizados | SIEM |
| 14.11 | Detectar anomalías | Comportamiento inusual | Analytics |
| 14.12 | Auditar / revisar permisos | Control de accesos | — |
| 14.13 | Planear recuperación ante desastres | Continuidad | — |
| 15.9 | Adaptar horarios a estaciones | Ritmo circadiano estacional | — |
| 15.10 | Detectar recursos disponibles | Qué tengo a mano | Inventory |
| 16.1 | Automonitoreo | Cómo voy | — |
| 16.4 | Gestionar energía / fatiga | No agotarse | — |
| 16.5 | Reiniciar / resetear | Empezar de cero | — |
| 16.6 | Detectar cuando algo falla | Diagnóstico | — |
| 16.8 | Documentar lo hecho | Bitácora | — |
| 16.9 | Versionar / dejar revertible | Poder deshacer | — |
| 16.10 | Supervisar procesos autónomos | Vigilar que todo va bien | — |
| 16.11 | Detener / pausar algo que corre | Kill switch | — |
| 16.12 | Recuperarse de fallos | Resiliencia de sistema | — |
| 16.14 | Detectar sobre-esfuerzo / desperdicio | Eficiencia | — |
| 16.15 | Planear vs ejecutar | Separar diseño de acción | — |
| 17.2 | Distinguir útil/inútil | Juicio pragmático | — |
| 17.5 | Distinguir relevante/irrelevante | Juicio de prioridad | — |
| 17.7 | Distinguir urgente/no urgente | Juicio temporal | — |
| 17.8 | Distinguir confidencial/público | Juicio de privacidad | — |

---
## Sección R — Exclusivas de un recurso

> Capacidades que exige poseer un activo concreto. Sin ese recurso, imposible.

| # | Capacidad | Qué es | Recurso clave |
|---|---|---|---|
| 1.3 | Memorizar a corto plazo | Retener info segundos-minutos | DB / memoria de sesión |
| 1.4 | Memorizar a largo plazo | Recordar hechos, eventos, habilidades | DB vectorial (pgvector) |
| 1.5 | Recordar con contexto temporal | Cuándo pasó X, qué cambió | DB + timestamps |
| 1.8 | Razonar deductivo | A→B, silogismos | LLM |
| 1.9 | Razonar inductivo | Generalizar desde ejemplos | LLM |
| 1.10 | Razonar abductivo | La mejor explicación para... | LLM |
| 1.16 | Abstraer | Extraer patrones | LLM |
| 1.21 | Estimar / aproximar | Juicio rápido sin datos | LLM |
| 1.22 | Pensamiento crítico | Cuestionar, falacias | LLM |
| 1.23 | Pensamiento lateral / creativo | Salir del camino obvio | LLM |
| 1.24 | Razonamiento contrafactual | Qué pasaría si... | LLM |
| 2.1 | Hablar (producir voz) | Articulación de sonidos | TTS |
| 2.2 | Escuchar (comprender voz) | Procesar lenguaje hablado | STT |
| 2.6 | Traducir idiomas | Convertir idioma | LLM/MT |
| 2.7 | Resumir | Comprimir manteniendo esencia | LLM |
| 2.8 | Parafrasear | Decir lo mismo otras palabras | LLM |
| 2.9 | Argumentar / persuadir | Defender con razones | LLM |
| 2.10 | Narrar / contar historias | Estructurar eventos | LLM |
| 2.11 | Explicar | Hacer comprensible lo complejo | LLM |
| 2.13 | Debatir | Defender y refutar | LLM |
| 2.17 | Leer entre líneas (inferir) | Entender lo no dicho | LLM |
| 2.18 | Detectar ironía/sarcasmo | Significado no literal | LLM |
| 2.19 | Adaptar registro (formal/informal) | Cambiar tono según contexto | LLM |
| 3.1 | Ver (visión) | Percibir luz, formas, color | Cámara + modelo visión |
| 3.2 | Reconocer objetos visuales | Identificar qué es | Modelo visión |
| 3.3 | Reconocer rostros | Identificar personas | Modelo visión |
| 3.4 | Leer texto de imágenes (OCR) | Extraer texto de foto | OCR/visión |
| 3.5 | Interpretar imágenes / fotos | Entender contenido visual | Modelo multimodal |
| 3.6 | Ver video / movimiento | Seguir acción en tiempo real | Modelo visión |
| 3.7 | Estimar distancias / profundidad | Juzgar espacio 3D | Visión/profundidad |
| 3.8 | Detectar movimiento | Notar desplazamiento | Visión |
| 3.9 | Escuchar (audición) | Percibir sonidos | Micrófono + STT |
| 3.10 | Reconocer sonidos | Identificar qué sonido | Modelo audio |
| 3.11 | Reconocer música / melodías | Distinguir canciones | Modelo audio |
| 3.12 | Localizar sonido (dirección) | De dónde viene | Micrófono array |
| 5.9 | Resolver captchas | Demostrar que es humano | Servicio captcha/AI |
| 5.22 | Generar imágenes con IA | DALL-E, Stable Diffusion | Generador de imágenes |
| 5.23 | Generar voz con IA (TTS) | Sintetizar habla | TTS |
| 5.24 | Transcribir audio a texto (STT) | Whisper, etc | STT |
| 5.25 | Operar dispositivos IoT | Sensores, actuadores | Sensor/actuador IoT |
| 7.6 | Estimar duración de tareas | Predecir cuánto tomará | LLM |
| 8.7 | Trackear sueño | Horas y calidad | Wearable |
| 8.16 | Hacer meditación guiada | Conducir práctica | Audio/LLM |
| 8.17 | Monitorear signos vitales | Pulso, presión | Wearable |
| 9.6 | Detectar estado emocional ajeno | Leer cómo está el otro | LLM de texto/voz |
| 9.14 | Detectar manipulación / mentiras | Reconocer dolo | LLM |
| 10.1 | Generar ideas nuevas | Lluvia de ideas | LLM |
| 10.2 | Conectar conceptos lejanos | Ver relaciones inesperadas | LLM |
| 10.3 | Escribir creativo (ficción, poesía) | Literatura original | LLM |
| 10.4 | Componer música | Crear melodías/armonía | Modelo audio |
| 10.5 | Improvisar | Actuar sin guión | LLM |
| 10.6 | Hacer humor / chistes | Provocar risa | LLM |
| 10.8 | Crear metáforas / analogías | Explicar con imágenes verbales | LLM |
| 10.9 | Producir arte visual | Pintura, ilustración digital | Generador de imágenes |
| 10.16 | Sorprender / romper expectativas | Subvertir lo esperado | LLM |
| 11.2 | Aprender de videos | Absorber audiovisual | Modelo multimodal |
| 11.8 | Sintetizar conocimiento | Integrar múltiples fuentes | LLM |
| 11.15 | Detectar obsolescencia | Esto ya no sirve | LLM |
| 11.17 | Hacer preguntas críticas | Cuestionar lo establecido | LLM |
| 11.19 | Aprender de errores ajenos | No caer en lo mismo | LLM |
| 12.2 | Conocer derechos propios | Saber a qué se tiene derecho | LLM |
| 12.9 | Gestionar identidad documental | Pasaporte, INE, etc | Wallet/credencial |
| 12.10 | Comprender jerga legal | Entender contratos | LLM |
| 12.12 | Detectar estafas / fraudes | Protegerse de dolo | LLM |
| 13.10 | Controlar consumo (luz, agua) | Monitorear servicios | Sensor IoT |
| 14.1 | Detectar peligros físicos | Notar riesgo inminente | Cámara/sensor |
| 14.4 | Detectar phishing / engaños | Reconocer intentos de robo | LLM |
| 15.1 | Orientarse / no perderse | Navegar espacios | GPS/maps |
| 15.6 | Aprender cultura / costumbres nuevas | Integrarse | LLM |
| 17.1 | Distinguir bien/mal | Juicio moral | LLM |
| 17.3 | Distinguir bello/feo | Juicio estético | LLM |
| 17.4 | Distinguir verdad/mentira | Juicio epistémico | LLM |
| 17.6 | Distinguir seguro/peligroso | Juicio de riesgo | LLM |
| 17.15 | Detectar conflicto de interés | Reconocer sesgos | LLM |

---
## Sección A+R — Mixto (recurso + acciones)

> Requieren un recurso que ejecuta acciones. Lo más común en open-pax.

| # | Capacidad | Qué es | Recurso clave |
|---|---|---|---|
| 1.1 | Percibir (notar, darse cuenta) | Captar estímulos del entorno | Sensor + modelo multimodal |
| 1.6 | Consolidar / dormir sobre algo | Procesar offline, integrar | Proceso batch + DB |
| 1.11 | Resolver problemas | Encontrar solución | LLM + workflow |
| 1.17 | Analizar (descomponer) | Entender partes del todo | LLM + workflow |
| 1.18 | Sintetizar (componer) | Unir partes coherente | LLM + workflow |
| 2.4 | Escribir texto | Producir símbolos escritos | LLM + plantilla |
| 2.5 | Redactar documentos | Componer textos estructurados | LLM + workflow |
| 2.12 | Negociar | Llegar a acuerdos | LLM + workflow |
| 2.15 | Hacer preguntas | Indagar, solicitar info | LLM + workflow |
| 2.16 | Escuchar activamente | Atender + responder empático | STT + LLM |
| 2.21 | Comunicar por voz (teléfono) | Llamada hablada | TTS + telefonía API |
| 2.22 | Comunicar por video | Videollamada, cuerpo visible | Cámara + video API |
| 4.5 | Dibujar / ilustrar | Imágenes manuales | Generador de imágenes + plotter |
| 4.15 | Operar maquinaria | Controlar equipos industriales | IoT actuador + workflow |
| 4.16 | Manipular pantallas/dispositivos | Tocar, clic, scroll | RPA/autonomación |
| 5.6 | Iniciar sesión en webs | Login usuario/contraseña | Gestor credenciales |
| 5.8 | Crear cuentas en servicios | Registrarse en plataformas | Identidad/credencial |
| 5.11 | Programar / escribir código | Crear software | LLM coder + sandbox |
| 5.12 | Depurar código (debug) | Encontrar y corregir errores | LLM + sandbox |
| 5.20 | Diseñar (UI/UX, gráficos) | Crear visuales digitales | LLM + tool de diseño |
| 5.21 | Editar imágenes / video / audio | Manipular media digital | ffmpeg + modelos |
| 6.6 | Invertir | Colocar dinero para crecer | API broker + algoritmo |
| 6.7 | Pagar facturas / servicios | Cumplir obligaciones | API banco |
| 6.8 | Transferir dinero | Mover fondos entre cuentas | API banco |
| 6.9 | Monitorear inversiones | Seguir portafolio | API broker |
| 6.14 | Cobrar a clientes | Gestión de cobranza | API + workflow |
| 6.15 | Negociar precios / descuentos | Convenir términos | LLM |
| 6.16 | Comprar online | Adquirir productos por internet | API/RPA + pago |
| 6.17 | Vender online | Publicar y vender productos | API + workflow |
| 6.20 | Hacer forecast financiero | Proyectar futuro | Modelo predictivo |
| 7.9 | Delegar | Asignar a otros | Agente/humano |
| 7.15 | Hacer retrospectivas | Revisar qué pasó y aprender | LLM |
| 8.2 | Monitorear estado de ánimo | Cómo me siento hoy | Input + LLM |
| 8.3 | Detectar bajones prolongados | 3+ días mal → alertar | LLM analítica |
| 8.6 | Fomentar ejercicio | Motivar movimiento | Nudge LLM |
| 8.8 | Trackear alimentación | Lo que como | Log + LLM |
| 8.9 | Trackear síntomas físicos | Dolor, malestar | Log + LLM |
| 8.10 | Agendar citas médicas | Pedir hora con doctor | API salud |
| 8.12 | Detectar patrones de salud | Cuando duermes mal, comes peor | LLM analítica |
| 8.13 | Gestionar estrés | Técnicas de relajación | LLM guía |
| 8.14 | Fomentar hábitos (streaks) | Racha sin castigo | Nudge LLM |
| 8.15 | Detectar señales de alarma | Síntomas que requieren atención | LLM |
| 8.18 | Gestionar crisis de ansiedad | Técnicas de regulación | LLM |
| 9.5 | Consolar / apoyar emocional | Estar para alguien | LLM empático |
| 9.7 | Resolver conflictos | Mediar desacuerdos | LLM |
| 9.8 | Dar feedback | Evaluar constructivamente | LLM |
| 9.9 | Recibir feedback | Aceptar críticas | LLM |
| 9.10 | Hacer networking | Conectar profesionalmente | LLM + workflow |
| 9.12 | Organizar eventos sociales | Fiestas, reuniones | LLM + workflow |
| 9.18 | Enseñar / transmitir conocimiento | Educar a otros | LLM |
| 9.20 | Detectar soledad / aislamiento | Notar falta de contacto | LLM analítica |
| 10.7 | Diseñar estética | Decidir qué se ve bien | LLM + tool |
| 10.10 | Producir video / cine | Narrativa audiovisual | Modelo video + edición |
| 10.11 | Diseñar productos / inventos | Idear objetos útiles | LLM + workflow |
| 10.12 | Estilizar / branded look | Identidad visual | LLM + tool |
| 10.13 | Curar / seleccionar lo mejor | Elegir de entre mucho | LLM |
| 10.14 | Remixar / combinar existente | Lo nuevo desde lo viejo | LLM + tool |
| 11.1 | Aprender de la lectura | Absorber de textos | RAG |
| 11.3 | Aprender de la experiencia | Trial and error | RL/feedback loop |
| 11.4 | Aprender de mentor / maestro | Por instrucción guiada | LLM + workflow |
| 11.6 | Practicar / entrenar | Repetición deliberada | LLM + ejercicios |
| 11.7 | Investigar un tema | Búsqueda profunda | Search + scrape + LLM |
| 11.9 | Enseñar lo aprendido | Transmitir | LLM |
| 11.10 | Evaluar propio progreso | Medir avance | LLM analítica |
| 11.11 | Detectar propias debilidades | Metacognición aplicada | LLM |
| 11.12 | Adaptarse a cambios | Aprender nuevo entorno | LLM |
| 11.13 | Aprender idiomas | Comunicar en otra lengua | LLM + app |
| 11.16 | Validar información | Confirmar si es cierta | Search + LLM |
| 11.18 | Aprender de errores propios | No repetir | Log + LLM |
| 11.20 | Identificar mentores / modelos | Buscar a quién imitar | LLM + search |
| 12.3 | Redactar contratos | Documentos legales | LLM + plantilla |
| 12.4 | Firmar documentos legalmente | Firma válida | API e-sign |
| 12.5 | Hacer trámites burocráticos | Gestiones con instituciones | Gov API/RPA |
| 12.6 | Pagar impuestos | Cumplir obligación fiscal | API fiscal |
| 12.7 | Reclamar / defender derechos | Quejas, demandas | LLM + workflow |
| 12.14 | Gestionar herencias / testamentos | Sucesión de bienes | LLM + workflow |
| 13.1 | Planear comidas / menú semanal | Qué comer cada día | LLM |
| 13.8 | Mantener electrodomésticos | Cuidar equipos | IoT diagnóstico |
| 13.12 | Cuidar plantas / jardín | Mantener vegetación | IoT + schedule |
| 13.13 | Cuidar mascotas | Animales de compañía | Schedule + IoT |
| 13.15 | Hacer mantenimiento preventivo | Revisar antes de que falle | Schedule + IoT |
| 14.9 | Reaccionar a emergencias | Protocolos de crisis | LLM + workflow |
| 14.10 | Verificar identidad de otros | Confirmar quién es quién | LLM + API |
| 14.14 | Defensa legal / reportar delitos | Acciones legales | LLM + workflow |
| 14.15 | Seguro / cobertura de riesgos | Transferir riesgo | API seguros |
| 15.2 | Adaptarse a nuevo entorno | Ajustarse a cambio | LLM |
| 15.3 | Explorar lo desconocido | Curiosidad activa | LLM + search |
| 15.4 | Detectar oportunidades | Ver dónde hay potencial | LLM analítica |
| 16.2 | Auto-reparación | Corregir errores propios | LLM + sandbox |
| 16.3 | Auto-mejora continua | Optimizar con el tiempo | LLM + métricas |
| 16.7 | Pedir ayuda / escalar | Saber cuándo delegar | LLM + routing |
| 16.13 | Explicar por qué se hizo algo | Trazabilidad | LLM + log |
| 17.10 | Ceder / transigir | Concesiones | LLM |
| 17.13 | Equilibrar corto vs largo plazo | Visión estratégica | LLM |

---
## Sección N/A — No replicables (asistir/delegar)

> Capacidades biológicas/corporales/subjetivas. open-pax no las adquiere; las **asiste** (recordatorios, info) o las **delega al humano**.

| # | Capacidad | Qué es | Bloqueo |
|---|---|---|---|
| 1.25 | Meta-cognición | Pensar sobre el pensamiento | Biología/subjetivo |
| 2.23 | Lenguaje corporal / gestos | Comunicar con el cuerpo | Cuerpo humano |
| 2.24 | Comunicar no-verbal (expresión) | Miradas, postura, microexpresiones | Cuerpo humano |
| 3.13 | Tocar (tacto) | Textura, presión, temperatura | Sensor táctil/HMD |
| 3.14 | Oler (olfato) | Percibir olores | Sensor químico |
| 3.15 | Gustar (gusto) | Percibir sabores | Sensor químico |
| 3.16 | Sentir dolor | Percibir daño | Biología |
| 3.17 | Equilibrio / propiocepción | Sentir posición del cuerpo | Biología |
| 3.18 | Sentir paso del tiempo | Percepción subjetiva duración | Biología/subjetivo |
| 4.1 | Caminar / desplazarse | Moverse a otro lugar | Robot/vehículo |
| 4.2 | Correr | Movimiento rápido | Robot |
| 4.3 | Manipular objetos con manos | Agarrar, girar, presionar | Brazo robótico |
| 4.4 | Escribir a mano | Texto con lapicera | Brazo robótico/plotter |
| 4.6 | Construir / ensamblar físico | Unir piezas materiales | Robot ensamblador |
| 4.7 | Reparar objetos físicos | Arreglar algo material | Robot |
| 4.8 | Cocinar | Preparar alimentos | Robot cocina |
| 4.9 | Limpiar / ordenar espacio físico | Mantener un lugar | Robot limpiador |
| 4.10 | Conducir vehículos | Operar auto, moto | Vehículo autónomo |
| 4.11 | Operar herramientas manuales | Taladro, martillo | Actuador robótico |
| 4.12 | Cargar / transportar peso | Mover cosas pesadas | Robot |
| 4.13 | Actividad física / deporte | Ejercicio, atletismo | Cuerpo humano |
| 4.14 | Gesticular / expresar con cuerpo | Mímica, danza | Cuerpo humano |
| 6.5 | Ahorrar / decidir no gastar | Postergar consumo | Voluntad humana |
| 9.4 | Empatizar | Sentir lo que el otro siente | Subjetivo/biología |
| 9.15 | Establecer límites | Decir no | Voluntad humana |
| 9.16 | Liderar / dirigir grupos | Conducir equipos | Carisma humano |
| 9.17 | Hacer presentaciones en público | Exponer ante audiencia | Cuerpo humano |
| 9.19 | Acompañar en duelo / pérdidas | Estar presente en dolor | Presencia humana |
| 10.15 | Tener estilo personal / voz | Identidad creativa propia | Subjetivo |
| 12.8 | Votar / participar cívicamente | Ejercicio ciudadano | Cuerpo/cívico |
| 13.3 | Cocinar | Preparar alimentos | Robot cocina |
| 13.4 | Limpiar el hogar | Mantener orden | Robot limpiador |
| 13.5 | Lavar ropa | Ropa limpia | Robot lavadora |
| 13.6 | Hacer compras físicas | Ir a tiendas | Cuerpo humano |
| 13.7 | Recibir compras / paquetes | Estar en casa | Presencia humana |
| 13.11 | Decorar / personalizar espacio | Hacerlo agradable | Cuerpo/gusto |
| 13.14 | Gestionar residuos / reciclaje | Separar basura | Cuerpo/robot |
| 14.2 | Protegerse de ataques físicos | Defenderse | Cuerpo/actuador |
| 15.5 | Migrar / mudarse | Cambiar de lugar | Cuerpo humano |
| 15.7 | Viajar | Desplazarse a otros lugares | Cuerpo/vehículo |
| 15.8 | Sobrevivir en condiciones extremas | Resiliencia física | Cuerpo humano |
| 17.9 | Tener principios / valores | Ética personal | Subjetivo |
| 17.11 | Perdonar | Soltar resentimiento | Subjetivo |
| 17.12 | Mantener integridad bajo presión | No ceder a coacción | Voluntad humana |
| 17.14 | Asumir responsabilidad | Hacerse cargo | Voluntad humana |
| 18.1 | Respirar | Intercambio de gases | Biología |
| 18.2 | Alimentarse / digerir | Procesar nutrientes | Biología |
| 18.3 | Dormir / descansar | Recuperación fisiológica | Biología |
| 18.4 | Reproducirse | Generar descendencia | Biología |
| 18.5 | Crecer / desarrollarse | Maduración biológica | Biología |
| 18.6 | Sanar / regenerarse | Recuperación de daño | Biología |
| 18.7 | Envejecer | Cambio biológico temporal | Biología |
| 18.8 | Tener instintos | Respuestas innatas | Biología |
| 18.9 | Tener emociones primarias | Miedo, alegría, ira, tristeza | Biología |
| 18.10 | Sentir placer / displacer | Experiencia subjetiva | Biología |
| 18.11 | Tener consciencia | Experiencia subjetiva de existir | Biología |
| 18.12 | Morir | Fin de la vida biológica | Biología |

---
## Anexo — Catálogo de recursos necesarios

> Para open-pax: cada recurso es algo que hay que **provisionar** (desplegar, contratar, comprar). Mientras más capacidades concentre un recurso, más rentable es adquirido.

| Recurso | Tipo | Capacidades que lo usan | Ejemplo en open-pax |
|---|---|---|---|
| LLM (texto/razonamiento) | Modelo IA | 56 | cerebropax (LiteLLM) |
| Modelo multimodal (visión/audio) | Modelo IA | 11 | Ollama multimodal / API |
| Generador de imágenes | Modelo IA | 2 | Stable Diffusion local / API |
| TTS | Modelo IA | 2 | Piper / Ollama TTS |
| STT | Modelo IA | 2 | Whisper local |
| DB vectorial (pgvector) | Infra | 3 | Postgres+pgvector (Letta) |
| Sensor / wearable / IoT | Hardware | 7 | Wearable + cámara IP + mic |
| API externa (banco/gob/salud) | Servicio | 9 | Open Finance / SAT / e-sign |
| Credencial / identidad | Activo | 3 | Vault + identity wallet |
| Servicio captcha/AI | Servicio | 1 | 2captcha / AI solver |
| GPS/maps | Servicio | 1 | OSM / Google Maps API |
| Generador de imágenes + plotter | Hardware | 1 | Plotter / impresora 3D |
| Telefonía API | Servicio | 2 | Twilio / LiveKit |
| Modelo predictivo | Modelo IA | 2 | ML propio /forecast |
| IaC / sandbox | Infra | 3 | Docker + Terraform |

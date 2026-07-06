# Capacidades humanas vs n8n — mapa completo (jul-2026)

> Análisis: qué capacidades que un humano hace puede n8n self-hosted replicar
> (nativa o vía integración) y cuáles NO. Base: docs.n8n.io verificadas jul-2026.
> 🟢 = nativo/viable · 🟡 = parcial (requiere LLM/externo) · 🔴 = inviable en n8n solo

---

## 🟢 Capacidades humanas que n8n SÍ tiene

### Comunicación escrita
| Capacidad humana | Cómo en n8n | Nodo(s) |
|---|---|---|
| Enviar mensajes de texto | Telegram, WhatsApp Business, email, Slack, Discord, SMS | `Telegram`, `WhatsApp Business Cloud`, `Send Email`, `Slack`, `Discord`, `Twilio SMS` |
| Responder mensajes 24/7 | Trigger + respuesta automática | `Telegram Trigger`, `Webhook`, `Schedule Trigger` |
| Redactar documentos | Generar texto con LLM y enviar | `AI Agent` + `HTTP Request` (LLM) |
| Traducir idiomas | Vía LLM | `AI Agent` + modelo |
| Enviar archivos/archivos adjuntos | Por Telegram/WhatsApp/email | `Telegram` (sendDocument), `WhatsApp`, `Send Email` |
| Programar mensajes futuros | Cron + envío | `Schedule Trigger` + `Telegram` |

### Cognición lógica
| Capacidad humana | Cómo en n8n | Nodo(s) |
|---|---|---|
| Tomar decisiones (sí/no) | Lógica condicional | `IF`, `Switch`, `Filter` |
| Comparar valores | Operaciones lógicas | `Compare`, `Set` |
| Contar / sumar / matemáticas | Cálculos | `Code` (JS/Python), `Set` |
| Razonar sobre datos | Con LLM | `AI Agent` |
| Resumir texto | Con LLM | `AI Agent` |
| Extraer información estructurada | Con LLM o JSON parsing | `AI Agent`, `Item Lists`, `Code` |
| Clasificar / categorizar | Con LLM | `AI Agent` |
| Responder preguntas (Q&A) | RAG | `Vector Store QA Tool` + embeddings |

### Acceso a datos y apps
| Capacidad humana | Cómo en n8n | Nodo(s) |
|---|---|---|
| Leer/escribir hojas de cálculo | Google Sheets, Excel | `Google Sheets`, `Microsoft Excel 365` |
| Usar bases de datos | SQL, NoSQL | `Postgres`, `MySQL`, `MongoDB`, `Redis`, `Supabase` |
| Gestionar tareas/proyectos | Trello, Notion, ClickUp, Todoist | `Notion`, `Trello`, `ClickUp`, `Todoist`, `Google Tasks` |
| Manejar repositorios de código | GitHub, GitLab | `GitHub`, `GitLab` |
| Manejar calendarios | Google Calendar, Outlook | `Google Calendar`, `Microsoft Outlook` |
| Enviar/recibir email | IMAP/Gmail/Outlook | `Gmail`, `IMAP Email`, `Send Email` |
| Manejar CRM | HubSpot, Salesforce | `HubSpot`, `Salesforce` |
| Manejar almacenamiento cloud | Drive, S3, Dropbox | `Google Drive`, `AWS S3`, `Dropbox` |
| Hacer peticiones web (APIs) | HTTP | `HTTP Request` (cualquier API REST) |
| Leer feeds/RSS | Noticias, blogs | `RSS Feed Read` |
| Buscar en la web (resultados) | Motores de búsqueda | `SerpApi`, `Wikipedia`, `Hacker News`, `YouTube` |

### Automatización y flujos
| Capacidad humana | Cómo en n8n | Nodo(s) |
|---|---|---|
| Hacer cosas a horarios fijos | Cron | `Schedule Trigger` (segundos→meses + cron custom) |
| Reaccionar a eventos | Webhooks | `Webhook`, `Telegram Trigger`, `GitHub Trigger` |
| Dividir trabajo en subtareas | Sub-workflows | `Execute Sub-workflow` (paso inputs tipados) |
| Delegar a "sub-agentes" | Workflow como tool | `Call n8n Workflow` (tool del AI Agent) |
| Procesar en lote | Batches | `Loop`, `Split In Batches` |
| Esperar respuestas humanas | Pausar workflow | `Wait`, `Send and Wait for Response` |
| Reintentar si falla | Reintentos | `Retry on Fail`, `Stop and Error` |

### Procesamiento de archivos
| Capacidad humana | Cómo en n8n | Nodo(s) |
|---|---|---|
| Leer/escribir archivos del disco | Local | `Read/Write Files from Disk` |
| Convertir formatos | CSV, JSON, XML | `Convert to CSV`, `Convert to XML`, `Set` |
| Extraer texto de PDFs | OCR/PDF | `Extract from File` (PDF) |
| Manipular imágenes | Básico | `Convert to File`, HTTP a servicio externo |
| Comprimir/descomprimir | ZIP | `Compression` |
| Firmar/cifrar | Crypto | `Crypto`, `HMAC` |

### IA / LLM (vía integración)
| Capacidad humana | Cómo en n8n | Nodo(s) |
|---|---|---|
| Generar texto creativo | Con LLM | `AI Agent`, `OpenAI`, `Anthropic`, `Ollama Chat Model` |
| Usar modelos locales | Ollama | `Ollama Chat Model`, `Ollama Chat/Generate` |
| Hacer RAG (preguntas sobre docs) | Vectores | `Vector Store` (Pinecone/PGVector/Milvus/Qdrant) + `Embeddings` |
| Generar embeddings | Con LLM | `Embeddings` (OpenAI, Cohere, Ollama, Bedrock) |
| Usar herramientas (tool calling) | Agente con tools | `AI Agent` (Tools Agent) + tools |
| Múltiples modelos en un flujo | Comparar/route | Varios `Chat Model` sub-nodos |
| Memorizar conversación (chat) | Memoria de ventana | `Postgres Chat Memory`, `Window Buffer Memory`, `Zep` (⚠️ deprecated) |

### Finanzas y contabilidad
| Capacidad humana | Cómo en n8n | Nodo(s) |
|---|---|---|
| Anotar gastos | Sheets + LLM categoriza | `Google Sheets` + `AI Agent` |
| Generar reportes | Sheets + PDF | `Google Sheets` + `Convert to File` |
| Conectar a Stripe/PayPal | Pagos | `Stripe`, `PayPal` |
| Contabilidad (QuickBooks) | Real | `QuickBooks Online` |
| Monitorear cripto/finanzas | APIs | `HTTP Request` a Binance/CoinGecko/etc |

---

## 🟡 Capacidades humanas que n8n tiene PARCIALMENTE (necesita externo)

| Capacidad humana | Qué le falta a n8n | Necesita |
|---|---|---|
| Recordar a largo plazo con significado | Solo chat-memory de ventana, no semántica | **Letta** o **Mem0** |
| Aprender de la experiencia | No hay aprendizaje, solo re-ejecuta | LLM con memoria externa |
| Investigar tendencias en TikTok/Reels | No hay nodo nativo de TikTok | HTTP a API no oficial o **browser-use** |
| Escribir código y probarlo en loop | Genera código pero no itera con filesystem | **Claude Code / Cline / OpenHands** |
| Ver y entender imágenes | Vía LLM multimodal (HTTP), no nativo | LLM con visión (GPT-4o, Gemini) |
| Generar imágenes | Vía HTTP a OpenAI/Stability | `HTTP Request` a DALL-E/Stable Diffusion |
| Generar voz (TTS) | Solo saliente unidireccional (Twilio) | OpenAI TTS/ElevenLabs vía HTTP |
| Entender voz (STT) | No nativo | Whisper/Deepgram vía HTTP |
| Priorizar proyectos con criterios complejos | LLM decide, pero sin contexto profundo | Letta con memoria de proyectos |
| Planificar multi-paso autónomo | AI Agent hace 1 turno, no persiste planes | LangGraph o Letta |

---

## 🔴 Capacidades humanas que n8n NO tiene (inviable solo)

### Voz y llamadas
| Capacidad humana | Por qué no | Alternativa real |
|---|---|---|
| Conversar por voz en tiempo real (bidireccional) | n8n no tiene STT/TTS streaming bidireccional | **LiveKit Agents** |
| Contestar llamadas telefónicas reales | Solo TTS saliente (Twilio), no recibe audio | **LiveKit** + telephony |
| Detectar emoción en la voz | No procesa audio entrante | Deepgram + LLM |
| Hablar con voz natural y expresiva | TTS básico solo | ElevenLabs / OpenAI TTS |

### Navegación web y mundo físico
| Capacidad humana | Por qué no | Alternativa real |
|---|---|---|
| Navegar webs con JavaScript (SPAs, React, Vue) | HTTP Request solo lee HTML estático | **browser-use / Playwright** |
| Iniciar sesión en webs | No maneja cookies/sesiones/captchas | **browser-use** |
| Crear cuentas en sitios de terceros | No llena formularios dinámicos | **browser-use** |
| Resolver captchas | No | 2Captcha / Capsolver (externo) |
| Mover objetos físicos | Es software, no hardware | IoT + microcontroladores |
| Conducir / manipular el mundo físico | Imposible | Robots físicos |

### Percepción avanzada
| Capacidad humana | Por qué no | Alternativa |
|---|---|---|
| Ver video en tiempo real | No procesa video | OpenCV / YOLO vía webhook |
| Escuchar audio continuo | No | Whisper streaming |
| Sentir (tacto, temperatura) | Sin sensores | IoT + MQTT |
| Olfato / gusto | Imposible en software | — |

### Cognición avanzada
| Capacidad humana | Por qué no | Alternativa |
|---|---|---|
| Razonamiento temporal ("qué cambió desde ayer") | La chat-memory no razona sobre tiempo | **Mem0** (91.6% precisión) |
| Consolidar / "soñar" la memoria | n8n no auto-consolida | **Letta** (dreaming/sleeptime) |
| Auto-mejora continua | No aprende de sus propios resultados | LangGraph con reflexión |
| Creatividad original (no recombinación) | Los LLM recombinan, no crean | — (limitación fundamental de LLM) |
| Empatía real | Solo simula texto | — |
| Consciencia / autoconciencia | Imposible | — |

### Acción en el mundo
| Capacidad humana | Por qué no | Alternativa |
|---|---|---|
| Hacer compras online autónomas | Requiere login + pago + 2FA | browser-use + supervisión |
| Firmar documentos legalmente | No tiene firma electrónica válida | DocuSign API (vía HTTP) |
| Asistir físicamente a citas | Imposible | — |
| Cocinar, limpiar, etc. | Imposible en software | Robots domésticos |

---

## Resumen numérico

| Categoría | n8n 🟢 | n8n 🟡 | n8n 🔴 |
|---|---|---|---|
| Comunicación escrita | 6 | 0 | 0 |
| Cognición lógica | 8 | 2 | 0 |
| Acceso a datos/apps | 12 | 0 | 0 |
| Automatización | 7 | 0 | 0 |
| Procesamiento de archivos | 6 | 0 | 0 |
| IA / LLM | 7 | 0 | 0 |
| Finanzas | 5 | 0 | 0 |
| Memoria/cognición avanzada | 0 | 3 | 5 |
| Voz y llamadas | 0 | 2 | 4 |
| Navegación web/physical | 0 | 1 | 6 |
| Percepción avanzada | 0 | 0 | 4 |
| Acción en el mundo | 0 | 0 | 4 |
| **TOTAL** | **51** | **8** | **23** |

**Porcentaje: ~62% n8n puede · ~10% parcial · ~28% inviable solo.**

---

## Conclusión honesta

n8n cubre **toda la capa de orquestación + integración + automatización** que un
humano hace con herramientas digitales (comunicarse, gestionar datos, decidir,
programar tareas, conectar apps). Es el "sistema nervioso" de open-pax.

Pero n8n **no es** el cerebro, ni los ojos, ni las manos, ni la voz:
- **Cerebro + memoria semántica** → Letta / Mem0
- **Ojos y manos en la web** → browser-use / Playwright
- **Voz y oído** → LiveKit + Whisper/ElevenLabs
- **Cerebro LLM** → Ollama / cerebropax (LiteLLM)

El patrón correcto: **n8n = orquestador visible + cerebros externos especializados.**
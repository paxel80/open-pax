# Recursos + proveedores para capacidades tipo R

> Asignación uno-a-uno de **recurso + proveedor concreto** para cada una de las 74 capacidades tipo R.
> Tipo R = exclusiva de un recurso (sin ese activo, imposible).
> Criterios: self-hosted primero, costo ~$0, hardware de Erik (RTX 3050 4GB + 2do equipo Tailscale con Ollama).
> Creado: 5-jul-2026 · open-pax/documentos/10

---

## Resumen por recurso

| Recurso | Capacidades |
|---|---|
| LLM | 40 |
| Modelo visión | 3 |
| Modelo audio | 3 |
| TTS | 2 |
| STT | 2 |
| Modelo multimodal | 2 |
| Generador de imágenes | 2 |
| Wearable | 2 |
| DB de sesión | 1 |
| DB vectorial | 1 |
| DB + timestamps | 1 |
| LLM/MT | 1 |
| Cámara + modelo visión | 1 |
| OCR/visión | 1 |
| Visión/profundidad | 1 |
| Visión | 1 |
| Micrófono + STT | 1 |
| Micrófono array | 1 |
| Servicio captcha/AI | 1 |
| Sensor/actuador IoT | 1 |
| Audio/LLM | 1 |
| LLM de texto/voz | 1 |
| Wallet/credencial | 1 |
| Sensor IoT | 1 |
| Cámara/sensor | 1 |
| GPS/maps | 1 |
| **TOTAL** | **74** |

## Resumen por proveedor principal

| Proveedor | Capacidades | Notas |
|---|---|---|
| cerebropax → qwen3-abliterated:14b | 28 |  |
| cerebropax → qwen3-abliterated:4b | 11 |  |
| LLaVA | 2 |  |
| ESP32 | 2 |  |
| Letta session memory (postgres) | 1 | Memoria de sesión ya disponible. |
| pgvector (Postgres en nube1) | 1 | DB vectorial ya desplegada con Letta. |
| pgvector | 1 |  |
| cerebropax (LiteLLM) → qwen3-abliterated:4b (local) | 1 |  |
| cerebropax → qwen3-abliterated:4b/14b | 1 |  |
| cerebropax → qwen3-abliterated:14b (2do equipo) | 1 |  |
| Piper (self-hosted, CPU, ~$0) | 1 | TTS offline, rápido, español. |
| faster-whisper-small (local GPU) | 1 | STT en 4GB VRAM; large vía Groq. |
| Webcam/IPCámara | 1 |  |
| FaceNet/InsightFace (self-hosted) | 1 |  |
| Tesseract | 1 |  |
| LLaVA via Ollama (2do equipo) | 1 | Visión multimodal; API si pesado. |
| YOLOv8 | 1 |  |
| MiDaS (Depth Anything) self-hosted | 1 |  |
| OpenCV | 1 |  |
| USB mic | 1 |  |
| YAMNet | 1 |  |
| ChromaPrint/AcoustID (self-hosted) | 1 |  |
| 2x USB mics | 1 |  |
| AI solver (YOLo+OCR self-hosted) | 1 |  |
| Stable Diffusion 1.5 (local, 4GB VRAM) | 1 |  |
| Piper (self-hosted) | 1 |  |
| faster-whisper (local) | 1 |  |
| 🟡 Erik no tiene wearable → Google Fit via Android (free) | 1 |  |
| Piper TTS | 1 |  |
| 🟡 Sin wearable → Google Fit | 1 |  |
| MusicGen (AudioCraft) self-hosted | 1 |  |
| Stable Diffusion 1.5 | 1 |  |
| Bitwarden vault (self-hosted) | 1 |  |
| IPCámara | 1 |  |
| OSM | 1 |  |

### Principio rector

- **1er plano (self-hosted)**: gratis, control total, sin TOS de tercero. Lo que Erik ya tiene o puede montar.
- **Plan alternativo (API)**: si el self-hosted no cabe en 4GB VRAM o requiere escala. APIs free tier (Groq, DeepSeek, OpenRouter).
- **R6 supervisión humana**: cualquier juicio moral/estético/verdad → LLM propone, Erik valida.
- **R8 honestidad**: 🟡 marca capacidades con limitación real (sin wearable, captchas difíciles).

---

## Tabla completa (uno a uno)

| # | Capacidad | Recurso | Proveedor (1er plano) | Plan alternativo | Notas |
|---|---|---|---|---|---|
| 1.3 | Memorizar a corto plazo | DB de sesión | **Letta session memory (postgres)** | Redis en nube2 | Ya disponible en Letta desplegado. |
| 1.4 | Memorizar a largo plazo | DB vectorial | **pgvector (Postgres en nube1)** | ChromaDB self-hosted | Ya desplegado con Letta. Embeddings: bge-m3 del 2do equipo. |
| 1.5 | Recordar con contexto temporal | DB + timestamps | **pgvector + columna timestamp (nube1)** | TimescaleDB | Postgres maneja timestamps nativos. |
| 1.8 | Razonar deductivo | LLM | **cerebropax (LiteLLM) → qwen3-abliterated:4b (local) / 14b (2do equipo)** | Groq llama-3.3-70b (free tier) | Modelo sin censura. Local ~50 t/s, 2do equipo para lo pesado. |
| 1.9 | Razonar inductivo | LLM | **cerebropax → qwen3-abliterated:4b/14b** | DeepSeek-V3 (free) | Mismo gateway LiteLLM. |
| 1.10 | Razonar abductivo | LLM | **cerebropax → qwen3-abliterated:14b (2do equipo)** | OpenRouter free models | Abducción requiere modelo grande; 14b en 2do equipo. |
| 1.16 | Abstraer | LLM | **cerebropax → qwen3-abliterated:4b** | Groq |  |
| 1.21 | Estimar / aproximar | LLM | **cerebropax → qwen3-abliterated:4b** | Groq |  |
| 1.22 | Pensamiento crítico | LLM | **cerebropax → qwen3-abliterated:14b** | DeepSeek-V3 | Requiere razonamiento profundo → 14b. |
| 1.23 | Pensamiento lateral / creativo | LLM | **cerebropax → qwen3-abliterated:14b** | OpenRouter | Creatividad → modelo grande. |
| 1.24 | Razonamiento contrafactual | LLM | **cerebropax → qwen3-abliterated:14b** | Groq llama-3.3-70b |  |
| 2.1 | Hablar (producir voz) | TTS | **Piper (self-hosted, CPU, ~$0)** | Coqui TTS / OpenAI TTS | Piper es óptimo: offline, rápido, calidad OK, español. |
| 2.2 | Escuchar (comprender voz) | STT | **faster-whisper-small (local GPU)** | Groq whisper-large-v3 (free) | Whisper-small cabe en 4GB VRAM; large vía Groq. |
| 2.6 | Traducir idiomas | LLM/MT | **cerebropax → qwen3-abliterated:4b / DeepSeek-V3** | Groq + DeepSeek | Multilingüe. Alternativa: LibreTranslate self-hosted (dedicado MT). |
| 2.7 | Resumir | LLM | **cerebropax → qwen3-abliterated:4b** | Groq |  |
| 2.8 | Parafrasear | LLM | **cerebropax → qwen3-abliterated:4b** | Groq |  |
| 2.9 | Argumentar / persuadir | LLM | **cerebropax → qwen3-abliterated:14b** | DeepSeek-V3 | Persuasión → 14b. |
| 2.10 | Narrar / contar historias | LLM | **cerebropax → qwen3-abliterated:14b** | OpenRouter | Narrativa → modelo grande. |
| 2.11 | Explicar | LLM | **cerebropax → qwen3-abliterated:4b** | Groq |  |
| 2.13 | Debatir | LLM | **cerebropax → qwen3-abliterated:14b** | Groq llama-3.3-70b | Debate → razonamiento profundo. |
| 2.17 | Leer entre líneas (inferir) | LLM | **cerebropax → qwen3-abliterated:14b** | DeepSeek-V3 | Inferencia → 14b. |
| 2.18 | Detectar ironía/sarcasmo | LLM | **cerebropax → qwen3-abliterated:14b** | Groq | Sarcasmo difícil → modelo grande. |
| 2.19 | Adaptar registro (formal/informal) | LLM | **cerebropax → qwen3-abliterated:4b** | Groq |  |
| 3.1 | Ver (visión) | Cámara + modelo visión | **Webcam/IPCámara + LLaVA via Ollama (2do equipo)** | Qwen2-VL via OpenRouter free | LLaVA local; API si pesado. |
| 3.2 | Reconocer objetos visuales | Modelo visión | **LLaVA / YOLOv8 (self-hosted)** | Roboflow free / OpenRouter | YOLOv8 para detección rápida, LLaVA para descripción. |
| 3.3 | Reconocer rostros | Modelo visión | **FaceNet/InsightFace (self-hosted)** | CompreFace self-hosted | Self-hosted por privacidad. NO usar API externa con rostros. |
| 3.4 | Leer texto de imágenes (OCR) | OCR/visión | **Tesseract + PaddleOCR (self-hosted)** | LLaVA OCR | Tesseract para documento; PaddleOCR para escena compleja. |
| 3.5 | Interpretar imágenes / fotos | Modelo multimodal | **LLaVA via Ollama (2do equipo)** | Qwen2-VL free |  |
| 3.6 | Ver video / movimiento | Modelo visión | **YOLOv8 + OpenCV (self-hosted)** | Frigate NVR self-hosted | Frigate combina detección + NVR; ideal para cámaras IP. |
| 3.7 | Estimar distancias / profundidad | Visión/profundidad | **MiDaS (Depth Anything) self-hosted** | Depth-Anything-V2 | Modelo de profundidad monocular. Si hay cámara RGBD mejor. |
| 3.8 | Detectar movimiento | Visión | **OpenCV + YOLOv8 (self-hosted)** | Frigate motion detection | Frigate trae detección de movimiento + clasificación IA. |
| 3.9 | Escuchar (audición) | Micrófono + STT | **USB mic + faster-whisper (local)** | Groq whisper |  |
| 3.10 | Reconocer sonidos | Modelo audio | **YAMNet / AudioSet (self-hosted)** | Hugging Face audio models | Clasificación de eventos sonoros (sirena, ladrido, etc). |
| 3.11 | Reconocer música / melodías | Modelo audio | **ChromaPrint/AcoustID (self-hosted)** | Shazam-like API | AcoustID gratis para fingerprinting musical. |
| 3.12 | Localizar sonido (dirección) | Micrófono array | **2x USB mics + TDOA (self-hosted)** | ReSpeaker Mic Array | Hardware especializado; DIY posible con 2 mics. |
| 5.9 | Resolver captchas | Servicio captcha/AI | **AI solver (YOLo+OCR self-hosted) — 🟡 limitado** | 2captcha (~$3/1000) | R8: self-hostado no bate reCAPTCHA v3. Documentar TOS. |
| 5.22 | Generar imágenes con IA | Generador de imágenes | **Stable Diffusion 1.5 (local, 4GB VRAM) / sdxl-turbo** | Pollinations.ai (free, sin API key) | SD1.5 cabe en 4GB; sdxl-turbo más rápido. Pollinations gratis sin auth. |
| 5.23 | Generar voz con IA (TTS) | TTS | **Piper (self-hosted)** | Coqui XTTS / OpenAI TTS | Mismo recurso que 2.1. |
| 5.24 | Transcribir audio a texto (STT) | STT | **faster-whisper (local)** | Groq whisper-large-v3 | Mismo recurso que 2.2. |
| 5.25 | Operar dispositivos IoT | Sensor/actuador IoT | **ESP32 + Home Assistant (self-hosted)** | Shelly / Tasmota | ESP32 $3-5, HA gratuito. DIY económico. |
| 7.6 | Estimar duración de tareas | LLM | **cerebropax → qwen3-abliterated:4b** | Groq |  |
| 8.7 | Trackear sueño | Wearable | **🟡 Erik no tiene wearable → Google Fit via Android (free)** | Garmin/Oura API | R8 honestidad: sin wearable, datos limitados. Alternativa: app sleeptracker Android. |
| 8.16 | Hacer meditación guiada | Audio/LLM | **Piper TTS + guiones LLM (self-hosted)** | Medito app (gratis) | Generar audio con Piper; guiones con LLM. |
| 8.17 | Monitorear signos vitales | Wearable | **🟡 Sin wearable → Google Fit / phone sensors** | Garmin/Oura | R8: limitado sin hardware. Phone tiene acelerómetro (pasos). |
| 9.6 | Detectar estado emocional ajeno | LLM de texto/voz | **cerebropax → qwen3-abliterated:14b + análisis tono voz (Whisper)** | Hume AI free tier | Texto: LLM. Voz: prosodia con modelos de emociones. |
| 9.14 | Detectar manipulación / mentiras | LLM | **cerebropax → qwen3-abliterated:14b** | DeepSeek-V3 | Requiere razonamiento profundo sobre patrones. |
| 10.1 | Generar ideas nuevas | LLM | **cerebropax → qwen3-abliterated:14b** | OpenRouter |  |
| 10.2 | Conectar conceptos lejanos | LLM | **cerebropax → qwen3-abliterated:14b** | OpenRouter |  |
| 10.3 | Escribir creativo (ficción, poesía) | LLM | **cerebropax → qwen3-abliterated:14b** | DeepSeek-V3 | Creatividad → modelo grande. |
| 10.4 | Componer música | Modelo audio | **MusicGen (AudioCraft) self-hosted / Suno API** | Suno (free tier limitado) | MusicGen local pesado → 2do equipo o API. Suno free con créditos. |
| 10.5 | Improvisar | LLM | **cerebropax → qwen3-abliterated:14b** | Groq |  |
| 10.6 | Hacer humor / chistes | LLM | **cerebropax → qwen3-abliterated:14b** | OpenRouter | Humor es difícil para LLMs; modelo grande mejor. |
| 10.8 | Crear metáforas / analogías | LLM | **cerebropax → qwen3-abliterated:4b** | Groq |  |
| 10.9 | Producir arte visual | Generador de imágenes | **Stable Diffusion 1.5 / sdxl-turbo (local)** | Pollinations.ai free | Mismo recurso que 5.22. |
| 10.16 | Sorprender / romper expectativas | LLM | **cerebropax → qwen3-abliterated:14b** | OpenRouter |  |
| 11.2 | Aprender de videos | Modelo multimodal | **LLaVA + faster-whisper (self-hosted)** | Qwen2-VL free | Whisper transcribe audio; LLaVA analiza frames clave. |
| 11.8 | Sintetizar conocimiento | LLM | **cerebropax → qwen3-abliterated:14b** | DeepSeek-V3 |  |
| 11.15 | Detectar obsolescencia | LLM | **cerebropax → qwen3-abliterated:4b** | Groq |  |
| 11.17 | Hacer preguntas críticas | LLM | **cerebropax → qwen3-abliterated:14b** | Groq |  |
| 11.19 | Aprender de errores ajenos | LLM | **cerebropax → qwen3-abliterated:14b** | DeepSeek-V3 |  |
| 12.2 | Conocer derechos propios | LLM | **cerebropax → qwen3-abliterated:14b + RAG legal MX** | Groq | RAG sobre leyes MX ( Constitución, Códigos). |
| 12.9 | Gestionar identidad documental | Wallet/credencial | **Bitwarden vault (self-hosted) + scans cifrados** | Vaultwarden | Vaultwarden = Bitwarden self-hosted gratis. |
| 12.10 | Comprender jerga legal | LLM | **cerebropax → qwen3-abliterated:14b + RAG legal** | DeepSeek-V3 |  |
| 12.12 | Detectar estafas / fraudes | LLM | **cerebropax → qwen3-abliterated:14b** | Groq |  |
| 13.10 | Controlar consumo (luz, agua) | Sensor IoT | **ESP32 + sensor no invasivo SCT-013 (corriente) + HA** | Shelly EM | Shelly EM ~$30 (1 vez); DIY ESP32+SCT-013 ~$10. |
| 14.1 | Detectar peligros físicos | Cámara/sensor | **IPCámara + Frigate + YOLOv8 (self-hosted)** | Shelly Door/Window sensor | Frigate detecta intrusos; sensores de puerta complementan. |
| 14.4 | Detectar phishing / engaños | LLM | **cerebropax → qwen3-abliterated:14b** | Groq | Analiza email/URL; LLM detecta patrones de phishing. |
| 15.1 | Orientarse / no perderse | GPS/maps | **OSM + Nominatim + GraphHopper (self-hosted)** | Google Maps API (free tier) | 100% gratis self-hosted. GraphHopper para routing. |
| 15.6 | Aprender cultura / costumbres nuevas | LLM | **cerebropax → qwen3-abliterated:14b + RAG web** | OpenRouter |  |
| 17.1 | Distinguir bien/mal | LLM | **cerebropax → qwen3-abliterated:14b** | DeepSeek-V3 | Juicio moral → modelo grande; el humano aprueba (R6). |
| 17.3 | Distinguir bello/feo | LLM | **cerebropax → qwen3-abliterated:4b** | OpenRouter | Estética subjetiva; LLM + humano valida. |
| 17.4 | Distinguir verdad/mentira | LLM | **cerebropax → qwen3-abliterated:14b + RAG (fuentes verificables)** | Groq + search | LLM solo alucina; requiere RAG con fuentes. |
| 17.6 | Distinguir seguro/peligroso | LLM | **cerebropax → qwen3-abliterated:14b** | Groq |  |
| 17.15 | Detectar conflicto de interés | LLM | **cerebropax → qwen3-abliterated:14b** | DeepSeek-V3 | Requiere razonamiento profundo sobre contextos. |

---

## Catálogo de recursos a provisionar

> Para open-pax: estos son los activos que hay que **instalar/desplegar/conectar**. Mientras más capacidades concentre un recurso, más rentable.

| Recurso | Tipo | Caps | Notas de provisión |
|---|---|---|---|
| cerebropax (LiteLLM) | Banco de cerebros | ~30 | Gateway LLM que enruta a Ollama local + 2do equipo + APIs free. **Prioridad #1.** Ya tiene expediente. |
| pgvector (Postgres) | DB vectorial | ~3 | Ya desplegado con Letta. Memoria a largo plazo. |
| Piper | TTS | ~3 | `apt install piper` o Docker. Voces ES descargables gratis. |
| faster-whisper | STT | ~3 | Docker / Python. small/base en 4GB VRAM. |
| Stable Diffusion | Generador imágenes | ~3 | Automatic1111 o ComfyUI. SD1.5 en 4GB; sdxl-turbo más rápido. |
| LLaVA (Ollama) | Visión multimodal | ~5 | 2do equipo Tailscale. API local vía Ollama. |
| YOLOv8 + OpenCV | Detección objetos/movimiento | ~3 | Python. Real-time en CPU/GPU. |
| Frigate NVR | NVR + IA | ~2 | Docker self-hosted. Para cámaras IP de seguridad. |
| Tesseract + PaddleOCR | OCR | ~2 | Python libs. Documento y escena. |
| ESP32 + Home Assistant | IoT | ~3 | HA en Docker (nube2). ESP32 $3-5/nodo. Sensores DIY. |
| Vaultwarden | Identidad/credenciales | ~1 | Docker self-hosted. Bitwarden-compatible, gratis. |
| GraphHopper + OSM | Mapas/routing | ~1 | Docker self-hosted. 100% gratis. |
| 2captcha (alt) | Captcha solver | ~1 | 🟡 Pago ~$3/1000. Solo si self-hostado no bate. |

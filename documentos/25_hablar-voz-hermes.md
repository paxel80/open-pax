# 25 · Cómo darle voz a Hermes (TTS + Telegram) — veredicto

> **Fecha:** 6-jul-2026 · Resuelve: *"cómo darle la capacidad a Hermes de hablar"* (con ElevenLabs disponible). Apéndice al doc 23 (lóbulo frontal). · **Estado de Hermes verificado en disco: YA INSTALADO.**

---

## ✅ Estado verificado en disco (6-jul-2026)

| Componente | Estado | Dónde |
|---|---|---|
| Hermes instalado | 🟢 SÍ | `C:\Users\erikj\AppData\Local\hermes\` (Hermes.exe desktop + venv Python + 80+ plugins) |
| Plugin Telegram nativo | 🟢 SÍ | `plugins\platforms\telegram\` (adapter.py + plugin.yaml + telegram_network.py) |
| edge-tts (TTS gratis) | 🟢 SÍ v7.2.7 | `hermes-agent\venv\Scripts\edge-tts.exe` |
| edge-playback (reproductor) | 🟢 SÍ | `hermes-agent\venv\Scripts\edge-playback.exe` |
| Voces es-MX | 🟢 2 | **DaliaNeural (F)** y **JorgeNeural (M)** |
| Voces es-ES | 🟢 3 | AlvaroNeural (M), ElviraNeural (F), XimenaNeural (F) |
| MCP de n8n nativo | 🟢 SÍ | `optional-mcps\n8n\manifest.yaml` (confirma doc 24) |
| ElevenLabs API key | 🔴 NO en disco | No está en `~/.llmkeys/keys.env`, ni `~/.elevenlabs/`, ni variables entorno → Erik la tiene en el navegador |

---

## 🧠 Las 2 rutas de voz (comparación honesta)

| | **edge-tts** (YA instalado) | **ElevenLabs** (tienes cuenta) |
|---|---|---|
| Costo | 🟢 **$0, ilimitado** | 🟡 10k chars/mes free, luego $5-22/mes |
| Calidad | 🟢 Neural, natural (buena) | 🟢 Premium, más expresiva, clonación de voz |
| Setup | 🟢 **Ya instalado en Hermes** | 🟡 Crear skill HTTP + guardar key en `~/.elevenlabs/token` |
| Para frases cortas TDAH | 🟢 Suficiente | 🟢 Overkill (caro para 10 palabras) |
| Para mensajes largos | 🟡 Suena algo robótico al rato | 🟢 Más humana, no cansa |
| Latencia | 🟢 Rápido | 🟡 Depende de red |
| Spanish | 🟢 es-MX + es-ES nativos | 🟡 Multilingual v2 (buen español) |

---

## 🎯 Veredicto (UNA opción): Fase 1 edge-tts, Fase 2 ElevenLabs upgrade

```
   FASE 1 (HOY, $0, sin instalar nada):
   ┌──────────────────────────────────────────────────────────┐
   │ Erik (Telegram) → Hermes genera texto                     │
   │      → skill "hablar"                                     │
   │      → edge-tts es-MX-DaliaNeural/JorgeNeural → MP3       │
   │      → plugin Telegram nativo → voice message a Erik      │
   └──────────────────────────────────────────────────────────┘

   FASE 2 (cuando edge-tts te sepa robótico en mensajes largos):
   ┌──────────────────────────────────────────────────────────┐
   │ Skill "hablar" decide:                                    │
   │   - mensaje corto (<200 chars) → edge-tts (gratis)        │
   │   - mensaje largo (>=200 chars) → ElevenLabs (premium)    │
   │   - celebración/ánimo → ElevenLabs (expresividad)        │
   └──────────────────────────────────────────────────────────┘
```

**Por qué edge-tts primero:**
1. 🟢 **$0 e ilimitado** (regla de Erik). ElevenLabs te ata a 10k chars/mes.
2. 🟢 **Ya está instalado** en Hermes (no sumas nada, no configuras nada nuevo).
3. 🟢 **Calidad suficiente** para el caso de uso real del lóbulo frontal: recordatorios CORTOS ("Erik, llevas 20 min en X", "¿cambias o cierras?", "¡cerraste la tarea! 🎉"). Para frases de 10-20 palabras, edge-tts suena natural.
4. 🟢 **Voz mexicana** (Dalia/Jorge) cercana a tu acento (Veracruz).

**Cuándo SÍ migrar a ElevenLabs (Fase 2):**
- Resumen semanal largo donde edge-tts cansa al oído.
- Quieres clonar TU propia voz (más personal, más "tuyo").
- Celebraciones donde quieres expresividad real (no monotona).

---

## 🔧 Cómo se configura el plugin Telegram de Hermes (verificado en `plugin.yaml`)

Variables que pide el plugin:

| Variable | Obligatoria | Qué es | Cómo conseguirla |
|---|---|---|---|
| `TELEGRAM_BOT_TOKEN` | 🟢 SÍ | Token del bot | @BotFather → regenerar (🔴 el doc 21 marca el anterior como expuesto) |
| `TELEGRAM_ALLOWED_USERS` | 🟡 Opcional pero OBLIGATORIO para seguridad | Tu user ID de Telegram | @userinfobot te lo dice. **CIERRA el dev-mode abierto del doc 21** |
| `TELEGRAM_ALLOW_ALL_USERS` | 🟡 false por defecto | Permitir a cualquiera | DEJAR en false (true = dev-mode 🔴) |
| `TELEGRAM_HOME_CHANNEL` | 🟡 Opcional | Chat ID para cron/notificaciones | @userinfobot. Ahí caen los avisos programados |

**Soporta el plugin (de plugin.yaml):** threads/topics, streaming edits, native media (envía voice messages ✅), inline keyboards, slash commands, fallback network, notification modes, mention gating, per-user/chat allowlists.

---

## 📋 Plan de ejecución Fase 1 (5 pasos, 1 a la vez — anti-TDAH)

### 🔴 Paso 0 (HOY, 5 min) — Regenerar bot token
@BotFather → `/revoke` el bot actual → `/newbot` → guardar token nuevo en `~/.telegram_token` (NO commitear). Razón: el doc 21 marca el token anterior como expuesto en git histórico.

### 🟢 Paso 1 (10 min) — Configurar plugin Telegram de Hermes
Hermes pedirá al primer arranque (o vía `hermes config`):
- `TELEGRAM_BOT_TOKEN` = token nuevo.
- `TELEGRAM_ALLOWED_USERS` = tu user ID de Telegram.
- `TELEGRAM_HOME_CHANNEL` = tu chat ID.
- `TELEGRAM_ALLOW_ALL_USERS` = **false** (crítico, cierra dev-mode 🔴).

Probar: escribirle al bot desde tu Telegram. Si responde → plugin vivo.

### 🟢 Paso 2 (15 min) — Probar edge-tts aislado
```powershell
# Generar MP3 de prueba con voz mexicana femenina
& "$env:LOCALAPPDATA\hermes\hermes-agent\venv\Scripts\edge-tts.exe" `
  --voice es-MX-DaliaNeural --text "Erik, llevas 20 minutos en esto. ¿Cambias o cierras?" `
  --write-media "$env:TEMP\prueba-hermes.mp3"
# Reproducirlo
& "$env:LOCALAPPDATA\hermes\hermes-agent\venv\Scripts\edge-playback.exe" "$env:TEMP\prueba-hermes.mp3"
```
Si suena bien → sigues. Si no → pruebas JorgeNeural (masculino) o es-ES-ElviraNeural.

### 🟢 Paso 3 (30 min) — Crear skill `hablar` en Hermes
Skill que:
1. Toma el texto de respuesta de Hermes.
2. Decide si va con voz (no todo debe hablar — solo recordatorios/celebraciones, no output técnico largo).
3. Llama edge-tts con la voz elegida → genera MP3.
4. Usa plugin Telegram para enviar el MP3 como voice message a `TELEGRAM_HOME_CHANNEL`.

### 🟢 Paso 4 (10 min) — Probar el flujo completo
Escribirle a Hermes por Telegram: *"¿qué toca hoy?"*. Hermes debe responder con **voice message** + texto. Si llega la voz → Fase 1 completa.

### 🟢 Paso 5 (opcional, Fase 2) — Sumar ElevenLabs
Cuando edge-tts te canse en mensajes largos:
1. Crear API key en elevenlabs.io → guardar en `C:\Users\erikj\.elevenlabs\token` (patrón Erik).
2. Modificar skill `hablar` para que mensajes >=200 chars usen ElevenLabs.
3. (Opcional) Clonar tu voz con Voice Cloning de ElevenLabs.

---

## ⚠️ Encuadre TDAH (andamiaje, no muleta) — doc 23

La voz NO es para leer todo el output de Hermes (sería ruidoso, caro en chars, y atrofia tu lectura). Es para:

| Caso | Qué dice Hermes (con voz) | Por qué ayuda al TDAH |
|---|---|---|
| Iniciación | "Erik, hoy toca: [tarea]. ¿La parto en pasos?" | Vence "¿por dónde empiezo?" |
| Flexibilidad | "Llevas 90 min en X. ¿Cambias o cierras?" | Vence "me clavo horas" |
| Seguimiento | "¡Cerraste la tarea! 🎉 Van 3 hoy." | Vence "no siento que avanzo" |
| Inhibición | "¿La anoto para el domingo? Ahora sigue X." | Vence "se me ocurre idea Y y me voy" |

**Regla:** voz solo para mensajes cortos de función ejecutiva. Output técnico (código, logs, datos) → texto, siempre.

---

## 🗺️ Dónde vive la voz en tu malla de 4 nodos

```
   🟢 LAPTOP (propia)        → Hermes corre aquí, edge-tts genera MP3 aquí
   🟢 CELULAR (propio)       → Erik RECIBE voice messages por Telegram aquí
   🟡 VM ORACLE SP (ajena)   → (futuro) Hermes 24/7 para que hable cuando laptop apagada
   🟡 VM ORACLE FRA (ajena)  → LiteLLM (router de modelos, no afecta voz)
```

**Principio:** la generación de voz (edge-tts) es reversible y barata → laptop primero. La entrega de voz (Telegram) llega al celular que siempre tienes arriba.

---

## ❓ Pendientes para la próxima sesión

1. ¿Voz femenina (Dalia) o masculina (Jorge)? — decisión de Erik al oír las 2 en Paso 2.
2. ¿Hermes está corriendo ya (sesión main lo instaló) o hay que iniciarlo? — verificar `Get-Process Hermes`.
3. ¿El bot token actual está regenerado o sigue el expuesto del doc 21? — verificar con @BotFather.
4. ¿Skill `hablar` va como skill nativa de Hermes o como plugin custom? — depende de la API de skills de Hermes (leer docs de Hermes).

---

*25_hablar-voz-hermes.md · 6-jul-2026 · Regla de Oro: nada en conversación, todo a disco.*
*Veredicto: edge-tts + Telegram nativo HOY ($0, ya instalado). ElevenLabs = upgrade Fase 2 para mensajes largos.*
*Hermes verificado instalado en disco. Plugin Telegram nativo confirmado. edge-tts 7.2.7 con voces es-MX Dalia/Jorge.*
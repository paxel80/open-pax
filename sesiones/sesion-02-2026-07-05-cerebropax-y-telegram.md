# open-pax — Sesión: 5-jul-2026 (tarde) — Creación de cerebropax + arreglo Telegram

> **Sesión:** 2.ª del día 5-jul-2026
> **Estado al cerrar:** cerebropax creado (Fase 0 completa), Telegram estabilizado con OpenCode Zen

---

## Qué se hizo

### 1. Revisión del estado real de open-pax
- Letta **ya estaba desplegado** en Oracle SP (4 contenedores: letta + pgvector + ollama + telegram_bridge).
- Agente `open-pax` creado, respondiendo por Telegram con `ollama/llama3.1:8b` local.
- Problema: Ollama en ARM 4 OCPU es lento → `ReadTimeout` intermitente en el bridge.

### 2. Creación del subproyecto cerebropax
Erik pidió crear el "banco de cerebros" para aprovechar los recursos API e infra.
- Inventariadas **10 proveedores de IA** (8 gratis + DeepSeek + OpenAI) con claves existentes.
- Creado subproyecto completo en `open-pax/cerebropax/` con expediente, código (LiteLLM), diagrama y documentos.
- Decisiones: LiteLLM en Oracle Frankfurt, solo por Tailscale, una sola puerta para todos los consumidores.
- **cerebropax se desplegará en paralelo en otra sesión dedicada.**

### 3. Arreglo del timeout de Telegram
- **Diagnóstico:** el agente usaba `ollama/llama3.1:8b` local (lento en ARM). Intentamos migrar a Groq pero Letta 0.16.8 no reconoce `GROQ_API_KEY` del entorno.
- **Problema con Groq:** Letta 0.16.8 no tiene soporte nativo para Groq via env var. El provider "byok" se creó pero la asociación al modelo base no funcionó.
- **Solución de Erik:** usar la key de OpenCode Zen (gateway compatible OpenAI con 5 modelos gratis).
- **Solución aplicada:**
  1. Añadido `OPENAI_API_KEY=<key-opencode>` al docker-compose de Letta.
  2. Configurado el agente con modelo `big-pickle` (gratis) y endpoint `https://opencode.ai/zen/v1`.
  3. Reiniciado Letta + Telegram bridge.
  4. **Verificado: respuesta en 7.3s** con la personalidad correcta y memoria funcionando.

---

## Estado real verificado al cerrar

| Componente | Estado | Detalle |
|---|---|---|
| Oracle SP (Letta) | 🟢 | vivo, agente `open-pax` con modelo `big-pickle` (OpenCode Zen) |
| Oracle SP (Telegram) | 🟢 | bridge reiniciado, escuchando mensajes |
| Oracle SP (Ollama) | 🟢 | corriendo como respaldo local |
| Oracle FRA | 🟢 | vivo, limpio, listo para cerebropax |
| cerebropax | 🟡 | creado en disco, pendiente despliegue (otra sesión) |
| Timeout Telegram | 🟢 | resuelto (Groq directo → OpenCode Zen) |

---

## Archivos modificados

| Archivo | Cambio |
|---|---|
| `cerebropax/EXPEDIENTE-MAESTRO.md` | Creado (subproyecto completo) |
| `cerebropax/codigo/config.yaml` | Creado (16 modelos, 10 proveedores, failover) |
| `cerebropax/codigo/docker-compose.yml` | Creado (LiteLLM + PostgreSQL) |
| `cerebropax/codigo/.env.example` | Creado (plantilla de claves) |
| `cerebropax/codigo/deploy.sh` | Creado (despliegue en Frankfurt) |
| `cerebropax/codigo/test-cerebros.sh` | Creado (prueba de 10 proveedores) |
| `cerebropax/documentos/01_por-que-litellm.md` | Creado (justificación) |
| `cerebropax/diagramas/01_arquitectura.svg` | Creado (diagrama visual) |
| `cerebropax/sesiones/sesion-01-creacion.md` | Creado (bitácora) |
| `codigo/letta/.env` | Añadido `OPENCODE_API_KEY` |
| `codigo/letta/docker-compose.yml` | Añadido `OPENAI_API_KEY` inyección |
| `codigo/letta/setup-agent.py` | Corregido: modelo `big-pickle` + endpoint OpenCode Zen |
| `EXPEDIENTE-MAESTRO.md` | Actualizado: Letta 🟢, subproyectos, timeout resuelto |

---

## Notas técnicas para futuras sesiones

### Por qué Groq no funcionó directo con Letta
- Letta 0.16.8 no reconoce `GROQ_API_KEY` del entorno (no hay `groq_api_key` en `LettaSettings`).
- Los modelos `groq/*` aparecen como `base` pero Letta no sabe resolver la llave.
- El endpoint `/v1/providers/` permite crear providers "byok" pero la asociación al agente no tomó la llave.
- **Solución temporal:** OpenCode Zen como gateway OpenAI-compatible (`big-pickle` gratis).
- **Solución definitiva:** cerebropax (LiteLLM) centralizará todo; Letta apuntará a `workspace:4000`.

### OpenCode Zen (gateway temporal)
- Endpoint: `https://opencode.ai/zen/v1`
- Key: la de OpenCode (en `.env` como `OPENCODE_API_KEY`)
- Modelos gratis: `big-pickle`, `deepseek-v4-flash-free`, `mimo-v2.5-free`, `north-mini-code-free`, `nemotron-3-ultra-free`
- Latencia observada: ~7s (vs ~30s+ de Ollama en ARM)
- Costo: $0 (modelos gratis)

### Cuando cerebropax esté listo
- Cambiar el agente Letta de `big-pickle` (OpenCode Zen) a un modelo de LiteLLM.
- Endpoint pasará de `https://opencode.ai/zen/v1` a `http://workspace:4000`.
- La llave pasará de `OPENCODE_API_KEY` a la llave maestra de LiteLLM.
- Esto da failover automático + todos los proveedores en una sola puerta.
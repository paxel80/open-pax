# cerebropax — Documento de sesión 2

> **Sesión:** 2 — Preparación final de Fase 1 + auditoría de API keys + recursospax
> **Fecha:** 5-jul-2026 (continuación en misma sesión)
> **Estado al cerrar:** Fase 1.1-1.5 completas en código. Código listo para subir a Frankfurt. Pendiente: acción humana (regenerar OpenRouter, guardar Anthropic) + subir y ejecutar deploy.sh.

---

## Qué se hizo (segundo tramo)

1. **Auditoría completa de API keys** desde 5 archivos `.env` del disco:
   - `~/.llmkeys/keys.env` (1362 bytes, 7 APIs + tokens no-LLM)
   - `~/.nvidia/nvidia.env` (375 bytes, NVIDIA con clave distinta)
   - `open-pax/codigo/letta/.env` (637 bytes, Groq + OpenCode Zen)
   - `Downloads/installer-latest/.env` (10596 bytes, PentAGI: OpenAI, Gemini, DeepSeek #2)
   - `cerebropax/codigo/.env.example` (plantilla, sin claves reales)
   → Extraídas **11 APIs cloud + 2 locales = 13 cerebros**

2. **Hallazgo crítico: Anthropic** — Erik reveló la clave por curl durante la sesión.
   No estaba en ningún `.env` del disco. Se integró inmediatamente a:
   - `recursospax/bitacora/01_apis-llm.md` (ficha #13)
   - `cerebropax/codigo/config.yaml` (`anthropic/claude-sonnet-4-6`, `anthropic/claude-haiku`)
   - `cerebropax/codigo/.env.example` (`ANTHROPIC_API_KEY=`)

3. **Cerebropax codebase rehecho:**
   - `config.yaml`: + Anthropic modelos, + fallback Anthropic→OpenAI→NVIDIA, + 4 router_groups nuevos
     (`resumen`, `vision`, `todo-el-mercado`, `calidad-tope`). **9 categorías completas.**
   - `docker-compose.yml`: corregido bug `environment_file` (no es clave válida de Compose),
     añadido healthcheck para LiteLLM, logging con rotación.
   - `.env.example`: reescrito con notas de claves canónicas y advertencias (OPEN_AI_KEY vs OPENAI_API_KEY).
   - `deploy.sh`: mejorado con verificación de vacíos en .env, ufw para puerto 4000 solo Tailscale,
     conteo de modelos, mensajes claros con semáforos.

4. **Validación YAML:** ambos archivos pasan `yaml.safe_load()` OK.
   - 24 modelos en 9 grupos, 3 entradas de fallback.

---

## Archivos modificados/creados

```
cerebropax/
├── codigo/
│   ├── docker-compose.yml       ← corregido + healthcheck + logging
│   ├── config.yaml              ← 24 modelos, 9 grupos, 3 fallbacks
│   ├── .env.example             ← reescrito (11 proveedores + notas)
│   ├── deploy.sh                ← mejorado (ufw, verificación, conteo)
│   └── test-cerebros.sh         ← sin cambios (ya era sólido)
├── PROMPTS-DE-ARRANQUE.md        ← 🆕 arranques copy-paste
└── EXPEDIENTE-MAESTRO.md         ← 📝 Fase 1 actualizada

recursospax/
├── bitacora/
│   ├── 01_apis-llm.md            ← 🆕 auditoría completa (13 cerebros)
│   └── README.md                 ← 🆕 índice de 7 fichas
└── sesiones/
    └── sesion-01-creacion.md      ← 📝 actualizado con avances
```

---

## Estado consolidado (semáforo)

| Tarea | Estado |
|---|---|
| 🧪 Auditoría de API keys (5 archivos) | 🟢 completa |
| 📋 Bitácora 01_apis-llm.md (13 cerebros) | 🟢 completa |
| Anthropic key encontrada | 🟢 integrada |
| OpenRouter key expuesta | 🔴 🚨 regenerar YA |
| Anthropic huérfana (sin .env) | 🔴 🚨 guardar en .env |
| Anthropic integrada a config.yaml/.env.example | 🟢 hecha |
| `config.yaml` (24 modelos, 9 grupos, 3 fallbacks) | 🟢 validado YAML OK |
| `docker-compose.yml` (bug corregido + mejoras) | 🟢 validado YAML OK |
| `.env.example` actualizado | 🟢 hecha |
| `deploy.sh` mejorado | 🟢 hecha |
| PROMPTS-DE-ARRANQUE | 🟢 creada |
| **Código listo para subir a Frankfurt** | 🟢 TODO preparado |
| Acción humana: regenerar OpenRouter | 🔴 pendiente (tuya) |
| Acción humana: guardar Anthropic en .env | 🔴 pendiente (tuya) |
| Acción humana: verificar SSH a Frankfurt | 🔴 pendiente (tuya) |
| Subir codigo/ a Frankfurt | 🔴 la próxima sesión |
| Ejecutar deploy.sh + test-cerebros.sh | 🔴 la próxima sesión |

---

## 🚨 Acciones humanas urgentes (antes de la próxima sesión)

| # | Acción | Dónde |
|---|---|---|
| 1 | **Regenerar OpenRouter key** | [openrouter.ai/keys](https://openrouter.ai/keys) → revocar → crear nueva |
| 2 | **Guardar Anthropic key en un .env** | Copiar la key que pasaste por curl, guardarla. Sin .env se pierde. |
| 3 | **Revisar saldos** | DeepSeek: [platform.deepseek.com](https://platform.deepseek.com) → Billing. OpenAI: [platform.openai.com](https://platform.openai.com) → Billing. Cohere: [dashboard.cohere.com](https://dashboard.cohere.com). OpenRouter: [openrouter.ai/settings/billing](https://openrouter.ai/settings/billing). Anthropic: [console.anthropic.com](https://console.anthropic.com). |
| 4 | **Probar SSH a Frankfurt** | `ssh nube2` desde la laptop. Si falla, toca resolver acceso antes de desplegar. |

## Próximo paso recomendado (R7, continuación)

**Subir el código a Frankfurt y desplegar.**

> "Sesión dedicada a cerebropax. Subir `codigo/` a `nube2` via scp/rsync, crear
> .env en `/opt/cerebropax/.env` con las 11 claves según la bitácora `recursospax/
> bitacora/01_apis-llm.md`, ejecutar `bash deploy.sh`, probar con `test-cerebros.sh`,
> anotar los semáforos reales en la bitácora, verificar el panel `/ui`."

(Copia el prompt de `PROMPTS-DE-ARRANQUE.md`.)
# cerebropax — Documento de sesión 1

> **Sesión:** 1 — Creación del subproyecto + inicio de despliegue
> **Fecha:** 5-jul-2026
> **Estado al cerrar:** Fase 0 completa, Fase 1 en progreso (expediente + código listos, pendiente subir a Frankfurt)

---

## Qué se hizo

1. **Releído el expediente padre** (`open-pax/EXPEDIENTE-MAESTRO.md`) y verificado el
   estado real de la infraestructura:
   - Oracle São Paulo: Letta + Ollama + pgvector + telegram_bridge corriendo
     (Fase 1 del padre más avanzada de lo que decía el expediente).
   - Oracle Frankfurt: limpio, 36 GB disco, 22 GB RAM libre, Docker listo.

2. **Inventariadas todas las claves API** disponibles en la laptop:
   - Fuentes: `~/.llmkeys/keys.env`, `~/.nvidia/nvidia.env`,
     `open-pax/codigo/letta/.env`, `Downloads/installer-latest/.env` (PentAGI).
   - Total: **10 proveedores** (8 gratis + DeepSeek barato + OpenAI pago).
   - Faltaba Groq → encontrada en `open-pax/codigo/letta/.env`.

3. **Creado el subproyecto `cerebropax`** con estructura completa:
   ```
   open-pax/cerebropax/
   ├── EXPEDIENTE-MAESTRO.md        ← fuente de verdad
   ├── .gitignore
   ├── codigo/
   │   ├── config.yaml              ← todos los modelos + routing
   │   ├── docker-compose.yml       ← LiteLLM + PostgreSQL
   │   ├── .env.example             ← plantilla de claves
   │   ├── deploy.sh                ← despliegue en Frankfurt
   │   └── test-cerebros.sh         ← prueba los 10 proveedores
   ├── documentos/
   ├── diagramas/
   └── sesiones/
       └── sesion-01-creacion.md    ← este archivo
   ```

4. **Definida la arquitectura**: LiteLLM Gateway en Oracle Frankfurt, solo por
   Tailscale, una sola puerta (`workspace:4000`) para todos los consumidores
   de open-pax.

---

## Estado de los cerebros (previo a prueba)

| # | Proveedor | Clave encontrada | Origen de la clave | Notas |
|---|---|---|---|---|
| 1 | Groq | ✅ | `open-pax/codigo/letta/.env` | En uso por Letta hoy |
| 2 | NVIDIA NIM | ✅ | `~/.nvidia/nvidia.env` + `~/.llmkeys/keys.env` | 2 claves, usar la de `.nvidia` |
| 3 | DeepSeek | ✅ | `~/.llmkeys/keys.env` | centavos |
| 4 | Gemini | ✅ | PentAGI .env | free tier |
| 5 | Cerebras | ✅ | `~/.llmkeys/keys.env` | |
| 6 | Mistral | ✅ | `~/.llmkeys/keys.env` | free tier |
| 7 | Cohere | ✅ | `~/.llmkeys/keys.env` | trial |
| 8 | HuggingFace | ✅ | `~/.llmkeys/keys.env` | |
| 9 | OpenRouter | ✅ | `~/.llmkeys/keys.env` | ⚠️ clave expuesta en git histórico, regenerar |
| 10 | OpenAI | ✅ | PentAGI .env | pago, usar con cuidado |
| 11 | Ollama SP | — | sin clave (local) | ya corriendo en SP |
| 12 | Ollama laptop | — | sin clave (local) | RTX 3050, sin censura |

---

## Pendientes para la próxima sesión

- [ ] **Fase 1 de cerebropax:** subir `codigo/` a Frankfurt y ejecutar `deploy.sh`
- [ ] Generar llave maestra real (`LITELLM_MASTER_KEY`) y salt
- [ ] Crear `.env` en Frankfurt con las 10 claves reales
- [ ] Correr `test-cerebros.sh` y anotar qué proveedores responden
- [ ] Marcar en `EXPEDIENTE-MAESTRO.md` los semáforos reales por proveedor
- [ ] Actualizar el expediente padre de open-pax: marcar LiteLLM como 🟢 desplegado
- [ ] Conectar Letta (SP) para que use `workspace:4000` en vez de Ollama directo

---

## Decisiones tomadas

1. **LiteLLM** como tecnología del banco de cerebros (vs OpenRouter directo):
   - Una sola puerta para todos los consumidores.
   - Failover automático entre proveedores.
   - Panel UI para ver uso y modelos.
   - Estándar OpenAI → cualquier consumidor lo entiende sin cambios.

2. **Oracle Frankfurt** como ubicación (vs laptop o SP):
   - Estaba vacío y sobrado de recursos.
   - 24/7 (la laptop se apaga de noche).
   - Central para Fase 2 del padre (LangGraph + Mem0 también irán en FRA).

3. **Solo por Tailscale** (no público):
   - Las claves son sensibles. ufw permite solo red Tailscale + localhost.

4. **PostgreSQL** interno para logs y claves virtuales (opcional pero recomendado):
   - Permite crear claves virtuales por consumidor (Letta, Fábrica, etc.).
   - Guarda logs de uso por modelo (para observabilidad).

---

## Próximo paso recomendado (R7: UN solo siguiente paso)

**Desplegar cerebropax en Frankfurt.** El siguiente mensaje de arranque para la
próxima sesión sería:

> "Continúa con cerebropax: sube `open-pax/cerebropax/codigo/` a Frankfurt
> (`nube2`), genera la llave maestra, crea el `.env` con las claves reales,
> ejecuta `deploy.sh` y luego `test-cerebros.sh`. Anota los resultados en el
> expediente."
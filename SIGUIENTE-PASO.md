# SIGUIENTE PASO

> **Un solo paso.** El sistema autónomo te dice qué hacer, lo hace, y te muestra el resultado.
> Diseñado para TDAH (R11): una línea, un comando, un resultado visible.

---

## Ahora mismo: levantar el núcleo

### Comando 1 — Desplegar LiteLLM en nube2

```bash
ssh nube2
cd open-pax/codigo/cerebropax
cp .env.example .env  # rellenar claves desde recursos/bitacora/01_apis-llm.md
docker compose up -d
bash test-cerebros.sh
```

**Si pasa:** cerebropax responde `/v1/models` con la lista de modelos disponibles.
**Si falla:** revisar `.env` (claves) y `config.yaml` (modelos configurados).

### Comando 2 — Conectar Letta a LiteLLM

```bash
ssh nube1
# En codigo/letta/.env, cambiar el endpoint del modelo a:
# OPENAI_API_BASE=http://<nube2-tailscale-ip>:4000/v1
# OPENAI_API_KEY=<LITELLM_MASTER_KEY de .env de cerebropax>
docker compose restart letta
```

**Si pasa:** Letta responde usando modelos de cerebropax (no OpenCode Zen directo).
**Si falla:** verificar conectividad Tailscale entre nube1 y nube2.

### Comando 3 — Probar el loop mínimo

```bash
# En laptop (o nube2):
git init sandbox/  # sandbox reversible
cd sandbox
# Enviar por Telegram al bot: "crea hola.py con print('hola mundo')"
# El agente debe: escribir archivo → ruff check → si OK notifica, si fail revierte
```

**Si pasa:** 🎉 Fase 1 completada — el paradigma funciona en miniature.
**Si falla:** falta implementar el tool MCP o el auto-verificador (ver `documentos/19` DAG).

---

## Después del comando 3

1. Medir: ¿cuántas de 10 tareas como `hola.py` se completan autónomas?
2. Recalibrar invariantes (ver `documentos/19_invariantes-operativos.md`)
3. Empezar Fase 2: añadir tools más complejos

---

## Qué NO hacer ahora

- ❌ No desplegar Qdrant, LLaVA, LiveKit, browser-use
- ❌ No leer los 18 documentos (ya están archivados los que no importan)
- ❌ No diseñar sub-agentes o multi-agente
- ❌ No añadir más capas ni frameworks

**Solo levantar el loop mínimo.** 50 líneas de Python > 19 KB de manifiesto.

---

*SIGUIENTE-PASO.md · 5-jul-2026 · El 80% del valor está en completar el comando 1*
# SIGUIENTE PASO

> **Un solo paso.** El roadmap completo está en `documentos/20_roadmap-fase-1.md`.
> Aquí solo LO QUE TOCA AHORA. Diseñado para TDAH (R11).

---

## AHORA: Paso 1 del roadmap — Desplegar LiteLLM en nube2

> **Quién ejecuta:** el bootstrap-builder (un agente IA), no Erik.
> Erik solo observa el resultado y valida.

### Pre-requisitos del bootstrap-builder
1. Acceso SSH a nube2 (Oracle Frankfurt) vía Tailscale
2. Las claves de los proveedores LLM (de `recursos/bitacora/01_apis-llm.md`)
3. Los archivos de `codigo/cerebropax/` (ya existen en el repo)

### Pasos que el bootstrap-builder debe ejecutar

```bash
# En la laptop, copiar el repo a nube2 vía Tailscale
ssh nube2 'mkdir -p /opt/cerebropax && cd /opt/cerebropax'

# Rellenar .env con claves REALES (no las pongo aquí — están en recursos/bitacora/)
# Generar llaves maestras:
python -c "import secrets; print('sk-cerebropax-'+secrets.token_urlsafe(32))"

# Desplegar
cd codigo/cerebropax && bash deploy.sh
```

### Verificación de éxito
```bash
curl -H "Authorization: Bearer $LITELLM_MASTER_KEY" http://<nube2-tailscale-ip>:4000/v1/models
# Debe responder con ~23 modelos
```

🟢 **Si pasa:** avanzar al Paso 2 (cablear Letta→LiteLLM).
🔴 **Si falla:** revisar `.env` (claves vacías) o `config.yaml` (nombre de modelo mal).

---

## Lo que sigue (NO ejecutar todavía)

```
FASE 1A  1.🟢AHORA Desplegar LiteLLM    →  2.⏳ Cablear Letta→LiteLLM
FASE 1B  3a.⏳ Sandbox    ||    3b.⏳ Tool MCP write_file+undo
FASE 1C  4.⏳ Auto-verificador (ruff)
FASE 1D  5.⏳ Watchdog mínimo (I5 + logging)
→ ★ DONE: "crea hola.py" sin intervención humana
```

---

## Qué NO hacer ahora

- ❌ No construir el sandbox ni el tool MCP todavía (van en 1B, tras 1A listo)
- ❌ No desplegar Docker completo para el sandbox (git init basta — over-engineering)
- ❌ No implementar el verificador LLM adversarial (Fase 2)
- ❌ No añadir más modelos a config.yaml (23 es suficiente)
- ❌ Erik no programa nada — todo lo construye el bootstrap-builder (R8)

---

*SIGUIENTE-PASO.md · 5-jul-2026 · El 80% del valor está en completar el Paso 1*

# PROMPTS-DE-ARRANQUE.md — cerebropax

> **Copia y pega este prompt** en la próxima sesión para continuar exactamente donde quedamos.
> Última actualización: 5-jul-2026

---

## 🟢 Arranque para Fase 1 (desplegar en Frankfurt)

Léete los archivos importantes y despliega:

```
Sesión dedicada a cerebropax (open-pax/cerebropax).
Leo los expedientes de disco y continúo desde donde quedó la sesión 2 (5-jul-2026).

Estado actual:
- cerebropax/EXPEDIENTE-MAESTRO.md v2 (base categorizada, 9 categorías, visión-futura registrada)
- recursospax creado como subproyecto hermano (gestión de recursos, bitácora)
- bitacora/01_apis-llm.md completa (13 cerebros auditados, 5 .env leídos)
- Docker Compose corregido (bug de environment_file eliminado)
- .env.example actualizado con ANTHROPIC_API_KEY
- deploy.sh mejorado (ufw, verificación de .env, conteo de modelos)
- config.yaml validado (YAML OK): 24 modelos en 9 categorías con 3 fallbacks

Objetivo de esta sesión:
Desplegar cerebropax en Oracle Frankfurt (workspace / nube2, 100.70.241.65).

Lo que hay que hacer (en orden):
1. Verificar acceso SSH a Frankfurt (ssh nube2)
2. Subir codigo/ a Frankfurt (scp o rsync) — config.yaml, docker-compose.yml, .env, test-cerebros.sh
3. Crear el .env real en Frankfurt con las 11 claves (fuente: recursospax/bitacora/01_apis-llm.md)
   - ATENCIÓN: OpenRouter debe REGENERARSE (expuesta en git histórico)
   - Anthropic se pasó por curl en la sesión anterior; guardarla en .env
   - NVIDIA canónica: la de .nvidia/nvidia.env
   - OPEN_AI_KEY → renombrar a OPENAI_API_KEY en el .env de Frankfurt
4. Generar LITELLM_MASTER_KEY y LITELLM_SALT_KEY nuevos
5. Generar LITELLM_DB_PASSWORD y alinear con LITELLM_DATABASE_URL
6. Ejecutar deploy.sh (configura ufw, levanta Docker, verifica livez)
7. Verificar que curl http://workspace:4000/health/liveliness responda desde la laptop
8. Ejecutar test-cerebros.sh desde Frankfurt o la laptop contra workspace:4000
9. Anotar semáforos reales en recursospax/bitacora/01_apis-llm.md
10. Verificar panel http://workspace:4000/ui

Importante:
- Puerto 4000 solo accesible por Tailscale (ufw ya lo configurará deploy.sh)
- Las claves van en /opt/cerebropax/.env, chmod 600, NUNCA en git
- El .env NO se commitea, NUNCA
- Si alguna clave no funciona, anotar en la bitácora y seguir con las demás
```

---

## 🟡 Arranque para recursospax (continuar bitácora)

Usar si se decide seguir documentando en vez de desplegar:

```
Sesión dedicada a recursospax (open-pax/recursospax).
Leo los expedientes de disco y continúo donde quedó la sesión 1 (5-jul-2026).

Estado actual:
- Ficha 1 (APIs LLM) completada: 13 cerebros auditados
- Fichas 2-7 pendientes
- cerebropax avanzado: 9 categorías, YAML validado, deploy.sh listo

Objetivo: crear bitacora/02_cuentas-cloud.md y bitacora/03_mcp.md.
Extraer datos de recursos/infraestructura/01_inventario-infraestructura.md.
```

---

## 🚨 Acciones humanas urgentes (tuyas, antes de la próxima sesión)

Estas las haces tú en el navegador/terminal, no yo:

1. **Regenerar OpenRouter key** → [openrouter.ai/keys](https://openrouter.ai/keys)
2. **Guardar Anthropic key** en un `.env` seguro (está suelta, riesgo de pérdida)
3. **Revisar saldo** de DeepSeek, OpenAI, Cohere, OpenRouter, Anthropic
4. **Probar si puedes hacer SSH a Frankfurt** (`ssh nube2`) — requisito para desplegar
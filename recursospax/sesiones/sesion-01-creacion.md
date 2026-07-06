# recursospax — Documento de sesión 1

> **Sesión:** 1 — Creación del subproyecto
> **Fecha:** 5-jul-2026
> **Estado al cerrar:** Fase 0 completa, Fase 1 en progreso (expediente creado, pendiente rellenar las 7 fichas)

---

## Qué se hizo

1. **Erik definió recursospax** como nuevo subproyecto de open-pax:
   - "Un proyecto llamado recursospax, encargado de gestionar mis recursos.
     Uno de ellos es cerebros, otro podría ser cuentas, MCP, API tokens,
     contraseñas, etc. Que lleve bitácora, registro y monitoreo de los recursos."
   - Decisión: **solo recursos técnicos de open-pax**, no personales.

2. **Alcance definido:** recursos de open-pax (APIs, cuentas cloud, MCP, tokens,
   modelos locales, claves SSH, saldo prepago). Lo personal va al área `💚 Personal`.

3. **Estrategia por fases:** bitácora escrita primero → comprobación automática
   después → monitoreo vivo + alertas más adelante. Caminar primero, correr después.

4. **7 categorías de recursos** definidas con Erik:
   1. 🧠 Cerebros (APIs LLM)
   2. 🏦 Cuentas cloud
   3. 🔌 MCP (Model Context Protocol)
   4. 🎫 API tokens y keys
   5. 🖥️ Modelos locales
   6. 🔑 Claves SSH y acceso
   7. 💉 Inyección / prepago

5. **Creada la estructura del subproyecto:**
   ```
   open-pax/recursospax/
   ├── EXPEDIENTE-MAESTRO.md        ← fuente de verdad
   ├── .gitignore
   ├── bitacora/                    ← las 7 fichas (a crear)
   ├── codigo/                      ← scripts de comprobación (Fase 2)
   ├── documentos/                  ← por qué recursospax
   ├── diagramas/                   ← panorama SVG
   └── sesiones/
       └── sesion-01-creacion.md   ← este archivo
   ```

6. **Cerebropax ya existente** se relaciona: los cerebros que gestiona cerebropax
   están registrados en recursospax (`bitacora/01_apis-llm.md`). cerebropax =
   el que los usa; recursospax = el que lleva la bitácora.

7. **Información ya existente** en disco:
   - `recursos/infraestructura/01_inventario-infraestructura.md` (209 líneas de
     inventario detallado con IPs, cuentas, APIs, estado)
   - `cerebropax/EXPEDIENTE-MAESTRO.md` (10 proveedores LLM con estado y origen de claves)
   - `recursos/infraestructura/02_topologia-red.svg` (diagrama de red)
   → La bitácora extrae de ahí, no inventa.

---

## Decisiones tomadas

1. **recursospax como subproyecto aparte** (no solo una carpeta dentro de `recursos/`).
   Así tiene su propio expediente, reglas, hoja de ruta y sesiones. La carpeta vieja
   `recursos/` queda como archivo histórico (el inventario original).

2. **Las claves NUNCA se escriben en la bitácora** (RR4). Se referencia dónde está
   la clave real (p. ej. `cerebropax/codigo/.env`), pero el texto de la clave jamás
   aparece en un archivo que se suba a git.

3. **Honestidad con lo desconocido** (RR3). Si no sabemos el saldo, ponemos
   "🔴 desconocido — revisar en portal del proveedor". No inventamos números.

4. **Por fases** (Fase 1 = bitácora manual → Fase 2 = comprobación automática →
   Fase 3 = alertas por Telegram). No construimos el cohete antes que la carreta.

---

## Pendientes para la próxima sesión

- [ ] **Fase 1.1** Crear `bitacora/01_apis-llm.md` — extraer las 10 APIs de `cerebropax/EXPEDIENTE-MAESTRO.md`
- [ ] 1.2 Crear `bitacora/02_cuentas-cloud.md` — extraer de `recursos/infraestructura/01_inventario-infraestructura.md`
- [ ] 1.3 Crear `bitacora/03_mcp.md` — requerirá revisar qué MCP hay en la laptop
- [ ] 1.4 Crear `bitacora/04_api-tokens.md`
- [ ] 1.5 Crear `bitacora/05_modelos-locales.md`
- [ ] 1.6 Crear `bitacora/06_claves-ssh.md`
- [ ] 1.7 Crear `bitacora/07_saldo-prepago.md`
- [ ] 1.8 Crear `bitacora/README.md` — índice de las 7 fichas
- [ ] Actualizar `open-pax/EXPEDIENTE-MAESTRO.md` — tabla de subproyectos
- [ ] Definir plantilla común para las 7 fichas (mismo formato)

## Próximo paso recomendado (R7: UN solo siguiente paso)

**Rellenar la primera ficha: APIs LLM.** Con los datos que ya están en
`cerebropax/EXPEDIENTE-MAESTRO.md`, crear `bitacora/01_apis-llm.md` con la
plantilla: proveedor, cuenta creada, tipo (free/pago), límite, saldo, dónde
está la clave, última verificación, semáforo, notas. Luego seguir con las otras 6.

---

## 🆕 Avance durante esta sesión (continuación)

### Ficha 1 — APIs LLM completada ✅

Se extrajeron todas las API keys de **5 archivos fuente** del disco y se creó
`bitacora/01_apis-llm.md` (305 líneas). Resultado:

- **11 proveedores cloud + 2 modelos locales = 13 cerebros** documentados
- Cada uno con: plataforma, modelos, tipo de cuenta, costo, límite, saldo
  (cuando se sabe), dónde está la clave, última verificación, semáforo

### Hallazgos importantes de la auditoría

| # | Hallazgo | Severidad |
|---|---|---|
| 1 | **OpenRouter key expuesta en git histórico** | 🚨 Crítica — regenerar YA |
| 2 | **NVIDIA y DeepSeek tienen 2 claves distintas cada uno** | 🟡 — probar ambas, ver cuál funciona |
| 3 | **Saldo de DeepSeek, OpenAI, Cohere, OpenRouter** | 🔴 — desconocido en todos |
| 4 | **Anthropic** apareció (clave revelada por Erik via curl en sesión) | 🟡 — guardar en `.env` YA (está suelta) |
| 5 | **OPENCODE_API_KEY** (OpenCode Zen) — proveedor no documentado | 🔵 — queda pendiente investigar |
| 6 | `keys.env` está en `C:\Users\erikj\.llmkeys\` (no es un .env con nombre estándar) | 🟢 — referencia correcta |

### Impacto en cerebropax (subproyecto hermano)

Esta auditoría cerró la **Fase 1.1 y 1.2** de `cerebropax/EXPEDIENTE-MAESTRO.md`:
- ✅ `config.yaml` revisado: las **9 categorías** del `router_groups` quedaron
  completas (antes solo tenía 5: chat-rapido, chat-inteligente, codigo,
  razonamiento, respaldo-local). Añadidas: **resumen, vision, todo-el-mercado,
  calidad-tope**.
- ✅ Anthropic agregada al `model_list` (`claude-sonnet-4-6`, `claude-haiku`),
  a los `fallbacks` (Anthropic → OpenAI → NVIDIA) y al grupo `calidad-tope`.
- ✅ `.env.example` de cerebropax actualizado con `ANTHROPIC_API_KEY`.

### Archivos creados/modificados en disco

```
recursospax/
├── EXPEDIENTE-MAESTRO.md                    ← (ya existía)
├── bitacora/
│   ├── README.md                            ← 🆕 índice de las 7 fichas
│   └── 01_apis-llm.md                       ← 🆕 ficha 1 completa (13 cerebros)
└── sesiones/
    └── sesion-01-creacion.md                ← 📝 actualizado (este archivo)

cerebropax/
├── EXPEDIENTE-MAESTRO.md                    ← 📝 categorías completadas en la hoja de ruta
├── codigo/
│   ├── config.yaml                          ← 📝 Anthropic + 4 grupos nuevos + fallback
│   └── .env.example                         ← 📝 ANTHROPIC_API_KEY añadido
```

### Pendientes para la próxima sesión

- [ ] Ficha 2: `bitacora/02_cuentas-cloud.md` (Oracle SP, Oracle FRA, Cloudflare, GitHub, Supabase, Northflank)
- [ ] Ficha 3: `bitacora/03_mcp.md`
- [ ] Ficha 4: `bitacora/04_api-tokens.md` (Telegram, Ngrok, Langfuse, n8n, Vercel, Scaleway, Tavily, OpenCode Zen)
- [ ] Ficha 5: `bitacora/05_modelos-locales.md`
- [ ] Ficha 6: `bitacora/06_claves-ssh.md`
- [ ] Ficha 7: `bitacora/07_saldo-prepago.md`
- [ ] Acción humana: regenerar OpenRouter key en openrouter.ai/keys
- [ ] Acción humana: guardar Anthropic API key en `.env` antes que se pierda
- [ ] Acción humana: anotar saldo real de DeepSeek y OpenAI
- [ ] Decidir claves canónicas para NVIDIA y DeepSeek (probar ambas, ver cuál responde)

### Próximo paso recomendado (continuación)

**Fase 1.3 de cerebropax**: corregir el bug de `docker-compose.yml`
(`environment_file` no es clave válida de Compose) → y entonces ya estaría todo
listo para subir a Frankfurt. O bien seguir con la **Ficha 2** de recursospax
(cuentas cloud), que es lo equivalente a "documentar la siguiente categoría".
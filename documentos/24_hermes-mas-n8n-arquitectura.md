# 24 · Arquitectura — Hermes + n8n (cerebro + manos)

> **Fecha:** 6-jul-2026 · Apéndice de arquitectura al doc 23 (lóbulo frontal). Responde: ¿combinar n8n con Hermes?

---

## 🧠 Regla de oro arquitectónica

```
   COGNICIÓN (decidir, recordar, interpretar, hablar)  →  HERMES (LLM)
   DETERMINISMO (conectar APIs, schedulear, transformar) →  n8n (workflow)
```

Son **complementarios**, no competidores. Hermes piensa; n8n ejecuta integraciones sin alucinar.

---

## 🔄 Patrón de interacción

```
   Erik (Telegram) → HERMES (decide) → n8n (lee/actualiza APIs) → HERMES (interpreta) → Erik
```

- Hermes llama a n8n vía **webhook HTTP** (skill de Hermes que hace POST).
- n8n llama a Hermes vía **CLI/API de Hermes** cuando un trigger externo necesita decisión.
- Bidireccional, desacoplado, escalable.

---

## 🟢 Lo que se gana

| Capacidad | Solo Hermes | Hermes + n8n |
|---|---|---|
| Decidir qué toca | 🟢 | 🟢 |
| Recordar contexto | 🟢 | 🟢 |
| Leer archivos locales (tablero, AGENTS.md) | 🟢 | 🟢 |
| Conectar Gmail/Calendar/Notion/Trello/Slack | 🔴 una skill por API | 🟢 **n8n nativo** |
| Triggers deterministas (sin alucinación) | 🟡 LLM puede errar | 🟢 0 errores |
| Flujos visuales | 🔴 solo código | 🟢 **visual** (bueno TDAH) |
| Cron robusto 24/7 | 🟢 | 🟢 |

---

## 🔴 Anti-TDAH: fasear, NO sumar de golpe

**Trampa real:** n8n es un "juguete nuevo" que puede comer 2 semanas configurando workflows sin dar dinero, mientras Yésika no avanza. Mismo error que ya pasó con Letta (construir infra por anticipado).

### FASE 1 (AHORA, semanas 1-3) — SOLO HERMES
- 7 funciones frontales con skills nativas de Hermes.
- Lectura directa de archivos locales: `mi-tablero.html`, `AGENTS.md`, `memories\`.
- **80% del valor del lóbulo frontal se obtiene aquí, sin n8n.**
- NO desplegar n8n todavía.

### FASE 2 (cuando lo necesites, ~mes 2) — Hermes + n8n
- Desplegar n8n en **VM Oracle** (24GB RAM sobra), NUNCA en laptop (7.7GB al límite).
- Conectar Hermes ↔ n8n vía webhook.
- Usar n8n SOLO para integraciones que Hermes no tenga nativas (Gmail, Calendar, Notion, scraping).
- **Regla de activación:** *"cuando una skill de Hermes necesite una API externa que no tiene → ahí sumas n8n para esa integración. Nunca antes."*

---

## 📋 Estado de n8n en el ecosistema de Erik (verificado memoria + doc 01)

- 🔴 n8n ya existió, vivía en el **Hetzner** (apagado 2-jul-2026, ver `infra-ovh-dada-de-baja`). Cayó con él.
- 🟡 `N8N_API_KEY` todavía en `C:\Users\erikj\.llmkeys\keys.env` (inútil sin instancia corriendo).
- 🟢 n8n self-hosted es **fair-code / free** ($0 cumple).
- 🟢 Desplegar en VM Oracle (SP o FRA, la que tenga más holgura), **NO laptop** (RAM).
- 🟢 Conexión Hermes↔n8n vía red Tailscale (webhook interno, no expuesto a internet — evita el error del Ollama del doc 21).

---

## 🗺️ Dónde vive cada cosa en tu malla de 4 nodos

```
   🟢 LAPTOP (propio)        → Hermes (memoria viva, skills, sesión de día)
   🟢 CELULAR (propio)       → Erik habla con Hermes por Telegram (canal)
   🟡 VM ORACLE SP (ajeno)   → Hermes 24/7 + (futuro) n8n Fase 2
   🟡 VM ORACLE FRA (ajeno)  → LiteLLM (router de modelos) + respaldo
```

**Principio:** lo irreversible (memoria persistente del lóbulo frontal) → VM 24/7. Lo reversible (skills, experiments) → laptop primero.

---

## ⚠️ Cuidados de seguridad (heredados de la auditoría doc 21)

- n8n webhook interno **SOLO por Tailscale**, NUNCA `0.0.0.0` (mismo error que Ollama 🔴).
- Auth en n8n habilitada (basic auth o API key) desde el primer día.
- `.env` de n8n en `.gitignore` (regla anti-fuga).
- Si n8n toca APIs de Erik (Gmail, Calendar), esas credenciales se guardan en n8n credentials encriptadas, NUNCA en código.

---

## ❓ Pendientes para Fase 2 (NO resolver ahora)

1. ¿Qué integración externa será la PRIMERA que Hermes necesite? (esa dicta el primer workflow de n8n)
2. ¿n8n en SP o en FRA? (SP ya tiene Letta+Ollama; FRA tiene LiteLLM — equilibrio de carga)
3. ¿Hermes se muda a VM 24/7 o se queda en laptop con sync de memoria?

---

*24_hermes-mas-n8n-arquitectura.md · 6-jul-2026 · Regla de Oro: nada en conversación, todo a disco.*
*Decisión: sí combinar, pero en Fase 2. Fase 1 = solo Hermes. Anti-TDAH = no construir infra por anticipado.*
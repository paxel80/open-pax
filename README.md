# open-pax

**Agente autónomo de propósito general.** Un sistema que opera sin supervisión humana continua, aspirando a adquirir/replicar un espectro amplio de capacidades humanas.

## Paradigma

Establecido por el Consejo de 18 perspectivas ortogonales (15/16 unánime, 3 rondas de deliberación, autonomía máxima).

### Single-agent + Autoverify + Reversible

Un único LLM con:
1. **Tool-calling robusto** (vía MCP)
2. **Memoria persistente legible** (vectorial + estructurada, auditable)
3. **Auto-verificador interno** (2º pase adversarial + tests deterministas)
4. **Reversibilidad por diseño** (sandbox, dry-run, undo, dead-man's switch)
5. **Kill-switches automáticos** disparados por invariantes — no por humanos

El humano es **diseñador ex-ante + auditor ex-post**. No está en el lazo.

## Estructura

```
open-pax/
├── EXPEDIENTE-MAESTRO.md      # Fuente única de verdad (v3)
├── documentos/                # Análisis y veredictos del Consejo
│   ├── 06_capacidades-humanas-universales.md    # 316 capacidades en 18 grupos
│   ├── 08_metodo-implementacion.md              # Clasificación A/R/A+R/N/A
│   ├── 14_veredicto-consejo-estado-del-arte.md # Paradigma establecido
├── codigo/                     # Código de despliegue
│   └── letta/                  # Stack Letta + Telegram bridge
├── visual/                     # Reportes HTML imprimibles
├── diagramas/                  # Diagramas SVG
├── recursos/                   # Inventario de infraestructura
├── cerebropax/                 # Subproyecto: banco de cerebros (LiteLLM)
├── recursospax/                # Subproyecto: gestión de recursos
└── personalpax/                # Subproyecto: área personal
```

## Estado

- 🟢 Fase 0: Fundación completa (Oracle VMs, Tailscale, Letta desplegado)
- 🟡 Fase 1: Núcleo autónomo (LiteLLM + MCP + auto-verificador + sandbox + watchdog)
- ⏳ Fase 2+: Capacidades autónomas

## Repo

https://github.com/paxel80/open-pax

---

*open-pax v3 · Paradigma: single-agent + autoverify + reversible*
# 🗃️ Recursos — open-pax

Índice de los recursos documentados del proyecto.

## Estructura

```
recursos/
├── README.md                           ← estás aquí
├── infraestructura/
│   └── 01_inventario-infraestructura.md ← inventario completo de servidores, dominios, cuentas
└── (por crear)
    ├── plantillas/                      ← .env.example, docker-compose base, etc.
    ├── modelos/                         ← modelos de IA disponibles (local + API)
    └── referencias/                     ← enlaces a proyectos base (La Fábrica, Hermes)
```

## Proyectos de origen (continuación de)

### La Fábrica — `C:\Users\erikj\Proyecto-Empresa-IA\`

Proyecto anterior donde se diseñó y construyó el sistema de agentes tipo "empresa de IA". Contiene:

- **EXPEDIENTE-MAESTRO.md** — fuente de verdad de la fábrica
- **SISTEMA-DESARROLLO-VANGUARDISTA.md** — blueprint de la fábrica de código con IA
- **BLUEPRINT-EL-TALLER.md** — arquitectura por capas del núcleo (Hetzner)
- **MAXIMA-CAPACIDAD-reporte.md** — estado del arte 2026 con costos
- **cerebro_completo.py** — CrewAI con 7 departamentos
- **herramientas_infra.py** — tools para Qdrant, SearXNG, OpenHands, OpenCode

### Hermes Stack — `C:\Users\erikj\OneDrive\Documents\Hermes-brain\`

Stack anterior de 14 servicios Docker en OVH (ahora caído). Contiene:

- **RECONSTRUCCION.md** — runbook para levantar en VPS nuevo
- **Arquitectura del Sistema.md** — diseño del sistema de agentes
- **Configuración y Variables.md** — .env y secretos

**open-pax** es la continuación re-enfocada de estos proyectos: asistente personal humano-equivalente en vez de "empresa de agentes".

## Regla de oro de recursos

> Cada recurso documentado aquí tiene un costo (dinero, RAM, mantenimiento). Antes de añadir uno nuevo, preguntar: ¿sube la capacidad humana-equivalente, o es solo "más infraestructura"? Si no sube la capacidad, no entra.
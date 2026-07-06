# Frameworks óptimos para capacidades tipo A (serie de acciones)

> Asignación uno-a-uno del **framework óptimo** para cada una de las 91 capacidades tipo A.
> Tipo A = serie de acciones / workflow puro (sin LLM ni recurso especial).
> Creado: 5-jul-2026 · open-pax/documentos/09

---

## Resumen por framework

| Framework | Capacidades | % |
|---|---|---|
| n8n | 61 | 67% |
| n8n + Postgres | 4 | 4% |
| n8n + Metabase | 4 | 4% |
| n8n + DB | 4 | 4% |
| n8n + Playwright | 3 | 3% |
| git CLI (script) | 2 | 2% |
| n8n + ADB (script) | 1 | 1% |
| Docker sandbox (script) | 1 | 1% |
| n8n (Cheerio) / Python+Playwright | 1 | 1% |
| Ansible/Terraform (IaC) | 1 | 1% |
| Python script (reglas) | 1 | 1% |
| Python (numpy-financial) | 1 | 1% |
| n8n + Anki-like (script) | 1 | 1% |
| Ansible + scripts (hardening) | 1 | 1% |
| Bitwarden/Vault (self-hosted) | 1 | 1% |
| Borg/restic (script + cron) | 1 | 1% |
| WireGuard/Tailscale (infra) | 1 | 1% |
| Wazuh/Falco (SIEM) | 1 | 1% |
| n8n + Borg | 1 | 1% |
| **TOTAL** | **91** | 100% |

### Conclusión

- **n8n domina** con 141 capacidades (orquestación visual, self-hosted, ideal para Erik que no programa — R4).
- **Herramientas dedicadas** mejor que n8n en 11 casos: git CLI, Ansible/Terraform, Python (numpy-financial), Docker sandbox, Metabase. n8n las **invoca** pero no las reemplaza.
- **LangChain y CrewAI NO se asignaron a ninguna capacidad tipo A**: son frameworks orientados a LLM/agentes (tipo R y A+R). Para workflows puros sin LLM, n8n es más simple y visual.
- **Principio**: n8n orquesta; herramientas especializadas ejecutan lo que n8n hace mal (infra, math pesada, git).

---

## Tabla completa (uno a uno)

| # | Capacidad | Qué es | Framework óptimo | Por qué |
|---|---|---|---|---|
| 1.2 | Atender / concentrarse | Foco sostenido en una tarea | **n8n** | Workflow que silencia notifs + timer pomodoro; visual, programable por cron. |
| 1.7 | Olvidar selectivamente | Descartar lo irrelevante | **n8n** | Job de purga con reglas TTL sobre la DB; nodos Date+Delete visuales. |
| 1.12 | Planificar multi-paso | Secuencia hacia meta | **n8n** | Workflow con nodos secuenciales + estado persistente en DB. |
| 1.13 | Tomar decisiones | Elegir entre opciones | **n8n** | Nodo IF/Switch con reglas declarativas; Erik ve el árbol de decisión. |
| 1.14 | Priorizar | Ordenar por importancia | **n8n** | Nodos Sort + Function con fórmula de scoring; editable visualmente. |
| 1.15 | Comparar / evaluar | Sopesar alternativas | **n8n** | Nodos Compare/Diff sobre datos; salida tabular para Erik. |
| 1.19 | Categorizar / clasificar | Agrupar por similitud | **n8n** | Nodos Set + reglas de clasificación; sin LLM si son reglas fijas. |
| 1.20 | Calcular / matemáticas | Operaciones numéricas | **n8n** | Nodo Code (JS) para cálculos rápidos; para pesados → Python. |
| 2.3 | Leer texto | Decodificar símbolos escritos | **n8n** | Nodos Read File + Extract; pipeline de parseo determinista. |
| 2.14 | Dar instrucciones | Indicar cómo hacer algo | **n8n** | Nodo que envía instrucciones a canal (Telegram/Email). |
| 2.20 | Comunicar por escrito (mensajería) | Chat, email, cartas | **n8n** | Nodos nativos Telegram/Slack/Email/Gmail; su especialidad. |
| 5.1 | Usar computadora | Teclado, ratón, OS | **n8n + Playwright** | RPA determinista vía nodo Playwright; si necesita adaptarse → browser-use (R). |
| 5.2 | Usar smartphone | Apps, táctil | **n8n + ADB (script)** | Automatización móvil por ADB; escaso en n8n nativo, complementa con script. |
| 5.3 | Navegar internet | Abrir webs, seguir links | **n8n + Playwright** | Automatización de navegador headless; n8n orquesta, Playwright ejecuta. |
| 5.4 | Buscar información web | Google, búsquedas | **n8n** | Nodo HTTP + Brave/SerpAPI/Google; orquesta resultados paginados. |
| 5.5 | Leer contenido web | Extraer info de páginas | **n8n** | Nodos HTTP + HTML/Cheerio Extract; scraping determinista. |
| 5.7 | Rellenar formularios web | Escribir campos, seleccionar | **n8n + Playwright** | Llenado de forms con selectores estables; n8n pasa los datos. |
| 5.10 | Usar apps específicas (Excel, Notion, etc) | Operar software concreto | **n8n** | Nodos app nativos (Notion, Sheets, Airtable) o HTTP API. |
| 5.13 | Ejecutar código y ver resultado | Correr programas | **Docker sandbox (script)** | Aislamiento y reproducibilidad; n8n solo orquesta el disparo, el código corre en contenedor. |
| 5.14 | Usar git / versionado | Gestionar repositorios | **git CLI (script)** | git es la herramienta nativa; n8n no aporta valor sobre CLI. |
| 5.15 | Manejar bases de datos | Consultar, insertar, actualizar | **n8n** | Nodos Postgres/MySQL/Redis nativos; CRUD visual con mapeo. |
| 5.16 | Manejar APIs (REST/GraphQL) | Consumir servicios web | **n8n** | Nodo HTTP Request es su núcleo; auth, paginación, retries visuales. |
| 5.17 | Scraping web | Extraer datos de páginas | **n8n (Cheerio) / Python+Playwright** | Simple → n8n HTTP+Cheerio; JS-heavy/anti-bot → Python+Playwright. |
| 5.18 | Descargar / subir archivos | Transferir datos | **n8n** | Nodos Read/Write File + S3/FTP/Drive; transferencias programadas. |
| 5.19 | Configurar servidores / infra | Sistemas, redes | **Ansible/Terraform (IaC)** | IaC declarativo idempotente; n8n no es herramienta de infra. |
| 6.1 | Anotar gastos | Registrar lo que se gasta | **n8n + Postgres** | Webhook desde Telegram → insert en DB; Erik registra por mensaje. |
| 6.2 | Categorizar gastos | Clasificar por tipo | **n8n** | Nodos Set + reglas (palabras clave → categoría); sin LLM si es determinista. |
| 6.3 | Hacer presupuesto | Planear ingresos/gastos | **n8n** | Workflow de agregación sobre DB de gastos; salida a spreadsheet. |
| 6.4 | Comparar precios | Buscar la mejor oferta | **n8n** | Scraping multi-fuente + nodo Sort por precio; alerta si baja. |
| 6.10 | Calcular impuestos | Determinar obligaciones fiscales | **Python script (reglas)** | Reglas fiscales complejas mejor en código testeable; n8n lo invoca. |
| 6.11 | Generar estados financieros | Balance, P&L, flujo de caja | **n8n + Metabase** | n8n calcula y guarda; Metabase visualiza reportes vivos para Erik. |
| 6.12 | Calcular rentabilidad (TIR/VAN) | Evaluación de proyectos | **Python (numpy-financial)** | numpy-financial tiene TIR/VAN nativos; n8n pasa inputs. |
| 6.13 | Hacer facturas | Emitir comprobantes | **n8n** | Workflow: datos cliente → plantilla PDF → guardar + enviar. |
| 6.18 | Gestionar suscripciones | Alta/baja servicios recurrentes | **n8n** | API nodes + DB; recordatorio antes de renovación, kill switch. |
| 6.19 | Detectar gastos hormiga | Identificar micro-gastos | **n8n + Metabase** | Agregación SQL + dashboard; n8n alerta umbrales. |
| 7.1 | Anotar citas / eventos | Registrar en agenda | **n8n** | Nodos Google/Outlook Calendar nativos; inserción desde Telegram. |
| 7.2 | Recordar compromisos | No olvidar lo agendado | **n8n** | Schedule trigger + notify; consulta DB agenda cada mañana. |
| 7.3 | Programar recordatorios | Alertas a futuras horas | **n8n** | Schedule/Cron trigger es su especialidad; zona horaria incluida. |
| 7.4 | Priorizar tareas | Decidir qué antes | **n8n** | Sort + fórmula urgencia/importancia; un solo 'siguiente paso' (R7 TDAH). |
| 7.5 | Hacer listas de tareas | Todo list | **n8n + DB** | CRUD de tareas; n8n expone por Telegram botón. |
| 7.7 | Calendarizar / bloquear tiempo | Asignar slots | **n8n** | Calendar API + lógica de bloques; evita solapamientos. |
| 7.8 | Reprogramar | Mover citas/tareas | **n8n** | Update en Calendar API + notify a involucrados. |
| 7.10 | Seguir progreso de proyectos | Track de avance | **n8n + DB** | Workflow que actualiza % avance y lo reporta. |
| 7.11 | Detectar retrasos | Notar desviaciones del plan | **n8n** | Compare fecha actual vs planificada → alerta si delta>umbral. |
| 7.12 | Gestionar múltiples proyectos | Coordinar varios frentes | **n8n** | Multi-board sync; un workflow por proyecto + agregador. |
| 7.13 | Sincronizar calendarios | Google, Outlook, etc | **n8n** | Nodos Calendar múltiples; su especialidad de integración. |
| 7.14 | Gestionar zonas horarias | Coordinar entre países | **n8n** | Nodos con conversión tz nativa; cron aware. |
| 8.1 | Recordar medicación | No olvidar pastillas | **n8n** | Schedule trigger + notify Telegram; confirma toma. |
| 8.4 | Sugerir pausas | Toma 10 min | **n8n** | Cron cada X horas de foco → push pausa. |
| 8.5 | Recordar hidratación | Tomar agua | **n8n** | Cron horario → notify. |
| 8.11 | Recordar seguimientos médicos | Próximas revisiones | **n8n** | Schedule desde DB médica → notify. |
| 8.19 | Llevar diario emocional | Registro de sentimientos | **n8n + Postgres** | Form por Telegram → insert; n8n muestra histórico. |
| 8.20 | Recordar chequeos preventivos | Anuales, rutina | **n8n** | Cron anual/semestral desde DB de chequeos. |
| 9.1 | Mantener contacto | Saludar, escribir, llamar | **n8n** | Cron + msg API; sugerencia de a quién contactar hoy. |
| 9.2 | Recordar cumpleaños / fechas | No olvidar eventos de otros | **n8n** | Cron diario sobre DB contactos → notify. |
| 9.3 | Coordinar encuentros | Organizar reuniones | **n8n** | Encuesta/poll + Calendar; encuentra slot común. |
| 9.11 | Mantener relaciones a distancia | Llamadas, mensajes | **n8n** | Programación de msgs recurrentes para no perder contacto. |
| 9.13 | Gestión de contactos | CRM personal | **n8n + Postgres** | CRUD de contactos; n8n como backend + Telegram front. |
| 11.5 | Memorizar / estudiar | Repaso activo | **n8n + Anki-like (script)** | Cron de spaced repetition; n8n programa, motor SR calcula intervalos. |
| 11.14 | Seguir tendencias / novedades | Estar al día | **n8n** | Scraping periódico de fuentes → digest; su especialidad de agregación. |
| 12.1 | Cumplir leyes / normativas | Acatar marco legal | **n8n** | Checklist de compliance como workflow; valida antes de acciones. |
| 12.11 | Archivar documentos importantes | Guardar papeles | **n8n** | Storage node (S3/local) + index en DB; busca por metadata. |
| 12.13 | Comparar seguros / coberturas | Protección financiera | **n8n** | Scraping + compare tabla; alerta renovación. |
| 12.15 | Cumplir obligaciones contractuales | Honrar acuerdos | **n8n** | Schedule de hitos contractuales + reminders. |
| 13.2 | Hacer lista de compras | Qué comprar | **n8n + DB** | Genera desde inventario + menú semanal; output a Telegram. |
| 13.9 | Gestionar inventario hogar | Saber qué hay | **n8n + Postgres** | CRUD inventario; alerta stock bajo. |
| 14.3 | Proteger información digital | Seguridad informática | **Ansible + scripts (hardening)** | Hardening declarativo idempotente; n8n orquesta su ejecución. |
| 14.5 | Gestionar contraseñas | Credenciales seguras | **Bitwarden/Vault (self-hosted)** | Vault dedicado es seguro y compartible; n8n rota y valida. |
| 14.6 | Hacer backups | Respaldo de datos | **Borg/restic (script + cron)** | Borg/restic son óptimos para backup incremental; n8n programa el cron. |
| 14.7 | Cifrar / proteger comunicaciones | Privacidad | **WireGuard/Tailscale (infra)** | VPN mesh ya desplegada por Erik; n8n verifica estado. |
| 14.8 | Monitorear intrusiones | Detectar accesos no autorizados | **Wazuh/Falco (SIEM)** | SIEM dedicado detecta intrusiones; n8n consume alertas y notifica. |
| 14.11 | Detectar anomalías | Comportamiento inusual | **n8n + Metabase** | Métricas + umbral; n8n alerta, Metabase visualiza. |
| 14.12 | Auditar / revisar permisos | Control de accesos | **n8n** | Workflow de auditoría: lista permisos, compara con baseline, reporta drift. |
| 14.13 | Planear recuperación ante desastres | Continuidad | **n8n + Borg** | Workflow DR: test restore periódico + report; Borg restaura, n8n orquesta. |
| 15.9 | Adaptar horarios a estaciones | Ritmo circadiano estacional | **n8n** | Cron con config estacional (horario de verano/invierno). |
| 15.10 | Detectar recursos disponibles | Qué tengo a mano | **n8n + DB** | Escaneo de inventario de recursos open-pax; reporte. |
| 16.1 | Automonitoreo | Cómo voy | **n8n** | Healthcheck workflow periódico; reporta estado del sistema. |
| 16.4 | Gestionar energía / fatiga | No agotarse | **n8n** | Throttle de trabajos por carga; pausa si CPU/RAM alta. |
| 16.5 | Reiniciar / resetear | Empezar de cero | **n8n** | Nodo Execute Command orquesta reinicios controlados. |
| 16.6 | Detectar cuando algo falla | Diagnóstico | **n8n** | Error Trigger + alerta; su especialidad de monitoring. |
| 16.8 | Documentar lo hecho | Bitácora | **n8n** | Append a log DB en cada nodo; trazabilidad automática. |
| 16.9 | Versionar / dejar revertible | Poder deshacer | **git CLI (script)** | git es la herramienta; n8n hace commit tras cada cambio. |
| 16.10 | Supervisar procesos autónomos | Vigilar que todo va bien | **n8n** | Dashboard de workflows activos + cron de auditoría. |
| 16.11 | Detener / pausar algo que corre | Kill switch | **n8n** | Webhook botón (R6 supervisión humana); su especialidad. |
| 16.12 | Recuperarse de fallos | Resiliencia de sistema | **n8n** | Workflows de retry + fallback; Error Workflow nativo. |
| 16.14 | Detectar sobre-esfuerzo / desperdicio | Eficiencia | **n8n + Metabase** | Métricas de tiempo/recurso por workflow; dashboard. |
| 16.15 | Planear vs ejecutar | Separar diseño de acción | **n8n** | Workflow 'plan' genera, workflow 'exec' ejecuta; separación clara. |
| 17.2 | Distinguir útil/inútil | Juicio pragmático | **n8n** | Nodos de regla (scoring) sobre datos; sin LLM si es determinista. |
| 17.5 | Distinguir relevante/irrelevante | Juicio de prioridad | **n8n** | Reglas de relevancia + scoring; n8n filtra. |
| 17.7 | Distinguir urgente/no urgente | Juicio temporal | **n8n** | Scoring por fecha límite + reglas; output priorizado. |
| 17.8 | Distinguir confidencial/público | Juicio de privacidad | **n8n** | Reglas de clasificación sobre metadata; etiqueta automática. |

---

## Anexo — Cuándo NO usar n8n (las 6 excepciones)

| Capacidad | Mejor opción | Razón |
|---|---|---|
| 5.13 Ejecutar código y ver resultado | Docker sandbox (script) | Aislamiento y reproducibilidad; n8n solo orquesta el disparo, el código corre en contenedor. |
| 5.14 Usar git / versionado | git CLI (script) | git es la herramienta nativa; n8n no aporta valor sobre CLI. |
| 5.19 Configurar servidores / infra | Ansible/Terraform (IaC) | IaC declarativo idempotente; n8n no es herramienta de infra. |
| 6.10 Calcular impuestos | Python script (reglas) | Reglas fiscales complejas mejor en código testeable; n8n lo invoca. |
| 6.12 Calcular rentabilidad (TIR/VAN) | Python (numpy-financial) | numpy-financial tiene TIR/VAN nativos; n8n pasa inputs. |
| 14.3 Proteger información digital | Ansible + scripts (hardening) | Hardening declarativo idempotente; n8n orquesta su ejecución. |
| 14.5 Gestionar contraseñas | Bitwarden/Vault (self-hosted) | Vault dedicado es seguro y compartible; n8n rota y valida. |
| 14.6 Hacer backups | Borg/restic (script + cron) | Borg/restic son óptimos para backup incremental; n8n programa el cron. |
| 14.7 Cifrar / proteger comunicaciones | WireGuard/Tailscale (infra) | VPN mesh ya desplegada por Erik; n8n verifica estado. |
| 14.8 Monitorear intrusiones | Wazuh/Falco (SIEM) | SIEM dedicado detecta intrusiones; n8n consume alertas y notifica. |
| 16.9 Versionar / dejar revertible | git CLI (script) | git es la herramienta; n8n hace commit tras cada cambio. |

> Estas 6 son **invocadas desde n8n** (nodo Execute Command / HTTP), pero la lógica vive en la herramienta especializada. n8n sigue siendo el orquestador visual.

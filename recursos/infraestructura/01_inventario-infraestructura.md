# 🏗️ Inventario de Infraestructura — open-pax

> Fuente de verdad al **5-jul-2026**.
> Basado en: MEMORY.md de Claude Code + brains Gemini + bitácora Fábrica de Código.
> **⚠️ Cambios masivos respecto a jun-2026: OVH + Hetzner MUERTOS. 2 Oracle VMs VIVAS.**
> Última actualización: 2026-07-05

---

## 🖥️ Servidores — estado REAL

### Laptop — ASUS TUF Gaming F15 (plano de control)
| Campo | Valor |
|---|---|
| Marca/Modelo | ASUS TUF Gaming F15 |
| CPU | i5-11400H, 6 núcleos / 12 hilos |
| RAM | ~8 GB física, 7.7 GB usable (cuello de botella) |
| GPU | NVIDIA RTX 3050 Laptop, 4 GB VRAM + Intel UHD |
| Disco | ~477 GB: C: (Win 11) ~238 GB + Ubuntu ~238 GB |
| SO | Windows 11 Home + Ubuntu (dual-boot) |
| Software | Git, Node, Python 3.11, WSL, SSH, Tailscale, Obsidian, Ollama (≤4B), rclone |
| Tailscale | `nachitolap` (IP pendiente), `erikj@100.120.229.112` (SSH por Tailscale) |
| Google Drive | Montado Z: (rclone+WinFsp), `Montar-GoogleDrive.bat` |
| 🔴 Limitación | Solo 7.7 GB RAM → máximo 2 obreros IA simultáneos; se apaga de noche |
| **Corriendo AHORA** | Constelación (WhatsApp + Telegram bidireccional), Ollama ≤4B, Fabrica de Codigo local |

### Oracle VM1 — São Paulo "Mostrador" 🟢
| Campo | Valor |
|---|---|
| Cuenta | Esposa (Esmeralda), tenancy `aburtoesmeralda580` |
| Nombre | `paxel-central` (hostname) |
| Tipo | VM.Standard.A1.Flex 4 OCPU / 24 GB / boot 50 GB, Always Free ($0) |
| IP pública | `129.148.16.240` (cambió al recrear la VM con 24.04) |
| SO | **Ubuntu 24.04.4 LTS** aarch64 |
| SSH | `ssh nube1` (atajo) o `ssh -i ~/.ssh/oci_paxel ubuntu@100.108.105.27` |
| Tailscale | IP `100.108.105.27`, nombre `central` |
| Estado | 🟢 VIVA, Ubuntu 24.04, endurecida (swap+Docker+fail2ban+ufw), Fase 0 completa, Tailscale OK |
| Rol planeado | **"Mostrador"**: Constelación (bot WhatsApp/Telegram 24/7) + BD PAXELMEM (Oracle 23ai) + URL fija vía Cloudflare tunnel |
| BD asociada | Oracle Autonomous 23ai `PAXELMEM` (misma cuenta, São Paulo) |
| ⚠️ | Cuenta AJENA (esposa) → ESTRICTO 4/24 + boot 50GB, NUNCA recursos de pago |

### Oracle VM2 — Frankfurt "Workspace" 🟢
| Campo | Valor |
|---|---|
| Cuenta | Amigo (Johann), tenancy `johannortizroman90` |
| Nombre | `workspace` (hostname) |
| Tipo | VM.Standard.A1.Flex 4 OCPU / 24 GB / boot 50 GB, Always Free ($0) |
| IP pública | `130.61.140.83` (cambió al recrear la VM con 24.04) |
| SO | **Ubuntu 24.04.4 LTS** aarch64 |
| SSH | `ssh nube2` (atajo) o `ssh -i ~/.oci/amigo_vm_ssh ubuntu@100.70.241.65` |
| Tailscale | IP `100.70.241.65`, nombre `workspace` |
| Estado | 🟢 VIVA, Ubuntu 24.04, endurecida (swap+Docker+fail2ban+ufw), Fase 0 completa, Tailscale OK |
| Rol planeado | **"Workspace"**: Fábrica de Código (más obreros en paralelo, 24 GB) + Curador 24/7 + Open Notebook + trabajos pesados caídos del OVH |
| ⚠️ | Cuenta AJENA (amigo, trial ~30 días → confirmar que sigue Always Free al terminar trial). ESTRICTO 4/24 + boot 50GB. |

### 🔴 SERVIDORES MUERTOS

| Servidor | IP | Murió | Qué perdió | Respaldo |
|---|---|---|---|---|
| **OVH** | `100.89.131.4` | jun-2026 | Curador 24/7, Fábrica Proyectos, Open Notebook, Ollama grande (14b/27b) | Solo el código local; los modelos grandes se perdieron |
| **Hetzner CPX62** | `178.105.28.215` | 2-jul-2026 | LiteLLM, Qdrant, SearXNG, n8n, Langfuse, OpenHands, OpenCode | Snapshot `403418503` (8.85 GB) + IaC en repo `taller` + código de Constelación en `paxel80/taller` |

---

## 📱 Dispositivos personales

### Celular — Xiaomi 14T Pro (nodo activo)
| Campo | Valor |
|---|---|
| Marca/Modelo | Xiaomi 14T Pro (2407FPN8EG) |
| SO | Android 16 (HyperOS) |
| CPU | 8 cores ARM (aarch64) |
| RAM | 10 GB total, ~3.6 GB libre (HyperOS come el resto) |
| Almacenamiento | ~116 GB libres |
| Tailscale | IP `100.85.146.98`, nombre `xiaomi-14t-pro` |
| SSH | `ssh -i ~/.ssh/termux_phone -p 8022 u0_a545@100.85.146.98` |
| Termux | Python 3.14.6, sshd puerto 8022, wake-lock activo |
| Rol | Nodo ligero: worker liviano, cron, bot chico, panel de control |
| ⚠️ | HyperOS mata apps en background → Termux+Tailscale en "Sin restricciones" + candado Recientes |

---

## 🌐 Dominios y DNS

### lainconclusa.com — dominio principal
| Campo | Valor |
|---|---|
| Registro/DNS | Cloudflare |
| Sitio principal | `lainconclusa.com` → GitHub Pages (repo `paxel80/lainconclusa-web`) |
| Correo | `paxel80@lainconclusa.com` vía Zoho (gratis) |
| Túnel WhatsApp | `wa.lainconclusa.com` → Cloudflare Tunnel |
| Subdominios | `plano.lainconclusa.com` y `portafolio.lainconclusa.com` → caídos desde migración |
| Certificados | Cloudflare proxied SSL "Full" |

### el80.space — dominio Hermes (histórico)
| Campo | Valor |
|---|---|
| Estado | 🔴 El servidor OVH que lo servía fue dado de baja (jun-2026) |
| Runbook | Existe: `OneDrive\Documents\Hermes-brain\RECONSTRUCCION.md` |

---

## 🔐 Tailscale — malla privada (4 nodos vivos)

| Nodo | IP Tailscale | Nombre | Estado | Acceso |
|---|---|---|---|---|
| Laptop | `100.120.229.112` | `nachitolap` | 🟢 | `ssh erikj@100.120.229.112` |
| Oracle São Paulo | `100.108.105.27` | `central` | 🟢 | `ssh nube1` (atajo) |
| Oracle Frankfurt | `100.70.241.65` | `workspace` | 🟢 | `ssh nube2` (atajo) |
| Xiaomi 14T Pro | `100.85.146.98` | `xiaomi-14t-pro` | 🟢 | `ssh 14tpro` (atajo, puerto 8022) |

---

## 🔑 APIs y servicios cloud

### APIs de LLM activas
| Proveedor | Modelos clave | Costo | Estado |
|---|---|---|---|
| Groq | Llama 3, gratis+rápido | $0 | 🟢 |
| NVIDIA NIM | `qwen/qwen3-next-80b-a3b-instruct`, ~121 modelos | $0 | 🟢 |
| OpenRouter | 100+ modelos, 1 llave | variable | 🟢 (⚠️ regenerar llave expuesta) |
| DeepSeek API | V4 Pro/Flash, código barato | centavos | 🟢 |
| Google Gemini | Free tier | $0 | 🟢 |
| Cerebras, Mistral, Cohere, HF, Scaleway | — | $0 | 🟢 configurado |
| Anthropic API | Opus/Sonnet | $$ | ⚠️ sin key (solo suscripción) |

### Modelos locales (Ollama en laptop)
| Modelo | Tamaño | Disponible |
|---|---|---|
| `huihui_ai/qwen3-abliterated:4b-instruct-2507-q4_K_M` | ~4B Q4 | 🟢 laptop (RTX 3050) |
| 14b / 27b (sin censura) | — | 🔴 Perdidos con OVH (pendiente volver a descargar en Oracle Frankfurt) |

### Otros servicios cloud
| Servicio | Uso | Costo |
|---|---|---|
| Cloudflare | DNS, CDN, túnel, correo routing | $0 |
| GitHub Pages | lainconclusa.com | $0 |
| Supabase | DB + auth (`mttohgmueztahyxuubkp`) | $0 |
| Cloudflare R2 | Backups + archivos | $0 (10 GB) |
| Langfuse | 🔴 caído con Hetzner | — |
| LangSmith | observabilidad opcional | $0 (dev) |
| Northflank | nube gratis lista, token conectado | $0 (⚠️ pide tarjeta para activar) |
| Pipedream, Kaggle, B2, Cloudinary, PostHog | verificados OK | $0 |
| Ngrok | túneles | $0 (free) |

---

## 📊 Estado consolidado (semáforo)

| Recurso | Estado |
|---|---|
| Laptop ASUS TUF | 🟢 viva, RAM al límite, 2 obreros máx |
| Oracle São Paulo 24 GB | 🟢 viva, endurecida, Tailscale OK |
| Oracle Frankfurt 24 GB | 🟢 viva, endurecida, Tailscale OK |
| Celular Xiaomi 14T Pro | 🟢 4º nodo, Termux ligero |
| Hetzner | 🔴 MUERTO (2-jul) — snapshot existe |
| OVH / Ollama grande | 🔴 MUERTO (jun) — modelos 14b/27b caídos |
| lainconclusa.com | 🟢 vivo (GitHub Pages) |
| Constelación | 🟢 viva en laptop (WhatsApp+TG, Quick Tunnel) |
| Fábrica de Código | 🟢 local, 5 obreros, probada 4-jul |
| LiteLLM / n8n / Qdrant | 🔴 caídos con Hetzner |
| Mem0 / LangGraph | 🔴 sin desplegar todavía |

---

## 🗺️ Topología real (5-jul-2026)

```
                         INTERNET
                            │
            ┌───────────────┼───────────────┐
            ▼               ▼               ▼
      Cloudflare        GitHub Pages    Oracle APIs
      DNS + Tunnel      lainconclusa    (APIs gratuitas)
            │
            │ Tailscale (4 nodos)
            │
   ┌────────┼────────┬──────────────┐
   ▼        ▼        ▼              ▼
Laptop   SP 24GB   FRA 24GB    Xiaomi 14T
ASUS     central   workspace   3.6 GB libre
7.7 GB   4 CPU     4 CPU       Android 16
RTX 3050 ARM       ARM         Termux
(apaga   Ubuntu    Ubuntu      Python 3.14
 de noche) 24.04    24.04       nodo ligero

   🔴 CAÍDOS:
   OVH 100.89.131.4 (jun-2026)
   Hetzner 178.105.28.215 (2-jul-2026)
```

---

## ⚡ Cambios respecto al inventario anterior

| Qué cambió | Antes (erróneo) | Ahora (real) |
|---|---|---|
| Hetzner | "vivo, 90% libre" | 🔴 MUERTO 2-jul |
| OVH / 2.º equipo | "vivo, Ollama 14b+27b" | 🔴 MUERTO jun-2026 |
| Oracle VMs | "por confirmar" | 🟢 2 VIVAS, Ubuntu **24.04 LTS**, endurecidas, Tailscale OK |
| Oracle VMs (recreadas 5-jul) | Ubuntu 22.04, IPs viejas | **Ubuntu 24.04.4 LTS** vía truco A2→A1, IPs nuevas (SP `129.148.16.240` / FRA `130.61.140.83`), renombradas (`central` / `workspace`) |
| Atajos SSH | comandos largos con IP pública | `ssh nube1` (SP), `ssh nube2` (FRA), `ssh 14tpro` (cel) — todos por Tailscale |
| Frankfurt hostname | `paxel-taller-fra` | `workspace` (renombrado por Erik) |
| Modelos grandes | "en 2.º equipo" | 🔴 caídos con OVH, toca re-descargar en Oracle |
| LiteLLM/Qdrant/n8n | "funcionando en Hetzner" | 🔴 caídos |
| Constelación | "por rehospedar" | 🟢 VIVA en laptop (WhatsApp+TG) |
| Celular | "Android" | Xiaomi 14T Pro, Termux, 4º nodo Tailscale |

**Fuente definitiva para este inventario:** MEMORY.md Claude Code (5-jul), `project-migracion-oracle-2-nubes.md`, `reference-nodo-celular-termux.md`, `project-oracle-cerebro-agentes.md`, `project-oracle-vm-amigo-frankfurt.md`, `project-constelacion.md`.
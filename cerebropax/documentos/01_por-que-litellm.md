# cerebropax — Por qué LiteLLM

> Documento V3 (el "por qué / qué es"). Parte de `documentos/`.

## En 30 segundos

Necesitamos un "conmutador" que reciba pedidos de modelos y los reparta entre
todos los proveedores que tenemos (Groq, NVIDIA, DeepSeek, etc.). Sin ese
conmutador, cada programa de open-pax tendría que saber hablar con cada
proveedor, con su llave, su formato y su nombre de modelo. **LiteLLM** hace
exactamente eso: una sola puerta OpenAI-compatible, detrás la magia.

## Qué es

**LiteLLM** es un proxy (gateway) de código abierto que:

1. **Habla el formato OpenAI** (`/v1/chat/completions`, `/v1/embeddings`).
   Cualquier programa que sepa hablar con OpenAI, sabe hablar con LiteLLM.
2. **Traduce** ese formato a +100 proveedores distintos (Groq, Anthropic,
   Cohere, Ollama, etc.).
3. **Esconde las llaves**: los consumidores usan UNA llave maestra; LiteLLM
   guarda las llaves reales de cada proveedor.
4. **Hace failover**: si un proveedor cae, usa el siguiente automáticamente.
5. **Tiene panel UI** para ver qué modelos hay, cuánto se gasta y probarlos.

## Por qué esta elección (tabla de alternativas)

| Opción | Pros | Contras | Veredicto |
|---|---|---|---|
| **LiteLLM** ✅ | OpenAI-compatible, 100+ proveedores, failover, panel UI, gratis, self-host | Hay que mantenerlo corriendo | **Elegido** |
| OpenRouter (solo API) | 0 mantenimiento, 100+ modelos, 1 llave | Paga por encima del free tier, sin failown propio, sin panel de gasto granular | Como proveedor dentro de LiteLLM |
| Portkey | Parecido a LiteLLM, panel bonito | Más orientado a SaaS pago | Descartado |
| Helicone | Buen observability | Más observability que gateway | Descartado |
| Directo a cada API | 0 dependencias | Cada consumidor maneja N llaves y N formatos → caos | Descartado |
| N8n como router | Ya lo conocía Erik | No es su función, lento para latencia de chat | Descartado |

**Decisión:** LiteLLM self-hosted en Oracle Frankfurt. OpenRouter queda como un
proveedor más dentro de LiteLLM (para modelos que no tengamos directo).

## Cómo funciona

```
1. Consumidor (Letta) → POST http://workspace:4000/v1/chat/completions
   Body: {"model":"groq/llama-3.3-70b", "messages":[...]}
   Header: Authorization: Bearer <LLAVE_MAESTRA>

2. LiteLLM mira config.yaml:
   - ¿"groq/llama-3.3-70b"? → usa la llave GROQ_API_KEY
   - Reenvía a https://api.groq.com con esa llave

3. Groq responde → LiteLLM se lo pasa al consumidor tal cual.

4. Si Groq da error 5xx o timeout:
   - LiteLLM mira "fallbacks" en config.yaml
   - Intenta nvidia/qwen3-next-80b, luego cerebras/llama-3.1-70b
   - El consumidor no se entera del cambio.
```

## Conexiones

- **Letta (SP):** cambiará su `llm_config` para apuntar a `workspace:4000` en
  vez de `ollama:11434`. Mismo formato OpenAI → cambio mínimo.
- **La Fábrica (laptop):** usará LiteLLM para sus obreros de código (DeepSeek,
  Mistral Codestral).
- **Mem0 (futuro Fase 3):** usará los embeddings unificados de aquí.
- **LangGraph (Fase 2):** orquestador que también consumirá modelos de aquí.

## Qué puede salir mal

| Fallo | Síntoma | Solución |
|---|---|---|
| Clave expirada | Ese proveedor da 401 | Regenerar clave en el portal, actualizar `.env` |
| Modelo renombrado | 404 model not found | Actualizar `config.yaml` con el nombre nuevo |
| Rate limit gratis | 429 too many requests | Failover al siguiente proveedor (automático) |
| LiteLLM cae | Nada responde | `restart: unless-stopped` lo levanta solo |
| Frankfurt cae | Igual que arriba | Watchdog + alerta por Telegram (Fase 5) |

## FAQ

**¿Por qué no usar OpenRouter para todo y quitarme LiteLLM?**
Porque OpenRouter cobra margen sobre los modelos de pago y no te deja meter tus
propias llaves directas de Groq/NVIDIA (que son 100% gratis). Con LiteLLM
usamos cada API directo, gratis, y OpenRouter solo como respaldo.

**¿Es seguro tener todas las llaves en un sitio?**
El `.env` vive en Frankfurt con `chmod 600` (solo el usuario ubuntu lo lee),
nunca se sube a git, y el puerto 4000 solo es alcanzable por Tailscale (red
privada). Es más seguro que tener las llaves desparramadas en 4 archivos de la
laptop (como están hoy).

**¿Cuánto consume LiteLLM?**
~200 MB RAM en Frankfurt. Nada comparado con los 22 GB libres que hay.
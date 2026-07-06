import httpx
import sys

LETTA_BASE_URL = "http://localhost:8283"
client = httpx.Client(base_url=LETTA_BASE_URL)

print("Checking providers...")
providers = client.get("/v1/providers/").json()
ollama_provider = next((p for p in providers if p.get("name") == "ollama"), None)

if not ollama_provider:
    print("Creating ollama provider...")
    payload = {
        "name": "ollama",
        "provider_type": "ollama",
        "api_key": "dummy",
        "base_url": "http://ollama:11434"
    }
    resp = client.post("/v1/providers/", json=payload)
    if resp.status_code not in [200, 201]:
        print("Failed to create provider:", resp.text)
        sys.exit(1)
    ollama_provider = resp.json()
    print("Created provider:", ollama_provider)
else:
    print("Provider exists:", ollama_provider["id"])

provider_id = ollama_provider["id"]

print("Checking models...")
models = client.get("/v1/models/").json()
ollama_model = next((m for m in models if m.get("handle") == "ollama/llama3:8b"), None)

if not ollama_model:
    print("Creating model...")
    payload = {
        "name": "llama3:8b",
        "provider_id": provider_id,
        "model_type": "llm",
        "handle": "ollama/llama3:8b",
        "context_window": 8192
    }
    resp = client.post("/v1/models/", json=payload)
    if resp.status_code not in [200, 201]:
        print("Failed to create model:", resp.text)
        sys.exit(1)
    print("Created model:", resp.json())
else:
    print("Model exists:", ollama_model["id"])

print("Done.")

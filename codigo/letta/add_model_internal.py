import sys
import json
from letta.server.server import SyncServer
from letta.schemas.models import LLMConfig
from letta.schemas.providers import Provider

try:
    server = SyncServer()
    print("SyncServer initialized")

    # Get providers
    providers = server.provider_manager.get_all_providers()
    ollama_provider = next((p for p in providers if p.name == "ollama"), None)
    if not ollama_provider:
        print("Ollama provider not found, adding it...")
        # create provider?
        pass # Wait, if it exists we skip. It exists now because we created it.

    print("Checking models...")
    models = server.model_manager.get_all_models()
    model = next((m for m in models if m.handle == "ollama/llama3:8b"), None)
    if not model:
        print("Adding model...")
        # Just create the model
        from letta.schemas.models import LLMModelCreate
        model_create = LLMModelCreate(
            name="llama3:8b",
            provider_id=ollama_provider.id,
            model_type="llm",
            handle="ollama/llama3:8b",
            context_window=8192
        )
        server.model_manager.create_model(model_create)
        print("Model created.")
    else:
        print("Model already exists.")

except Exception as e:
    import traceback
    traceback.print_exc()
    sys.exit(1)

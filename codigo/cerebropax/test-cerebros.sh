#!/usr/bin/env bash
# =============================================================================
# cerebropax — Script de pruebas: verifica que cada cerebro responde
# =============================================================================
# Uso:  bash test-cerebros.sh
#       (debe haber un .env con LITELLM_MASTER_KEY, o pasa la llave como arg)
# =============================================================================
set -euo pipefail

APP_DIR="/opt/cerebropax"
BASE_URL="http://localhost:4000"

# Cargar llave maestra
if [ -n "${1:-}" ]; then
    MASTER_KEY="$1"
elif [ -f "$APP_DIR/.env" ]; then
    MASTER_KEY="$(grep LITELLM_MASTER_KEY "$APP_DIR/.env" | cut -d= -f2-)"
else
    echo "❌ No se encontró .env ni llave como argumento."
    exit 1
fi

PASS=0
FAIL=0
TOTAL=0

test_model() {
    local model="$1"
    local label="${2:-$1}"
    TOTAL=$((TOTAL+1))
    echo -n "  [$TOTAL] $label ... "
    resp=$(curl -sS -m 30 -w "\n%{http_code}" \
        -X POST "$BASE_URL/v1/chat/completions" \
        -H "Authorization: Bearer $MASTER_KEY" \
        -H "Content-Type: application/json" \
        -d "{\"model\":\"$model\",\"messages\":[{\"role\":\"user\",\"content\":\"Di solo: OK\"}],\"max_tokens\":10}" \
        2>&1) || true
    code=$(echo "$resp" | tail -1)
    if [ "$code" = "200" ]; then
        echo "✅ ($code)"
        PASS=$((PASS+1))
    else
        echo "❌ ($code)"
        echo "       $(echo "$resp" | head -2 | tail -1 | cut -c1-120)"
        FAIL=$((FAIL+1))
    fi
}

echo "╔══════════════════════════════════════════════╗"
echo "║   🧠 cerebropax — Probando todos los cerebros ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

echo "⚡ Groq (gratis, rápido)"
test_model "groq/llama-3.1-8b-instant" "llama-3.1-8b-instant"
test_model "groq/llama-3.3-70b" "llama-3.3-70b"
test_model "groq/mixtral-8x7b" "mixtral-8x7b"

echo ""
echo "🧠 NVIDIA NIM (120 modelos gratis)"
test_model "nvidia/qwen3-next-80b" "qwen3-next-80b"

echo ""
echo "💻 DeepSeek (centavos, código)"
test_model "deepseek/chat" "deepseek-chat"
test_model "deepseek/reasoner" "deepseek-reasoner"

echo ""
echo "👁️ Gemini (gratis, multimodal)"
test_model "gemini/2.0-flash" "gemini-2.0-flash"

echo ""
echo "⚡ Cerebras (gratis, rápido)"
test_model "cerebras/llama-3.1-8b" "llama-3.1-8b"

echo ""
echo "📦 Mistral (free tier)"
test_model "mistral/codestral" "codestral"

echo ""
echo "📚 Cohere (RAG)"
test_model "cohere/command-r-plus" "command-r-plus"

echo ""
echo "🧪 HuggingFace"
test_model "hf/mistral-7b" "mistral-7b (HF)"

echo ""
echo "🎛️ OpenRouter (100+ modelos)"
test_model "openrouter/auto" "auto-router"

echo ""
echo "🏠 Ollama local (respaldo)"
test_model "ollama/llama3.1-8b" "llama3.1:8b (SP local)"

echo ""
echo "═════════════════════════════════════════════"
echo "Resultado: ✅ $PASS pasaron  ❌ $FAIL fallaron  /  $TOTAL total"
echo "═════════════════════════════════════════════"

if [ "$FAIL" -gt 0 ]; then
    echo ""
    echo "⚠️  Los cerebros que fallaron pueden tener:"
    echo "   - Clave expirada (regenerar en el portal del proveedor)"
    echo "   - Modelo renombrado (verificar nombre actual)"
    echo "   - Rate limit agotado (esperar y reintentar)"
    exit 1
fi
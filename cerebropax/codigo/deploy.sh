#!/usr/bin/env bash
# =============================================================================
# cerebropax — Deploy Script para Oracle Frankfurt (workspace)
# =============================================================================
# Ejecutar como: bash deploy.sh
# Prerequisitos: Ubuntu 24.04, Docker + Compose, .env con claves reales
#
# Mejorado 5-jul-2026:
#   - Verificación de .env (no placeholders vacíos)
#   - Configuración ufw (puerto 4000 solo Tailscale + localhost)
#   - Verificación posterior: respuesta del /v1/models
#   - Mensajes más claros con semáforos
# =============================================================================
set -euo pipefail

APP_DIR="/opt/cerebropax"
TAILSCALE_INTERFACE="tailscale0"

echo "╔══════════════════════════════════════════════╗"
echo "║   🧠 cerebropax — Desplegando en Frankfurt    ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

# -----------------------------------------------
# 1. Verificar Docker
# -----------------------------------------------
echo "1️⃣  Verificando Docker..."
if ! command -v docker &> /dev/null; then
    echo "   ❌ Docker no encontrado. Instala con: curl -fsSL https://get.docker.com | sh"
    exit 1
fi
echo "   ✅ Docker: $(docker --version)"

if ! docker compose version &> /dev/null; then
    echo "   ❌ Docker Compose no encontrado."
    exit 1
fi
echo "   ✅ Compose: $(docker compose version --short)"

# -----------------------------------------------
# 2. Preparar directorio
# -----------------------------------------------
echo ""
echo "2️⃣  Preparando $APP_DIR..."
sudo mkdir -p "$APP_DIR"
sudo chown "$USER:$USER" "$APP_DIR"

# -----------------------------------------------
# 3. Copiar archivos y validar .env
# -----------------------------------------------
echo ""
echo "3️⃣  Preparando archivos..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$SCRIPT_DIR" != "$APP_DIR" ]; then
    cp "$SCRIPT_DIR/docker-compose.yml" "$APP_DIR/"
    cp "$SCRIPT_DIR/config.yaml" "$APP_DIR/"
    cp "$SCRIPT_DIR/test-cerebros.sh" "$APP_DIR/"

    if [ ! -f "$SCRIPT_DIR/.env" ]; then
        echo "   ❌ No se encontró .env."
        echo "      Copia .env.example a .env y rellena con las claves reales."
        echo "      Fuente de las claves: recursospax/bitacora/01_apis-llm.md"
        exit 1
    fi
    cp "$SCRIPT_DIR/.env" "$APP_DIR/.env"
fi

chmod 600 "$APP_DIR/.env"
echo "   ✅ Archivos listos en $APP_DIR"

# Validar que .env no tenga placeholders sin llenar
echo ""
echo "   🔍 Validando .env..."
PLACEHOLDERS=$(grep -E "CAMBIA-ESTO|=_$|=$" "$APP_DIR/.env" || true)
if [ -n "$PLACEHOLDERS" ]; then
    echo "   ⚠️  Se detectaron variables vacías o con placeholder:"
    echo "$PLACEHOLDERS" | sed 's/^/      /'
    echo "      (continuamos de todos modos, pero esos proveedores fallarán)"
fi

if ! grep -q "^LITELLM_MASTER_KEY=sk-cerebropax-" "$APP_DIR/.env"; then
    echo "   ⚠️  LITELLM_MASTER_KEY no parece una llave real (debería empezar con sk-cerebropax-)"
fi

# -----------------------------------------------
# 4. Firewall ufw — puerto 4000 solo Tailscale + localhost
# -----------------------------------------------
echo ""
echo "4️⃣  Configurando firewall (ufw)..."
if command -v ufw &> /dev/null; then
    sudo ufw allow from 100.64.0.0/10 to any port 4000 proto tcp comment "Tailscale -> cerebropax"
    sudo ufw deny 4000 comment "Bloquear acceso público a cerebropax"
    echo "   ✅ ufw: puerto 4000 solo accesible por Tailscale"
else
    echo "   ⚠️  ufw no instalado. Instala con: sudo apt install ufw"
    echo "      Mientras tanto, никтоTOQUE el puerto 4000 manualmente."
fi

# -----------------------------------------------
# 5. Levantar stack
# -----------------------------------------------
echo ""
echo "5️⃣  Levantando Docker Compose..."
cd "$APP_DIR"
docker compose pull
docker compose up -d

echo "   ⏳ Esperando a que LiteLLM arranque..."
sleep 5

MAX_RETRIES=12
LITELLM_UP=false
for i in $(seq 1 $MAX_RETRIES); do
    if curl -sf http://localhost:4000/health/liveliness > /dev/null 2>&1; then
        echo "   ✅ LiteLLM está vivo!"
        LITELLM_UP=true
        break
    fi
    if [ "$i" -eq $MAX_RETRIES ]; then
        echo "   ❌ LiteLLM no respondió."
        echo "   Logs: docker compose logs litellm"
        exit 1
    fi
    echo "   ⏳ Reintento $i/$MAX_RETRIES..."
    sleep 5
done

# -----------------------------------------------
# 6. Estado final
# -----------------------------------------------
echo ""
echo "6️⃣  Estado final:"
docker compose ps

# -----------------------------------------------
# 7. Verificación del endpoint /v1/models
# -----------------------------------------------
echo ""
echo "7️⃣  Verificando /v1/models..."
MASTER_KEY=$(grep "^LITELLM_MASTER_KEY=" "$APP_DIR/.env" | cut -d= -f2-)
if [ -n "$MASTER_KEY" ]; then
    MODELS_RESP=$(curl -sS -m 10 -H "Authorization: Bearer $MASTER_KEY" http://localhost:4000/v1/models 2>&1 || true)
    MODEL_COUNT=$(echo "$MODELS_RESP" | python3 -c "import sys, json; try: print(len(json.load(sys.stdin)['data'])); except: print(0)" 2>/dev/null || echo "0")
    if [ "$MODEL_COUNT" -gt 0 ]; then
        echo "   ✅ $MODEL_COUNT modelos disponibles en LiteLLM"
    else
        echo "   🟡 /v1/models respondió pero no se pudo contar modelos"
        echo "      Respuesta: $(echo "$MODELS_RESP" | head -c 200)"
    fi
else
    echo "   ⚠️  Sin MASTER_KEY no se puede verificar /v1/models"
fi

# -----------------------------------------------
# 8. Print final — info de uso
# -----------------------------------------------
echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║   ✅ cerebropax desplegado exitosamente!      ║"
echo "╚══════════════════════════════════════════════╝"
echo ""
echo "🌐 Panel UI:     http://workspace:4000/ui  (solo Tailscale)"
echo "🔍 Health:       curl http://workspace:4000/health/liveliness"
echo "📋 Modelos:      curl -H 'Authorization: Bearer $LITELLM_MASTER_KEY' http://workspace:4000/v1/models"
echo "🧪 Probar todos: bash /opt/cerebropax/test-cerebros.sh"
echo "🔄 Reiniciar:    cd $APP_DIR && docker compose restart"
echo "🛑 Detener:      cd $APP_DIR && docker compose down"
echo "📜 Logs:         cd $APP_DIR && docker compose logs -f litellm"
echo ""
echo "Bitácora en:    recursospax/bitacora/01_apis-llm.md (estado por proveedor)"

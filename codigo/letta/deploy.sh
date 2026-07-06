#!/usr/bin/env bash
# =============================================================================
# open-pax — Deploy Script para Oracle São Paulo
# =============================================================================
# Ejecutar como: bash deploy.sh
# Prerequisitos: Ubuntu 24.04, acceso root/sudo, .env con secretos reales
# =============================================================================

set -euo pipefail

APP_DIR="/opt/open-pax"
COMPOSE_FILE="$APP_DIR/docker-compose.yml"

echo "╔══════════════════════════════════════════════╗"
echo "║    🧠 open-pax — Desplegando en Oracle SP    ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

# -----------------------------------------------
# 1. Verificar Docker
# -----------------------------------------------
echo "1️⃣  Verificando Docker..."
if ! command -v docker &> /dev/null; then
    echo "   Docker no encontrado. Instalando..."
    curl -fsSL https://get.docker.com | sh
    sudo usermod -aG docker "$USER"
    echo "   ✅ Docker instalado. Es posible que necesites cerrar sesión y volver a entrar."
else
    echo "   ✅ Docker encontrado: $(docker --version)"
fi

# Verificar Docker Compose (plugin)
if ! docker compose version &> /dev/null; then
    echo "   ❌ Docker Compose plugin no encontrado."
    echo "   Instala con: sudo apt install docker-compose-plugin"
    exit 1
else
    echo "   ✅ Docker Compose: $(docker compose version --short)"
fi

# -----------------------------------------------
# 2. Crear directorio de aplicación
# -----------------------------------------------
echo ""
echo "2️⃣  Preparando directorio $APP_DIR..."
sudo mkdir -p "$APP_DIR"
sudo chown "$USER:$USER" "$APP_DIR"

# -----------------------------------------------
# 3. Copiar archivos (si es necesario)
# -----------------------------------------------
echo ""
echo "3️⃣  Preparando archivos..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$SCRIPT_DIR" != "$APP_DIR" ]; then
    echo "   Copiando de $SCRIPT_DIR a $APP_DIR..."
    cp "$SCRIPT_DIR/docker-compose.yml" "$APP_DIR/"
    cp "$SCRIPT_DIR/Dockerfile.telegram" "$APP_DIR/"
    cp "$SCRIPT_DIR/telegram-bridge.py" "$APP_DIR/"
    cp "$SCRIPT_DIR/requirements.txt" "$APP_DIR/"
    cp "$SCRIPT_DIR/setup-agent.py" "$APP_DIR/"
    
    if [ ! -f "$SCRIPT_DIR/.env" ]; then
        echo "   ⚠️  No se encontró .env"
        exit 1
    fi
    cp "$SCRIPT_DIR/.env" "$APP_DIR/.env"
else
    echo "   Los archivos ya están en $APP_DIR"
fi

chmod 600 "$APP_DIR/.env"
echo "   ✅ Archivos listos en $APP_DIR"

# -----------------------------------------------
# 4. Levantar stack
# -----------------------------------------------
echo ""
echo "4️⃣  Levantando Docker Compose..."
cd "$APP_DIR"
docker compose pull
docker compose up -d --build

echo "   ⏳ Esperando a que Letta esté listo (puede tomar 30-60s)..."
sleep 10

# Esperar hasta que Letta responda
MAX_RETRIES=12
for i in $(seq 1 $MAX_RETRIES); do
    if curl -sf http://localhost:8283/v1/health > /dev/null 2>&1; then
        echo "   ✅ Letta está vivo!"
        break
    fi
    if [ "$i" -eq "$MAX_RETRIES" ]; then
        echo "   ❌ Letta no respondió después de $((MAX_RETRIES * 10))s."
        echo "   Revisa los logs: docker compose logs letta"
        exit 1
    fi
    echo "   ⏳ Reintento $i/$MAX_RETRIES..."
    sleep 10
done

# -----------------------------------------------
# 5. Crear agente
# -----------------------------------------------
echo ""
echo "5️⃣  Configurando agente open-pax..."

# Instalar dependencias Python para setup
if ! command -v pip3 &> /dev/null; then
    sudo apt update && sudo apt install -y python3-pip python3-venv
fi

# Crear venv temporal para setup
python3 -m venv "$APP_DIR/.venv-setup"
source "$APP_DIR/.venv-setup/bin/activate"
pip install --quiet httpx
LETTA_BASE_URL=http://localhost:8283 python3 "$APP_DIR/setup-agent.py"
deactivate

# -----------------------------------------------
# 6. Verificar estado
# -----------------------------------------------
echo ""
echo "6️⃣  Verificando estado final..."
echo "   Docker containers:"
docker compose ps
echo ""
echo "   Letta health:"
curl -s http://localhost:8283/v1/health | python3 -m json.tool 2>/dev/null || echo "(sin formato)"

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║    ✅ open-pax desplegado exitosamente!       ║"
echo "╚══════════════════════════════════════════════╝"
echo ""
echo "📱 Abre Telegram y envía un mensaje a @LaInconclusa80_bot"
echo "🔍 Logs: cd $APP_DIR && docker compose logs -f"
echo "🔄 Reiniciar: cd $APP_DIR && docker compose restart"
echo "🛑 Detener: cd $APP_DIR && docker compose down"

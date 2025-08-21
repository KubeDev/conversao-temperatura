#!/bin/bash

# Parar o script imediatamente se qualquer comando falhar
set -e

# ----- Configurações -----
APP_NAME="conversao-temperatura"
# Diretório base onde a pasta da aplicação será criada no WSL
# (dentro da home do usuário que rodar o script)
INSTALL_BASE_DIR="$HOME/meus_projetos_nodejs_direto_wsl"
# Diretório final da aplicação
APP_INSTALL_DIR="$INSTALL_BASE_DIR/$APP_NAME"

REPO_URL="https://github.com/diegoasf/conversao-temperatura.git"
NODE_SETUP_VERSION="20.x" # Versão do Node.js a ser configurada (ex: "20.x", "18.x")

echo ">>> [SCRIPT WSL] Iniciando setup e execução para: $APP_NAME (direto no WSL) <<<"
echo ">>> Local de instalação será: $APP_INSTALL_DIR"

# 1. Criar diretório de instalação no WSL (se não existir)
mkdir -p "$APP_INSTALL_DIR"
cd "$APP_INSTALL_DIR" # Entra no diretório da aplicação
echo ">>> Trabalhando no diretório: $(pwd)"

# 2. Instalar Git (se não estiver instalado)
if ! command -v git &> /dev/null; then
    echo ">>> Git não encontrado. Instalando Git..."
    sudo apt-get update -qq # -qq para menos output
    sudo apt-get install -y git
else
    echo ">>> Git já está instalado."
fi

# 3. Clonar o repositório (ou atualizar se já existir)
if [ -d ".git" ]; then # Verifica se o diretório atual é um repositório git
    echo ">>> Repositório já existe em $(pwd). Tentando atualizar com 'git pull'..."
    # Tenta pegar a branch atual para o pull
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if [ -n "$CURRENT_BRANCH" ] && [ "$CURRENT_BRANCH" != "HEAD" ]; then
        git pull origin "$CURRENT_BRANCH"
    else
        echo "Não foi possível determinar a branch atual ou está em detached HEAD. Pulando 'git pull'."
        echo "Se necessário, atualize manualmente."
    fi
else
    echo ">>> Clonando o repositório de $REPO_URL para $(pwd)..."
    git clone "$REPO_URL" . # O '.' clona no diretório atual
fi

# 4. Instalar Node.js (se não estiver instalado ou a versão principal for diferente)
echo ">>> Verificando e instalando/atualizando o Node.js (versão desejada ~v${NODE_SETUP_VERSION})..."
NEEDS_NODE_INSTALL=false
# Extrai o número principal da versão desejada (ex: "20" de "20.x")
EXPECTED_NODE_MAJOR_VERSION=$(echo "$NODE_SETUP_VERSION" | cut -d. -f1)

if ! command -v node &> /dev/null; then
    echo "Node.js não encontrado. Será instalado."
    NEEDS_NODE_INSTALL=true
else
    CURRENT_NODE_VERSION_FULL=$(node -v)
    # Extrai o número principal da versão atual (ex: "20" de "v20.15.0")
    CURRENT_NODE_MAJOR_VERSION=$(echo "$CURRENT_NODE_VERSION_FULL" | sed 's/v\([0-9]*\).*/\1/')

    if [ "$CURRENT_NODE_MAJOR_VERSION" != "$EXPECTED_NODE_MAJOR_VERSION" ]; then
        echo "Versão atual do Node ($CURRENT_NODE_VERSION_FULL) tem major diferente da desejada (v${EXPECTED_NODE_MAJOR_VERSION}.x). Será atualizado."
        NEEDS_NODE_INSTALL=true
    else
        echo "Node.js v${EXPECTED_NODE_MAJOR_VERSION}.x (ou compatível: $CURRENT_NODE_VERSION_FULL) já está instalado."
    fi
fi

if [ "$NEEDS_NODE_INSTALL" = true ]; then
    echo ">>> Instalando/atualizando Node.js v${NODE_SETUP_VERSION} via NodeSource..."
    sudo apt-get update -qq
    sudo apt-get install -y ca-certificates curl
    curl -fsSL "https://deb.nodesource.com/setup_${NODE_SETUP_VERSION}" | sudo -E bash -
    sudo apt-get install -y nodejs
    echo ">>> Node.js instalado/atualizado."
else
    echo ">>> Instalação/atualização do Node.js pulada."
fi

echo ">>> Versão final do Node.js:"
node -v
echo ">>> Versão final do npm:"
npm -v

# 5. Instalar dependências da aplicação
echo ">>> Instalando dependências da aplicação '$APP_NAME' com 'npm install'..."
if [ -f "package.json" ]; then
    npm install
else
    echo "--- ERRO: package.json não encontrado em $(pwd)! Não é possível instalar dependências."
    exit 1
fi

# 6. Iniciar a aplicação em segundo plano com 'nohup' e '&'
echo ">>> Iniciando a aplicação '$APP_NAME' em segundo plano com 'node server.js'..."
if [ -f "server.js" ]; then
    # Inicia o servidor com nohup, redireciona stdout e stderr para app.log, e roda em background (&)
    nohup node server.js > app.log 2>&1 &

    # Captura o PID (Process ID) do processo que acabou de ser iniciado em background
    NODE_PID=$!

    echo ""
    echo ">>> Aplicação '$APP_NAME' iniciada em segundo plano com PID: $NODE_PID."
    echo ">>> Os logs da aplicação estão sendo direcionados para o arquivo: $(pwd)/app.log"
    echo ">>> Para ver os logs em tempo real, você pode usar o comando: tail -f app.log"
    echo ">>> Para parar esta instância da aplicação, use o comando: kill $NODE_PID"
    echo ">>> (Se você fechar este terminal WSL e reabrir, para parar a aplicação, "
    echo ">>>  você precisará encontrar o PID novamente com 'pgrep -f server.js' ou 'ps aux | grep server.js' e usar 'kill SEU_PID')"
else
    echo "--- ERRO: server.js não encontrado em $(pwd)! Não é possível iniciar a aplicação."
    echo "--- Verifique se o arquivo 'server.js' existe na raiz do projeto."
    exit 1
fi

echo ""
echo ">>> Script WSL para '$APP_NAME' finalizado. A aplicação deve estar rodando em segundo plano."

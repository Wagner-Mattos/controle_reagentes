Ambiente de Desenvolvimento
🧭 Visão Geral

Este guia descreve como preparar o ambiente de desenvolvimento do Sistema de Controle de Reagentes utilizando:

    Ubuntu

    Windows + WSL Ubuntu

    VSCode

    Docker

    Node.js

    PocketBase

    Vue.js

🐧 Cenários Suportados
Linux

    Ubuntu 22.04+

    Debian 12+

Windows

    Windows 10/11

    WSL2 Ubuntu

    VSCode com extensão Remote WSL

⚙️ Tecnologias Necessárias
Ferramenta	Finalidade
Docker	Containers
Docker Compose	Orquestração
VSCode	IDE
Node.js	Frontend Vue
npm	Dependências
Git	Versionamento
📦 1. Instalar Git
Ubuntu / WSL

sudo apt update
sudo apt install git -y

Verificar:

git --version

🐳 2. Instalar Docker
Ubuntu / WSL

Instalar dependências:

sudo apt update

sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

Adicionar chave:

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

Adicionar repositório:

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

Instalar:

sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

Adicionar usuário ao grupo docker:

sudo usermod -aG docker $USER

Reiniciar sessão:

exit

🪟 Docker Desktop no Windows

Instalar:

    Docker Desktop

    Habilitar WSL2 integration

🧪 Testar Docker

docker run hello-world

🟩 3. Instalar Node.js

Recomendado:

Node.js 22 LTS

Instalar NVM

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

Recarregar shell:

source ~/.bashrc

Instalar Node.js:

nvm install 22

Verificar:

node -v
npm -v

💻 4. Instalar VSCode
Ubuntu

Baixar:

Visual Studio Code
Windows

Instalar:

    VSCode

    Extensão Remote WSL

🧩 5. Extensões VSCode Recomendadas
Extensão	Finalidade
Vue Official	Vue.js
ESLint	Qualidade
Prettier	Formatação
Docker	Containers
GitLens	Git
Markdown All in One	Documentação
Error Lens	Melhor visualização
📂 6. Criar Estrutura do Projeto

mkdir -p reagent-control

cd reagent-control

📥 7. Clonar Repositório

git clone https://github.com/SEU-USUARIO/reagent-control.git

Entrar no projeto:

cd reagent-control

📁 8. Criar Estrutura Inicial

mkdir -p \
backend/pocketbase \
frontend \
docs \
docker

🧪 9. Criar Projeto Vue.js

npm create vite@latest frontend -- --template vue

Entrar:

cd frontend

Instalar dependências:

npm install

📦 10. Instalar Dependências Frontend

npm install \
vue-router \
pinia \
axios \
pocketbase

▶️ 11. Testar Frontend

Executar:

npm run dev

Abrir:

Frontend Vue.js
🧪 12. Baixar PocketBase
Linux AMD64

cd backend/pocketbase

wget https://github.com/pocketbase/pocketbase/releases/download/v0.29.3/pocketbase_0.29.3_linux_amd64.zip

Extrair:

unzip pocketbase_0.29.3_linux_amd64.zip

Permissão:

chmod +x pocketbase

▶️ 13. Executar PocketBase

./pocketbase serve

Abrir admin:

PocketBase Admin UI
🐳 14. Testar Docker Compose

Na raiz do projeto:

docker compose up -d

Verificar containers:

docker ps

🔍 15. Verificar Serviços
Serviço	URL
Frontend	http://localhost:5173
PocketBase	http://localhost:8090
Admin PocketBase	http://localhost:8090/_/
🧪 16. Testar Integração Frontend + PocketBase

Criar:

frontend/.env

Conteúdo:

VITE_API_URL=http://localhost:8090

📦 17. Testar SDK PocketBase

Instalar:

npm install pocketbase

Exemplo:

import PocketBase from 'pocketbase'

const pb = new PocketBase('http://localhost:8090')

const records = await pb.collection('reagents').getFullList()

console.log(records)

🔄 18. Fluxo Diário de Desenvolvimento
Subir backend

cd backend/pocketbase

./pocketbase serve

Subir frontend

cd frontend

npm run dev

🧹 19. Organização Recomendada VSCode

Abrir projeto raiz:

reagent-control

Evitar abrir somente:

    frontend

    backend

📋 20. Checklist Final
Ambiente

    Docker funcionando

    Node.js instalado

    VSCode instalado

    Git instalado

Projeto

    Frontend funcionando

    PocketBase funcionando

    Docker Compose funcionando

    API acessível

🚀 Próximo Passo

Após validar o ambiente:

    Criar collections no PocketBase

    Configurar autenticação

    Criar layout base Vue

    Implementar login

    Criar CRUD de reagentes
Testando o Frontend Vue.js com PocketBase Remoto

Como você já possui uma instância do PocketBase em:

api.wagner.mattos.nom.br

você pode testar o frontend localmente sem precisar executar o PocketBase no ambiente de desenvolvimento.
🧭 Objetivo

Executar:

    Frontend Vue.js local

    PocketBase remoto

Fluxo:

Vue.js Local
     ↓
HTTPS
     ↓
PocketBase Remoto

📦 1. Entrar no Frontend

cd frontend

⚙️ 2. Criar Arquivo .env

Criar:

touch .env

Conteúdo:

VITE_API_URL=https://api.wagner.mattos.nom.br

📁 Estrutura

frontend/
├── .env
├── package.json
└── src/

🧪 3. Instalar SDK PocketBase

Caso ainda não tenha:

npm install pocketbase

🔌 4. Criar Serviço PocketBase

Criar arquivo:

src/services/pocketbase.js

Conteúdo:

import PocketBase from 'pocketbase'

const pb = new PocketBase(import.meta.env.VITE_API_URL)

export default pb

🧪 5. Criar Teste de Conexão

Exemplo simples.

Editar:

src/App.vue

Conteúdo:

<script setup>
import { onMounted } from 'vue'
import pb from './services/pocketbase'

onMounted(async () => {
  try {
    const health = await pb.health.check()

    console.log('PocketBase OK:', health)

  } catch (err) {
    console.error('Erro conexão:', err)
  }
})
</script>

<template>
  <div>
    <h1>Teste PocketBase</h1>
    <p>Verifique o console do navegador.</p>
  </div>
</template>

▶️ 6. Executar Frontend

npm run dev

Abrir:

Frontend Local Vue.js
🧪 7. Testar no Navegador

Abrir DevTools:

F12 → Console

Resultado esperado:

PocketBase OK

🔍 8. Testar API Manualmente

Abrir:

PocketBase Health Endpoint

Deve retornar algo parecido com:

{
  "code": 200,
  "message": "API is healthy."
}

🔐 9. Testar Login

Exemplo:

const authData = await pb
  .collection('users')
  .authWithPassword(
    'admin@teste.com',
    '123456'
  )

console.log(authData)

⚠️ Possíveis Problemas
CORS

Se ocorrer erro:

CORS policy blocked

Configurar CORS no PocketBase.
HTTPS

Como você está usando HTTPS no domínio:

https://api.wagner.mattos.nom.br

o navegador aceitará normalmente.
🧪 10. Testar Collections

Exemplo:

const records = await pb
  .collection('reagents')
  .getList(1, 10)

console.log(records)

📦 Estrutura Recomendada

frontend/
│
├── src/
│   ├── services/
│   │   └── pocketbase.js
│   │
│   ├── stores/
│   ├── pages/
│   └── components/
│
└── .env

🚀 Próximo Passo Recomendado

Após validar a conexão:

    Criar página Login

    Implementar Pinia

    Criar Auth Store

    Criar Layout Base

    Criar CRUD reagentes

    Implementar realtime

🔥 Dica Importante

Como você já possui domínio HTTPS configurado, isso facilita:

    PWA futuro

    Service Workers

    WebSocket seguro

    Deploy frontend separado

    APIs externas

Essa arquitetura já fica muito próxima de um ambiente real de produção.



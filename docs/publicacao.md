# 🚀 Publicação do Frontend

Este guia descreve o passo a passo para gerar o build de produção do frontend e publicá-lo no endereço: `https://wiki.wagner.mattos.nom.br/gestao/`.

Como o sistema não será hospedado na raiz do domínio (e sim no subdiretório `/gestao/`), algumas configurações adicionais são necessárias antes de gerar o build.

---

## 1. Configurar o subdiretório (Base URL)

### Vite (`frontend/vite.config.js`)
Adicione a propriedade `base` apontando para o subdiretório no arquivo de configuração do Vite. Se o arquivo não existir, crie-o na raiz da pasta `frontend`:

```javascript
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  base: '/gestao/', // Fundamental para carregar JS/CSS corretamente
})
```

### Vue Router (`frontend/src/router/index.js`)
Atualize a configuração do histórico para utilizar a base `/gestao/`, para que a navegação interna respeite a URL pública:

```javascript
// Procure por esta linha e adicione o subdiretório:
const router = createRouter({
  history: createWebHistory('/gestao/'),
  routes
})
```

---

## 2. Configurar a API Remota

Certifique-se de que o projeto saberá a qual servidor do PocketBase ele deve se conectar em produção.
Crie um arquivo chamado `.env.production` na pasta `frontend/`:

```env
VITE_API_URL=https://api.wagner.mattos.nom.br
```

---

## 3. Gerar o Build

No terminal da sua máquina de desenvolvimento, acesse a pasta `frontend` e execute o comando de build:

```bash
cd frontend
npm install  # Garante que todas as dependências estão corretas
npm run build
```

O Vite criará uma pasta chamada `dist/` contendo todos os arquivos estáticos e otimizados para produção.

---

## 4. Publicar no Servidor

Para enviar os arquivos compilados para o servidor de produção, utilizaremos o `rsync`. Certifique-se de estar na pasta `frontend` do seu projeto local e execute o comando abaixo:

```bash
rsync -avz --delete --rsync-path="sudo rsync" dist/ dietpi@192.168.1.249:/var/www/html/gestao/
```

* **`dist/`**: Pasta local contendo o build final gerado pelo Vite.
* **`--delete`**: Garante que arquivos antigos no servidor (como versões velhas de JS/CSS) sejam apagados, mantendo o diretório de destino exatamente igual à pasta local.

---

## 5. Configurar o Servidor Web (SPA Fallback)

Por ser um sistema SPA (Single Page Application) gerenciado pelo Vue Router, o seu servidor Web (Apache ou Nginx) precisa redirecionar todas as rotas não encontradas para o arquivo `index.html`.

**Exemplo de configuração para Nginx:**
```nginx
location /gestao/ {
    alias /var/www/sua-pasta-wiki/gestao/;
    try_files $uri $uri/ /gestao/index.html;
}
```
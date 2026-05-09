# Frontend

# 🖥️ Visão Geral

O frontend do Sistema de Controle de Reagentes será desenvolvido utilizando:

- Vue.js 3
- Vite
- Pinia
- Vue Router
- Axios

Objetivos principais:

- Interface moderna e limpa
- Facilidade de manutenção
- Componentização
- Responsividade
- Alta produtividade
- Integração simples com PocketBase

---

# ⚙️ Stack Tecnológica

| Tecnologia | Finalidade |
|---|---|
| Vue.js 3 | Framework frontend |
| Vite | Build tool |
| Pinia | Gerenciamento de estado |
| Vue Router | Controle de rotas |
| Axios | Comunicação HTTP |
| PocketBase JS SDK | Integração backend |
| TailwindCSS *(futuro)* | Estilização |
| VueUse *(futuro)* | Utilitários Vue |

---

# 📁 Estrutura de Diretórios

```bash
frontend/
│
├── public/
│
├── src/
│   ├── assets/
│   │
│   ├── components/
│   │   ├── common/
│   │   ├── forms/
│   │   ├── tables/
│   │   ├── dashboard/
│   │   └── layout/
│   │
│   ├── composables/
│   │
│   ├── layouts/
│   │
│   ├── pages/
│   │   ├── auth/
│   │   ├── dashboard/
│   │   ├── reagents/
│   │   ├── movements/
│   │   ├── locations/
│   │   └── settings/
│   │
│   ├── router/
│   │
│   ├── services/
│   │
│   ├── stores/
│   │
│   ├── styles/
│   │
│   ├── utils/
│   │
│   ├── App.vue
│   └── main.js
│
├── package.json
├── vite.config.js
└── .env
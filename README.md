# 🧪 Sistema de Controle de Reagentes

Sistema web para gerenciamento de reagentes laboratoriais, desenvolvido com **PocketBase** no backend e **Vue.js** no frontend.

O objetivo do projeto é oferecer uma plataforma simples, moderna e eficiente para controle de:

- Cadastro de reagentes
- Controle de estoque
- Validade
- Localização física
- Movimentações
- Usuários e permissões
- Histórico de utilização
- Alertas de vencimento e estoque mínimo

---

# 🚀 Stack Tecnológica

## Backend
- [PocketBase](https://pocketbase.io/)
  - Banco SQLite integrado
  - API REST automática
  - Autenticação
  - Realtime
  - Upload de arquivos

## Frontend
- [Vue.js 3](https://vuejs.org/)
- [Vite](https://vitejs.dev/)
- [Vue Router](https://router.vuejs.org/)
- [Pinia](https://pinia.vuejs.org/) (estado global)
- [Axios](https://axios-http.com/)

---

# 📁 Estrutura Inicial do Projeto

```bash
reagent-control/
│
├── backend/
│   └── pocketbase/
│
├── frontend/
│   ├── src/
│   │   ├── assets/
│   │   ├── components/
│   │   ├── composables/
│   │   ├── layouts/
│   │   ├── pages/
│   │   ├── router/
│   │   ├── services/
│   │   ├── stores/
│   │   └── utils/
│   │
│   ├── public/
│   └── package.json
│
├── docs/
├── docker/
├── docker-compose.yml
└── README.md



🎯 Funcionalidades Planejadas
📦 Controle de Reagentes
Cadastro completo
Número CAS
Fabricante
Lote
Quantidade
Unidade
Grau de pureza
FISPQ/SDS em PDF
Classificação de risco
🧾 Movimentações
Entrada
Saída
Ajuste de estoque
Histórico completo
📍 Localização
Laboratório
Armário
Prateleira
Posição
⏰ Alertas
Validade próxima
Estoque mínimo
Reagentes vencidos
👥 Usuários
Administrador
Técnico
Pesquisador
Auditoria de ações
📊 Dashboard
Estoque geral
Produtos vencendo
Movimentações recentes
Indicadores
🧱 Modelagem Inicial
Coleções PocketBase
users

Usuários do sistema.

reagents

Cadastro principal dos reagentes.

Campos previstos:

Campo	Tipo
name	text
cas_number	text
manufacturer	text
lot	text
quantity	number
unit	select
expiration_date	date
risk_class	select
location_id	relation
sds_file	file
minimum_stock	number
notes	editor
locations

Locais físicos.

Campo	Tipo
laboratory	text
cabinet	text
shelf	text
position	text
movements

Movimentações de estoque.

Campo	Tipo
reagent_id	relation
user_id	relation
type	select
quantity	number
date	date
notes	editor
🔐 Controle de Acesso

Perfis previstos:

Admin
Supervisor
Técnico
Consulta
🐳 Docker
Subir ambiente

autor Wagner
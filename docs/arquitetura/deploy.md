# Deploy

# 🚀 Visão Geral

O Sistema de Controle de Reagentes será distribuído inicialmente utilizando:

- Docker
- Docker Compose
- PocketBase
- Vue.js
- SQLite

Objetivos principais:

- Facilidade de instalação
- Reprodutibilidade
- Portabilidade
- Simplicidade operacional
- Facilidade de backup

---

# 🐳 Arquitetura Inicial

Estrutura prevista:

```bash
project/
│
├── backend/
│   └── pocketbase/
│
├── frontend/
│
├── docs/
│
├── docker/
│
└── docker-compose.yml
# Backend

# 🧠 Visão Geral

O backend do Sistema de Controle de Reagentes será baseado em:

- PocketBase
- SQLite
- API REST automática
- Realtime via WebSocket
- Autenticação integrada

Objetivos:

- Simplicidade operacional
- Facilidade de deploy
- Baixo consumo de recursos
- Alta produtividade
- Estrutura facilmente expansível

---

# ⚙️ Tecnologias

| Tecnologia | Finalidade |
|---|---|
| PocketBase | Backend principal |
| SQLite | Banco de dados |
| Docker | Containerização |
| WebSocket | Atualizações realtime |
| JWT | Autenticação |

---

# 📦 Estrutura

```bash
backend/
│
└── pocketbase/
    │
    ├── pb_data/
    ├── pb_public/
    ├── pb_hooks/
    ├── pb_migrations/
    └── pocketbase
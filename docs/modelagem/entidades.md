# Entidades

# 🧠 Visão Geral

Este documento descreve as principais entidades do Sistema de Controle de Reagentes e seus relacionamentos.

Objetivos:

- Organizar a modelagem do sistema
- Facilitar evolução futura
- Servir como referência para backend e frontend
- Definir responsabilidades de cada entidade

---

# 🧪 Reagent

Representa um reagente químico controlado pelo sistema.

## Responsabilidades

- Controle de estoque
- Controle de validade
- Associação de localização
- Associação de fornecedor
- Controle documental

---

## Campos Principais

| Campo | Tipo |
|---|---|
| name | text |
| cas_number | text |
| lot | text |
| quantity | number |
| unit | select |
| expiration_date | date |
| risk_class | select |

---

# 📦 Movement

Representa movimentações de estoque.

## Objetivos

Registrar:

- Entrada
- Saída
- Ajuste
- Descarte
- Transferência

---

## Relacionamentos

| Origem | Destino |
|---|---|
| movement | reagent |
| movement | user |

---

# 👤 User

Representa usuários do sistema.

## Perfis previstos

- admin
- supervisor
- technician
- viewer

---

## Responsabilidades

- Autenticação
- Auditoria
- Controle de acesso
- Registro de ações

---

# 📍 Location

Representa localização física do reagente.

## Estrutura

| Campo |
|---|
| laboratory |
| room |
| cabinet |
| shelf |
| position |

---

# 🏢 Supplier

Representa fornecedores.

## Objetivos

- Controle de origem
- Histórico de compras
- Dados de contato

---

# 🧾 Audit

Registra eventos importantes do sistema.

## Eventos previstos

- Login
- Logout
- Alterações
- Exclusões
- Movimentações

---

# 🔗 Relacionamentos Gerais

```text
User
 └── Movement

Reagent
 ├── Movement
 ├── Supplier
 └── Location

Audit
 └── User
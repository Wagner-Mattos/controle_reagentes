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
- Registro de localização física (simplificado)
- Registro de fabricante/fornecedor (simplificado)

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
| location | text |
| manufacturer | text |

---

# 📦 Movement

Representa movimentações de estoque.

## Objetivos

Registrar:

- Entrada
- Saída
- Ajuste
- Descarte

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
- Controle de acesso
- Registro de autoria nas movimentações

---

# 🔗 Relacionamentos Gerais

```text
User
 └── Movement

Reagent
 └── Movement
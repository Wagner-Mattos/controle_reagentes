# Banco de Dados

# 🗄️ Visão Geral

O Sistema de Controle de Reagentes utilizará inicialmente:

- SQLite
- Gerenciado pelo PocketBase

Objetivos principais:

- Simplicidade operacional
- Facilidade de backup
- Baixo consumo de recursos
- Alta produtividade
- Facilidade de manutenção

---

# ⚙️ Tecnologias

| Tecnologia | Finalidade |
|---|---|
| SQLite | Banco de dados principal |
| PocketBase | Gerenciamento e API |
| Docker | Persistência e deploy |

---

# 📦 Estratégia de Modelagem

A modelagem seguirá:

- Collections desacopladas
- Relacionamentos simples
- Auditoria de movimentações
- Estrutura escalável
- Campos padronizados

---

# 📚 Collections Principais

## users

Usuários do sistema.

### Responsabilidades

- Login
- Controle de permissões
- Auditoria
- Histórico de ações

### Campos

| Campo | Tipo |
|---|---|
| name | text |
| email | email |
| role | select |
| active | bool |
| avatar | file |

### Roles previstas

- admin
- supervisor
- technician
- viewer

---

# 🧪 reagents

Cadastro principal de reagentes.

### Campos

| Campo | Tipo | Descrição |
|---|---|---|
| name | text | Nome do reagente |
| cas_number | text | Número CAS |
| manufacturer | text | Fabricante |
| supplier_id | relation | Fornecedor |
| lot | text | Número do lote |
| quantity | number | Quantidade atual |
| unit | select | Unidade |
| purity | text | Grau de pureza |
| expiration_date | date | Validade |
| acquisition_date | date | Data de aquisição |
| minimum_stock | number | Estoque mínimo |
| risk_class | select | Classe de risco |
| location_id | relation | Localização |
| barcode | text | Código de barras |
| qr_code | text | QRCode |
| sds_file | file | FISPQ/SDS |
| image | file | Foto |
| active | bool | Situação |
| notes | editor | Observações |

---

# 📦 movements

Controle de movimentações de estoque.

### Objetivo

Registrar:

- Entrada
- Saída
- Ajustes
- Transferências
- Perdas

### Campos

| Campo | Tipo |
|---|---|
| reagent_id | relation |
| user_id | relation |
| movement_type | select |
| quantity | number |
| previous_quantity | number |
| current_quantity | number |
| movement_date | date |
| destination | text |
| notes | editor |

### Tipos previstos

- input
- output
- adjustment
- discard
- transfer

---

# 📍 locations

Localização física dos reagentes.

### Campos

| Campo | Tipo |
|---|---|
| laboratory | text |
| room | text |
| cabinet | text |
| shelf | text |
| position | text |
| notes | editor |

---

# 🏢 suppliers

Fornecedores.

### Campos

| Campo | Tipo |
|---|---|
| company_name | text |
| trade_name | text |
| cnpj | text |
| contact | text |
| phone | text |
| email | email |
| website | url |
| notes | editor |

---

# 🧾 audits

Auditoria do sistema.

### Objetivo

Registrar:

- Alterações
- Exclusões
- Login
- Eventos críticos

### Campos

| Campo | Tipo |
|---|---|
| user_id | relation |
| action | text |
| collection_name | text |
| record_id | text |
| old_data | json |
| new_data | json |
| created_at | date |

---

# 🔗 Relacionamentos

```text
users
 └── movements

reagents
 ├── movements
 ├── suppliers
 └── locations
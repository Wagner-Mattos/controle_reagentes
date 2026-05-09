
---

# `docs/modelagem/collections-pocketbase.md`

```markdown id="collections-pocketbase-md-v1"
# Collections PocketBase

# 🗂️ Visão Geral

Este documento define as collections do PocketBase utilizadas pelo Sistema de Controle de Reagentes.

---

# 📚 Collections

## users

Collection nativa do PocketBase.

### Objetivo

- Autenticação
- Controle de acesso
- Sessão
- Auditoria

---

## reagents

Cadastro principal de reagentes.

### Campos

| Campo | Tipo |
|---|---|
| name | text |
| cas_number | text |
| manufacturer | text |
| lot | text |
| quantity | number |
| unit | select |
| purity | text |
| expiration_date | date |
| acquisition_date | date |
| minimum_stock | number |
| risk_class | select |
| location_id | relation |
| supplier_id | relation |
| barcode | text |
| qr_code | text |
| sds_file | file |
| image | file |
| active | bool |
| notes | editor |

---

## movements

Controle de movimentações.

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

---

## locations

Localização física.

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

## suppliers

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

## audits

Auditoria.

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

# 🔐 Regras de Acesso

## users

| Perfil | Permissão |
|---|---|
| admin | total |
| supervisor | leitura |
| technician | leitura |
| viewer | leitura |

---

## reagents

| Perfil | Permissão |
|---|---|
| admin | total |
| supervisor | total |
| technician | parcial |
| viewer | leitura |

---

# 📈 Índices Recomendados

## reagents

- name
- cas_number
- expiration_date
- lot

---

## movements

- movement_date

---

# 🧭 Convenções

## Collections

```text id="collections-pocketbase-conv-1"
snake_case
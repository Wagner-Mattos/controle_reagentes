
---

# `docs/modelagem/fluxo-movimentacao.md`

```markdown id="fluxo-movimentacao-md-v1"
# Fluxo de Movimentação

# 🔄 Visão Geral

Este documento descreve o fluxo operacional de movimentação de reagentes no sistema.

Objetivos:

- Garantir rastreabilidade
- Controlar estoque
- Registrar auditoria
- Facilitar inventário

---

# 📦 Tipos de Movimentação

## Entrada

Utilizada quando:

- Compra
- Recebimento
- Devolução
- Correção positiva

---

## Saída

Utilizada quando:

- Consumo
- Transferência
- Empréstimo
- Correção negativa

---

## Ajuste

Utilizada para:

- Inventário
- Correção manual
- Regularização

---

## Descarte

Utilizada quando:

- Produto vencido
- Contaminação
- Danificação

---

# 🧪 Fluxo Geral

```text
Cadastro do Reagente
        ↓
Entrada Inicial
        ↓
Estoque Disponível
        ↓
Movimentações
        ↓
Atualização de Estoque
        ↓
Auditoria
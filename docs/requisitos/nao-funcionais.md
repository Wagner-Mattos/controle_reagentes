---

# `docs/requisitos/nao-funcionais.md`

```markdown id="requisitos-nao-funcionais-md"
# Requisitos Não Funcionais

# 🎯 Visão Geral

Este documento descreve os requisitos não funcionais do Sistema de Controle de Reagentes.

Os requisitos não funcionais definem:

- Qualidade
- Desempenho
- Segurança
- Escalabilidade
- Operação

---

# ⚡ RNF001 - Desempenho

O sistema deverá responder operações comuns em menos de:

```text id="rnf-perf"
2 segundos

🔒 RNF002 - Segurança

O sistema deverá possuir:

HTTPS
JWT
Controle de permissões
Auditoria
Proteção de rotas
💾 RNF003 - Backup

O sistema deverá permitir:

Backup diário
Recuperação rápida
Exportação do banco
📱 RNF004 - Responsividade

O sistema deverá funcionar em:

Desktop
Tablet
Smartphone
🧩 RNF005 - Escalabilidade

A arquitetura deverá permitir:

Crescimento modular
Novas collections
Novos módulos
Migração futura de banco
🐳 RNF006 - Portabilidade

O sistema deverá ser executável via:

Docker
Docker Compose
🌐 RNF007 - Compatibilidade

O sistema deverá funcionar em:

Linux
Windows
Navegadores modernos
🧠 RNF008 - Manutenibilidade

O sistema deverá possuir:

Código organizado
Componentização
Documentação
Padrões definidos
📊 RNF009 - Monitoramento

O sistema deverá permitir integração futura com:

Logs
Métricas
Dashboards
🔄 RNF010 - Disponibilidade

Objetivo inicial:

99%
🧪 RNF011 - Auditabilidade

Toda alteração importante deverá ser registrada.

📦 RNF012 - Persistência

Os dados deverão permanecer persistidos mesmo após:

Reinicializações
Atualizações
Migrações
🚀 RNF013 - Atualização

O sistema deverá permitir atualização simples utilizando Docker.

🔌 RNF014 - API

A API deverá:

Seguir REST
Utilizar JSON
Possuir autenticação JWT
📈 RNF015 - Crescimento Futuro

O sistema deverá permitir futura migração para:

PostgreSQL
Clusterização
Balanceamento
🎨 RNF016 - Usabilidade

A interface deverá:

Ser simples
Intuitiva
Limpa
Responsiva
🔍 RNF017 - Observabilidade

Planejado futuramente:

Logs centralizados
Métricas
Alertas
📚 RNF018 - Documentação

O projeto deverá possuir documentação para:

API
Deploy
Modelagem
Arquitetura
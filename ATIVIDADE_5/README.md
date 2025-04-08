# Sistema de Rastreamento de Pacotes de Entrega

**Aluno:** Daniel Guedes  
**Matrícula:** 20220869804

## Descrição do Projeto
Este projeto consiste na modelagem de um sistema de rastreamento de pacotes de entrega, desenvolvido como parte da disciplina de Banco de Dados. O sistema foi modelado em três níveis:

### 1. Modelo Conceitual
- Representa a estrutura lógica do banco de dados usando um Diagrama Entidade-Relacionamento (DER)
- Define as entidades principais: Pacote, Entregador, Remetente e Destinatário
- Estabelece os relacionamentos entre as entidades com cardinalidades (1,1) e (1,n)
- Identifica os atributos de cada entidade

### 2. Modelo Lógico
- Transforma o modelo conceitual em uma representação mais próxima do banco de dados
- Define as tabelas e seus atributos
- Estabelece as chaves primárias e estrangeiras
- Especifica os tipos de dados e restrições

### 3. Modelo Físico
- Implementa o modelo lógico em SQL
- Define a estrutura das tabelas com comandos CREATE TABLE
- Implementa as restrições de integridade
- Cria índices para otimização
- Inclui dados de exemplo

## Estrutura do Sistema
O sistema possui quatro entidades principais:

1. **Pacote**
   - Número de rastreamento único
   - Informações sobre conteúdo e destino
   - Status da entrega e datas

2. **Entregador**
   - Dados pessoais
   - Informações do veículo
   - CPF único

3. **Remetente**
   - Dados de contato
   - Endereço completo

4. **Destinatário**
   - Dados de contato
   - Endereço de entrega

## Relacionamentos
- Um entregador pode entregar vários pacotes (1:N)
- Um remetente pode enviar vários pacotes (1:N)
- Um destinatário pode receber vários pacotes (1:N)
- Cada pacote tem exatamente um entregador, um remetente e um destinatário

## Arquivos do Projeto
- `modelo_conceitual.md`: Documentação do modelo conceitual
- `modelo_logico.md`: Documentação do modelo lógico
- `Sistema de Rastreamento de Pacotes de Entrega_fisico.sql`: Script SQL com o modelo físico

## Tecnologias Utilizadas
- SQL para implementação do modelo físico
- Modelagem ER para o design conceitual
- Índices para otimização de consultas
- Constraints para garantir a integridade dos dados 
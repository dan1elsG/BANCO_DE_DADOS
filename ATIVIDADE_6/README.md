# Sistema de Consultas ao Banco de Dados

Este sistema realiza consultas ao banco de dados PostgreSQL Pagila, respondendo às seguintes questões:

1. Quais são os 10 primeiros filmes (título e duração) com mais de 2 horas (120 minutos), ordenados por duração decrescente?
2. Liste os nomes dos filmes e suas respectivas categorias.
3. Quais são os 5 filmes mais alugados, com seus respectivos totais de aluguel?
4. Qual o valor total gasto por cada cliente (nome completo), ordenado do que mais gastou para o que menos gastou?
5. Qual a receita total obtida por cada categoria de filme? Mostre da maior para a menor.

## Pré-requisitos

- Python 3.6 ou superior
- PostgreSQL instalado e rodando
- Banco de dados Pagila criado e populado

## Instalação

1. Clone este repositório
2. Instale as dependências:
```bash
pip install -r requirements.txt
```

3. Configure o arquivo `.env` com suas credenciais do banco de dados:
```
DB_HOST=localhost
DB_NAME=pagila
DB_USER=seu_usuario
DB_PASSWORD=sua_senha
DB_PORT=5432
```

## Uso

Execute o script principal:
```bash
python main.py
```

O sistema irá exibir os resultados de todas as consultas em formato de tabela.

## Estrutura do Projeto

- `main.py`: Script principal com todas as consultas
- `requirements.txt`: Dependências do projeto
- `.env`: Configurações do banco de dados
- `README.md`: Documentação do projeto 

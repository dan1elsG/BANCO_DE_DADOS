import os
import psycopg2
from dotenv import load_dotenv
from tabulate import tabulate

# Carrega as variáveis de ambiente
load_dotenv()

def connect_to_db():
    """Estabelece conexão com o banco de dados"""
    try:
        conn = psycopg2.connect(
            host=os.getenv('DB_HOST'),
            database=os.getenv('DB_NAME'),
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASSWORD'),
            port=os.getenv('DB_PORT')
        )
        return conn
    except Exception as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        return None

def query_1():
    """Consulta 1: Filmes com mais de 2 horas"""
    conn = connect_to_db()
    if conn:
        try:
            cur = conn.cursor()
            query = """
                SELECT title, length 
                FROM film 
                WHERE length > 120 
                ORDER BY length DESC 
                LIMIT 10
            """
            cur.execute(query)
            results = cur.fetchall()
            print("\n1. Top 10 filmes com mais de 2 horas:")
            print(tabulate(results, headers=['Título', 'Duração (min)'], tablefmt='grid'))
        finally:
            conn.close()

def query_2():
    """Consulta 2: Filmes e suas categorias"""
    conn = connect_to_db()
    if conn:
        try:
            cur = conn.cursor()
            query = """
                SELECT f.title, c.name as category
                FROM film f
                JOIN film_category fc ON f.film_id = fc.film_id
                JOIN category c ON fc.category_id = c.category_id
                ORDER BY f.title
            """
            cur.execute(query)
            results = cur.fetchall()
            print("\n2. Filmes e suas categorias:")
            print(tabulate(results, headers=['Título', 'Categoria'], tablefmt='grid'))
        finally:
            conn.close()

def query_3():
    """Consulta 3: Filmes mais alugados"""
    conn = connect_to_db()
    if conn:
        try:
            cur = conn.cursor()
            query = """
                SELECT f.title, COUNT(r.rental_id) as total_alugueis
                FROM film f
                JOIN inventory i ON f.film_id = i.film_id
                JOIN rental r ON i.inventory_id = r.inventory_id
                GROUP BY f.title
                ORDER BY total_alugueis DESC
                LIMIT 5
            """
            cur.execute(query)
            results = cur.fetchall()
            print("\n3. Top 5 filmes mais alugados:")
            print(tabulate(results, headers=['Título', 'Total de Aluguéis'], tablefmt='grid'))
        finally:
            conn.close()

def query_4():
    """Consulta 4: Valor total gasto por cliente"""
    conn = connect_to_db()
    if conn:
        try:
            cur = conn.cursor()
            query = """
                SELECT 
                    c.first_name || ' ' || c.last_name as nome_completo,
                    SUM(p.amount) as total_gasto
                FROM customer c
                JOIN payment p ON c.customer_id = p.customer_id
                GROUP BY nome_completo
                ORDER BY total_gasto DESC
            """
            cur.execute(query)
            results = cur.fetchall()
            print("\n4. Valor total gasto por cliente:")
            print(tabulate(results, headers=['Nome Completo', 'Total Gasto'], tablefmt='grid'))
        finally:
            conn.close()

def query_5():
    """Consulta 5: Receita total por categoria"""
    conn = connect_to_db()
    if conn:
        try:
            cur = conn.cursor()
            query = """
                SELECT 
                    c.name as categoria,
                    SUM(p.amount) as receita_total
                FROM category c
                JOIN film_category fc ON c.category_id = fc.category_id
                JOIN film f ON fc.film_id = f.film_id
                JOIN inventory i ON f.film_id = i.film_id
                JOIN rental r ON i.inventory_id = r.inventory_id
                JOIN payment p ON r.rental_id = p.rental_id
                GROUP BY categoria
                ORDER BY receita_total DESC
            """
            cur.execute(query)
            results = cur.fetchall()
            print("\n5. Receita total por categoria:")
            print(tabulate(results, headers=['Categoria', 'Receita Total'], tablefmt='grid'))
        finally:
            conn.close()

def main():
    """Função principal que executa todas as consultas"""
    print("Iniciando consultas ao banco de dados Pagila...")
    
    query_1()
    query_2()
    query_3()
    query_4()
    query_5()

if __name__ == "__main__":
    main() 
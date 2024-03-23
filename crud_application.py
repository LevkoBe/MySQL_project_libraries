import mysql.connector
import pandas as pd

config = {
  'user': 'root',
  'password': 'jereMy555',
  'host': '127.0.0.1',
  'port': '3306',
  'database': 'first_db'
}

def create_record(name, address, phone_number, email, password):
    try:
        connection = mysql.connector.connect(**config)
        cursor = connection.cursor()

        query = """
        INSERT INTO customers (name, address, phone_number, email, password)
        VALUES (%s, %s, %s, %s, %s)
        """
        cursor.execute(query, (name, address, phone_number, email, password))

        connection.commit()
        print("Record created successfully.")

    except mysql.connector.Error as error:
        print("Error:", error)

    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals():
            connection.close()

def update_record(customer_id, new_address):
    try:
        connection = mysql.connector.connect(**config)
        cursor = connection.cursor()

        query = """
        UPDATE customers
        SET address = %s
        WHERE id = %s
        """
        cursor.execute(query, (new_address, customer_id))

        connection.commit()
        print("Record updated successfully.")

    except mysql.connector.Error as error:
        print("Error:", error)

    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals():
            connection.close()

def delete_record(customer_id):
    try:
        connection = mysql.connector.connect(**config)
        cursor = connection.cursor()

        query = """
        DELETE FROM customers
        WHERE id = %s
        """
        cursor.execute(query, (customer_id,))

        connection.commit()
        print("Record deleted successfully.")

    except mysql.connector.Error as error:
        print("Error:", error)

    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals():
            connection.close()

def read_data():
    try:
        connection = mysql.connector.connect(**config)
        # favourite author
        query = """
SELECT c.name AS customer_name, fav_author.name AS favorite_author FROM customers c
    INNER JOIN (
        SELECT c.id AS customer_id, a.name AS name,
        ROW_NUMBER() OVER (PARTITION BY c.id ORDER BY COUNT(1) DESC) AS rn
        FROM customers c
        INNER JOIN loans l ON c.id = l.customer_id
        INNER JOIN loan_books lb ON l.id = lb.loan_id
        INNER JOIN books b ON lb.book_id = b.id
        INNER JOIN book_authors ba ON b.id = ba.book_id
        INNER JOIN authors a ON ba.author_id = a.id
        GROUP BY c.id, a.id
    ) AS fav_author ON c.id = fav_author.customer_id AND fav_author.rn = 1;
"""
        cursor = connection.cursor()

        cursor.execute(query)

        columns = [desc[0] for desc in cursor.description]
        df = pd.DataFrame(cursor.fetchall(), columns=columns)

        print(df)

    except mysql.connector.Error as error:
        print("Error:", error)

    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals():
            connection.close()


create_record('Jonathan Drikes', '31 Lychakivska St', '333-222-3333', 'jdrikes@example.com', 'drikes123321')

update_record(10, '12 Mykolayivska St')

delete_record(9)

read_data()


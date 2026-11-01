import os

import mysql.connector
from dotenv import load_dotenv

load_dotenv()


def save_log(method, route, total_results, client_ip, created_at):
    connection = mysql.connector.connect(
        host=os.getenv("MYSQL_HOST"),
        port=int(os.getenv("MYSQL_PORT")),
        database=os.getenv("MYSQL_DATABASE"),
        user=os.getenv("MYSQL_USER"),
        password=os.getenv("MYSQL_PASSWORD"),
    )
    try:
        cursor = connection.cursor()
        cursor.execute(
            "INSERT INTO logs (method, route, total_results, client_ip, created_at) "
            "VALUES (%s, %s, %s, %s, %s)",
            (method, route, total_results, client_ip, created_at),
        )
        connection.commit()
    finally:
        connection.close()

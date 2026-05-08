import pyodbc

def obtener_conexion():
    conn_str = (
        "Driver={ODBC Driver 17 for SQL Server};"
        "Server=localhost;"
        "Database=foodtruck-db;"
        "Trusted_Connection=yes;"
    )
    try:
        conn = pyodbc.connect(conn_str)
        print("Conexion exitosa")
        return conn
    except Exception as e:
        print(f"Error al conectar: {e}")
        return None

if __name__ == "__main__":
    obtener_conexion()
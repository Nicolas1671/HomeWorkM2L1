from database_conection import obtener_conexion

referencia = [{"tabla": "foodtrucks", "archivo": r"C:\Users\Nico\Desktop\Henry\Data Science\Modulo 2\HomeWorkM2L1\data\foodtrucks.csv"},
              {"tabla": "locations", "archivo": r"C:\Users\Nico\Desktop\Henry\Data Science\Modulo 2\HomeWorkM2L1\data\locations.csv"},
              {"tabla": "products", "archivo": r"C:\Users\Nico\Desktop\Henry\Data Science\Modulo 2\HomeWorkM2L1\data\products.csv"},
              {"tabla": "orders", "archivo": r"C:\Users\Nico\Desktop\Henry\Data Science\Modulo 2\HomeWorkM2L1\data\orders.csv"},
              {"tabla": "order_items", "archivo": r"C:\Users\Nico\Desktop\Henry\Data Science\Modulo 2\HomeWorkM2L1\data\order_items.csv"}]

def cargar_datos_csv_a_tabla():

    conn = obtener_conexion()

    if not conn:
        print("No se pudo establecer la conexión. Abortando carga.")
        return
    
    cursor = conn.cursor()

    for p in referencia:
        try: 
            cursor.execute(
                f"""BULK INSERT {p['tabla']}
                FROM '{p['archivo']}'
                WITH (
                FORMAT = 'CSV',
                FIRSTROW = 2,
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n'
                );"""
            )
            conn.commit()
            print(f"  + Insertado: {p['tabla']}")
        except Exception as err:
            print(f"   - Error en {p['tabla']}: {err}")
    
    conn.close()
    print("\nProceso terminado.")

if __name__ == "__main__":
    cargar_datos_csv_a_tabla()



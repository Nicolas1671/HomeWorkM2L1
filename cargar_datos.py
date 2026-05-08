from database_conection import obtener_conexion

def cargar_datos():
    
    conn = obtener_conexion()

    if not conn:
        print("No se pudo establecer la conexión. Abortando carga.")
        return    
    
    cursor = conn.cursor()

    productos = [
        {'ft_id': 1, 'name': 'Combo Burger', 'price': 1200, 'stock': 50},
        {'ft_id': 1, 'name': 'Soda 500ml', 'price': 400, 'stock': 100},
        {'ft_id': 1, 'name': 'Producto Fallido', 'price': 'TextoEnVezDeNumero', 'stock': 10}
    ]

    for p in productos:
        try:
            query = """
            INSERT INTO products (foodtruck_id, name, price, stock)
            VALUES (?, ?, ?, ?)
            """
            cursor.execute(query, p['ft_id'], p['name'], p['price'], p['stock'])
            conn.commit()
            print(f"  + Insertado: {p['name']}")

        except Exception as err:
            print(f"   - Error en {p['name']}: Guardando en failed_orders...")
            cursor.execute(
                "INSERT INTO failed_orders (product_name, error_message) VALUES (?, ?)",
                p['name'], str(err)
            )
            conn.commit()

        conn.close()
        print("\nProceso terminado.")

if __name__ == "__main__":
    cargar_datos()
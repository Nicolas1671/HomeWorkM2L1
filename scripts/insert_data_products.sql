-- 1. Crear la tabla de destino (si aún no existe)
CREATE TABLE Productos_Import (
    product_id INT,
    foodtruck_id INT,
    name VARCHAR(255),
    price DECIMAL(10, 2),
    stock INT
);

-- 2. Ejecutar la carga masiva
BULK INSERT Productos_Import
FROM '"C:\Users\Nico\Desktop\Henry\Data Science\Modulo 2\HomeWorkM2L1\data\products.csv"' -- 
WITH (
    FIRSTROW = 2,           -- Ignora el encabezado (fila 1)
    FIELDTERMINATOR = ',',  -- Separador de columnas (coma)
    ROWTERMINATOR = '\n',   -- Salto de línea
    TABLOCK                 -- Optimiza el rendimiento bloqueando la tabla durante la carga
);
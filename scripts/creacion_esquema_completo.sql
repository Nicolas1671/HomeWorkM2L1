-- DROP SCHEMA dbo;

CREATE SCHEMA dbo;
-- [foodtruck-db].dbo.foodtrucks definition

-- Drop table

-- DROP TABLE [foodtruck-db].dbo.foodtrucks;

CREATE TABLE [foodtruck-db].dbo.foodtrucks (
	foodtruck_id int NOT NULL,
	name varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	cuisine_type varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	city varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	CONSTRAINT foodtrucks_pk PRIMARY KEY (foodtruck_id)
);


-- [foodtruck-db].dbo.locations definition

-- Drop table

-- DROP TABLE [foodtruck-db].dbo.locations;

CREATE TABLE [foodtruck-db].dbo.locations (
	location_id int NOT NULL,
	foodtruck_id int NOT NULL,
	location_date date NOT NULL,
	[zone] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT locations_pk PRIMARY KEY (location_id),
	CONSTRAINT locations_foodtrucks_FK FOREIGN KEY (foodtruck_id) REFERENCES [foodtruck-db].dbo.foodtrucks(foodtruck_id)
);


-- [foodtruck-db].dbo.orders definition

-- Drop table

-- DROP TABLE [foodtruck-db].dbo.orders;

CREATE TABLE [foodtruck-db].dbo.orders (
	order_id int NOT NULL,
	foodtruck_id int NOT NULL,
	order_date date NOT NULL,
	status varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	total int NOT NULL,
	comments varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT orders_pk PRIMARY KEY (order_id),
	CONSTRAINT orders_foodtrucks_FK FOREIGN KEY (foodtruck_id) REFERENCES [foodtruck-db].dbo.foodtrucks(foodtruck_id)
);
ALTER TABLE [foodtruck-db].dbo.orders WITH NOCHECK ADD CONSTRAINT orders_check_status CHECK (([status]='pendiente' OR [status]='entregado' OR [status] IS NULL));


-- [foodtruck-db].dbo.products definition

-- Drop table

-- DROP TABLE [foodtruck-db].dbo.products;

CREATE TABLE [foodtruck-db].dbo.products (
	product_id int NOT NULL,
	foodtruck_id int NOT NULL,
	name varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	price int NOT NULL,
	stock int NOT NULL,
	CONSTRAINT products_pk PRIMARY KEY (product_id),
	CONSTRAINT products_unique UNIQUE (name),
	CONSTRAINT products_foodtrucks_FK FOREIGN KEY (foodtruck_id) REFERENCES [foodtruck-db].dbo.foodtrucks(foodtruck_id)
);


-- [foodtruck-db].dbo.order_items definition

-- Drop table

-- DROP TABLE [foodtruck-db].dbo.order_items;

CREATE TABLE [foodtruck-db].dbo.order_items (
	order_item_id int NOT NULL,
	order_id int NOT NULL,
	product_id int NOT NULL,
	quantity int NOT NULL,
	CONSTRAINT order_items_pk PRIMARY KEY (order_item_id),
	CONSTRAINT order_items_orders_FK FOREIGN KEY (order_id) REFERENCES [foodtruck-db].dbo.orders(order_id),
	CONSTRAINT order_items_products_FK FOREIGN KEY (product_id) REFERENCES [foodtruck-db].dbo.products(product_id)
);
-- [foodtrack-db].dbo.products definition

-- Drop table

-- DROP TABLE [foodtrack-db].dbo.products;

CREATE TABLE [foodtrack-db].dbo.products (
	product_id int NOT NULL,
	foodtruck_id int NOT NULL,
	name varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	price int NOT NULL,
	stock int NOT NULL,
	CONSTRAINT products_pk PRIMARY KEY (product_id),
	CONSTRAINT products_unique UNIQUE (name)
);


-- [foodtrack-db].dbo.products foreign keys

ALTER TABLE [foodtrack-db].dbo.products ADD CONSTRAINT products_foodtrucks_FK FOREIGN KEY (foodtruck_id) REFERENCES [foodtrack-db].dbo.foodtrucks(foodtruck_id);
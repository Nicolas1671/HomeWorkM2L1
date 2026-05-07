-- [foodtrack-db].dbo.orders definition

-- Drop table

-- DROP TABLE [foodtrack-db].dbo.orders;

CREATE TABLE [foodtrack-db].dbo.orders (
	order_id int NOT NULL,
	foodtruck_id int NOT NULL,
	order_date date NOT NULL,
	status varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	total int NOT NULL,
	CONSTRAINT orders_pk PRIMARY KEY (order_id)
);
ALTER TABLE [foodtrack-db].dbo.orders WITH NOCHECK ADD CONSTRAINT orders_check_status CHECK (([status]='pendiente' OR [status]='entregado' OR [status] IS NULL));


-- [foodtrack-db].dbo.orders foreign keys

ALTER TABLE [foodtrack-db].dbo.orders ADD CONSTRAINT orders_foodtrucks_FK FOREIGN KEY (foodtruck_id) REFERENCES [foodtrack-db].dbo.foodtrucks(foodtruck_id);
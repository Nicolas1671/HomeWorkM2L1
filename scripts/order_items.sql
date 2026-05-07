-- [foodtrack-db].dbo.order_items definition

-- Drop table

-- DROP TABLE [foodtrack-db].dbo.order_items;

CREATE TABLE [foodtrack-db].dbo.order_items (
	order_item_id int NOT NULL,
	order_id int NOT NULL,
	product_id int NOT NULL,
	quantity int NOT NULL,
	CONSTRAINT order_items_pk PRIMARY KEY (order_item_id)
);


-- [foodtrack-db].dbo.order_items foreign keys

ALTER TABLE [foodtrack-db].dbo.order_items ADD CONSTRAINT order_items_orders_FK FOREIGN KEY (order_id) REFERENCES [foodtrack-db].dbo.orders(order_id);
ALTER TABLE [foodtrack-db].dbo.order_items ADD CONSTRAINT order_items_products_FK FOREIGN KEY (product_id) REFERENCES [foodtrack-db].dbo.products(product_id);
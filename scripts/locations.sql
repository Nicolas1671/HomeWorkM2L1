-- [foodtrack-db].dbo.locations definition

-- Drop table

-- DROP TABLE [foodtrack-db].dbo.locations;

CREATE TABLE [foodtrack-db].dbo.locations (
	location_id int NOT NULL,
	foodtruck_id int NOT NULL,
	location_date date NOT NULL,
	[zone] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT locations_pk PRIMARY KEY (location_id)
);


-- [foodtrack-db].dbo.locations foreign keys

ALTER TABLE [foodtrack-db].dbo.locations ADD CONSTRAINT locations_foodtrucks_FK FOREIGN KEY (foodtruck_id) REFERENCES [foodtrack-db].dbo.foodtrucks(foodtruck_id);
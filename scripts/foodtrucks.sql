-- [foodtrack-db].dbo.foodtrucks definition

-- Drop table

-- DROP TABLE [foodtrack-db].dbo.foodtrucks;

CREATE TABLE [foodtrack-db].dbo.foodtrucks (
	foodtruck_id int NOT NULL,
	name varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	cuisine_type varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	city varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	CONSTRAINT foodtrucks_pk PRIMARY KEY (foodtruck_id)
);
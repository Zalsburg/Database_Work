CREATE TABLE [dbo].[Pet]
(
	[OwnerId]	INT,
	[PetName]	NVARCHAR(10),
	[Type]		NVARCHAR(10),
	PRIMARY KEY ([OwnerId], [PetName]),
	FOREIGN KEY ([OwnerId]) REFERENCES [dbo].[Owner]
)

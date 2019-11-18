CREATE TABLE [dbo].[Treatment]
(
	[ProcId] INT,
	[OwnerId]	INT,
	[PetName]	NVARCHAR(10),
	[Date]		DATE,
	[Price]		MONEY,
	[Notes]		NVARCHAR(50),
	PRIMARY KEY ([ProcId], [OwnerId], [PetName], [Date]),
	FOREIGN KEY	([ProcId]) REFERENCES [dbo].[Procedure],
	FOREIGN KEY ([OwnerId], [PetName]) REFERENCES [dbo].[Pet]
)

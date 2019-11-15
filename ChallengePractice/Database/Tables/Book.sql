CREATE TABLE [dbo].[Book]
(
	[ISBN]		BIGINT,
	[Title]		NVARCHAR(100),
	[YearPublished]	INT,
	[AuthorId]		INT,
	[StudentId]		NVARCHAR(9),
	PRIMARY KEY ([ISBN]),
	FOREIGN KEY ([AuthorId]) references [dbo].[Author],
	FOREIGN KEY ([StudentId]) references [dbo].[Student]
)

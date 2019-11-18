DELETE FROM [dbo].[Treatment];
DELETE FROM	[dbo].[Pet];
DELETE FROM	[dbo].[Owner];
DELETE FROM	[dbo].[Procedure];

INSERT INTO [dbo].[Procedure] ([ProcId], [Desc])
VALUES	(1, 'Rabies Vaccination'),
		(5, 'Heart Worm Test'),
		(8, 'Tetnus Vaccination'),
		(10, 'Examine and Treat Wound');

INSERT INTO [dbo].[Owner] ([OwnerId], [FirstName], [Surname], [Phone])
VALUES	(1, 'Frank', 'Sinatra', '0400111222'),
		(2, 'Duke', 'Ellington', '0400222333'),
		(3, 'Ella', 'Fitzgerald', '0400333444');

INSERT INTO [dbo].[Pet] ([OwnerId], [PetName], [Type])
VALUES	(1, 'Buster', 'Dog'),
		(1, 'Fluffy', 'Cat'),
		(2, 'Stew', 'Rabbit'),
		(3, 'Pooper', 'Dog'),
		(3, 'Buster', 'Dog');

INSERT INTO [dbo].[Treatment] ([ProcId], [OwnerId], [PetName], [Date], [Price], [Notes])
VALUES	(1, 1, 'Buster', '2017-06-20', 24, 'Routine Vaccination'),
		(1, 1, 'Buster', '2018-05-15', 24, 'Booster Shot'),
		(10, 1, 'Fluffy', '2018-05-10', 30, 'Wounds sustained in apparent cat fight'),
		(1, 1, 'Fluffy', '2017-06-20', 24, 'Routine Vaccination'),
		(10, 2, 'Stew', '2018-05-10', 30, 'Wounds sustained during attempt to cook the stew'),
		(1, 2, 'Stew', '2018-05-15', 24, 'Routine Vaccination'),
		(5, 3, 'Pooper', '2018-05-18', 25, 'Routine Test'),
		(8, 3, 'Buster', '2017-06-20', 17, 'Stepped on a Rusty Nail'),
		(1, 3, 'Buster', '2017-06-20', 24, 'Routine Vaccination');

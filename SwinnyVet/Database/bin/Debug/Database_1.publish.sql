﻿/*
Deployment script for 102690319

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "102690319"
:setvar DefaultFilePrefix "102690319"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
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
GO

GO
PRINT N'Update complete.';


GO

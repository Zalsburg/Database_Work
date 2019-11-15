/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

DELETE FROM [dbo].[Book];
DELETE FROM [dbo].[Student];
DELETE FROM [dbo].[Author];

INSERT INTO [dbo].[Author] (AuthorId, FirstName, Surname, TaxFileNumer)
VALUES	(32567, 'Edgar', 'Codd', 150111222),
		(76543, 'Vinton', 'Cerf', 150222333),
		(12345, 'Alan', 'Turing', 150333444);

INSERT INTO [dbo].[Student] (StudentId, FirstName, Surname, Email, Mobile)
VALUES	('s12345678', 'Fred', 'Flintstone', '12345678@student.swin.edu.au', '0400555111'),
		('s23456789', 'Barney', 'Rubble', '23456789@student.swin.edu.au', '0400555222'),
		('s34567890', 'Bam-Bam', 'Rubble', '34567890@student.swin.edu.au', '0400555333');

INSERT INTO [dbo].[Book] (ISBN, Title, YearPublished, AuthorId, StudentId)
VALUES	(9783161484100, 'Relationships with Databases, the ins and outs', 1970, 32567, NULL),
		(9783161484101, 'Normalisation, how to make a databse geek fit in', 1973, 32567, 's12345678'),
		(9783161484102, 'TCP/IP, the protocol for the masses', 1983, 76543, 's34567890'),
		(9783161484103, 'The Man, the Bombe, and the Enigma', 1940, 12345, NULL);
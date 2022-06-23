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

SET IDENTITY_INSERT [dbo].[Actors] ON
INSERT INTO [dbo].[Actors] ([Id], [ActorName], [CreatedDate]) VALUES (1, N'Keanu Reeves', SYSDATETIMEOFFSET())
INSERT INTO [dbo].[Actors] ([Id], [ActorName], [CreatedDate]) VALUES (2, N'Alex Winter', SYSDATETIMEOFFSET())
SET IDENTITY_INSERT [dbo].[Actors] OFF

SET IDENTITY_INSERT [dbo].[Movies] ON
INSERT INTO [dbo].[Movies] ([Id], [MovieName], [Rating], [YearOfRelease], [CreatedDate]) VALUES (1, N'The Matrix', 9, 1999, SYSDATETIMEOFFSET())
INSERT INTO [dbo].[Movies] ([Id], [MovieName], [Rating], [YearOfRelease], [CreatedDate]) VALUES (2, N'Bill and Ted''s Excellent Adventure', 9, 1989, SYSDATETIMEOFFSET())
INSERT INTO [dbo].[Movies] ([Id], [MovieName], [Rating], [YearOfRelease], [CreatedDate]) VALUES (3, N'The Lost Boys', 6, 1987, SYSDATETIMEOFFSET())
SET IDENTITY_INSERT [dbo].[Movies] OFF

INSERT INTO [dbo].[MovieActors] ([MovieId], [ActorId]) VALUES (1, 1)
INSERT INTO [dbo].[MovieActors] ([MovieId], [ActorId]) VALUES (2, 1)
INSERT INTO [dbo].[MovieActors] ([MovieId], [ActorId]) VALUES (2, 2)
INSERT INTO [dbo].[MovieActors] ([MovieId], [ActorId]) VALUES (3, 2)

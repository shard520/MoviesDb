CREATE PROCEDURE [dbo].[GetMoviesWithActors]
	
AS

SELECT [m].[Id],
	[m].[CreatedDate],
	[m].[Name],
	[m].[Rating],
	[m].[UpdatedDate],
	[m].[YearOfRelease],
	[t].[ActorId],
	[t].[MovieId],
	[t].[Id],
	[t].[CreatedDate],
	[t].[Name],
	[t].[UpdatedDate]
FROM [MoviesDb].[dbo].Movies AS [m]
LEFT JOIN (
SELECT [m0].[ActorId], [m0].[MovieId], [a].[Id], [a].[CreatedDate], [a].[Name], [a].[UpdatedDate]
FROM [MoviesDb].[dbo].[MovieActors] AS [m0]
INNER JOIN [MoviesDb].[dbo].[Actors] AS [a] ON [m0].[ActorId] = [a].[Id]
)
AS [t] ON [m].[Id] = [t].[MovieId]
ORDER BY [m].[Id], [t].[ActorId], [t].[MovieId]

RETURN 0

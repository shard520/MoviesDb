CREATE PROCEDURE [dbo].[GetMoviesWithActors]
	
AS

SELECT * FROM Movies AS m
LEFT JOIN MovieActors AS ma ON m.Id = ma.MovieId
RIGHT JOIN Actors AS a ON a.Id = ma.ActorId
ORDER BY m.Id, a.Id

RETURN 0

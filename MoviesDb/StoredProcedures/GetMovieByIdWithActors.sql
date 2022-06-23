CREATE PROCEDURE [dbo].[GetMovieByIdWithActors]
	@Id int
AS

SELECT * FROM Movies AS m
LEFT JOIN MovieActors AS ma ON m.Id = ma.MovieId
RIGHT JOIN Actors AS a ON a.Id = ma.ActorId
WHERE m.Id = @Id
ORDER BY m.Id, a.Id

RETURN 0

CREATE PROCEDURE [dbo].[DeleteMovieAndMovieActors]
	@Id INT 
AS
	
BEGIN

DELETE FROM MovieActors WHERE MovieId = @Id
DELETE FROM Movies WHERE Id = @Id
RETURN @@ROWCOUNT

END
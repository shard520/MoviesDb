CREATE PROCEDURE GetMovieIdFromName
	@MovieName varchar(50)
AS

DECLARE @Id int

SELECT @Id = Id FROM [dbo].[Movies]
WHERE MovieName = @MovieName

RETURN @Id

GO

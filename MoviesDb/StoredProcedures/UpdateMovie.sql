CREATE PROCEDURE [dbo].[UpdateMovie]
	@Id int,
	@MovieName NVARCHAR(50),
	@YearOfRelease INT,
	@Rating DECIMAL(2,1)
AS
SET NOCOUNT ON
BEGIN

MERGE Movies AS Source
USING (SELECT
		@Id as Id,
		@MovieName AS MovieName, 
		@YearOfRelease AS YearOfRelease,
		@Rating AS Rating
	  ) AS Target
ON (Source.Id = Target.Id)

WHEN MATCHED THEN
UPDATE SET 
MovieName = @MovieName,
YearOfRelease = @YearOfRelease,
Rating = @Rating,
UpdatedDate = GETUTCDATE();

SELECT * FROM Movies AS m
LEFT JOIN MovieActors AS ma ON m.Id = ma.MovieId
RIGHT JOIN Actors AS a ON a.Id = ma.ActorId
WHERE m.Id = @Id
END
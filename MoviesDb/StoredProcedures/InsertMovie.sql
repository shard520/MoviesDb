CREATE PROCEDURE [dbo].[InsertMovie]
	@MovieName NVARCHAR(50),
	@YearOfRelease INT,
	@Rating DECIMAL(2,1)
AS
SET NOCOUNT ON
BEGIN

MERGE Movies AS Source
USING (SELECT 
		@MovieName AS MovieName, 
		@YearOfRelease AS YearOfRelease,
		@Rating AS Rating
	  ) AS Target
ON (Source.MovieName = Target.MovieName)

WHEN NOT MATCHED THEN
	INSERT 
	(MovieName, YearOfRelease, Rating, CreatedDate) 
	VALUES (Target.MovieName, 
			Target.YearOfRelease, 
			Target.Rating, 
			GETUTCDATE()
			);
	
IF(SCOPE_IDENTITY() IS NULL) 
	RETURN (SELECT Id FROM Movies WHERE MovieName = @MovieName)
ELSE
	RETURN SCOPE_IDENTITY();

SET NOCOUNT OFF
END
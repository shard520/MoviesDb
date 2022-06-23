CREATE PROCEDURE [dbo].[MergeMovie]
	@Id INT NULL,
	@MovieName NVARCHAR(50),
	@Rating DECIMAL(2, 1) NULL,
	@YearOfRelease INT NULL

AS

MERGE [dbo].[Movies] AS Target
USING (SELECT Id = @Id,
		CreatedDate = SYSUTCDATETIME(),
		MovieName = @MovieName,
		Rating = @Rating,
		YearOfRelease = @YearOfRelease) AS Source
ON Target.Id = Source.ID Or Target.MovieName = Source.MovieName

WHEN NOT MATCHED BY Target THEN
	INSERT (CreatedDate,
		MovieName,
		Rating,
		YearOfRelease)
	VALUES (Source.CreatedDate,
		Source.MovieName,
		Source.Rating,
		Source.YearOfRelease)

WHEN MATCHED THEN UPDATE SET
	Target.MovieName = Source.MovieName,
	Target.Rating = Source.Rating,
	Target.UpdatedDate = SYSUTCDATETIME(),
	Target.YearOfRelease = Source.YearOfRelease

OUTPUT $action, DELETED.*, INSERTED.*;
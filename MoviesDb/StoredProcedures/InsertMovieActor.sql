CREATE PROCEDURE [dbo].[InsertMovieActor]
	@MovieId INT,
	@ActorId INT
AS
SET NOCOUNT ON
BEGIN

MERGE MovieActors AS Source
USING (SELECT 
	@MovieId AS MovieId, 
	@ActorId AS ActorId
	) AS Target
ON (
	Source.MovieId = Target.MovieId 
	AND 
	Source.ActorId = Target.ActorId
	)

WHEN NOT MATCHED THEN
	INSERT 
	(MovieId, ActorId) 
	VALUES (Target.MovieId, Target.ActorId);

SET NOCOUNT OFF
END
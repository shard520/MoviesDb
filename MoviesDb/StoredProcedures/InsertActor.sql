CREATE PROCEDURE [dbo].[InsertActor]
	@ActorName NVARCHAR(50)
AS
SET NOCOUNT ON
BEGIN

MERGE Actors AS Source
USING (SELECT @ActorName AS ActorName) AS Target
ON (Source.ActorName = Target.ActorName)

WHEN NOT MATCHED THEN
	INSERT 
	(ActorName, CreatedDate) 
	VALUES (Target.ActorName, GETUTCDATE());
	
IF(SCOPE_IDENTITY() IS NULL) 
	RETURN (SELECT Id FROM Actors WHERE ActorName = @ActorName)
ELSE
	RETURN SCOPE_IDENTITY();

SET NOCOUNT OFF
END
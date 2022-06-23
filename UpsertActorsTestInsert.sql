DECLARE @ImportTable [dbo].[TempActorsTableForBulkUpsert]

INSERT INTO @ImportTable ([Id],[ActorName], [CreatedDate])
VALUES(3, 'Kevin Costner', '2022-06-14 19:30:58.4308361'),
	  (4, 'Dennis Hopper', '2022-06-14 19:30:58.4308361'),
	  (5, 'Tina Majorino', '2022-06-14 19:30:58.4308361')

EXECUTE [dbo].[InsertActors] @ImportTable




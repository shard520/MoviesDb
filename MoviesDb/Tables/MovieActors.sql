CREATE TABLE [dbo].[MovieActors]
(
    [MovieId] INT NOT NULL, 
    [ActorId] INT NOT NULL, 
    CONSTRAINT [FK_MovieActors_Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movies]([Id]) ON DELETE CASCADE, 
    CONSTRAINT [FK_MovieActors_Actor_ActorId] FOREIGN KEY (ActorId) REFERENCES [Actors]([Id]) ON DELETE CASCADE, 
    CONSTRAINT [PK_MovieActors] PRIMARY KEY ([MovieId], [ActorId])
)

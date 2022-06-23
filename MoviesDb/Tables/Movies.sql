CREATE TABLE [dbo].[Movies] 
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [MovieName] NVARCHAR(50) NOT NULL UNIQUE, 
    [YearOfRelease] INT NULL, 
    [Rating] DECIMAL(2, 1) NULL, 
    [CreatedDate] DATETIME2(7) NOT NULL, 
    [UpdatedDate] DATETIME2(7) NULL 
)

CREATE TABLE [dbo].[Movies] 
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [YearOfRelease] INT NULL, 
    [Rating] DECIMAL(2, 1) NULL, 
    [CreatedDate] DATETIMEOFFSET NOT NULL, 
    [UpdatedDate] DATETIMEOFFSET NULL 
)

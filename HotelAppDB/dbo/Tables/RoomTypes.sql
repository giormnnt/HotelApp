﻿CREATE TABLE [dbo].[RoomTypes]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Title] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(3000) NOT NULL, 
    [Price] MONEY NOT NULL
)

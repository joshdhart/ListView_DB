﻿CREATE TABLE [dbo].[UserAccounts]
(
	[AccountId] INT IDENTITY (1,1) NOT NULL PRIMARY KEY, 
	[Email] NVARCHAR(200) UNIQUE NOT NULL,
    [DoB] DATE NOT NULL, 
    [Password] NVARCHAR(100) NOT NULL, 
    [Location] NVARCHAR(100) NOT NULL
)

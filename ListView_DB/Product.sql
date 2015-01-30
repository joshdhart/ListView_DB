CREATE TABLE [dbo].[Product]
(
	[ProductId] INT IDENTITY (1,1) NOT NULL PRIMARY KEY, 
	[SellerId] INT NOT NULL FOREIGN KEY REFERENCES UserAccounts([AccountId]), 
    [Title] NVARCHAR(100) NOT NULL, 
	[Category] NVARCHAR(200) NOT NULL,
    [Price] MONEY NOT NULL, 
    [VideoURL] NVARCHAR(MAX) NULL, 
	[ContactEmail] NVARCHAR(200) NULL,
	[ContactPhone] VARCHAR(18) NULL, 
    [Location] NVARCHAR(100) NOT NULL, 
    [Description] NVARCHAR(MAX) NOT NULL
)

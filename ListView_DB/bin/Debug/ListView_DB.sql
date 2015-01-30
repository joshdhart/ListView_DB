﻿/*
Deployment script for ListView_DB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "ListView_DB"
:setvar DefaultFilePrefix "ListView_DB"
:setvar DefaultDataPath "C:\Users\SP_Dev\AppData\Local\Microsoft\VisualStudio\SSDT\ListView_DB"
:setvar DefaultLogPath "C:\Users\SP_Dev\AppData\Local\Microsoft\VisualStudio\SSDT\ListView_DB"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

MERGE INTO UserAccounts As Target
USING (VALUES
		(1, 'josh_hartwell@msn.com', '10/24/1992', 'password', 'Portland-Metro'),
		(2, 'admin@listview.com', '12/1/2014', 'admin', 'Beaverton-Hillsboro')
)
AS Source (AccountId, Email, DoB, Password, Location)
ON Target.AccountId = Source.AccountId
WHEN NOT MATCHED BY  TARGET THEN
INSERT (Email, DoB, Password, Location)
VALUES (Email, DoB, Password, Location);


MERGE INTO Product As Target
USING (VALUES
		(1, 1, 'Office Chair', 'Furniture', 50.00, '//www.youtube.com/embed/gm5lan6Hkl4', 
		'josh_hartwell@msn.com', '503-111-1111', 'Portland-Metro', 'Extremely cushy and comfy chair. Great condition!')
)
AS Source (ProductId, SellerId, Title, Category, Price, VideoURL, ContactEmail, ContactPhone, Location, Description)
ON Target.ProductId = Source.ProductId
WHEN NOT MATCHED BY  TARGET THEN
INSERT (SellerId, Title, Category, Price, VideoURL, ContactEmail, ContactPhone, Location, Description)
VALUES (SellerId, Title, Category, Price, VideoURL, ContactEmail, ContactPhone, Location, Description);
GO

GO
PRINT N'Update complete.';


GO

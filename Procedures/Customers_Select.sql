USE [CustomerLib_Naida];

GO

CREATE PROCEDURE [dbo].[Customers_Select]

	@CustomerID int

AS
BEGIN

	SELECT * FROM [dbo].[Customers]
	WHERE [CustomerID] = @CustomerID;

END

GO

EXECUTE [dbo].[Customers_Select] @CustomerID = 1;
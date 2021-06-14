USE [CustomerLib_Naida];

GO

CREATE PROCEDURE [dbo].[Addresses_Select]

	@AddressID int

AS
BEGIN

	SELECT * FROM [dbo].[Addresses]
	WHERE [AddressID] = @AddressID;

END

GO

EXECUTE [dbo].[Addresses_Select] @AddressID = 1;
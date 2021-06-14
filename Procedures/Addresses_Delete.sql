USE [CustomerLib_Naida];

GO

CREATE PROCEDURE [dbo].[Addresses_Delete]

	@AddressID int

AS
BEGIN

	DELETE FROM [dbo].[Addresses]
	WHERE [AddressID] = @AddressID;

END

GO

EXECUTE [dbo].[Addresses_Delete] @AddressID = 1;
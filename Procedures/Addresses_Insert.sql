USE [CustomerLib_Naida];

GO

CREATE PROCEDURE [dbo].[Addresses_Insert]

	@CustomerID int,
	@AddressLine nvarchar(100),
	@AddressLine2 nvarchar(100),
	@AddressType nvarchar(10),
	@City nvarchar(50),
	@PostalCode nvarchar(6),
	@State nvarchar(20),
	@Country nvarchar(15)

AS
BEGIN

	INSERT INTO [dbo].[Addresses] (
		[CustomerID], 
		[AddressLine], 
		[AddressLine2], 
		[AddressType], 
		[City], 
		[PostalCode], 
		[State], 
		[Country]
	) VALUES (
		@CustomerID, 
		@AddressLine, 
		@AddressLine2, 
		@AddressType, 
		@City, 
		@PostalCode, 
		@State, 
		@Country
	);

END

GO

EXECUTE [dbo].[Addresses_Insert] 
	@CustomerID = 1, 
	@AddressLine = 'Some address',  
	@AddressLine2 = 'continues', 
	@AddressType = 'Shipping',
	@City = 'New York',
	@PostalCode = '123456',
	@State = 'NY',
	@Country = 'United States';
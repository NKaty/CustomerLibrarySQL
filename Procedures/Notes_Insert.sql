USE [CustomerLib_Naida];

GO

CREATE PROCEDURE [dbo].[Notes_Insert]

	@CustomerID int,
	@Note nvarchar(500)

AS
BEGIN

	INSERT INTO [dbo].[Notes] (
		[CustomerID],
		[Note]
	) VALUES (
		@CustomerID,
		@Note
	);

END

GO

EXECUTE [dbo].[Notes_Insert]
	@CustomerID=1,
	@Note='Note1';
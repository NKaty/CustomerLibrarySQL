USE [CustomerLib_Naida];

GO

CREATE PROCEDURE [dbo].[Notes_Update]

	@NoteID int,
	@CustomerID int,
	@Note nvarchar(500)

AS
BEGIN

	UPDATE [dbo].[Notes]
	SET [CustomerID] = @CustomerID,
		[Note] = @Note
	WHERE [NoteID] = @NoteID;

END

GO

EXECUTE [dbo].[Notes_Update]
	@NoteID=1,
	@CustomerID=1,
	@Note='Note2';
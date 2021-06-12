USE [CustomerLib_Naida];

GO

CREATE PROCEDURE [dbo].[Notes_Delete]

	@NoteID int

AS
BEGIN

	DELETE FROM [dbo].[Notes]
	WHERE [NoteID] = @NoteID;

END

GO

EXECUTE [dbo].[Notes_Delete] @NoteID=1;
USE [CustomerLib_Naida];

GO

CREATE PROCEDURE [dbo].[Notes_Select]

	@NoteID int

AS
BEGIN

	SELECT * FROM [dbo].[Notes]
	WHERE [NoteID] = @NoteID;

END

GO

EXECUTE [dbo].[Notes_Select] @NoteID=1;
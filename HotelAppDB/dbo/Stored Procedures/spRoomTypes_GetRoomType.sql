CREATE PROCEDURE [dbo].[spRoomTypes_GetRoomType]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * 
	FROM dbo.RoomTypes t
	WHERE t.Id = @Id
END

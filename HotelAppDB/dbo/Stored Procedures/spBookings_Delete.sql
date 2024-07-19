CREATE PROCEDURE [dbo].[spBookings_Delete]
	@Id int
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM dbo.Bookings
	WHERE Id = @Id
END

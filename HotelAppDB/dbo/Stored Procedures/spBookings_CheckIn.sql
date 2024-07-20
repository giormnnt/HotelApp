CREATE PROCEDURE [dbo].[spBookings_CheckIn]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Bookings
	SET CheckIn = CASE WHEN CheckIn = 1 THEN 0 ELSE 1 END
	WHERE Id = @Id
END

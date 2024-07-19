using HotelAppLibrary.Models;

namespace HotelAppLibrary.Data
{
    public interface ISqlData
    {
        void BookGuest(string firstName, string lastName, DateTime startDate, DateTime endDate, int roomTypeId);
        void CheckInGuest(int bookingId);
        void DeleteBooking(int bookingId);
        List<RoomTypeModel> GetAvailableRoomTypes(DateTime startDate, DateTime endDate);
        List<BookingFullModel> SearchBookings(string lastName);
    }
}
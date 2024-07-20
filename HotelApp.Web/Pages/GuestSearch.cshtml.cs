using HotelAppLibrary.Data;
using HotelAppLibrary.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;

namespace HotelApp.Web.Pages
{
    public class GuestSearchModel : PageModel
    {
        private readonly IDatabaseData _db;

        public GuestSearchModel(IDatabaseData db)
        {
            _db = db;
        }

        [Display(Name = "Last Name")]
        [BindProperty(SupportsGet = true)] 
        public string LastName { get; set; }

        [BindProperty(SupportsGet = true)]
        public bool SearchEnabled { get; set; } = false;

        public List<BookingFullModel> Bookings { get; set; }

        public void OnGet()
        {
            if (SearchEnabled)
            {
                Bookings = _db.SearchBookings(LastName);
            }
        }

        public IActionResult OnPost()
        {
            return RedirectToPage(new
            {
                SearchEnabled = true,
                LastName 
            });
        }

        public IActionResult OnPostCheckIn(int bookingId)
        {
            _db.CheckInGuest(bookingId);
            return RedirectToPage(new
            {
                SearchEnabled = true,
                LastName
            });
        }
    }
}

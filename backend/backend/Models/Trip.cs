﻿using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    public class Trip
    {
        public int Id { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime FinishTime { get; set; }
        public double TicketPrice { get; set; }
        public int BusId { get; set; }
        public int DriverId { get; set; }
        public int? FromStationId { get; set; }
        public int? ToStationId { get; set; }
        public IEnumerable<Seat>? Seats { get; set; }
        public Bus? Bus { get; set; }
        public Driver? Driver { get; set; }
        public Station? FromStation { get; set; }
        public Station? ToStation { get; set; }
        public string? Image { get; set; }
        [NotMapped]
        public IFormFile? UploadImage { get; set; }
    }
}
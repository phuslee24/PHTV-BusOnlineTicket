﻿namespace backend.Models
{
    public class Ticket
    {
        public int Id { get; set; }
        public string? Code { get; set; }
        public int TripId { get; set; }
        public Trip? Trips { get; set; }
        public int UserId { get; set; }
        public User? Users { get; set; }
        public string? SeatsList { get; set; }
        public double? TotalPrice { get; set; }
        public bool? isCancel { get; set; } = false;
        public string? Note { get; set; }
        public DateTime? BookDate { get; set; } = DateTime.Now;
    }
}
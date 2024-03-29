﻿
using backend.IRepository;
using backend.Models;
using Microsoft.EntityFrameworkCore;
using System.Globalization;

namespace backend.Services
{
    public class TripService : ITripRepo
    {
        private readonly DatabaseContext db;
        private readonly IWebHostEnvironment env;

        public TripService(DatabaseContext db, IWebHostEnvironment env)
        {
            this.db = db;
            this.env = env;
        }

        public static int PAGE_SIZE { get; set; } = 5;

        public async Task<IEnumerable<Trip>> GetAllTrip()
        {
            return await db.Trips
                .Select(t => new Trip()
                {
                    Id = t.Id,
                    Image = t.Image,
                    BusId = t.BusId,
                    Bus = db.Buses.Where(b => b.Id == t.BusId)
                        .Select(b => new Bus()
                        {
                            Id = b.Id,
                            BusPlate = b.BusPlate,
                            BusType = b.BusType
                        }).SingleOrDefault(),
                    Driver = db.Drivers.Where(d => d.Id == t.DriverId)
                        .Select(n => new Driver()
                        {
                            FullName = n.FullName,
                            Phone = n.Phone,
                            Email = n.Email
                        }).SingleOrDefault(),
                    FromStation = db.Stations.Where(s => s.Id == t.FromStationId).SingleOrDefault(),
                    ToStation = db.Stations.Where(s => s.Id == t.ToStationId).SingleOrDefault(),
                    StartTime = t.StartTime,
                    FinishTime = t.FinishTime,
                    TicketPrice = t.TicketPrice,
                    Seats = db.Seats.Where(s => s.TripId == t.Id).ToList(),
                })
                .ToListAsync();
        }

        public async Task<IEnumerable<Trip>> GetTripById(int Id)
        {
            return await db.Trips.Include(b => b.Bus).ThenInclude(b => b.BusType).Include(d => d.Driver).Include(s => s.FromStation).Include(s => s.ToStation).Include(s => s.Seats).Where(b => b.Id == Id).ToListAsync();
        }

        public async Task<bool> CreateTrip(Trip Trip)
        {
            try
            {
                var oldTrip = db.Trips.Where(t => t.BusId == Trip.BusId && t.DriverId == Trip.DriverId && Trip.StartTime > t.StartTime && Trip.StartTime < t.FinishTime).Any();
                if (oldTrip == false)
                {
                    Bus bus = db.Buses.Where(b => b.Id == Trip.BusId).FirstOrDefault();
                    Station fromStation = db.Stations.Where(s => s.Id == Trip.FromStationId).FirstOrDefault();
                    Station toStation = db.Stations.Where(s => s.Id == Trip.ToStationId).FirstOrDefault();
                    Driver driver = db.Drivers.Where(s => s.Id == Trip.DriverId).FirstOrDefault();
                    List<Seat> seats = await db.Seats.Where(s => s.TripId == Trip.Id).ToListAsync();

                    Trip.Bus = bus;
                    Trip.FromStation = fromStation;
                    Trip.ToStation = toStation;
                    Trip.Driver = driver;
                    Trip.Seats = seats;

                    if (Trip.UploadImage != null)
                    {
                        string pathToNewFolder = System.IO.Path.Combine("Images", "Trip");
                        DirectoryInfo directory = Directory.CreateDirectory(pathToNewFolder);
                        var upload = Path.Combine(env.ContentRootPath, pathToNewFolder);
                        var filePath = Path.Combine(Path.GetRandomFileName() + Trip.UploadImage.FileName);

                        using (var stream = new FileStream(Path.Combine(upload, filePath), FileMode.Create))
                        {
                            await Trip.UploadImage.CopyToAsync(stream);
                        }

                        Trip.Image = filePath;
                    }

                    await db.Trips.AddAsync(Trip);
                    await db.SaveChangesAsync();

                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public async Task<Trip> DeleteTrip(int Id)
        {
            var ExistingTrip = await db.Trips.SingleOrDefaultAsync(b => b.Id == Id);
            if (ExistingTrip != null)
            {

                if (!string.IsNullOrEmpty(ExistingTrip.Image))
                {
                    var upload = Path.Combine(env.ContentRootPath, "Images/Trip");
                    if (System.IO.File.Exists(Path.Combine(upload, ExistingTrip.Image)))
                    {
                        System.IO.File.Delete(Path.Combine(upload, ExistingTrip.Image)); // Xóa tệp tin ảnh
                    }
                }

                db.Trips.Remove(ExistingTrip);
                int result = await db.SaveChangesAsync();
                if (result > 0)
                {
                    return ExistingTrip;
                }
            }
            return null;
        }
        public async Task<IEnumerable<Trip>> GetTripByDriverId(int Id)
        {
            return await db.Trips.Include(b => b.Bus).ThenInclude(b => b.BusType).Include(d => d.Driver).Include(s => s.FromStation).Include(s => s.ToStation).Where(i => i.DriverId == Id).ToListAsync();
        }
        public async Task<bool> PutTrip(int Id, Trip Trip)
        {
            var ExistingTrip = await db.Trips.SingleOrDefaultAsync(t => t.Id == Id);
            if (ExistingTrip != null && ExistingTrip.Seats.Count() == 0)
            {
                if (Trip.UploadImage != null)
                {
                    string pathToNewFolder = System.IO.Path.Combine("Images", "Trip");
                    DirectoryInfo directory = Directory.CreateDirectory(pathToNewFolder);
                    var upload = Path.Combine(env.ContentRootPath, pathToNewFolder);
                    var filePath = Path.Combine(Path.GetRandomFileName() + Trip.UploadImage.FileName);

                    using (var stream = new FileStream(Path.Combine(upload, filePath), FileMode.Create))
                    {
                        await Trip.UploadImage.CopyToAsync(stream);
                    }

                    if (!string.IsNullOrEmpty(ExistingTrip.Image))
                    {


                        if (System.IO.File.Exists(Path.Combine(upload, ExistingTrip.Image)))
                        {
                            System.IO.File.Delete(Path.Combine(upload, ExistingTrip.Image));
                        }
                    }
                    ExistingTrip.Image = filePath;
                }
                Bus bus = db.Buses.Where(b => b.Id == Trip.BusId).FirstOrDefault();
                Station fromStation = db.Stations.Where(s => s.Id == Trip.FromStationId).FirstOrDefault();
                Station toStation = db.Stations.Where(s => s.Id == Trip.ToStationId).FirstOrDefault();
                Driver driver = db.Drivers.Where(s => s.Id == Trip.DriverId).FirstOrDefault();

                ExistingTrip.Bus = bus;
                ExistingTrip.FromStation = fromStation;
                ExistingTrip.ToStation = toStation;
                ExistingTrip.FinishTime = Trip.FinishTime;
                ExistingTrip.StartTime = Trip.StartTime;
                ExistingTrip.TicketPrice = Trip.TicketPrice;
                ExistingTrip.Driver = driver;

                int Result = await db.SaveChangesAsync();
                if (Result > 0)
                {
                    return true;
                }
            }
            return false;
        }


        public List<Trip> OptionsAsDesired(string? searchBusType, string? fromPrice, string? toPrice, string? sort, string? from, string? to, string? dayStart, int page = 1)
        {

            var allTrips = db.Trips.Include(b => b.Bus).ThenInclude(b => b.BusType).Include(d => d.Driver).Include(s => s.FromStation).Include(s => s.ToStation).Include(s => s.Seats).Where(x => x.StartTime >= DateTime.Today).AsQueryable();
            var a = searchBusType;
            if (!string.IsNullOrEmpty(searchBusType))
            {
                List<string> list = searchBusType.Split(",").ToList();
                if (list.Any())
                {
                    allTrips = allTrips.Where(tr => list.Contains(tr.Bus.BusType.Name));
                }
            }
            if (!string.IsNullOrEmpty(from))
            {
                allTrips = allTrips.Where(tr => tr.FromStation.Name == from);
            }

            if (!string.IsNullOrEmpty(to))
            {

                allTrips = allTrips.Where(tr => tr.ToStation.Name == to);
            }
            if (!string.IsNullOrEmpty(dayStart))
            {
                allTrips = allTrips.Where(tr => tr.StartTime.Date == DateTime.ParseExact(dayStart, "dd-MM-yyyy", CultureInfo.InvariantCulture));
            }
            if (!string.IsNullOrEmpty(fromPrice))
            {
                allTrips = allTrips.Where(tr => tr.TicketPrice >= double.Parse(fromPrice));
            }

            if (!string.IsNullOrEmpty(toPrice))
            {

                allTrips = allTrips.Where(tr => tr.TicketPrice <= double.Parse(toPrice));
            }



            if (!string.IsNullOrEmpty(sort))
            {
                switch (sort)
                {
                    case "lowest-price":
                        allTrips = allTrips.OrderBy(trip => trip.TicketPrice);
                        break;
                    case "highest-price":
                        allTrips = allTrips.OrderByDescending(trip => trip.TicketPrice);
                        break;
                    case "earliest-departure":
                        allTrips = allTrips.OrderBy(trip => trip.StartTime);
                        break;
                    case "latest-departure":
                        allTrips = allTrips.OrderByDescending(trip => trip.StartTime);
                        break;

                }
            }




            allTrips = allTrips.Skip((page - 1) * PAGE_SIZE).Take(PAGE_SIZE);

            var result = allTrips.Select(trip => new Trip
            {
                Id = trip.Id,
                StartTime = trip.StartTime,
                FinishTime = trip.FinishTime,
                TicketPrice = trip.TicketPrice,
                BusId = trip.BusId,
                FromStationId = trip.FromStationId,
                ToStationId = trip.ToStationId,
                FromStation = trip.FromStation,
                ToStation = trip.ToStation,
                Driver = trip.Driver,
                Seats = trip.Seats.ToList(),
                Bus = trip.Bus,
                Image = trip.Image
            });

            return result.ToList();
        }

        public async Task<IEnumerable<Profit>> GetProfitByTrip(int year)
        {
            return await db.Trips
                .Where(t => t.StartTime.Year == year)
                .GroupBy(p => new { p.FromStationId, p.ToStationId })
                .Select(t => new Profit
                {
                    FromStationId = t.Key.FromStationId,
                    FromStation = db.Stations.Where(o => o.Id == t.Key.FromStationId).Select(s => new Station { Name = s.Name }).FirstOrDefault(),
                    ToStationId = t.Key.ToStationId,
                    ToStation = db.Stations.Where(o => o.Id == t.Key.ToStationId).Select(s => new Station { Name = s.Name }).FirstOrDefault(),
                    TotalProfit = db.Tickets.Where(x => x.Trips.FromStationId == t.Key.FromStationId && x.Trips.ToStationId == t.Key.ToStationId && x.BookDate.Value.Year == year).Sum(x => x.TotalPrice),
                })
                .ToListAsync();
        }
    }




}

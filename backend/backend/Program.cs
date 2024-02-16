﻿using backend.IRepository;
using backend.Models;
using backend.Services;
using backend.Settings;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.FileProviders;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<DatabaseContext>(op => op.UseSqlServer(builder.Configuration.GetConnectionString("MyConnection")));

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(option =>
{
    option.RequireHttpsMetadata = false;
    option.SaveToken = true;
    option.TokenValidationParameters = new TokenValidationParameters()
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidAudience = builder.Configuration["Jwt:Audience"],
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        IssuerSigningKey = new SymmetricSecurityKey
            (Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
    };
});


builder.Services.AddScoped<ITripRepo, TripService>();
builder.Services.AddScoped<IBusRepo, BusService>();
builder.Services.AddScoped<IStationRepo, StationService>();
builder.Services.AddScoped<IDriverRepo, DriverService>();
builder.Services.AddScoped<IUserRepo, UserService>();
builder.Services.AddScoped<IBusTypeRepo, BusTypeService>();
builder.Services.AddScoped<ISeatRepo, SeatService>();
builder.Services.AddScoped<ITicketRepo, TicketService>();
builder.Services.AddScoped<IFAQrepo, FAQService>();
builder.Services.AddScoped<IPromoteTripRepo, PromoteTripService>();
builder.Services.AddScoped<ISendMail, SendMailService>();
builder.Services.AddScoped<INewRepo, NewsService>();
builder.Services.AddScoped<IOfferRepo, OfferService>();
builder.Services.AddScoped<ICommentRepo, CommentService>();

builder.Services.Configure<MailSetting>(builder.Configuration.GetSection("MailSettings"));
//fix lỗi json bị vòng lặp 
builder.Services.AddControllers().AddJsonOptions(x =>
                x.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);

builder.Services.AddCors(o =>
{
    o.AddPolicy("MyAppCors", policy =>
    {
        policy.WithOrigins(builder.Configuration.GetSection("AllowedOrigins").Get<string[]>())
        .AllowAnyHeader()
        .AllowAnyMethod()
        .AllowAnyOrigin();
    });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(
           Path.Combine(builder.Environment.ContentRootPath, "Images")),
    RequestPath = "/Images"
});

app.UseHttpsRedirection();

app.UseAuthorization();

app.UseCors("MyAppCors");

app.MapControllers();

app.Run();
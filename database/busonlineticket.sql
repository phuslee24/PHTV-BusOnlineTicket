USE [master]
GO
/****** Object:  Database [busOnlineTicket]    Script Date: 01/02/2024 11:49:16 AM ******/
CREATE DATABASE [busOnlineTicket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'busOnlineTicket', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\busOnlineTicket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'busOnlineTicket_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\busOnlineTicket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [busOnlineTicket] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [busOnlineTicket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [busOnlineTicket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [busOnlineTicket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [busOnlineTicket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [busOnlineTicket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [busOnlineTicket] SET ARITHABORT OFF 
GO
ALTER DATABASE [busOnlineTicket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [busOnlineTicket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [busOnlineTicket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [busOnlineTicket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [busOnlineTicket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [busOnlineTicket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [busOnlineTicket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [busOnlineTicket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [busOnlineTicket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [busOnlineTicket] SET  ENABLE_BROKER 
GO
ALTER DATABASE [busOnlineTicket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [busOnlineTicket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [busOnlineTicket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [busOnlineTicket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [busOnlineTicket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [busOnlineTicket] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [busOnlineTicket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [busOnlineTicket] SET RECOVERY FULL 
GO
ALTER DATABASE [busOnlineTicket] SET  MULTI_USER 
GO
ALTER DATABASE [busOnlineTicket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [busOnlineTicket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [busOnlineTicket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [busOnlineTicket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [busOnlineTicket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [busOnlineTicket] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'busOnlineTicket', N'ON'
GO
ALTER DATABASE [busOnlineTicket] SET QUERY_STORE = ON
GO
ALTER DATABASE [busOnlineTicket] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [busOnlineTicket]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusPlate] [nvarchar](450) NOT NULL,
	[BusTypeId] [int] NULL,
	[StationId] [nvarchar](max) NULL,
	[Enabled] [bit] NOT NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Buses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusStations]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusStations](
	[BusId] [int] NOT NULL,
	[StationId] [int] NOT NULL,
 CONSTRAINT [PK_BusStations] PRIMARY KEY CLUSTERED 
(
	[BusId] ASC,
	[StationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusTypes]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[NumberOfSeat] [int] NOT NULL,
 CONSTRAINT [PK_BusTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[NewsId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Avatar] [nvarchar](max) NULL,
	[NationalId] [nvarchar](max) NOT NULL,
	[DriverLicense] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[YearOfBirth] [datetime2](7) NULL,
	[PlaceOfBirth] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[Enabled] [bit] NOT NULL,
	[isApprove] [bit] NOT NULL,
 CONSTRAINT [PK_Drivers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FAQs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[DayCreateNew] [datetime2](7) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offers]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[OfferCode] [nvarchar](max) NOT NULL,
	[Discount] [float] NOT NULL,
	[FromStation] [nvarchar](max) NULL,
	[ToStation] [nvarchar](max) NULL,
	[BeginDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[Enabled] [bit] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Offers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromoteTrips]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromoteTrips](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromStation] [nvarchar](max) NULL,
	[ToStation] [nvarchar](max) NULL,
	[MinPrice] [float] NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_PromoteTrips] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[TripId] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stations]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Stations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[TripId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[SeatsList] [nvarchar](max) NULL,
	[TotalPrice] [float] NULL,
	[isCancel] [bit] NULL,
	[Note] [nvarchar](max) NULL,
	[BookDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trips]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trips](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[FinishTime] [datetime2](7) NOT NULL,
	[TicketPrice] [float] NOT NULL,
	[BusId] [int] NOT NULL,
	[DriverId] [int] NOT NULL,
	[FromStationId] [int] NULL,
	[ToStationId] [int] NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Trips] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01/02/2024 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Avatar] [nvarchar](max) NULL,
	[Role] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240201032332_Init', N'7.0.14')
GO
SET IDENTITY_INSERT [dbo].[Buses] ON 

INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (1, N'59A1-55999', 1, N'3,1,2', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (2, N'59A1-55998', 2, N'4,5,7', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (3, N'59A1-55997', 3, N'2,4', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (4, N'59A1-55996', 4, N'18,17,16,19', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (5, N'59A1-55995', 1, N'1', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (6, N'59A1-55994', 2, N'6,7', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (8, N'59A1-55992', 4, N'16,17', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (9, N'59A1-55991', 1, N'16,17,15,14,13,12', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (10, N'59A1-55900', 2, N'12,13', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (11, N'59A1-55901', 3, N'2,3,4', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (12, N'59A1-55902', 4, N'2,5', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (13, N'59A1-55903', 1, N'20,11', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (14, N'59A1-55904', 2, N'8,10,9', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (15, N'59A1-55905', 3, N'1,2,3', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (16, N'59A1-55906', 4, N'1,2', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (17, N'59A1-55907', 1, N'1,2,6', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (18, N'59A1-55908', 2, N'4,5', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (19, N'59A1-55909', 3, N'5,6', 1, NULL)
INSERT [dbo].[Buses] ([Id], [BusPlate], [BusTypeId], [StationId], [Enabled], [Note]) VALUES (20, N'59A1-55911', 4, N'6,7,8', 1, NULL)
SET IDENTITY_INSERT [dbo].[Buses] OFF
GO
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (1, 1)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (5, 1)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (15, 1)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (16, 1)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (17, 1)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (1, 2)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (3, 2)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (11, 2)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (12, 2)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (15, 2)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (16, 2)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (17, 2)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (1, 3)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (11, 3)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (15, 3)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (2, 4)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (3, 4)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (11, 4)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (18, 4)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (2, 5)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (12, 5)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (18, 5)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (19, 5)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (6, 6)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (17, 6)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (19, 6)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (20, 6)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (2, 7)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (6, 7)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (20, 7)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (14, 8)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (20, 8)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (14, 9)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (14, 10)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (13, 11)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (9, 12)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (10, 12)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (9, 13)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (10, 13)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (9, 14)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (9, 15)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (4, 16)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (8, 16)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (9, 16)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (4, 17)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (8, 17)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (9, 17)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (4, 18)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (4, 19)
INSERT [dbo].[BusStations] ([BusId], [StationId]) VALUES (13, 20)
GO
SET IDENTITY_INSERT [dbo].[BusTypes] ON 

INSERT [dbo].[BusTypes] ([Id], [Name], [NumberOfSeat]) VALUES (1, N'Express', 42)
INSERT [dbo].[BusTypes] ([Id], [Name], [NumberOfSeat]) VALUES (2, N'Luxury', 30)
INSERT [dbo].[BusTypes] ([Id], [Name], [NumberOfSeat]) VALUES (3, N'Volvo Non-AC', 12)
INSERT [dbo].[BusTypes] ([Id], [Name], [NumberOfSeat]) VALUES (4, N'Volvo AC', 9)
SET IDENTITY_INSERT [dbo].[BusTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Drivers] ON 

INSERT [dbo].[Drivers] ([Id], [FullName], [Avatar], [NationalId], [DriverLicense], [Phone], [Email], [Password], [YearOfBirth], [PlaceOfBirth], [Note], [Enabled], [isApprove]) VALUES (1, N'Nguyen Van Toan', N'driver1.png', N'2345678', N'234567', N'090123456', N'driver1@phtv.com', N'$2a$11$AbC4cIV4gxpBBat5tctuYuzLQcrlU4v9E5jfJEyoUNagBybecqJ4O', CAST(N'1995-12-25T00:00:00.0000000' AS DateTime2), N'Ho Chi Minh', NULL, 1, 1)
INSERT [dbo].[Drivers] ([Id], [FullName], [Avatar], [NationalId], [DriverLicense], [Phone], [Email], [Password], [YearOfBirth], [PlaceOfBirth], [Note], [Enabled], [isApprove]) VALUES (2, N'Le Huy Phu', N'driver2.png', N'2345678', N'234567', N'090123456', N'driver2@phtv.com', N'$2a$11$lh7HRLWVBmnyPJrTI2ElGeJtaMi0hgDThURUTnT3RdLxxZHd0HLbm', CAST(N'1998-07-12T00:00:00.0000000' AS DateTime2), N'Lam Dong', NULL, 1, 1)
INSERT [dbo].[Drivers] ([Id], [FullName], [Avatar], [NationalId], [DriverLicense], [Phone], [Email], [Password], [YearOfBirth], [PlaceOfBirth], [Note], [Enabled], [isApprove]) VALUES (3, N'Bui Quoc Viet', N'driver3.png', N'2345679', N'234568', N'090123457', N'driver3@phtv.com', N'$2a$11$UMf7iETfAk.Mod5.mwsTIeK4paS9DztweZ4b2vX8IVxB7IBv4EbBK', CAST(N'1993-07-06T00:00:00.0000000' AS DateTime2), N'Binh Thuam', NULL, 1, 1)
INSERT [dbo].[Drivers] ([Id], [FullName], [Avatar], [NationalId], [DriverLicense], [Phone], [Email], [Password], [YearOfBirth], [PlaceOfBirth], [Note], [Enabled], [isApprove]) VALUES (4, N'Pham Huy Hoang', N'driver4.png', N'2345670', N'234569', N'090123458', N'driver4@phtv.com', N'$2a$11$hmNU9j5szrPtbUF5Ykazcud0taXJz6A7ZSIHoz.q3JdE0LVYVPJiK', CAST(N'1990-09-05T00:00:00.0000000' AS DateTime2), N'Gia Lai', NULL, 1, 1)
INSERT [dbo].[Drivers] ([Id], [FullName], [Avatar], [NationalId], [DriverLicense], [Phone], [Email], [Password], [YearOfBirth], [PlaceOfBirth], [Note], [Enabled], [isApprove]) VALUES (5, N'Le Huy Chuong', N'driver5.png', N'2345671', N'234560', N'090123459', N'driver5@phtv.com', N'$2a$11$8zhT87TsuOMZDb73WrmOqeKhNJf7iAIfBbwpfCcIHyaoQtX4YqRoC', CAST(N'1999-12-24T00:00:00.0000000' AS DateTime2), N'Vung Tau', NULL, 1, 0)
INSERT [dbo].[Drivers] ([Id], [FullName], [Avatar], [NationalId], [DriverLicense], [Phone], [Email], [Password], [YearOfBirth], [PlaceOfBirth], [Note], [Enabled], [isApprove]) VALUES (6, N'Le Thanh Thien', N'driver6.png', N'2345672', N'234561', N'090123450', N'driver6@phtv.com', N'$2a$11$m35JTD2NxC3.MBB2XHhZAe0x4j6JHMVyxshXQMKamXVijOdoMNebi', CAST(N'1997-03-12T00:00:00.0000000' AS DateTime2), N'Hà Nội', NULL, 1, 1)
INSERT [dbo].[Drivers] ([Id], [FullName], [Avatar], [NationalId], [DriverLicense], [Phone], [Email], [Password], [YearOfBirth], [PlaceOfBirth], [Note], [Enabled], [isApprove]) VALUES (7, N'Le Dai Vi', N'driver7.png', N'2345673', N'234562', N'090123452', N'driver7@phtv.com', N'$2a$11$vhgJCRAu00oPQx.p6KYbQ..O0w3XxlfzlmVvVeX3tEuQylTWcGdo2', CAST(N'1996-01-12T00:00:00.0000000' AS DateTime2), N'Ca Mau', NULL, 1, 0)
INSERT [dbo].[Drivers] ([Id], [FullName], [Avatar], [NationalId], [DriverLicense], [Phone], [Email], [Password], [YearOfBirth], [PlaceOfBirth], [Note], [Enabled], [isApprove]) VALUES (8, N'Le Huy Phu', N'driver8.png', N'2345674', N'234563', N'090123451', N'driver8@phtv.com', N'$2a$11$VP2BP4Sij/5N4EdIuBVR9uRCCGpOuNJzbq1cvZvDSjiFp/FvsexEm', CAST(N'1994-01-11T00:00:00.0000000' AS DateTime2), N'Lam Dong', NULL, 1, 0)
INSERT [dbo].[Drivers] ([Id], [FullName], [Avatar], [NationalId], [DriverLicense], [Phone], [Email], [Password], [YearOfBirth], [PlaceOfBirth], [Note], [Enabled], [isApprove]) VALUES (9, N'Le Huy Quan', N'driver9.png', N'2345675', N'234564', N'090123453', N'driver9@phtv.com', N'$2a$11$c3CNPgXIhjIytns5LTewVO.nQYps.mMaQX2ynTXhU7cvYCq3n.2ee', CAST(N'2000-07-10T00:00:00.0000000' AS DateTime2), N'Ben Tre', NULL, 1, 0)
INSERT [dbo].[Drivers] ([Id], [FullName], [Avatar], [NationalId], [DriverLicense], [Phone], [Email], [Password], [YearOfBirth], [PlaceOfBirth], [Note], [Enabled], [isApprove]) VALUES (10, N'Le Huy Linh', N'driver10.png', N'2345676', N'234565', N'090123455', N'driver10@phtv.com', N'$2a$11$pKr3YhaeKzrTuF/1eZRRPeiXNWg24V.nfHkhBsn5r0maBuX2Vuo2.', CAST(N'1978-04-06T00:00:00.0000000' AS DateTime2), N'Dong Thap', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Drivers] OFF
GO
SET IDENTITY_INSERT [dbo].[FAQs] ON 

INSERT [dbo].[FAQs] ([Id], [Question], [Answer]) VALUES (1, N'Q. How do you do online bus reservation on PHTV Bus?', N'Ans: Booking a bus ticket online in India is easy with PHTV Bus. Simply enter the Leaving from (Origin City) -- Going to (destination city) details along with the date you wish to travel in the bus search option on the site. Within seconds you will be given a list of available running buses for your route. Select the bus that best suits you, then just follow the bus ticket booking process by selecting your seat, providing passenger details and completing the payment process. Upon successful booking confirmation, you will receive an e-ticket over email.')
INSERT [dbo].[FAQs] ([Id], [Question], [Answer]) VALUES (2, N'Q. Do I need to create an account to book bus tickets on PHTV Bus?', N'Ans: You do not need to create an account to view bus availability and seat availability. However, you need to register an account to be able to book tickets, this is to assist you in future transactions and support.')
INSERT [dbo].[FAQs] ([Id], [Question], [Answer]) VALUES (3, N'Q. How do I get the bus ticket after booking?', N'Ans: We''ll send you a e-ticket by email after your booking is confirmed. Simply board by presenting your e-ticket.')
INSERT [dbo].[FAQs] ([Id], [Question], [Answer]) VALUES (4, N'Q. Can I cancel my ticket and get a refund?', N'Ans: If you cancel before 2 days of Journey date then the whole money will be returned, if done one day before then 15% is debited from the total amount is returned, and if done on that day 30% is debited from the total amount is to be returned back.')
SET IDENTITY_INSERT [dbo].[FAQs] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Content], [DayCreateNew], [Image]) VALUES (1, N'PHTV-BusOnlineTicket.com Group at World Economic Forum 2024: Revealing Asia’s biggest untapped opportunities in tourism', N'<p>Leading global travel service provider Trip.com Group is embracing new trends and opportunities in the post-pandemic travel landscape, with its CEO Jane Sun sharing insights at the prominent World Economic Forum (WEF) Annual Meeting held in Davos, Switzerland, this week. Ms Sun also expressed optimism about Asia’s continued growth and shared her perspective on its investment potential at the panel discussion titled “Asia – the world’s next growth anchor?”</p><p>As major leaders from government, business, and civil society gathered to discuss the fundamental principles of driving trust in a world of fractures and uncertainties, the panel convened influential stakeholders to delve into the exciting opportunities and new challenges emerging in Asia. Speaking alongside Ms Sun were Mr Roy Gori, President and CEO of Canada’s largest insurance company Manulife, and Mr Geoff Lee, Executive Director, Head of Private Markets and Head of Technology at Malaysia’s sovereign wealth fund Khazanah Nasional. Mr Ben Hung, CEO, Asia, at Standard Chartered Bank, moderated the panel.</p><p>With global tourism approaching a full recovery, Trip.com Group has witnessed strong booking interest in Asia, with Thailand, Japan, and South Korea among the top travel destinations. The rise in consumer income has also led to growing trends in the region such as high-quality wellness experiences and event tourism, particularly for sought-after events like concerts and music festivals.</p><p>Sustainable tourism is another shift that is picking up steam, with environmental awareness motivating more than 16 million Trip.com Group customers to choose low-carbon travel options, such as hotels that adhere to sustainable standards. The Group has also prioritised options such as the rental of electronic vehicles and offering flights with lower carbon emissions.</p><p>Zooming in on the post-pandemic economic trajectory in one of Asia’s largest regions, Ms Sun asserted that China offers more investment opportunities than what some may have perceived.</p><p>“Investors should not overlook the thriving travel, wellness or entertainment sector in China. With its vast size, diverse industries, and varying levels of consumer buying power, the investment opportunities are abundant,” said Ms Sun. In particular, the travel sector presents numerous untapped growth opportunities, such as the rapid increase in inbound and outbound travel, as well as favourable policy developments.</p><p>Ms Sun expressed optimism about the growth of the tourism industry, especially with recent positive developments, such as increased flight capacities and expanded visa-free arrangements, that have facilitated international travel to and from China. These include the recent unilateral visa-free policies for several countries, including France, Germany, Spain, Italy, and the Netherlands, mutual visa-free agreements with Malaysia, and plans for similar arrangements with Singapore and Thailand. China also announced earlier in the week that it will unilaterally grant visa-free entry to Swiss and Irish nationals. Since July 2023, China has removed visa requirements for citizens of 11 nations.</p><p>According to Trip.com Group data, significant increases have been recorded in inbound search and booking volumes from countries such as Germany, Spain, and the Netherlands. Those with visa-free arrangements or plans for relaxed visa policies, such as Singapore, Thailand, and Malaysia, are among the top destinations favoured by Chinese tourists for the upcoming Chinese New Year.</p><p>Moreover, since its launch in September 2023, Trip.com’s “China Travel Guide”, which provides information about hotel, transport, payment, and other travel-related issues, has served nearly 100,000 international travellers planning to visit China. Meanwhile, as of mid-January, outbound travel orders for the upcoming Chinese New Year holidays have surged more than 10 times compared to the previous year.</p><p>For the wider Asian economy, Ms Sun maintained that its prospects remain robust, citing projections that it will contribute to around 50% of global GDP growth. The rapid development of the tourism industry in Asia, coupled with the strong purchasing power of Asian customers, has indicated the potential for sustained growth in the region.</p><p>“We are committed to forging an influential network for our global partners, empowering them to welcome customers from every corner of the world,” said Ms Sun. “Equally, we stand poised to usher Asian customers into the global arena, opening doors to boundless opportunities and creating pathways for unprecedented international success.”</p>', CAST(N'2024-01-24T00:00:00.0000000' AS DateTime2), N'news1.png')
INSERT [dbo].[News] ([Id], [Title], [Content], [DayCreateNew], [Image]) VALUES (2, N'PHTV-BusOnlineTicket.com Group CEO tackles overtourism for sustainable travel at World Economic Forum', N'<p>Trip.com Group, a leading global travel service provider, has set its sights on tackling key challenges surrounding the tourism industry. This is evidenced by CEO Ms Jane Sun''s participation in the panel discussion "Sorry, We''re Full: Tackling Overtourism" at the prestigious World Economic Forum in Davos, Switzerland. The forum invited influential dignitaries, from political elites to business leaders, to tackle the challenges facing our world, in the hope of finding common ground and united solutions, aligning with this year''s theme of "Rebuilding Trust".</p><p>Davos comes as the world looks forward to forging a new normal for sustainable travel in the post-pandemic era. Over 75% of respondents in Trip.com Group’s sustainability report agreed that sustainable travel is vital. However, the industry faces obstacles to sustainable travel, particularly as the rise in visitor numbers approaches pre-pandemic levels. Consequently, destinations contend with multiple challenges, such as preserving heritage sites, combating pollution, and looking after their ecosystems.</p><p>At the forum, Ms Sun shared her views on the challenges of overtourism for multiple stakeholders across the industry. Ms Sun spoke alongside a distinguished panel of guests, including Ms Sithembile Ntombela, Acting Chief Executive Officer of Brand South Africa; Mr Stephen Cotton, General Secretary of the International Transport Workers'' Federation (ITF); and Mr Tony Fernandes, Chief Executive Officer of Capital A Berhad (AirAsia). The forum was moderated by CNN International’s anchor and correspondent Richard Quest.</p><p><br><i>From left to right: Mr Richard Quest, CNN International’s anchor and correspondent; Ms Jane Sun, CEO of Trip.com Group; Ms Sithembile Ntombela, Acting Chief Executive Officer of Brand South Africa; Mr Tony Fernandes, Chief Executive Officer of Capital A Berhad (AirAsia); and Mr Stephen Cotton, General Secretary of the International Transport Workers’ Federation (ITF). Source: World Economic Forum</i></p><p>Ms Sun also met with government officials from various countries to build upon the success of the region''s travel growth momentum.</p><p>Tackling overtourism can only work if sustainability is embedded across the travel and tourism industry. Trip.com Group addresses this challenge through a multifaceted approach, with initiatives to promote sustainable travel practices, improve infrastructure, and combat the environmental and social implications.</p><p>"We need to approach the issue of overtourism with a balanced view. Destinations can become overcrowded without proper management, and the overall experience suffers. It''s imperative to find ways for supply and demand to grow sustainably," said Ms Sun.</p><p>Investing in high-quality tourism is a viable approach to attract visitors to less well-travelled destinations. Several key markets, such as Thailand and Malaysia, have endorsed the idea of attracting "high-value" tourists to redirect demand away from hotspots. Simultaneously, other regions aim to diversify tourist influx by offering niche forms of tourism unique to under-visited regions. This mitigates overtourism and holds the potential for economic gains, with destinations such as Dubai successfully expanding their wellness tourism industry to an estimated value exceeding USD 108 billion.</p><p>To alleviate pressure on popular destinations, another strategy involves the promotion of lesser-known destinations, known as long-tail tourism. Advancements in technology and social networking have made marketing approaches that focus on lesser-known locales more effective. For instance, Trip.com Group employs content marketing strategies, including e-commerce campaigns and leveraging its social travel platform, Trip Moments, to showcase less visited areas. Daegu – a lesser-known destination in Korea – was highlighted in a successful digital campaign which garnered over 29 million views, resulting in an 87% increase in product sales compared to the same period in the previous year.</p><p>Beyond promoting lesser-known destinations, targeting lull periods or traditionally low travel seasons can help to address overtourism during peak travel periods. To make this possible, Trip.com Group provides advanced and flexible booking options to ensure customers have the freedom to adapt their travel plans whenever necessary.</p><p>The Group is also keen to collaborate with partners and industry stakeholders to find sustainable solutions over the long run.</p><p>“The complex challenges of overtourism demand more than quick fixes – it will not be resolved overnight. However, through unwavering dedication from multiple stakeholders, we believe that every effort contributes to shaping a future where travel harmonises seamlessly with sustainable principles. This goes beyond a goal; it’s a powerful commitment to redefine the very essence of responsible travel,” stated Ms Sun.</p>	2024-01-22T16:49:06.039	moqxtq0n.pjwnew2.jpg	
11	Trip.com Group and Vietjet Air Sign MOU to Improve Global Travellers’ Experience	<p>Leading global travel service provider Trip.com Group has signed a Memorandum of Understanding (MOU) with Vietjet Air to leverage the expertise and resources of both parties to make travel easier and more convenient for travellers around the world.</p><p>This will be achieved through various initiatives, such as offering Trip.com Group’s products – including hotels, airport transfers, attractions and activities – to customers on Vietjet’s website. Meanwhile, the Group will provide Vietjet with innovative technologies, such as the Virtual Interline solution to widen Vietjet’s global network footprint, and also share valuable insights to empower Vietjet to make informed decisions to optimise customer experience. Furthermore, the data integration initiative will enable customers to enjoy numerous benefits from both parties’ loyalty programmes. Members of Vietjet SkyJoy and Trip.com Rewards can accumulate reward points to exchange for gifts, flight tickets, and other incentives from a plethora of third-party products and services.</p><p>With the commitment of prioritising customer satisfaction, together, Trip.com Group and Vietjet will create a seamless travel experience, offering a comprehensive range of travel content, products, and exciting deals.</p><p><strong>Mr Yudong Tan, Chief Executive Officer, Flights, Trip.com Group</strong>, said: “We are delighted to partner with Vietjet Air, a leading low-cost airline, to offer travellers seamless experiences when planning and booking their trips with a comprehensive range of travel products and deals. We have worked with Vietjet before on successful campaigns to promote Vietnam as a destination of choice for travellers, and believe our mutual commitment to prioritising customer satisfaction is a testament to both companies’ customer centricity. We look forward to a fruitful partnership with Vietjet Air.”</p><p>To celebrate this exciting milestone, Vietjet and Trip.com Group will offer travel enthusiasts a special promotion with up to 50% off on airfares from today until 22 January 2024, applicable to Vietjet’s entire flight network. Customers can simply book Vietjet flights on Trip.com, <a href="http://www.vietjetair.com/">www.vietjetair.com</a>, or the Vietjet Air mobile app to unlock a 50% discount on the ticket fares by entering the code TR24150, 20% off with the code TR24120, and 10% off with the code TR24110*. The promotion is valid for flights from 30 March to 31 October 2024#.</p><p>Vietjet, recognised as one of the world''s top 10 safest low-cost airlines by AirlineRatings.com, currently operates a fleet of nearly 110 aircraft, serving over 30 international routes and catering to 32 million customers across Vietnam and internationally. These services connect passengers to destinations in Australia, India, China, Japan, South Korea, Indonesia, Thailand and Singapore, among others.</p><p>Bookings on Trip.com Group’s platforms last year for Vietnam-related products almost tripled (299.7%) year-on-year (YoY). Arrivals in Vietnam last year also increased similarly, with full-year numbers showing robust 344.2% growth. There has been a similar appetite for outbound travel from Vietnam as well, with outbound bookings in 2023 growing 213.2% YoY.</p><p>(*) Exclusive of taxes and fees. Other terms and conditions apply<br>(#) Exclusive of public holidays and peak seasons</p>', CAST(N'2024-01-25T00:00:00.0000000' AS DateTime2), N'news2.jpg')
INSERT [dbo].[News] ([Id], [Title], [Content], [DayCreateNew], [Image]) VALUES (3, N'PHTV-BusOnlineTicket.com Group Signs Strategic Partnership with Malaysia’s Tourism Ministry', N'<p>A delegation led by Malaysia’s Minister of Tourism, Arts and Culture, Dato'' Sri Tiong King Sing, was hosted at leading global travel service provider Trip.com Group’s headquarters in Shanghai by the Group’s Chief Executive Officer Ms Jane Sun and other senior executives. Following a productive meeting where both parties engaged in in-depth discussions about the development of Malaysia’s tourism industry, the Group and the Ministry of Tourism, Arts, and Culture (MOTAC) signed a strategic partnership to promote Malaysia as a destination of choice for the Chinese outbound market.</p><p>The partnership was signed by Mr Edison Chen, Vice President of Destination Marketing &amp; Strategic Alliances, Trip.com Group, and Dato'' Yeoh Soon Hin, Deputy Chairman of Tourism Malaysia, and witnessed by Ms Sun and Dato’ Sri Tiong. It solidifies a close partnership that has been maintained for many years.</p><p>Malaysia is actively building towards “Visit Malaysia Year 2026”, with target of 26.1 million international tourist arrivals and MYR97.6 billion in tourist expenditure. To this end, both parties will collaborate extensively to promote Malaysia as a tourism destination, utilising online and offline resources to craft customised outbound marketing campaigns, provide high-quality travel services to Chinese tourists, enhance user travel experiences, and actively promote the full recovery of Malaysia''s tourism industry.</p><p>Said Ms Jane Sun, Chief Executive Officer, Trip.com Group: “Malaysia enjoys an abundance of tourist attractions – I have been there many times myself, and have been deeply impressed by the unique characteristics of each destination. With the recent introduction of mutual visa-free entry for visitors from China and Malaysia, the rejuvenation of tourism offerings and the upgrading of destination experiences, more tourists will turn their attention to Malaysia. Trip.com Group will help Malaysian tourism seize this opportunity to achieve full recovery and grow further.”</p><p>Expressing confidence in the collaboration, Dato'' Sri Tiong King Sing, Minister of Tourism, Arts and Culture, Malaysia, said: “I am honoured to witness the signing of this strategic partnership, and I hope that both sides will be able to quickly start deploying the plans in order to fully implement the partnership in the near future. With Trip.com Group’s strength and years of experience, I have no doubt that Malaysia will become the preferred destination for more Chinese travellers next year.”</p><p>To celebrate the partnership, Tourism Malaysia will appear on this evening’s Boss Live broadcast at 7.00pm to host the first-ever Malaysia-themed live event on the Trip.com’s Ctrip app, offering exclusive discounts and a wide range of travel products to users across the platform.</p><p>Following the introduction of the mutual visa exemption policy between China and Malaysia on 26 November 2023, Trip.com Group’s data showed that Malaysia-related searches increased by 96% compared to the previous week. With favourable policies from both countries and deepening cooperation, this collaboration is poised to seize the opportunity for extensive growth in bilateral tourism and cultural exchanges.</p><p>In 2022, Malaysia’s tourism industry contributed MYR251.5 billion to Malaysia’s gross domestic product (GDP). This constituted 14% of its GDP, making tourism the country’s third largest contributor. It also contributed 23.4% to Malaysia’s total workforce, with 3.61 million people employed in 2022.</p>', CAST(N'2024-01-26T00:00:00.0000000' AS DateTime2), N'news3.jpg')
INSERT [dbo].[News] ([Id], [Title], [Content], [DayCreateNew], [Image]) VALUES (4, N'PHTV-BusOnlineTicket.com Group''s Inaugural WTM Showcase Highlights Surge in European Travel Market and AI-Driven Industry Transformation', N'<p>In its first appearance at World Travel Market (WTM) 2023, Trip.com Group, a global leader in travel services, laid out its inroads into the European market and the transformative role of artificial intelligence. The event, held from 6-8 November in London, provided a platform for Trip.com Group to articulate its vision of reshaping the travel experience with advanced AI technology and to solidify its position as an emerging key player in the European travel market.</p><p><strong>Leap Forward in AI-Powered Travel Customisation</strong><br>Boon Sian Chai, Managing Director and Vice President for International Markets at Trip.com Group took centre stage at the event''s Technology Summit. Chai discussed the pivotal role of AI in revolutionising the travel sector, enhancing customer service through intelligent chatbots, and improving overall service experiences while also touching on the resurgence of outbound travel from China.</p><p>The introduction of TripGenie, Trip.com Group''s AI assistant, earlier this year marked a significant enhancement in the company''s technology suite. TripGenie has notably improved user engagement and conversion rates by personalising travel experiences and simplifying travel planning. The Group plans to further enhance TripGenie''s features, augmenting its capability to provide bespoke travel arrangements.</p><p>"Our AI-driven tools, such as our curated travel lists, Trip.Trends and Trip.Best, transcend mere technological evolution," Chai stated. "They foster a sense of community and enrich the travel experience, adding a personal touch to each journey our customers undertake."</p><p>Chai highlighted the impressive impact of "Trip.Best," which has markedly increased traffic and bookings for partner hotels, and the success of "Trip Moments," which has actively involved a substantial segment of the app''s users in creating and sharing content. The Group''s strides in AI for customer service, celebrated for their accuracy in understanding user queries and high rates of resolving inquiries autonomously, have further cemented their dedication to improving customer interactions.</p><p><strong>Trip.com Group''s Strategic Growth in the European Market</strong><br>Andy Washington, General Manager for Europe at Trip.com Group, emphasised the company''s strategic commitment to integrating with local cultures and travel ecosystems.</p><p>"Our comprehensive, all-in-one app ensures a personalised journey for every traveller, reflecting the unique character of each destination and catering to the diverse preferences of our customers. It encompasses a wide array of transportation options, accommodations, and local experiences, all while championing responsible travel and sustainability," he noted.</p><p>Although still in the growth stage across Europe, Trip.com Group''s bookings are witnessing a notable increase, signalling an expansion of its influence across the continent. The company''s data reveals a significant uptick in travel activity from Europe, with the UK experiencing a 67% increase in flight bookings and a 62% rise in hotel reservations from 2022 to 2023. This figure dramatically eclipses pre-pandemic levels with a staggering 604% growth in flights compared to 2019. Similar upward trends are evident across other key European markets, including Germany, France, Spain, and Italy, which collectively have seen a 40% rise in flight bookings and a 60% increase in hotel bookings year over year.</p><p>As WTM London 2023 wraps up, Trip.com Group delivers a clear statement: technology and personalisation are at the forefront of travel''s future. The company''s active role at the event underscores its dedication to driving travel forward with innovative approaches and a deep understanding of the burgeoning European market.</p>', CAST(N'2024-01-27T00:00:00.0000000' AS DateTime2), N'news4.jpg')
INSERT [dbo].[News] ([Id], [Title], [Content], [DayCreateNew], [Image]) VALUES (5, N'PHTV-BusOnlineTicket.com Group Empowers the Travel Industry with Transformative AI Innovation', N'<p>Trip.com Group, a global leader in online travel services, took centre stage at ITB Asia in Singapore, highlighting the pivotal role of Artificial Intelligence (AI) in reshaping the travel industry. James Liang, Co-founder and Chairman of Trip.com Group, delivered a keynote, emphasising the Group’s commitment to elevating customer experiences through AI-driven innovation.</p><p><strong>TripGenie leads AI-powered travel ecosystem</strong></p><p>Trip.com Group''s AI travel assistant, TripGenie, stands out as a transformative innovation tailored to crafting itineraries and enhancing travel bookings within the all-in-one Trip.com Group app. Since its launch earlier this year and subsequent July upgrade, TripGenie has produced remarkable results.</p><p>Notable achievements include doubling the order conversion rate and improving user retention rates, resulting in enhanced user engagement and overall service effectiveness.</p><p>TripGenie’s recommendation capability for complex queries, combined with highly accurate compressive search, allows a user to find what they are looking for quickly and with great accuracy, providing a superior experience for Trip.com users.</p><p>Furthermore, TripGenie has redefined the user experience by excelling in travel and itinerary planning, including multi-destination planning, a soon-to-deploy feature. TripGenie provides quick inspiration for the uninspired traveller, creating personalised editable itineraries in under a minute. Advanced itinerary themes cater to various travel types, combining text and voice commands for a seamless user experience. Aside from English, users may also access these commands in traditional and simplified Chinese, Cantonese, Korean, and Japanese.</p><p>Trip.com Group envisions TripGenie at the forefront of the AI travel evolution. With plans to roll out itinerary sharing features and increased personalisation options such as upvoting and liking, TripGenie will enhance collaborative travel planning for a more personalised experience.</p><p>James Liang, Co-founder and Chairman of Trip.com Group, said, "Our AI expertise empowers the travel industry by transforming the way travellers plan and book their trips. With AI-tailored travel solutions like TripGenie, we enhance engagement, accuracy, and personalisation in the travel experience. I think the name, “TripGenie” is quite suitable for our mission, for our goal is to help the customer plan the perfect trip like a genie. In this new era of travel, we are optimistic, forging ahead to enrich their travel experiences with AI and pursue the perfect trip for a better world."</p><p><strong>AI-enhanced travel insights and customer service</strong></p><p><br>Boon Sian Chai, Managing Director and Vice President of International Markets at Trip.com Group, detailed the Group’s AI ecosystem, including its algorithmic, AI-powered lists like "Trip.Trends," "Trip.Best," and "Trip.Deals". These lists offer curated information based on user preferences and real-time data, encouraging a vibrant travel ecosystem where Trip.Best boosts partner bookings and Trip Moments facilitates user-generated content.</p><p>Mr Chai said, “We build strong communities on our all-in-one app to deepen our travel experiences and appetite for travel between partners and travellers. Trip.Best, which is our AI-curated recommendation travel list, inspires our traveller community to browse and book their favourite properties, in turn boosting traffic by 20% and bookings by 10% for over 1,500 hotel partners. Our Trip Moments platform brings together travellers who share their experiences, recommendations, and reviews, creating a rich source of travel stories. Engaged by 35% of our app users, this platform attracts and retains travellers well, and influences 22% of them to book a travel-related product within a month.”</p><p>The Group’s extensive proprietary database, enriched by human feedback, are supported by a global team of experts who curate travel content, ensuring authenticity and immersion in travel experiences in our all-in-one app.</p><p>Besides this, Mr Chai explained that AI technology also played a significant role in improving customer service within the travel sector. Trip.com Group has achieved remarkable self-service rates, where AI chatbots handle numerous inquiries via text and voice with over 85% semantic recognition accuracy. This streamlined approach results in impressive self-service resolution rates of 78% for airline tickets and 68% for hotels.</p><p>The success of our AI integration saves the time and energy of customers and service agents, thereby accelerating case solving efficiency. Empowered by AI, customer service teams can focus on more complex cases and provide a better overall experience for customers.</p><p><strong>AI-powered journeys amid growing travel demand</strong></p><p>Jane Sun, Trip.com Group CEO, said, “As the appetite for travel continues to grow, the future of AI in travel is expected to focus on efficient and highly personalised solutions tailored to individual travellers'' needs. This vision not only signifies the next phase of the travel industry but also underscores the profound impact of AI in making travel more convenient, personalised, and memorable for everyone. Together with our partners, Trip.com Group stands ready to support and shape the future of travel with AI.”</p><p>Trip.com Group''s AI push follows a thriving travel market, with international travel restrictions lifted and domestic and regional tourism experiencing a substantial surge. According to data by Trip.com Group, during China''s Golden Week, outbound travel volume surged by over 800% compared to the previous year, while domestic tourism grew by nearly 200% this year.</p><p>&nbsp;</p>', CAST(N'2024-01-28T00:00:00.0000000' AS DateTime2), N'news5.jpg')
INSERT [dbo].[News] ([Id], [Title], [Content], [DayCreateNew], [Image]) VALUES (6, N'PHTV-BusOnlineTicket.com Group''s Inaugural WTM Showcase Highlights Surge in European Travel Market and AI-Driven Industry Transformation', N'<p>In its first appearance at World Travel Market (WTM) 2023, Trip.com Group, a global leader in travel services, laid out its inroads into the European market and the transformative role of artificial intelligence. The event, held from 6-8 November in London, provided a platform for Trip.com Group to articulate its vision of reshaping the travel experience with advanced AI technology and to solidify its position as an emerging key player in the European travel market.</p><p><strong>Leap Forward in AI-Powered Travel Customisation</strong><br>Boon Sian Chai, Managing Director and Vice President for International Markets at Trip.com Group took centre stage at the event''s Technology Summit. Chai discussed the pivotal role of AI in revolutionising the travel sector, enhancing customer service through intelligent chatbots, and improving overall service experiences while also touching on the resurgence of outbound travel from China.</p><p>The introduction of TripGenie, Trip.com Group''s AI assistant, earlier this year marked a significant enhancement in the company''s technology suite. TripGenie has notably improved user engagement and conversion rates by personalising travel experiences and simplifying travel planning. The Group plans to further enhance TripGenie''s features, augmenting its capability to provide bespoke travel arrangements.</p><p>"Our AI-driven tools, such as our curated travel lists, Trip.Trends and Trip.Best, transcend mere technological evolution," Chai stated. "They foster a sense of community and enrich the travel experience, adding a personal touch to each journey our customers undertake."</p><p>Chai highlighted the impressive impact of "Trip.Best," which has markedly increased traffic and bookings for partner hotels, and the success of "Trip Moments," which has actively involved a substantial segment of the app''s users in creating and sharing content. The Group''s strides in AI for customer service, celebrated for their accuracy in understanding user queries and high rates of resolving inquiries autonomously, have further cemented their dedication to improving customer interactions.</p><p><strong>Trip.com Group''s Strategic Growth in the European Market</strong><br>Andy Washington, General Manager for Europe at Trip.com Group, emphasised the company''s strategic commitment to integrating with local cultures and travel ecosystems.</p><p>"Our comprehensive, all-in-one app ensures a personalised journey for every traveller, reflecting the unique character of each destination and catering to the diverse preferences of our customers. It encompasses a wide array of transportation options, accommodations, and local experiences, all while championing responsible travel and sustainability," he noted.</p><p>Although still in the growth stage across Europe, Trip.com Group''s bookings are witnessing a notable increase, signalling an expansion of its influence across the continent. The company''s data reveals a significant uptick in travel activity from Europe, with the UK experiencing a 67% increase in flight bookings and a 62% rise in hotel reservations from 2022 to 2023. This figure dramatically eclipses pre-pandemic levels with a staggering 604% growth in flights compared to 2019. Similar upward trends are evident across other key European markets, including Germany, France, Spain, and Italy, which collectively have seen a 40% rise in flight bookings and a 60% increase in hotel bookings year over year.</p><p>As WTM London 2023 wraps up, Trip.com Group delivers a clear statement: technology and personalisation are at the forefront of travel''s future. The company''s active role at the event underscores its dedication to driving travel forward with innovative approaches and a deep understanding of the burgeoning European market.</p>', CAST(N'2024-01-29T00:00:00.0000000' AS DateTime2), N'news6.jpg')
INSERT [dbo].[News] ([Id], [Title], [Content], [DayCreateNew], [Image]) VALUES (7, N'PHTV-BusOnlineTicket.com Group  and Tourism Authority of Thailand Sign Partnership', N'<p>Leading global travel service provider Trip.com Group and the Tourism Authority of Thailand (TAT) today signed a Letter of Intent (LOI) to cooperate on bolstering tourism in Thailand. This collaboration aims to promote Thailand as the premier travel hotspot for tourists from the Chinese mainland, who have consistently ranked it as one of their top destinations.</p><p>The LOI was signed by Amanda Wang, Vice President, Global Destinations, Trip.com Group and Thapanee Kiatphaibool, Governor, Tourism Authority of Thailand, in Beijing, China. It was part of an official visit by a high-level delegation to China led by Srettha Thavisin, Prime Minister of Thailand.</p><p>Ms Wang said: “Thailand has consistently captivated the hearts of travellers from the Chinese mainland, establishing itself as an irresistible destination. With the recent introduction of visa-free travel to Thailand, we foresee this trend of travel to Thailand continuing, and look forward to working closely with TAT to bring more tourists to the Land of Smiles.”</p><p>Ms Kiatphaibool said: “The signing of this Letter of Intent signifies a new phase of comprehensive co-operation in the promotion of Thai tourism in the Chinese market. The Tourism Authority of Thailand will use this as a framework to continue our close collaboration, and make every effort to ensure the safety and security of tourists travelling to Thailand. We will also organise a series of promotional activities to attract more tourists from mainland China to Thailand, promoting the high-quality development of our tourism sector.”</p><p>The LOI signed between the two parties will serve as a catalyst to further enhance the existing partnership and harness the extensive expertise and insights of Trip.com Group on Chinese travellers. It will entail knowledge and information sharing, joint promotional activities, as well as the establishment of formal communication channels for regular bilateral tourism updates. It formalises an established and fruitful working relationship between the two parties, a notable recent example being January''s Thailand edition of the Group’s “Super World Trip” series of livestreams.</p><p>The three-hour livestream session targeting the outbound mainland Chinese audience recorded sales of more than 20,000 room nights amounting to a Gross Merchandise Value of over RMB 40 million, featuring almost 60 products, including attractions, tickets and staycation packages at hotels across Thailand such as The Peninsula Bangkok, Capella Bangkok, InterContinental Pattaya Resort, and Banyan Tree Krabi.</p><p>Thailand was one of the top destinations of choice for Chinese tourists during the recent Golden Week holidays, with outbound travel volume to Thailand at over 11 times of 2022 volume for the same period. Compared to this year’s May Day holidays, volume was up by 27.6%. After the announcement of visa-free travel for Chinese travellers was made last month, searches for Thai destinations across Trip.com Group’s platforms soared by 800%.</p>', CAST(N'2024-01-30T00:00:00.0000000' AS DateTime2), N'news7.png')
INSERT [dbo].[News] ([Id], [Title], [Content], [DayCreateNew], [Image]) VALUES (8, N'PHTV-BusOnlineTicket.com Group Highlights Tourism''s Economic Vitality and Middle East Potential', N'<p>Trip.com Group CEO Jane Sun highlighted the dynamic role of tourism as a key economic driver at the inaugural SuperBridge Summit Dubai. Her message emphasised the industry''s remarkable resilience and potential to drive substantial global growth, particularly in the Middle East. She also discussed the future of sustainable travel in the post-pandemic era.</p><p>Trip.com Group CEO Jane Sun (right), addressing the topic of tourism as a key driver of the economy, at the inaugural SuperBridge Summit in Dubai.</p><p>Ms Sun underscored the pivotal role of travel and tourism, noting that the travel industry, prior to the pandemic, contributed to 10% of all jobs worldwide, ushering in 1 in every 5 new job opportunities.</p><p>In the Middle East, an area brimming with opportunities, the UAE stands as the third-largest economy. According to global research, tourism represented 9% of the total GDP in 2022, with about USD 32 billion in international tourist spending. The sector also accounted for 12% of the UAE''s GDP, employing 363,000 people in 2019.</p><p>In addition to the economic vitality of tourism, Ms Sun explored prevailing trends within the travel industry, notably the resurging demand for domestic and global travel. With international travel restrictions lifted, domestic and regional tourism has experienced a remarkable upsurge. For instance, during China''s Golden Week, outbound travel volume surged by over 800% compared to the previous year, while domestic tourism grew by nearly 200% this year.</p><p>The Middle East, in particular, has emerged as a sought-after destination. According to Trip.com Group data, hotel bookings from China to the Middle East have surged by over 400% in 2023, alongside a 300% increase in flight volumes. Additionally, bookings for attractions and events in Dubai have seen an astounding 450% surge in 2023.</p><p>Ms Sun also emphasised the growing importance of sustainable travel, a trend accelerated by the pandemic. Travellers are increasingly environmentally conscious, driving the industry to adopt eco-friendly practices and products. In response, Trip.com Group has actively engaged in various initiatives to reduce carbon emissions and promote sustainable travel, including partnering with CHOOOSE to offset CO2 emissions and joining the Science Based Targets initiative (SBTi) to encourage low-carbon practices in the tourism industry. She also lauded Dubai''s The Sustainable City aims to achieve net-zero energy by 2040 as a pioneering effort in creating eco-conscious destinations for tourists.</p><p><strong>Jane Sun, CEO of Trip.com Group, said,</strong> "Tourism stands as a key economic driver with unparalleled potential, driving global prosperity and shaping a brighter future. We are committed to harnessing this potential in the Middle East, offering high-spending tourists an unparalleled blend of luxury and sustainability. Together, we will make the Middle East a prime destination for travellers seeking exceptional experiences and eco-friendly adventures."</p><p>Additionally, Ms Sun highlighted Trip.com Group''s commitment to embracing technological innovation, particularly the Group’s AI-driven travel assistant, TripGenie. The tool is designed to streamline the booking process, catering to travellers'' needs and enhancing their overall experience.</p><p>Trip.com Group is resolute in its mission to create a sustainable, innovative, and enjoyable future for the travel industry, leveraging tourism''s economic vitality to propel global growth.</p>', CAST(N'2024-01-31T00:00:00.0000000' AS DateTime2), N'news8.jpg')
INSERT [dbo].[News] ([Id], [Title], [Content], [DayCreateNew], [Image]) VALUES (9, N'PHTV-BusOnlineTicket.com Sweeps Three Awards at World Travel Awards™ 2023 – Europe', N'<p>Trip.com, the internationally renowned one-stop travel service provider, achieved a new milestone by securing three awards at the 2023 World Travel Awards™ – Europe. The company earned "Europe''s Leading Online Travel Agency 2023," "Spain''s Leading Online Travel Agency 2023," and "England''s Leading Online Travel Agency 2023." This recognition reflects the resounding vote of confidence from customers, travel professionals, and media, reaffirming Trip.com''s steadfast commitment to excellence in serving travellers across these markets.<br>Trip.com received this year''s World Travel Awards accolades during a prestigious ceremony held in Batumi, Georgia, on 29th September 2023, highlighting Trip.com''s outstanding performance and ever-expanding influence in Europe''s online travel agency (OTA) sector.</p><p>"Securing three awards at the 2023 World Travel Awards - Europe is a testament to our unwavering dedication to delivering exceptional travel experiences and growing recognition at regional and country levels," said Andy Washington, General Manager of Trip.com Europe.</p><p>"We are honoured to be acknowledged as the leading online travel agency in Europe, Spain, and England. Product choice, technological innovation, and exceptional customer support are undoubtedly the keys to this success. However, this achievement wouldn''t have been possible without the tireless efforts of our team and the trust of our customers and industry partners, who cast their votes in our favour."</p><p>Graham E. Cooke, Founder, World Travel Awards, said: “Congratulations to Trip.com for winning ''Europe''s Leading Online Travel Agency 2023,'' ''Spain''s Leading Online Travel Agency 2023,'' and ''England''s Leading Online Travel Agency.'' This is a remarkable achievement, reflecting how the brand is setting the benchmark in online travel. The commitment of the entire team at Trip.com serves as an inspiration to us all."</p><p>Trip.com''s extensive global network encompasses 1.2 million accommodation services, over 480 airlines, and more than 30,000 tourism partners. Through an innovative mobile-first strategy and a comprehensive all-in-one travel platform offering flights, hotels, trains, cars, attractions, and more. Trip.com has rapidly grown as a significant player in the European travel industry in recent years. Today, it holds a robust presence across the globe, with 48 website variations, support for 31 currencies, availability in over 20 languages, and operations spanning 39 countries and regions.</p><p>Trip.com is at the forefront of innovation in the travel industry with its latest advancements, including TripGenie. This cutting-edge chatbot utilises advanced AI technology to provide travellers with real-time live assistance, delivering personalised travel routes, customised itineraries and valuable booking advice directly on the Trip.com platform, offering unprecedented support and guidance throughout their journeys.</p><p>Trip.com offers world-class 24/7 multilingual customer services globally, instrumental in creating unparalleled travel experiences for millions of customers worldwide. The Edinburgh-based call centre, catering to the European region, is a dedicated workforce of over 200 professionals who provide round-the-clock English customer support, with its customer service team ensuring rapid responses, with most calls answered within 30 seconds.</p><p>In 2022, the platform witnessed a surge in global app downloads, with over 14.1 million installations. The Spanish and English markets have played pivotal roles in Trip.com''s success in Europe.</p><p>The UK market, led by England, has experienced a remarkable surge, with daily app downloads increasing by an astonishing 400% year-on-year. The percentage of flight and hotel orders has risen by 180% and 80%, respectively, compared to 2022, with direct channel growth for flights and hotels at 240% and 170%, respectively.<br>These achievements highlight Trip.com''s unwavering commitment to delivering unparalleled travel experiences and solidifying its reputation for dedication to customer satisfaction. With this remarkable success, Trip.com stands firm as a pioneering global travel service provider, leading the way in shaping the future of travel.</p>', CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), N'news9.png')
INSERT [dbo].[News] ([Id], [Title], [Content], [DayCreateNew], [Image]) VALUES (10, N'PHTV-BusOnlineTicket.com Group Charts the Future of Travel at Envision 2023', N'<p>Trip.com Group today showcased its vision for the future of travel at its Envision 2023 global partner conference. The conference was attended by about 700 industry partners globally.</p><p>Mr James Liang, Chairman of Trip.com Group, remarked in his video address: “Travel is unique. It not only promotes economic growth and development but also fulfills our intellectual needs. Trip.com Group is dedicated to enriching the travel experience while maintaining industry responsibility. We believe that travel, as a fundamental human need, has the power to inspire innovation, drive progress, and foster a greater sense of unity and understanding among people from around the world.”</p><p>Speaking at the conference, Trip.com Group CEO Jane Sun recapped the company''s journey, including the series of initiatives and programmes implemented in support of its partners during the past three years. Over the years, Trip.com Group has proactively collaborated with partners across hotels, flights, vacations and attractions, supporting their efforts in serving Chinese travellers, who are among the top spenders in many markets globally. In 2019, Chinese tourists represented 15% of international spending, and post-pandemic, that figure is set to grow tremendously.</p><p><strong>Growing Partner Value Across All Levels</strong></p><p>Specifically, Ms Sun shared Trip.com Group’s strategies in collaborating with its partners to chart the future of the travel and tourism industry. "In recent years, Trip.com Group has strengthened our technological capabilities while, at the same time, implemented targetted strategies in various markets with the aim of connecting our partners with our users. These include our series of BOSS Live livestream sessions, enhancements to our global airfare capabilities, the launch of our AI travel assistant TripGenie, among others.</p><p>"Today, we are well-positioned to support our partners unlock new opportunities and expand their reach to our international customers. We will leverage our technology to strengthen the positioning and visibility of our partners and their offerings to our customers, including the high-spending consumers from China. The travel and tourism industry contribute significantly to global GDP and employment, and Trip.com Group will continue to utilise advanced technology and innovation to create new opportunities and growths for our partners.”</p><p><strong>Shaping a Sustainable Vision of Travel for the Future</strong></p><p>On the sustainability front, the company''s top leadership delved into comprehensive ESG strategies as well as the industry''s approach to sustainability.</p><p>Ms Sun affirmed the promising outlook in a rejuvenated, eco-conscious landscape. She said, "In this revitalised travel industry, the opportunities ahead are immense. We''re poised to redefine the travel landscape with our cutting-edge tech innovations, expanding partnerships, and strong investor confidence. As we harness these opportunities, we envision a future where travel is not just thriving but is also greener and more responsible. The horizon is bright for our partners, investors, and travellers, and together, we''ll journey towards a sustainable and prosperous future in travel."</p><p>Thanking the partners for their support over the years, Ms Sun concluded: "Let us envision a future where travel is not just a destination, but a transformational experience. Together, we can chart the future of travel."</p>', CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), N'news10.jpg')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Offers] ON 

INSERT [dbo].[Offers] ([Id], [Title], [OfferCode], [Discount], [FromStation], [ToStation], [BeginDate], [EndDate], [Enabled], [Image]) VALUES (1, N'30% off for LUNARNEWYEAR 2024 ', N'NEWYEAR24', 30, NULL, NULL, CAST(N'2024-01-31T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 1, N'offer1.png')
INSERT [dbo].[Offers] ([Id], [Title], [OfferCode], [Discount], [FromStation], [ToStation], [BeginDate], [EndDate], [Enabled], [Image]) VALUES (2, N'40% off for route HO CHI MINH to HA NOI', N'HCMHANOI', 40, N'Hồ Chí Minh', N'Hà Nội', CAST(N'2024-01-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-29T00:00:00.0000000' AS DateTime2), 1, N'offer2.png')
INSERT [dbo].[Offers] ([Id], [Title], [OfferCode], [Discount], [FromStation], [ToStation], [BeginDate], [EndDate], [Enabled], [Image]) VALUES (3, N'30% off for route HA NOI to DA LAT', N'HANOIDALAT30', 30, N'Hà Nội', N'Đà Lạt', CAST(N'2024-01-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-29T00:00:00.0000000' AS DateTime2), 1, N'offer3.png')
INSERT [dbo].[Offers] ([Id], [Title], [OfferCode], [Discount], [FromStation], [ToStation], [BeginDate], [EndDate], [Enabled], [Image]) VALUES (4, N'DISCOUNT 20% WITH CODE WELCOME2024', N'WELCOME2024', 20, N'Hồ Chí Minh', N'Bến Tre', CAST(N'2024-01-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 1, N'offer4.png')
SET IDENTITY_INSERT [dbo].[Offers] OFF
GO
SET IDENTITY_INSERT [dbo].[PromoteTrips] ON 

INSERT [dbo].[PromoteTrips] ([Id], [FromStation], [ToStation], [MinPrice], [Image]) VALUES (1, N'Hồ Chí Minh', N'Hà Nội', 100, N'image1.png')
INSERT [dbo].[PromoteTrips] ([Id], [FromStation], [ToStation], [MinPrice], [Image]) VALUES (2, N'Hà Nội', N'Đà Lạt', 250, N'image2.png')
INSERT [dbo].[PromoteTrips] ([Id], [FromStation], [ToStation], [MinPrice], [Image]) VALUES (3, N'Cà Mau', N'Hải Phòng', 280, N'image3.png')
INSERT [dbo].[PromoteTrips] ([Id], [FromStation], [ToStation], [MinPrice], [Image]) VALUES (4, N'Cần Thơ', N'Bình Định', 250, N'image4.png')
INSERT [dbo].[PromoteTrips] ([Id], [FromStation], [ToStation], [MinPrice], [Image]) VALUES (5, N'Hải Phòng', N'Nha Trang', 340, N'image5.png')
INSERT [dbo].[PromoteTrips] ([Id], [FromStation], [ToStation], [MinPrice], [Image]) VALUES (6, N'Đà Lạt', N'Cà Mau', 160, N'image6.png')
INSERT [dbo].[PromoteTrips] ([Id], [FromStation], [ToStation], [MinPrice], [Image]) VALUES (7, N'Nha Trang', N'Cần Thơ', 210, N'image7.png')
INSERT [dbo].[PromoteTrips] ([Id], [FromStation], [ToStation], [MinPrice], [Image]) VALUES (8, N'Bình Định', N'Thái Nguyên', 490, N'image8.png')
SET IDENTITY_INSERT [dbo].[PromoteTrips] OFF
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 

INSERT [dbo].[Seats] ([Id], [Name], [TripId], [UserId]) VALUES (1, N'B19', 1, 1)
INSERT [dbo].[Seats] ([Id], [Name], [TripId], [UserId]) VALUES (2, N'B20', 1, 1)
INSERT [dbo].[Seats] ([Id], [Name], [TripId], [UserId]) VALUES (3, N'B21', 1, 1)
INSERT [dbo].[Seats] ([Id], [Name], [TripId], [UserId]) VALUES (4, N'B19', 5, 1)
INSERT [dbo].[Seats] ([Id], [Name], [TripId], [UserId]) VALUES (5, N'B20', 5, 1)
INSERT [dbo].[Seats] ([Id], [Name], [TripId], [UserId]) VALUES (6, N'B21', 5, 1)
INSERT [dbo].[Seats] ([Id], [Name], [TripId], [UserId]) VALUES (7, N'B19', 15, 1)
INSERT [dbo].[Seats] ([Id], [Name], [TripId], [UserId]) VALUES (8, N'B20', 15, 1)
INSERT [dbo].[Seats] ([Id], [Name], [TripId], [UserId]) VALUES (9, N'B21', 15, 1)
INSERT [dbo].[Seats] ([Id], [Name], [TripId], [UserId]) VALUES (10, N'A07', 8, 1)
INSERT [dbo].[Seats] ([Id], [Name], [TripId], [UserId]) VALUES (11, N'A08', 8, 1)
INSERT [dbo].[Seats] ([Id], [Name], [TripId], [UserId]) VALUES (12, N'A09', 8, 1)
SET IDENTITY_INSERT [dbo].[Seats] OFF
GO
SET IDENTITY_INSERT [dbo].[Stations] ON 

INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (1, N'Hồ Chí Minh', N'395/1 Nam Kỳ Khởi Nghĩa P2 Q3')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (2, N'Hà Nội', N'126 Hai Bà Trưng P1 Q6')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (3, N'Đà Lạt', N'35 Hồ Xuân Hương P9 Q1')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (4, N'Cà Mau', N'3A Đất Mũi, Huyện Châu Thành, Tỉnh Cà Mau')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (5, N'Hải Phòng', N'39 Xã Nghĩa Lộ, Huyện Cát Hải, Thành phố Hải Phòng')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (6, N'Nha Trang', N'46 Trần Phú, Phường Lộc Thọ, Thành phố Nha Trang, Tỉnh Khánh Hòa')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (7, N'Cần Thơ', N'179 Lê Lợi, Phường Cái Khế, Quận Ninh Kiều, Thành phố Cần Thơ')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (8, N'Bình Định', N'219 Nguyễn Thái Học, Phường Lê Lợi, Thành phố Quy Nhơn, Tỉnh Bình Định')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (9, N'Thái Nguyên', N'208 Lương Ngọc Quyến, Phường Quang Trung, Thành phố Thái Nguyên, Tỉnh Thái Nguyên')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (10, N'Tây Nguyên', N'33 Nguyễn Thị Minh Khai, Phường Thắng Nhì, Thành phố Buôn Ma Thuột, Tỉnh Đắk Lắk')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (11, N'Lạng Sơn', N'215 Bà Triệu, Phường Chi Lăng, Thành phố Lạng Sơn, Tỉnh Lạng Sơn')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (12, N'Bến Tre', N'284B Nguyễn Thị Minh Khai, Phường 8, Thành phố Bến Tre, Tỉnh Bến Tre')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (13, N'Long An', N'268A Hùng Vương, Phường 6, Thành phố Tân An, Tỉnh Long An')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (14, N'Trà Vinh', N'275 Nguyễn Thị Minh Khai, Phường 3, Thành phố Trà Vinh, Tỉnh Trà Vinh')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (15, N'Mỹ Tho', N'119 Bến Tre, Phường 4, Thành phố Mỹ Tho, Tỉnh Tiền Giang')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (16, N'Tiền Giang', N'102 Nguyễn Huệ, Phường 1, Thành phố Mỹ Tho, Tỉnh Tiền Giang')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (17, N'Vĩnh Long', N'217 Cách Mạng Tháng Tám, Phường 8, Thành phố Vĩnh Long, Tỉnh Vĩnh Long')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (18, N'Bình Thuận', N'60 Trần Hưng Đạo, Phường Phú Tài, Thành phố Phan Thiết, Tỉnh Bình Thuận')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (19, N'Vũng Tàu', N'141 Nam Kỳ Khởi Nghĩa, Phường 3, Thành phố Vũng Tàu, Tỉnh Bà Rịa - Vũng Tàu')
INSERT [dbo].[Stations] ([Id], [Name], [Address]) VALUES (20, N'Bắc Giang', N'188 Hoàng Văn Thụ, Phường Hoàng Văn Thụ, Thành phố Bắc Giang, Tỉnh Bắc Giang')
SET IDENTITY_INSERT [dbo].[Stations] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Id], [Code], [TripId], [UserId], [SeatsList], [TotalPrice], [isCancel], [Note], [BookDate]) VALUES (1, N'20240201103827', 1, 1, N'B19, B20, B21', 300, 0, N'0 children + 0 teenage + 0 elder', CAST(N'2024-01-31T10:38:27.4312288' AS DateTime2))
INSERT [dbo].[Tickets] ([Id], [Code], [TripId], [UserId], [SeatsList], [TotalPrice], [isCancel], [Note], [BookDate]) VALUES (2, N'20240201103851', 5, 1, N'B19, B20, B21', 1200, 0, N'0 children + 0 teenage + 0 elder', CAST(N'2024-01-31T10:38:51.5476472' AS DateTime2))
INSERT [dbo].[Tickets] ([Id], [Code], [TripId], [UserId], [SeatsList], [TotalPrice], [isCancel], [Note], [BookDate]) VALUES (3, N'20240201103911', 15, 1, N'B19, B20, B21', 1260, 0, N'0 children + 0 teenage + 0 elder', CAST(N'2024-02-01T10:39:11.2812017' AS DateTime2))
INSERT [dbo].[Tickets] ([Id], [Code], [TripId], [UserId], [SeatsList], [TotalPrice], [isCancel], [Note], [BookDate]) VALUES (4, N'20240201103930', 8, 1, N'A07, A08, A09', 480, 0, N'0 children + 0 teenage + 0 elder', CAST(N'2024-02-01T10:39:30.6791898' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[Trips] ON 

INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (1, CAST(N'2024-02-14T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-15T00:00:00.0000000' AS DateTime2), 100, 1, 1, 1, 2, N'image1.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (2, CAST(N'2024-02-14T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-15T00:00:00.0000000' AS DateTime2), 200, 2, 2, 1, 2, N'image2.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (3, CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), 300, 3, 3, 1, 2, N'image3.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (4, CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), 350, 4, 4, 1, 2, N'image4.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (5, CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), 400, 5, 5, 2, 3, N'image5.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (6, CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), 250, 6, 6, 2, 3, N'image6.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (8, CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), 160, 8, 8, 3, 4, N'image8.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (9, CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), 180, 9, 9, 3, 4, N'image9.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (10, CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), 190, 10, 10, 3, 4, N'image10.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (11, CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), 290, 1, 1, 4, 5, N'image11.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (12, CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), 340, 2, 2, 4, 5, N'image12.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (13, CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), 360, 3, 3, 4, 5, N'image13.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (14, CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), 280, 4, 4, 4, 5, N'image14.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (15, CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), 420, 5, 5, 5, 6, N'image15.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (16, CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), 340, 6, 6, 5, 6, N'image16.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (18, CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), 210, 8, 8, 6, 7, N'image18.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (19, CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), 270, 9, 9, 6, 7, N'image19.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (20, CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), 230, 10, 10, 6, 7, N'image20.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (21, CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), 280, 1, 1, 7, 8, N'image21.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (22, CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), 320, 2, 2, 7, 8, N'image22.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (23, CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), 410, 3, 3, 7, 8, N'image23.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (24, CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), 250, 4, 4, 7, 8, N'image24.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (25, CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), 590, 5, 5, 8, 9, N'image25.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (26, CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), 490, 6, 6, 8, 9, N'image26.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (28, CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), 220, 8, 8, 9, 10, N'image28.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (29, CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), 390, 9, 9, 9, 10, N'image29.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (30, CAST(N'2024-02-03T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), 270, 10, 10, 9, 10, N'image30.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (31, CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), 100, 1, 1, 1, 2, N'image31.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (32, CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), 200, 2, 2, 1, 2, N'image32.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (33, CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), 300, 3, 3, 1, 2, N'image33.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (34, CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), 350, 4, 4, 1, 2, N'image34.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (35, CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), 400, 5, 5, 2, 3, N'image35.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (36, CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), 250, 6, 6, 2, 3, N'image36.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (38, CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), 160, 8, 8, 3, 4, N'image38.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (39, CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), 180, 9, 9, 3, 4, N'image39.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (40, CAST(N'2024-02-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), 190, 10, 10, 3, 4, N'image40.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (41, CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), 290, 1, 1, 4, 5, N'image41.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (42, CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), 340, 2, 2, 4, 5, N'image42.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (43, CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), 360, 3, 3, 4, 5, N'image43.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (44, CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), 280, 4, 4, 4, 5, N'image44.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (45, CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), 420, 5, 5, 5, 6, N'image45.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (46, CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), 340, 6, 6, 5, 6, N'image46.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (48, CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), 210, 8, 8, 6, 7, N'image48.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (49, CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), 270, 9, 9, 6, 7, N'image49.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (50, CAST(N'2024-02-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), 230, 10, 10, 6, 7, N'image50.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (51, CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), 280, 1, 1, 7, 8, N'image51.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (52, CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), 320, 2, 2, 7, 8, N'image52.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (53, CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), 410, 3, 3, 7, 8, N'image53.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (54, CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), 250, 4, 4, 7, 8, N'image54.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (55, CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), 590, 5, 5, 8, 9, N'image55.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (56, CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), 490, 6, 6, 8, 9, N'image56.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (58, CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), 220, 8, 8, 9, 10, N'image58.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (59, CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), 390, 9, 9, 9, 10, N'image59.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (60, CAST(N'2024-02-06T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), 270, 10, 10, 9, 10, N'image60.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (61, CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), 100, 1, 1, 1, 2, N'image61.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (62, CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), 200, 2, 2, 1, 2, N'image62.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (63, CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), 300, 3, 3, 1, 2, N'image63.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (64, CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), 350, 4, 4, 1, 2, N'image64.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (65, CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), 400, 5, 5, 2, 3, N'image65.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (66, CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), 250, 6, 6, 2, 3, N'image66.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (68, CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), 160, 8, 8, 3, 4, N'image68.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (69, CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), 180, 9, 9, 3, 4, N'image69.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (70, CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), 190, 10, 10, 3, 4, N'image70.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (71, CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), 290, 1, 1, 4, 5, N'image71.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (72, CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), 340, 2, 2, 4, 5, N'image72.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (73, CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), 360, 3, 3, 4, 5, N'image73.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (74, CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), 280, 4, 4, 4, 5, N'image74.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (75, CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), 420, 5, 5, 5, 6, N'image75.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (76, CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), 340, 6, 6, 5, 6, N'image76.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (78, CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), 210, 8, 8, 6, 7, N'image78.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (79, CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), 270, 9, 9, 6, 7, N'image79.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (80, CAST(N'2024-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), 230, 10, 10, 6, 7, N'image80.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (81, CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 280, 1, 1, 7, 8, N'image81.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (82, CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 320, 2, 2, 7, 8, N'image82.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (83, CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 410, 3, 3, 7, 8, N'image83.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (84, CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 250, 4, 4, 7, 8, N'image84.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (85, CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 590, 5, 5, 8, 9, N'image85.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (86, CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 490, 6, 6, 8, 9, N'image86.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (88, CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 220, 8, 8, 9, 10, N'image88.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (89, CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 390, 9, 9, 9, 10, N'image89.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (90, CAST(N'2024-02-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), 270, 10, 10, 9, 10, N'image90.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (91, CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), 100, 1, 1, 1, 2, N'image91.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (92, CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), 200, 2, 2, 1, 2, N'image92.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (93, CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), 300, 3, 3, 1, 2, N'image93.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (94, CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), 350, 4, 4, 1, 2, N'image94.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (95, CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), 400, 5, 5, 2, 3, N'image95.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (96, CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), 250, 6, 6, 2, 3, N'image96.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (98, CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), 160, 8, 8, 3, 4, N'image98.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (99, CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), 180, 9, 9, 3, 4, N'image99.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (100, CAST(N'2024-02-10T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), 190, 10, 10, 3, 4, N'image100.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (101, CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), 290, 1, 1, 4, 5, N'image101.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (102, CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), 340, 2, 2, 4, 5, N'image102.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (103, CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), 360, 3, 3, 4, 5, N'image103.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (104, CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), 280, 4, 4, 4, 5, N'image104.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (105, CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), 420, 5, 5, 5, 6, N'image105.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (106, CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), 340, 6, 6, 5, 6, N'image106.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (108, CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), 210, 8, 8, 6, 7, N'image108.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (109, CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), 270, 9, 9, 6, 7, N'image109.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (110, CAST(N'2024-02-11T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), 230, 10, 10, 6, 7, N'image110.jpg')
GO
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (111, CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), 280, 1, 1, 7, 8, N'image111.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (112, CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), 320, 2, 2, 7, 8, N'image112.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (113, CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), 410, 3, 3, 7, 8, N'image113.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (114, CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), 250, 4, 4, 7, 8, N'image114.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (115, CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), 590, 5, 5, 8, 9, N'image115.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (116, CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), 490, 6, 6, 8, 9, N'image116.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (118, CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), 220, 8, 8, 9, 10, N'image118.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (119, CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), 390, 9, 9, 9, 10, N'image119.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (120, CAST(N'2024-02-12T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), 270, 10, 10, 9, 10, N'image120.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (121, CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-14T00:00:00.0000000' AS DateTime2), 100, 1, 1, 1, 2, N'image121.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (122, CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-14T00:00:00.0000000' AS DateTime2), 200, 2, 2, 1, 2, N'image122.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (123, CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-14T00:00:00.0000000' AS DateTime2), 300, 3, 3, 1, 2, N'image123.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (124, CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-14T00:00:00.0000000' AS DateTime2), 350, 4, 4, 1, 2, N'image124.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (125, CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-14T00:00:00.0000000' AS DateTime2), 400, 5, 5, 2, 3, N'image125.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (126, CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-14T00:00:00.0000000' AS DateTime2), 250, 6, 6, 2, 3, N'image126.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (128, CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-14T00:00:00.0000000' AS DateTime2), 160, 8, 8, 3, 4, N'image128.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (129, CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-14T00:00:00.0000000' AS DateTime2), 180, 9, 9, 3, 4, N'image129.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (130, CAST(N'2024-02-13T00:00:00.0000000' AS DateTime2), CAST(N'2024-02-14T00:00:00.0000000' AS DateTime2), 190, 10, 10, 3, 4, N'image130.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (131, CAST(N'2024-01-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-01-30T00:00:00.0000000' AS DateTime2), 100, 1, 1, 1, 2, N'image1.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (132, CAST(N'2024-01-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-01-30T00:00:00.0000000' AS DateTime2), 200, 2, 2, 1, 2, N'image2.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (133, CAST(N'2024-01-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-01-30T00:00:00.0000000' AS DateTime2), 300, 3, 3, 1, 2, N'image3.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (134, CAST(N'2024-01-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-01-30T00:00:00.0000000' AS DateTime2), 350, 4, 4, 1, 2, N'image4.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (135, CAST(N'2024-01-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-01-30T00:00:00.0000000' AS DateTime2), 400, 5, 5, 2, 3, N'image5.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (136, CAST(N'2024-01-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-01-30T00:00:00.0000000' AS DateTime2), 250, 6, 6, 2, 3, N'image6.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (138, CAST(N'2024-01-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-01-30T00:00:00.0000000' AS DateTime2), 160, 8, 8, 3, 4, N'image8.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (139, CAST(N'2024-01-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-01-30T00:00:00.0000000' AS DateTime2), 180, 9, 9, 3, 4, N'image9.jpg')
INSERT [dbo].[Trips] ([Id], [StartTime], [FinishTime], [TicketPrice], [BusId], [DriverId], [FromStationId], [ToStationId], [Image]) VALUES (140, CAST(N'2024-01-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-01-30T00:00:00.0000000' AS DateTime2), 190, 10, 10, 3, 4, N'image10.jpg')
SET IDENTITY_INSERT [dbo].[Trips] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Avatar], [Role]) VALUES (1, N'admin@phtv.com', N'$2a$11$05Ra0nLyV28Qm83w8AXnzeYhU/XvENlFpPIkIIyLAdEKiAlrvc3XC', NULL, NULL, N'Admin')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Avatar], [Role]) VALUES (2, N'emp@phtv.com', N'$2a$11$lO.DhNPYdJ1mO14u3vLaPuQ8QAq1GhtW1RgV7H4z5nx72vHC8pDFe', NULL, NULL, N'Mod')
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Avatar], [Role]) VALUES (3, N'user@phtv.com', N'$2a$11$3q/k8Zxj8MTzy.pkweUbSu/kS8c7UW1zzvwPL7V7JDd2IL87BslFm', NULL, NULL, N'User')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Buses_BusPlate]    Script Date: 01/02/2024 11:49:16 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Buses_BusPlate] ON [dbo].[Buses]
(
	[BusPlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Buses_BusTypeId]    Script Date: 01/02/2024 11:49:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Buses_BusTypeId] ON [dbo].[Buses]
(
	[BusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BusStations_StationId]    Script Date: 01/02/2024 11:49:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_BusStations_StationId] ON [dbo].[BusStations]
(
	[StationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_NewsId]    Script Date: 01/02/2024 11:49:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_NewsId] ON [dbo].[Comments]
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 01/02/2024 11:49:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Seats_TripId]    Script Date: 01/02/2024 11:49:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Seats_TripId] ON [dbo].[Seats]
(
	[TripId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_TripId]    Script Date: 01/02/2024 11:49:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_TripId] ON [dbo].[Tickets]
(
	[TripId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_UserId]    Script Date: 01/02/2024 11:49:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_UserId] ON [dbo].[Tickets]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Trips_BusId]    Script Date: 01/02/2024 11:49:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Trips_BusId] ON [dbo].[Trips]
(
	[BusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Trips_DriverId]    Script Date: 01/02/2024 11:49:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Trips_DriverId] ON [dbo].[Trips]
(
	[DriverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Trips_FromStationId]    Script Date: 01/02/2024 11:49:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Trips_FromStationId] ON [dbo].[Trips]
(
	[FromStationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Trips_ToStationId]    Script Date: 01/02/2024 11:49:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Trips_ToStationId] ON [dbo].[Trips]
(
	[ToStationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Buses]  WITH CHECK ADD  CONSTRAINT [FK_Buses_BusTypes_BusTypeId] FOREIGN KEY([BusTypeId])
REFERENCES [dbo].[BusTypes] ([Id])
GO
ALTER TABLE [dbo].[Buses] CHECK CONSTRAINT [FK_Buses_BusTypes_BusTypeId]
GO
ALTER TABLE [dbo].[BusStations]  WITH CHECK ADD  CONSTRAINT [FK_BusStations_Buses_BusId] FOREIGN KEY([BusId])
REFERENCES [dbo].[Buses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BusStations] CHECK CONSTRAINT [FK_BusStations_Buses_BusId]
GO
ALTER TABLE [dbo].[BusStations]  WITH CHECK ADD  CONSTRAINT [FK_BusStations_Stations_StationId] FOREIGN KEY([StationId])
REFERENCES [dbo].[Stations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BusStations] CHECK CONSTRAINT [FK_BusStations_Stations_StationId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_News_NewsId] FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_News_NewsId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_Trips_TripId] FOREIGN KEY([TripId])
REFERENCES [dbo].[Trips] ([Id])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_Trips_TripId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Trips_TripId] FOREIGN KEY([TripId])
REFERENCES [dbo].[Trips] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Trips_TripId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Users_UserId]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [FK_Trips_Buses_BusId] FOREIGN KEY([BusId])
REFERENCES [dbo].[Buses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [FK_Trips_Buses_BusId]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [FK_Trips_Drivers_DriverId] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Drivers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [FK_Trips_Drivers_DriverId]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [FK_Trips_Stations_FromStationId] FOREIGN KEY([FromStationId])
REFERENCES [dbo].[Stations] ([Id])
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [FK_Trips_Stations_FromStationId]
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD  CONSTRAINT [FK_Trips_Stations_ToStationId] FOREIGN KEY([ToStationId])
REFERENCES [dbo].[Stations] ([Id])
GO
ALTER TABLE [dbo].[Trips] CHECK CONSTRAINT [FK_Trips_Stations_ToStationId]
GO
USE [master]
GO
ALTER DATABASE [busOnlineTicket] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [moviedb]    Script Date: 1/9/2022 1:54:50 AM ******/
CREATE DATABASE [moviedb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'moviedb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NGUYEN\MSSQL\DATA\moviedb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'moviedb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NGUYEN\MSSQL\DATA\moviedb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [moviedb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [moviedb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [moviedb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [moviedb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [moviedb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [moviedb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [moviedb] SET ARITHABORT OFF 
GO
ALTER DATABASE [moviedb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [moviedb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [moviedb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [moviedb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [moviedb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [moviedb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [moviedb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [moviedb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [moviedb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [moviedb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [moviedb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [moviedb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [moviedb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [moviedb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [moviedb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [moviedb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [moviedb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [moviedb] SET RECOVERY FULL 
GO
ALTER DATABASE [moviedb] SET  MULTI_USER 
GO
ALTER DATABASE [moviedb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [moviedb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [moviedb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [moviedb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [moviedb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [moviedb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'moviedb', N'ON'
GO
ALTER DATABASE [moviedb] SET QUERY_STORE = OFF
GO
USE [moviedb]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 1/9/2022 1:54:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[num] [int] IDENTITY(1,1) NOT NULL,
	[idMember] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[MovieName] [nvarchar](50) NOT NULL,
	[Showtime] [nvarchar](50) NULL,
	[Postition] [char](10) NULL,
	[Theater] [int] NULL,
	[Payment] [varchar](20) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 1/9/2022 1:54:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[idEmployee] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Phone] [varchar](12) NULL,
	[Email] [varchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Password] [varchar](20) NOT NULL,
	[Gender] [varchar](10) NULL,
	[BirthDate] [date] NULL,
	[EmployeeName] [nvarchar](100) NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[idEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 1/9/2022 1:54:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NULL,
	[ReleaseDate] [date] NULL,
	[RunningTime] [nvarchar](50) NULL,
	[Rate] [nvarchar](50) NULL,
	[Cast] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Movies_1] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 1/9/2022 1:54:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[num] [int] IDENTITY(1,1) NOT NULL,
	[MemberName] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](12) NULL,
	[Content] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SelectPos]    Script Date: 1/9/2022 1:54:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelectPos](
	[num] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NOT NULL,
	[Showtime] [nvarchar](50) NULL,
	[Postition] [char](10) NULL,
 CONSTRAINT [PK__SelectPo__DF908D655B4744D8] PRIMARY KEY CLUSTERED 
(
	[num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Showtime]    Script Date: 1/9/2022 1:54:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Showtime](
	[num] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NOT NULL,
	[ShowTime] [int] NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[Seat] [int] NULL,
	[Theater] [int] NULL,
 CONSTRAINT [PK__Showtime__DF908D659EA3B8F5] PRIMARY KEY CLUSTERED 
(
	[num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (1, 10, 6, N'ÂM HỒN NHẬP XÁC', N'Xuất chiếu 1: 17:00:00 - 19:00:00', N'D4        ', 6, N'Paypal')
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (2, 9, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'C3        ', 1, N'Visa')
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (3, 10, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'B2        ', 1, N'Paypal')
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (4, 10, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'D5        ', 1, N'Paypal')
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (5, 13, 2, N'SHANG-CHI VÀ HUYỀN THOẠI THẬP LUÂN', N'Xuất chiếu 1: 07:00:00 - 09:30:00', N'B4        ', 2, N'Momo')
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (6, 13, 2, N'SHANG-CHI VÀ HUYỀN THOẠI THẬP LUÂN', N'Xuất chiếu 1: 07:00:00 - 09:30:00', N'C6        ', 2, N'Momo')
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([idEmployee], [Username], [Phone], [Email], [Address], [Password], [Gender], [BirthDate], [EmployeeName]) VALUES (4, N'khangnv', N'09999999', N'khangnv@mail.com', NULL, N'123456', NULL, NULL, NULL)
INSERT [dbo].[Employees] ([idEmployee], [Username], [Phone], [Email], [Address], [Password], [Gender], [BirthDate], [EmployeeName]) VALUES (7, N'luannv', N'09898989', N'luannv@mail.com', NULL, N'123456', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (1, N'ETERNALS', N'Hành Động, Phiêu Lưu, Thần thoại', CAST(N'2021-12-03' AS Date), N'155 phút', N'C16', N'Gemma Chan, Angelina Jolie, Salma Hayek, Richard Madden, Kit Harington, Barry Keoghan', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (2, N'SHANG-CHI VÀ HUYỀN THOẠI THẬP LUÂN', N'Hành Động', CAST(N'2021-11-26' AS Date), N'136 phút', N'C13 ', N'Simu Liu, Awkwafina, Tony Chiu-Wai Leung', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (3, N'SUICIDE SQUAD: ĐIỆP VỤ CẢM TỬ', N'Hành Động', CAST(N'2021-11-19' AS Date), N'132 phút', N'C18 ', N'Margot Robbie, Idris Elba, John Cena', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (4, N'HỐ SÂU TỬ THẦN', N'Hồi hộp, Kinh Dị', CAST(N'2021-11-19' AS Date), N'89 phút', N'C16 ', N'Alicia Sanz, Adan Canto, Will Patton, Zach Avery, Chinaza Uche', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (5, N'THỤ HẢI: RỪNG TỬ KHÍ', N'Kinh Dị', CAST(N'2021-12-03' AS Date), N'116 phút', N'C18 ', N'Yumi Adachi, Hideko Hara, Fûju Kamio', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (6, N'ÂM HỒN NHẬP XÁC', N'Kinh Dị', CAST(N'2021-11-19' AS Date), N'120 phút', N'C16 ', N'Sawanee Utoomma, Narilya Gulmongkolpech, Sirani Yankittikan', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (7, N'GÓA PHỤ ĐEN', N'Hành Động, Phiêu Lưu', CAST(N'2021-11-19' AS Date), N'133 phút', N'C18', N'Scarlett Johansson, Florence Pugh, Robert Downey Jr', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (8, N'VỆ SĨ SÁT THỦ 2: NHÀ CÓ NÓC', N'Hài, Hành Động', CAST(N'2021-11-26' AS Date), N'124 phút', N'C16', N'Trúc Anh, Amee, Salim, Samuel An', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (9, N'THIÊN THẦN HỘ MỆNH', N'Hồi hộp, Tâm Lý', CAST(N'2021-12-17' AS Date), N'97 phút', N'C18', N'Tom Hardy, Michelle Williams', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (10, N'VENOM: ĐỐI MẶT TỬ THÙ', N'Hành động', CAST(N'2021-12-17' AS Date), N'97 phút', N'C16', N'Tom Hardy, Michelle Williams', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (11, N'A QUIET PLACE PART II', N'Kinh dị', CAST(N'2021-11-26' AS Date), N'100 phút', N'C16', N'Emily Blunt, Noah Jupe', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (12, N'BLACKPINK : THE MOVIE', N'Musical', CAST(N'2021-12-10' AS Date), N'96 phút', N'P', N'Kim Ji-soo, Black Pink, Jennie Kim', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (13, N'DORAEMON 2 : STAND BY ME', N'Hoạt hình', CAST(N'2021-12-03' AS Date), N'120 phút', N'P', NULL, NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (14, N'SPIDER-MAN: NO WAY HOME', N'Hành động', CAST(N'2021-12-17' AS Date), N'100 phút', N'C13 ', N'Benedict Cumberbatch, Tom Holland', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (15, N'DUNE: HÀNH TINH CÁT', N'Hành động, phiêu lưu', CAST(N'2021-10-12' AS Date), N'118 phút', N'C16', N'Timothée Chalamet, Rebecca Ferguson, Zendaya', NULL)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Movies]
GO
ALTER TABLE [dbo].[SelectPos]  WITH CHECK ADD  CONSTRAINT [FK_SelectPos_Booking] FOREIGN KEY([num])
REFERENCES [dbo].[Booking] ([num])
GO
ALTER TABLE [dbo].[SelectPos] CHECK CONSTRAINT [FK_SelectPos_Booking]
GO
ALTER TABLE [dbo].[SelectPos]  WITH CHECK ADD  CONSTRAINT [FK_SelectPos_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[SelectPos] CHECK CONSTRAINT [FK_SelectPos_Movies]
GO
ALTER TABLE [dbo].[Showtime]  WITH CHECK ADD  CONSTRAINT [FK_Showtime_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Showtime] CHECK CONSTRAINT [FK_Showtime_Movies]
GO
USE [master]
GO
ALTER DATABASE [moviedb] SET  READ_WRITE 
GO

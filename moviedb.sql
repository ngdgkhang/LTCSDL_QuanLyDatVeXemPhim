USE [master]
GO
/****** Object:  Database [moviedb]    Script Date: 20/1/2022 7:30:15 PM ******/
CREATE DATABASE [moviedb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'moviedb', FILENAME = N'D:\SQLL\MSSQL15.MSSQLSERVER01\MSSQL\DATA\moviedb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'moviedb_log', FILENAME = N'D:\SQLL\MSSQL15.MSSQLSERVER01\MSSQL\DATA\moviedb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Booking]    Script Date: 20/1/2022 7:30:16 PM ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 20/1/2022 7:30:16 PM ******/
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
	[Password] [varchar](max) NOT NULL,
	[Gender] [varchar](10) NULL,
	[BirthDate] [date] NULL,
	[EmployeeName] [nvarchar](100) NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[idEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 20/1/2022 7:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[idMember] [int] IDENTITY(1,1) NOT NULL,
	[MemberName] [nvarchar](100) NOT NULL,
	[Phone] [varchar](12) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[BirthDate] [date] NULL,
	[Gender] [varchar](10) NULL,
 CONSTRAINT [PK__Member__7399FC4E5CB8A99D] PRIMARY KEY CLUSTERED 
(
	[idMember] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 20/1/2022 7:30:16 PM ******/
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
/****** Object:  Table [dbo].[SelectPos]    Script Date: 20/1/2022 7:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelectPos](
	[num] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NOT NULL,
	[Showtime] [nvarchar](50) NULL,
	[Postition] [char](10) NULL,
 CONSTRAINT [PK_SelectPos] PRIMARY KEY CLUSTERED 
(
	[num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Showtime]    Script Date: 20/1/2022 7:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Showtime](
	[num] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[ShowTime] [int] NULL,
	[StartTime] [varchar](50) NULL,
	[EndTime] [varchar](50) NULL,
	[Seat] [int] NULL,
	[Theater] [int] NULL,
 CONSTRAINT [PK__Showtime__DF908D659EA3B8F5] PRIMARY KEY CLUSTERED 
(
	[num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (1, 1, 6, N'ÂM HỒN NHẬP XÁC', N'Xuất chiếu 1: 17:00:00 - 19:00:00', N'D4        ', 6, N'Paypal')
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (2, 2, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'C3        ', 1, N'Visa')
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (3, 2, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'C4        ', 1, N'Paypal')
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (4, 2, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'C5        ', 1, N'Paypal')
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (5, 3, 2, N'SHANG-CHI VÀ HUYỀN THOẠI THẬP LUÂN', N'Xuất chiếu 1: 07:00:00 - 09:30:00', N'B5        ', 2, N'Momo')
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (6, 3, 2, N'SHANG-CHI VÀ HUYỀN THOẠI THẬP LUÂN', N'Xuất chiếu 1: 07:00:00 - 09:30:00', N'B6        ', 2, N'Momo')
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (7, 2, 14, N'SPIDER-MAN: NO WAY HOME', N'Xuất chiếu 1: 09:30:00 - 11:50:00', N'A1        ', 2, NULL)
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (8, 3, 14, N'SPIDER-MAN: NO WAY HOME', N'Xuất chiếu 1: 09:30:00 - 11:50:00', N'A2        ', 2, NULL)
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (9, 3, 3, N'SUICIDE SQUAD: ĐIỆP VỤ CẢM TỬ', N'Xuất chiếu 1: 11:00:00 - 13:20:00', N'A1        ', 3, NULL)
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (10, 2, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'A1        ', 1, NULL)
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (11, 1, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'A2        ', 1, NULL)
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (12, 1, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'A3        ', 1, NULL)
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (13, 1, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'B6        ', 1, NULL)
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (14, 1, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'A4        ', 1, NULL)
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (16, 1, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'C1        ', 1, NULL)
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (17, 2, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'C5        ', 1, NULL)
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (18, 1, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'B2        ', 1, NULL)
INSERT [dbo].[Booking] ([num], [idMember], [MovieID], [MovieName], [Showtime], [Postition], [Theater], [Payment]) VALUES (19, 1, 1, N'ETERNALS', N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'B7        ', 1, NULL)
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([idEmployee], [Username], [Phone], [Email], [Address], [Password], [Gender], [BirthDate], [EmployeeName]) VALUES (4, N'khangnv', N'09999999', N'khangnv@mail.com', NULL, N'123456', NULL, NULL, NULL)
INSERT [dbo].[Employees] ([idEmployee], [Username], [Phone], [Email], [Address], [Password], [Gender], [BirthDate], [EmployeeName]) VALUES (7, N'luannv', N'09898989', N'luannv@mail.com', NULL, N'123456', NULL, NULL, NULL)
INSERT [dbo].[Employees] ([idEmployee], [Username], [Phone], [Email], [Address], [Password], [Gender], [BirthDate], [EmployeeName]) VALUES (8, N'khang123', NULL, N'khang@mail.com', NULL, N'7110EDA4D09E062AA5E4A390B0A572AC0D2C0220', NULL, NULL, N'Nguyễn Đăng Khang')
INSERT [dbo].[Employees] ([idEmployee], [Username], [Phone], [Email], [Address], [Password], [Gender], [BirthDate], [EmployeeName]) VALUES (1008, N'khang123', NULL, N'khang@mail.com', NULL, N'7C4A8D09CA3762AF61E59520943DC26494F8941B', NULL, NULL, N'Nguyễn Đăng Khang')
INSERT [dbo].[Employees] ([idEmployee], [Username], [Phone], [Email], [Address], [Password], [Gender], [BirthDate], [EmployeeName]) VALUES (1009, N'nguyen', NULL, N'nguyen@gmail.com', NULL, N'7C4A8D09CA3762AF61E59520943DC26494F8941B', NULL, NULL, N'nguyen')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (1, N'Trần Khang', N'034675891451', N'khang@mail.com', N'Q. Bình Thanh', CAST(N'1997-02-04' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (2, N'Hoàng Kiên', N'031554985659', N'kien@mail.com', N'Q.Tân Bình', CAST(N'2002-03-04' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (3, N'Nguyên ', N'054623265613', N'nguyen@mail.com', N'Q.Tân Bình', CAST(N'2003-03-04' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (4, N'Bảo Vy', N'061616412515', N'vy@mail.com', N'Q. Bình Thanh', CAST(N'1996-02-01' AS Date), N'Nu')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (5, N'Gia Hân', N'046232623265', N'ghan@mail.com', N'Q. Bình Thanh', CAST(N'1997-01-23' AS Date), N'Nu')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (6, N'Phương Thảo', N'094931131351', N'pthao@mail.com', N'Q.Tân Bình', CAST(N'1995-01-12' AS Date), N'Nu')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (7, N'Minh Tâm', N'051315130531', N'minhtam123@mail.com', N'Q. Gò Vap', CAST(N'1995-06-25' AS Date), N'Nu')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (8, N'Thảo Chi', N'051351265131', N'thaochii@mail.com', N'Q. Bình Thanh', CAST(N'1995-07-23' AS Date), N'Nu')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (9, N'Tú Vi', N'078131513213', N'tuvi23@mail.com', N'Q. Thu Ðuc', CAST(N'2001-01-01' AS Date), N'Nu')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (10, N'Lan Hương', N'084512331236', N'lanhuong197@mail.com', N'Q. Bình Thanh', CAST(N'1996-06-06' AS Date), N'Nu')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (11, N'Mạnh Cường', N'091315312135', N'mcuong423@mail.com', N'Q.Tân Bình', CAST(N'1992-04-03' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (12, N'Việt Cường', N'012351516531', N'vietcuong131@mail.com', N'Q. Bình Tân', CAST(N'1993-09-08' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (13, N'Quốc Dũng', N'016632632132', N'dung22@mail.com', N'Q. Bình Thanh', CAST(N'1994-05-07' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (14, N'Anh Dũng', N'013256462312', N'anhdung97@mail.com', N'Q. Bình Tân', CAST(N'1995-06-16' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (15, N'Tiến Dũng', N'064315313225', N'dungt127@mail.com', N'Q. Bình Thanh', CAST(N'1995-09-04' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (16, N'Tuấn Hưng', N'061542215325', N'tuanhung@mail.com', N'Q. Bình Tân', CAST(N'1999-03-04' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (17, N'Gia Hưng', N'061326136236', N'giahung154@mail.com', N'Q. Bình Tân', CAST(N'1997-06-28' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (18, N'Quang Lộc', N'062335664626', N'quangloc12@mail.com', N'Q. Bình Thanh', CAST(N'1997-08-24' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (19, N'Phúc Lâm', N'065665616653', N'plam44@mail.com', N'Q. Bình Tân', CAST(N'1989-05-12' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (20, N'Minh Khôi', N'094315431632', N'mkhoi456@mail.com', N'Q.Tân Bình', CAST(N'1995-06-25' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (21, N'Mạnh Khôi', N'016546356165', N'manhkhoi42@mail.com', N'Q. Bình Thanh', CAST(N'1995-06-25' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (22, N'Khôi Nguyên', N'064952534463', N'khoinguyen@mail.com', N'Q. Bình Tân', CAST(N'1995-01-12' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (23, N'Hoàng Nam', N'013165255665', N'hoangnamk223@mail.com', N'Q. Bình Thanh', CAST(N'1989-05-12' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (24, N'Hoàng Phi', N'046183253215', N'hoangphi298@mail.com', N'Q.Tân Bình', CAST(N'1995-01-12' AS Date), N'Nam')
INSERT [dbo].[Member] ([idMember], [MemberName], [Phone], [Email], [Address], [BirthDate], [Gender]) VALUES (25, N'Hữu Thiện', N'068995645565', N'thien1189@mail.com', N'Q. Bình Thanh', CAST(N'1989-05-12' AS Date), N'Nam')
SET IDENTITY_INSERT [dbo].[Member] OFF
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
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (12, N'BLACKPINK : THE MOVIE', N'Musical', CAST(N'2021-12-10' AS Date), N'96 phút', N'C16', N'Kim Ji-soo, Black Pink, Jennie Kim', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (13, N'DORAEMON 2 : STAND BY ME', N'Hoạt hình', CAST(N'2021-12-03' AS Date), N'120 phút', N'C16', N'	
Mizuta Wasabi
Ōhara Megumi
Kakazu Yumi
Kimura Subaru
Seki Tomokazu', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (14, N'SPIDER-MAN: NO WAY HOME', N'Hành động', CAST(N'2021-12-17' AS Date), N'100 phút', N'C13 ', N'Benedict Cumberbatch, Tom Holland', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (15, N'DUNE: HÀNH TINH CÁT', N'Hành động, phiêu lưu', CAST(N'2021-10-12' AS Date), N'118 phút', N'C16', N'Timothée Chalamet, Rebecca Ferguson, Zendaya', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (16, N'BLACK PANTHER', N'Hành động', CAST(N'2021-02-16' AS Date), N'134 phút', N'C16', N' Chadwick Boseman, Michael B. Jordan, Lupita Nyong''o, Danai Gurira, Martin Freeman, Daniel Kaluuya, Letitia Wright, Winston Duke, Angela Bassett, Forest Whitaker', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (17, N'AVENGERS: INFINITY WAR', N'Hành động ', CAST(N'2021-04-25' AS Date), N'149 phút', N'C16', N'Robert Downey Jr., Chris Hemsworth, Mark Ruffalo, Chris Evans, Scarlett Johansson, Benedict Cumberbatch, Don Cheadle, Tom Holland', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (18, N'GIA ĐÌNH SIÊU NHÂN 2 – INCREDIBLES 2', N'Hoạt hình', CAST(N'2021-06-15' AS Date), N'118 phút', N'C16', N' Craig T. Nelson, Holly Hunter, SarahVowell và Samuel L. Jackson', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (19, N'CÔNG VIÊN KỶ JURA – VƯƠNG QUỐC SỤP ĐỔ', N'Phiêu lưu', CAST(N'2021-06-11' AS Date), N'128 phút', N'C16', N'Chris Pratt
Bryce Dallas Howard
Rafe Spall
Justice Smith
Daniella Pineda
James Cromwell
Toby Jones
Ted Levine
B. D. Wong', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (20, N'TRÒ CHƠI KỲ ẢO – JUMANJI', N'Hành động, phiêu lưu, hài hước', CAST(N'2021-12-02' AS Date), N'119 phút', N'C16', N'Dwayne Johnson
Jack Black
Kevin Hart
Karen Gillan
Nick Jonas
Bobby Cannavale', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (21, N'NGƯỜI KIẾN VÀ CHIẾN BINH ONG', N'Hành động', CAST(N'2021-07-06' AS Date), N'118 phút', N'C16', N'Paul Rudd
Evangeline Lilly
Michael Peña
Walton Goggins
Bobby Cannavale
Judy Greer
Tip "T.I." Harris
David Dastmalchian
Hannah John-Kamen', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (22, N'KÝ SINH TRÙNG – PARASITE', N'Hài kịch', CAST(N'2021-05-30' AS Date), N'132 phút', N'C18', N'Song Kang-ho
Lee Sun-kyun
Cho Yeo-jeong
Choi Woo-shik
Park So-dam', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (23, N'SPIDER-MAN: FAR FROM HOME', N'Hành động', CAST(N'2021-06-26' AS Date), N'129 phút', N'C16', N'Tom Holland
Samuel L. Jackson
Zendaya
Cobie Smulders
Jon Favreau
J. B. Smoove
Jacob Batalon
Martin Starr
Marisa Tomei
Jake Gyllenhaal', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (24, N'ANNABELLE 3: COMES HOME', N'Kinh dị', CAST(N'2021-06-26' AS Date), N'104 phút', N'C16', N'Mckenna Grace
Madison Iseman
Katie Sarife
Patrick Wilson
Vera Farmiga', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (25, N'FAST AND FURIOUS: HOBBS AND SHAW', N'Hài, hành động', CAST(N'2021-07-13' AS Date), N'137 phút', N'C16', N'Dwayne Johnson
Jason Statham
Idris Elba
Vanessa Kirby
Eiza González
Cliff Curtis
Helen Mirren', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (26, N'JUMANJI 3: THE NEXT LEVEL', N'Phiêu lưu', CAST(N'2021-12-13' AS Date), N'123 phút', N'C16', N'Dwayne Johnson
Jack Black
Kevin Hart
Karen Gillan
Nick Jonas
Awkwafina
Danny Glover
Danny DeVito', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (27, N'DRAGON: THE HIDDEN WORLD', N'Hoạt hình 3D', CAST(N'2021-01-03' AS Date), N'104 phút', N'C16', N'	
Jay Baruchel
America Ferrera
Cate Blanchett
Craig Ferguson
F. Murray Abraham', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (28, N'BIRDS OF PREY', N'Hành động', CAST(N'2021-01-25' AS Date), N'109 phút', N'C18', N'	
Margot Robbie
Mary Elizabeth Winstead
Jurnee Smollett-Bell
Rosie Perez
Chris Messina
Ella Jay Basco
Ali Wong
Ewan McGregor', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (29, N'WONDER WOMAN: NỮ THẦN CHIẾN BINH', N'Hành động', CAST(N'2021-06-02' AS Date), N'141 phút', N'C16', N'Gal Gadot
Chris Pine
Robin Wright
Danny Huston
David Thewlis
Connie Nielsen
Elena Anaya', NULL)
INSERT [dbo].[Movies] ([MovieID], [MovieName], [Category], [ReleaseDate], [RunningTime], [Rate], [Cast], [Status]) VALUES (30, N'BÁC SĨ DOLITTLE', N'Phiêu lưu', CAST(N'2021-01-17' AS Date), N'101 phút', N'C16', N'Robert Downey Jr.
Antonio Banderas
Michael Sheen
Emma Thompson
Rami Malek
John Cena
Kumail Nanjiani
Octavia Spencer
Tom Holland', NULL)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[SelectPos] ON 

INSERT [dbo].[SelectPos] ([num], [MovieID], [Showtime], [Postition]) VALUES (1, 3, N'Xuất chiếu 1: 11:00:00 - 13:20:00', N'A1        ')
INSERT [dbo].[SelectPos] ([num], [MovieID], [Showtime], [Postition]) VALUES (2, 1, N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'A1        ')
INSERT [dbo].[SelectPos] ([num], [MovieID], [Showtime], [Postition]) VALUES (3, 1, N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'A2        ')
INSERT [dbo].[SelectPos] ([num], [MovieID], [Showtime], [Postition]) VALUES (4, 1, N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'A3        ')
INSERT [dbo].[SelectPos] ([num], [MovieID], [Showtime], [Postition]) VALUES (5, 1, N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'B6        ')
INSERT [dbo].[SelectPos] ([num], [MovieID], [Showtime], [Postition]) VALUES (6, 1, N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'A4        ')
INSERT [dbo].[SelectPos] ([num], [MovieID], [Showtime], [Postition]) VALUES (8, 1, N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'C1        ')
INSERT [dbo].[SelectPos] ([num], [MovieID], [Showtime], [Postition]) VALUES (9, 1, N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'C5        ')
INSERT [dbo].[SelectPos] ([num], [MovieID], [Showtime], [Postition]) VALUES (10, 1, N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'B2        ')
INSERT [dbo].[SelectPos] ([num], [MovieID], [Showtime], [Postition]) VALUES (11, 1, N'Xuất chiếu 1: 06:00:00 - 08:45:00', N'B7        ')
SET IDENTITY_INSERT [dbo].[SelectPos] OFF
GO
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (1, 1, 1, N'06:00:00', N'08:45:00', 120, 1)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (2, 1, 2, N'09:00:00', N'11:45:00', 110, 1)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (3, 1, 3, N'12:00:00', N'14:45:00', 110, 1)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (4, 28, 1, N'15:00:00', N'17:45:00', 120, 1)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (5, 1, 5, N'18:00:00', N'20:45:00', 140, 1)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (6, 2, 1, N'07:00:00', N'09:30:00', 100, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (7, 2, 2, N'11:00:00', N'13:30:00', 100, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (8, 24, 2, N'16:00:00', N'18:30:00', 120, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (9, 3, 1, N'11:00:00', N'13:20:00', 100, 3)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (10, 3, 2, N'17:30:00', N'19:50:00', 110, 3)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (11, 4, 1, N'09:00:00', N'11:20:00', 120, 4)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (12, 5, 1, N'08:00:00', N'10:00:00', 100, 5)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (13, 5, 2, N'18:00:00', N'20:00:00', 120, 5)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (14, 6, 1, N'17:00:00', N'19:00:00', 110, 6)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (15, 7, 1, N'09:00:00', N'11:30:00', 110, 1)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (16, 7, 2, N'17:00:00', N'19:30:00', 120, 1)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (17, 8, 1, N'08:30:00', N'10:30:00', 120, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (18, 21, 2, N'12:00:00', N'14:00:00', 120, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (19, 8, 3, N'17:00:00', N'19:00:00', 130, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (20, 9, 1, N'09:30:00', N'12:00:00', 120, 3)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (21, 22, 2, N'18:00:00', N'20:30:00', 120, 3)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (22, 10, 1, N'09:30:00', N'11:30:00', 120, 4)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (23, 10, 2, N'13:00:00', N'15:00:00', 120, 4)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (24, 10, 3, N'17:00:00', N'19:00:00', 125, 4)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (25, 29, 1, N'19:30:00', N'21:30:00', 110, 4)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (26, 11, 1, N'10:30:00', N'12:30:00', 110, 5)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (27, 11, 2, N'18:00:00', N'20:00:00', 110, 5)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (28, 12, 1, N'18:00:00', N'20:00:00', 120, 6)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (29, 13, 1, N'10:00:00', N'12:00:00', 120, 1)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (30, 13, 2, N'16:00:00', N'18:00:00', 125, 1)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (31, 14, 1, N'09:30:00', N'11:50:00', 120, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (32, 14, 2, N'12:00:00', N'14:20:00', 120, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (33, 14, 3, N'15:00:00', N'17:20:00', 120, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (34, 30, 1, N'18:00:00', N'20:20:00', 120, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (35, 14, 5, N'21:00:00', N'23:20:00', 130, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (36, 15, 1, N'10:00:00', N'12:00:00', 100, 3)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (37, 16, 1, N'10:00:00', N'12:00:00', 100, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (38, 23, 2, N'16:00:00', N'18:00:00', 125, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (39, 17, 1, N'09:30:00', N'11:50:00', 120, 1)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (40, 18, 1, N'18:00:00', N'20:20:00', 120, 1)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (41, 19, 1, N'10:30:00', N'12:30:00', 110, 4)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (42, 20, 1, N'15:00:00', N'11:50:00', 120, 3)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (43, 21, 1, N'18:00:00', N'14:20:00', 100, 1)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (44, 22, 1, N'21:00:00', N'17:20:00', 120, 4)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (45, 23, 1, N'10:00:00', N'20:20:00', 100, 5)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (46, 24, 1, N'10:00:00', N'23:20:00', 120, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (48, 25, 1, N'16:00:00', N'12:00:00', 100, 2)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (49, 26, 1, N'09:30:00', N'12:00:00', 120, 1)
INSERT [dbo].[Showtime] ([num], [MovieID], [ShowTime], [StartTime], [EndTime], [Seat], [Theater]) VALUES (50, 27, 1, N'18:00:00', N'20:20:00', 100, 1)
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Member] FOREIGN KEY([idMember])
REFERENCES [dbo].[Member] ([idMember])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Member]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Movies]
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
/****** Object:  StoredProcedure [dbo].[sp_Chodaconguoi]    Script Date: 20/1/2022 7:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Chodaconguoi]  @MaPhim int, @Xuatchieu nvarchar(50)
AS
begin
	set nocount on 
	declare @chongoi as nvarchar(max)
	select @chongoi = COALESCE(@chongoi + ',','') + Postition
	from SelectPos 
	where MovieID = @MaPhim and Showtime = @Xuatchieu
	select @chongoi as chongoi
end
GO
/****** Object:  StoredProcedure [dbo].[sp_thongKeKH]    Script Date: 20/1/2022 7:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_thongKeKH] 
as
set nocount on
select m.idMember, MemberName, MovieName, Showtime, Postition
from Member m join Booking b on m.idMember =b.idMember
order by idMember
GO
USE [master]
GO
ALTER DATABASE [moviedb] SET  READ_WRITE 
GO

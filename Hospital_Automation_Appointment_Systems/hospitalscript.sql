USE [master]
GO
/****** Object:  Database [HastaneProjesi]    Script Date: 9.03.2022 18:36:35 ******/
CREATE DATABASE [HastaneProjesi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HastaneProjesi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HastaneProjesi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HastaneProjesi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HastaneProjesi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HastaneProjesi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HastaneProjesi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HastaneProjesi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HastaneProjesi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HastaneProjesi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HastaneProjesi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HastaneProjesi] SET ARITHABORT OFF 
GO
ALTER DATABASE [HastaneProjesi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HastaneProjesi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HastaneProjesi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HastaneProjesi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HastaneProjesi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HastaneProjesi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HastaneProjesi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HastaneProjesi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HastaneProjesi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HastaneProjesi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HastaneProjesi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HastaneProjesi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HastaneProjesi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HastaneProjesi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HastaneProjesi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HastaneProjesi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HastaneProjesi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HastaneProjesi] SET RECOVERY FULL 
GO
ALTER DATABASE [HastaneProjesi] SET  MULTI_USER 
GO
ALTER DATABASE [HastaneProjesi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HastaneProjesi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HastaneProjesi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HastaneProjesi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HastaneProjesi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HastaneProjesi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HastaneProjesi] SET QUERY_STORE = OFF
GO
USE [HastaneProjesi]
GO
/****** Object:  UserDefinedFunction [dbo].[buyukharf]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[buyukharf](@gelendeger varchar(50))
returns varchar(50)
as
begin
return upper(@gelendeger)
end
GO
/****** Object:  Table [dbo].[Doktor_Randevular_Goruntule]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktor_Randevular_Goruntule](
	[DoctorCalendar_RandevuId] [int] IDENTITY(1,1) NOT NULL,
	[HastaTC] [char](11) NULL,
	[PoliklinikNo] [int] NULL,
	[RandevuTarihi] [date] NULL,
	[RandevuSaati] [time](7) NULL,
	[DoktorNo] [int] NULL,
	[RandevuDurum] [bit] NULL,
	[Hasta_Randevu_ID] [int] NULL,
 CONSTRAINT [PK_Randevular] PRIMARY KEY CLUSTERED 
(
	[DoctorCalendar_RandevuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doktorlar]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktorlar](
	[DoktorNo] [int] IDENTITY(1,1) NOT NULL,
	[DoktorAdSoyad] [varchar](50) NULL,
	[TC] [char](11) NULL,
	[UzmanlikAlani] [varchar](50) NULL,
	[Unvan] [varchar](50) NULL,
	[Telefon] [varchar](50) NULL,
	[Adres] [varchar](50) NULL,
	[DogumTarihi] [date] NULL,
	[PoliklinikNo] [int] NULL,
	[UserNo] [int] NULL,
 CONSTRAINT [PK_Doktorlar] PRIMARY KEY CLUSTERED 
(
	[DoktorNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hasta_Randevulari_Details]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hasta_Randevulari_Details](
	[Hasta_Randevu_ID] [int] IDENTITY(1,1) NOT NULL,
	[HastaNo] [int] NOT NULL,
	[HastaTC] [char](11) NULL,
	[HastaAdiSoyadi] [varchar](50) NULL,
	[DoktorNo] [int] NOT NULL,
	[PoliklinikNo] [int] NOT NULL,
	[RandevuTarihi] [date] NOT NULL,
	[RandevuSaati] [time](7) NOT NULL,
 CONSTRAINT [PK_Hasta_Randevulari_Details] PRIMARY KEY CLUSTERED 
(
	[Hasta_Randevu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastalar]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalar](
	[HastaNo] [int] IDENTITY(1,1) NOT NULL,
	[HastaAdSoyad] [varchar](50) NULL,
	[TcNo] [char](11) NULL,
	[DogumTarihi] [date] NULL,
	[Boy] [int] NULL,
	[Kilo] [int] NULL,
	[Yas] [int] NULL,
	[UserNo] [int] NULL,
 CONSTRAINT [PK_Hastalar] PRIMARY KEY CLUSTERED 
(
	[HastaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospital_Managers]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital_Managers](
	[ManagerID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[TC] [char](11) NULL,
	[UserNo] [int] NULL,
	[Password] [varchar](50) NULL,
	[EMail] [varchar](50) NULL,
	[ManagerTitle] [varchar](50) NULL,
 CONSTRAINT [PK_Hospital_Managers] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poliklinik]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliklinik](
	[PoliklinikNo] [int] IDENTITY(1,1) NOT NULL,
	[Poliklinik_Name] [varchar](50) NULL,
	[Poliklinik_Expert_Number] [int] NULL,
	[Poliklinik_President] [varchar](50) NULL,
	[Poliklinik_FirstNurse] [varchar](50) NULL,
	[Bed_Numbers] [int] NULL,
	[ManagerNo] [int] NULL,
 CONSTRAINT [PK_Poliklinik] PRIMARY KEY CLUSTERED 
(
	[PoliklinikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserNo] [int] IDENTITY(1,1) NOT NULL,
	[TC] [char](11) NULL,
	[UserTitle] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[User_Password] [varchar](50) NULL,
	[EMail] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doktor_Randevular_Goruntule] ON 

INSERT [dbo].[Doktor_Randevular_Goruntule] ([DoctorCalendar_RandevuId], [HastaTC], [PoliklinikNo], [RandevuTarihi], [RandevuSaati], [DoktorNo], [RandevuDurum], [Hasta_Randevu_ID]) VALUES (19, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Doktor_Randevular_Goruntule] ([DoctorCalendar_RandevuId], [HastaTC], [PoliklinikNo], [RandevuTarihi], [RandevuSaati], [DoktorNo], [RandevuDurum], [Hasta_Randevu_ID]) VALUES (20, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Doktor_Randevular_Goruntule] ([DoctorCalendar_RandevuId], [HastaTC], [PoliklinikNo], [RandevuTarihi], [RandevuSaati], [DoktorNo], [RandevuDurum], [Hasta_Randevu_ID]) VALUES (166, N'25636257896', 1, CAST(N'2022-03-10' AS Date), CAST(N'10:20:00' AS Time), 95, 0, 151)
SET IDENTITY_INSERT [dbo].[Doktor_Randevular_Goruntule] OFF
GO
SET IDENTITY_INSERT [dbo].[Doktorlar] ON 

INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [TC], [UzmanlikAlani], [Unvan], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo], [UserNo]) VALUES (95, N'kubraozyakisir', N'51587412589', N'BEYİN VE SİNİR CERRAHİSİ', N'Profesör Doktor', N'(530) 258-8516', N'İstanbul/Etiler', NULL, 1, 138)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [TC], [UzmanlikAlani], [Unvan], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo], [UserNo]) VALUES (96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [TC], [UzmanlikAlani], [Unvan], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo], [UserNo]) VALUES (97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [TC], [UzmanlikAlani], [Unvan], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo], [UserNo]) VALUES (98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [TC], [UzmanlikAlani], [Unvan], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo], [UserNo]) VALUES (99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [TC], [UzmanlikAlani], [Unvan], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo], [UserNo]) VALUES (100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [TC], [UzmanlikAlani], [Unvan], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo], [UserNo]) VALUES (101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [TC], [UzmanlikAlani], [Unvan], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo], [UserNo]) VALUES (102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [TC], [UzmanlikAlani], [Unvan], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo], [UserNo]) VALUES (103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Doktorlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Hasta_Randevulari_Details] ON 

INSERT [dbo].[Hasta_Randevulari_Details] ([Hasta_Randevu_ID], [HastaNo], [HastaTC], [HastaAdiSoyadi], [DoktorNo], [PoliklinikNo], [RandevuTarihi], [RandevuSaati]) VALUES (145, 57, N'           ', N'FarukDenizhan', 3, 2, CAST(N'2022-02-05' AS Date), CAST(N'10:10:00' AS Time))
INSERT [dbo].[Hasta_Randevulari_Details] ([Hasta_Randevu_ID], [HastaNo], [HastaTC], [HastaAdiSoyadi], [DoktorNo], [PoliklinikNo], [RandevuTarihi], [RandevuSaati]) VALUES (146, 2, NULL, N'MEHMET ÖZTÜRK', 1, 1, CAST(N'2022-03-09' AS Date), CAST(N'10:10:00' AS Time))
INSERT [dbo].[Hasta_Randevulari_Details] ([Hasta_Randevu_ID], [HastaNo], [HastaTC], [HastaAdiSoyadi], [DoktorNo], [PoliklinikNo], [RandevuTarihi], [RandevuSaati]) VALUES (151, 9, N'25636257896', N'mesutarslanoglu', 95, 1, CAST(N'2022-03-10' AS Date), CAST(N'10:20:00' AS Time))
SET IDENTITY_INSERT [dbo].[Hasta_Randevulari_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Hastalar] ON 

INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [TcNo], [DogumTarihi], [Boy], [Kilo], [Yas], [UserNo]) VALUES (8, N'mehmetozturk', N'25636982563', NULL, NULL, NULL, NULL, 145)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [TcNo], [DogumTarihi], [Boy], [Kilo], [Yas], [UserNo]) VALUES (9, N'mesutarslanoglu', N'25636257896', NULL, 183, 80, NULL, 146)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [TcNo], [DogumTarihi], [Boy], [Kilo], [Yas], [UserNo]) VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [TcNo], [DogumTarihi], [Boy], [Kilo], [Yas], [UserNo]) VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [TcNo], [DogumTarihi], [Boy], [Kilo], [Yas], [UserNo]) VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Hastalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Hospital_Managers] ON 

INSERT [dbo].[Hospital_Managers] ([ManagerID], [UserName], [TC], [UserNo], [Password], [EMail], [ManagerTitle]) VALUES (3, N'hakaneren', N'25632369852', 149, N'12000', N'barbiehakan@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Hospital_Managers] OFF
GO
SET IDENTITY_INSERT [dbo].[Poliklinik] ON 

INSERT [dbo].[Poliklinik] ([PoliklinikNo], [Poliklinik_Name], [Poliklinik_Expert_Number], [Poliklinik_President], [Poliklinik_FirstNurse], [Bed_Numbers], [ManagerNo]) VALUES (1, N'Nöroloji ', 10, N'Barış Akarsu', N'Savaş Akar', 150, NULL)
INSERT [dbo].[Poliklinik] ([PoliklinikNo], [Poliklinik_Name], [Poliklinik_Expert_Number], [Poliklinik_President], [Poliklinik_FirstNurse], [Bed_Numbers], [ManagerNo]) VALUES (2, N'Beslenme ve Diyetisyen', 5, N'Sezer Bayar', N'Kahraman Deniz', 5, NULL)
INSERT [dbo].[Poliklinik] ([PoliklinikNo], [Poliklinik_Name], [Poliklinik_Expert_Number], [Poliklinik_President], [Poliklinik_FirstNurse], [Bed_Numbers], [ManagerNo]) VALUES (3, N'Göz Poliklinik', 15, N'Sezen Aksu', N'Lale Öz', 0, NULL)
INSERT [dbo].[Poliklinik] ([PoliklinikNo], [Poliklinik_Name], [Poliklinik_Expert_Number], [Poliklinik_President], [Poliklinik_FirstNurse], [Bed_Numbers], [ManagerNo]) VALUES (4, N'Dahiliye', 25, N'Can Yılmaz', N'Serkan Boz', 150, NULL)
INSERT [dbo].[Poliklinik] ([PoliklinikNo], [Poliklinik_Name], [Poliklinik_Expert_Number], [Poliklinik_President], [Poliklinik_FirstNurse], [Bed_Numbers], [ManagerNo]) VALUES (5, N'iç hastalıklar', 50, N'başak özmen', N'lale sarı', 190, NULL)
INSERT [dbo].[Poliklinik] ([PoliklinikNo], [Poliklinik_Name], [Poliklinik_Expert_Number], [Poliklinik_President], [Poliklinik_FirstNurse], [Bed_Numbers], [ManagerNo]) VALUES (6, N'cerrahi', 25, N'eren can', N'seda sayan', 160, NULL)
SET IDENTITY_INSERT [dbo].[Poliklinik] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserNo], [TC], [UserTitle], [UserName], [User_Password], [EMail], [Phone]) VALUES (138, NULL, N'Doktor', N'kubraozyakisir', N'51598', N'kbr@gmail.com', N'05302587415')
INSERT [dbo].[Users] ([UserNo], [TC], [UserTitle], [UserName], [User_Password], [EMail], [Phone]) VALUES (145, N'25636982563', N'Hasta', N'mehmetozturk', N'7U7JVH8', N'mehmet@gmail.com', N'(536) 985-2563')
INSERT [dbo].[Users] ([UserNo], [TC], [UserTitle], [UserName], [User_Password], [EMail], [Phone]) VALUES (146, N'25636257896', N'Hasta', N'mesutarslanoglu', N'5000', N'mesut@gmail.com', N'(536) 256-2563')
INSERT [dbo].[Users] ([UserNo], [TC], [UserTitle], [UserName], [User_Password], [EMail], [Phone]) VALUES (149, N'25632369852', N'Yonetici', N'hakaneren', N'12000', N'barbiehakan@gmail.com', N'5369852635')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [UQ_Hasta_Tarih]    Script Date: 9.03.2022 18:36:36 ******/
ALTER TABLE [dbo].[Hasta_Randevulari_Details] ADD  CONSTRAINT [UQ_Hasta_Tarih] UNIQUE NONCLUSTERED 
(
	[RandevuSaati] ASC,
	[RandevuTarihi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doktor_Randevular_Goruntule] ADD  CONSTRAINT [DF_Randevular_RandevuDurum]  DEFAULT ((0)) FOR [RandevuDurum]
GO
ALTER TABLE [dbo].[Doktor_Randevular_Goruntule]  WITH CHECK ADD  CONSTRAINT [FK_Doktor_Randevular_Goruntule_Hasta_Randevulari_Details1] FOREIGN KEY([Hasta_Randevu_ID])
REFERENCES [dbo].[Hasta_Randevulari_Details] ([Hasta_Randevu_ID])
GO
ALTER TABLE [dbo].[Doktor_Randevular_Goruntule] CHECK CONSTRAINT [FK_Doktor_Randevular_Goruntule_Hasta_Randevulari_Details1]
GO
ALTER TABLE [dbo].[Doktor_Randevular_Goruntule]  WITH CHECK ADD  CONSTRAINT [FK_Randevular_Doktorlar] FOREIGN KEY([DoktorNo])
REFERENCES [dbo].[Doktorlar] ([DoktorNo])
GO
ALTER TABLE [dbo].[Doktor_Randevular_Goruntule] CHECK CONSTRAINT [FK_Randevular_Doktorlar]
GO
ALTER TABLE [dbo].[Doktor_Randevular_Goruntule]  WITH CHECK ADD  CONSTRAINT [FK_Randevular_Poliklinik] FOREIGN KEY([PoliklinikNo])
REFERENCES [dbo].[Poliklinik] ([PoliklinikNo])
GO
ALTER TABLE [dbo].[Doktor_Randevular_Goruntule] CHECK CONSTRAINT [FK_Randevular_Poliklinik]
GO
ALTER TABLE [dbo].[Doktor_Randevular_Goruntule]  WITH CHECK ADD  CONSTRAINT [FKCON_RANDEVU] FOREIGN KEY([Hasta_Randevu_ID])
REFERENCES [dbo].[Hasta_Randevulari_Details] ([Hasta_Randevu_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doktor_Randevular_Goruntule] CHECK CONSTRAINT [FKCON_RANDEVU]
GO
ALTER TABLE [dbo].[Doktor_Randevular_Goruntule]  WITH CHECK ADD  CONSTRAINT [FKDOKTORID] FOREIGN KEY([DoktorNo])
REFERENCES [dbo].[Doktorlar] ([DoktorNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doktor_Randevular_Goruntule] CHECK CONSTRAINT [FKDOKTORID]
GO
ALTER TABLE [dbo].[Doktorlar]  WITH CHECK ADD  CONSTRAINT [FK_Doktorlar_Poliklinik] FOREIGN KEY([PoliklinikNo])
REFERENCES [dbo].[Poliklinik] ([PoliklinikNo])
GO
ALTER TABLE [dbo].[Doktorlar] CHECK CONSTRAINT [FK_Doktorlar_Poliklinik]
GO
ALTER TABLE [dbo].[Doktorlar]  WITH CHECK ADD  CONSTRAINT [FK_Doktorlar_Users] FOREIGN KEY([UserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[Doktorlar] CHECK CONSTRAINT [FK_Doktorlar_Users]
GO
ALTER TABLE [dbo].[Doktorlar]  WITH CHECK ADD  CONSTRAINT [FK_Doktorlar_Users1] FOREIGN KEY([UserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[Doktorlar] CHECK CONSTRAINT [FK_Doktorlar_Users1]
GO
ALTER TABLE [dbo].[Hospital_Managers]  WITH CHECK ADD  CONSTRAINT [FK_Hospital_Managers_Users1] FOREIGN KEY([UserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[Hospital_Managers] CHECK CONSTRAINT [FK_Hospital_Managers_Users1]
GO
ALTER TABLE [dbo].[Hospital_Managers]  WITH CHECK ADD  CONSTRAINT [FKUser] FOREIGN KEY([UserNo])
REFERENCES [dbo].[Users] ([UserNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hospital_Managers] CHECK CONSTRAINT [FKUser]
GO
ALTER TABLE [dbo].[Poliklinik]  WITH CHECK ADD  CONSTRAINT [FK_Poliklinik_Hospital_Managers] FOREIGN KEY([ManagerNo])
REFERENCES [dbo].[Hospital_Managers] ([ManagerID])
GO
ALTER TABLE [dbo].[Poliklinik] CHECK CONSTRAINT [FK_Poliklinik_Hospital_Managers]
GO
ALTER TABLE [dbo].[Poliklinik]  WITH CHECK ADD  CONSTRAINT [FKPoliklink] FOREIGN KEY([ManagerNo])
REFERENCES [dbo].[Hospital_Managers] ([ManagerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Poliklinik] CHECK CONSTRAINT [FKPoliklink]
GO
ALTER TABLE [dbo].[Hasta_Randevulari_Details]  WITH NOCHECK ADD  CONSTRAINT [CK_PastDate] CHECK  (([RandevuTarihi]>getdate()))
GO
ALTER TABLE [dbo].[Hasta_Randevulari_Details] CHECK CONSTRAINT [CK_PastDate]
GO
/****** Object:  StoredProcedure [dbo].[AddDoctorfromUsers]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddDoctorfromUsers]
@DoktorAdSoyad varchar(50),
@TC char(11),
@UzmanlikAlani varchar(50),
@Unvan varchar(50),
@Telefon varchar(50),
@Adres varchar(50),
@DogumTarihi date,
@PoliklinikNo int
as begin
insert into Doktorlar(DoktorAdSoyad,TC,UzmanlikAlani,Unvan,Telefon,Adres,DogumTarihi,PoliklinikNo) values
(@DoktorAdSoyad,@TC,@UzmanlikAlani,@Unvan,@Telefon,@Adres,@DogumTarihi,@PoliklinikNo) end
GO
/****** Object:  StoredProcedure [dbo].[DoctorRandevuShow]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoctorRandevuShow]
@DoktorNo int
as begin
select *from  Doktor_Randevular_Goruntule where DoktorNo=@DoktorNo end
GO
/****** Object:  StoredProcedure [dbo].[DoktorDataUpdate]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DoktorDataUpdate]
@DoktorAdSoyad varchar(50),
@TC char(11),
@UzmanlikAlani varchar(50),
@Unvan varchar(50),
@Telefon varchar(50),
@Adres varchar(50),
@PoliklinikNo int
as begin
update Doktorlar set  TC=@TC,UzmanlikAlani=@UzmanlikAlani,Unvan=@Unvan,Telefon=@Telefon,Adres=@Adres, PoliklinikNo=@PoliklinikNo  where DoktorAdSoyad=@DoktorAdSoyad end
GO
/****** Object:  StoredProcedure [dbo].[DoktorDogumUzmanlıkGrup]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoktorDogumUzmanlıkGrup]
as begin
select DogumTarihi,UzmanlikAlani from Doktorlar  group by DogumTarihi,UzmanlikAlani order by DogumTarihi desc end
GO
/****** Object:  StoredProcedure [dbo].[DoktorlarVeriGetir]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoktorlarVeriGetir]
as begin
select *from Doktorlar end
GO
/****** Object:  StoredProcedure [dbo].[DoktorUnvanGrup]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--2000 YILINDAN sonra doğan doktorların unvanlarını gruplandır
create proc [dbo].[DoktorUnvanGrup]
as begin
select Unvan from Doktorlar where DogumTarihi>'1992' group by Unvan end
select *from Doktorlar
GO
/****** Object:  StoredProcedure [dbo].[HastaBoyOrt160Yastoplam]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaBoyOrt160Yastoplam]
as begin
--hastalar tablosundan birşeye göre boy ortaalması 160 dan uzun olanların yas toplamını yazan sorgu
select avg(Boy) as 'boy ortalaması', SUM(Yas) as 'Yas toplamı' from Hastalar where Boy>160 end
GO
/****** Object:  StoredProcedure [dbo].[HastaDogumYasort30]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaDogumYasort30]
as begin
--hastalar tablosundan dogumtarihine göre gruplandırıp yas ortalaması 30 dan büyük olanların boy ortalaamasını veren sorgu
select sum(Boy) as 'Boy toplamı' from Hastalar group by DogumTarihi having avg(Yas)>30 end
GO
/****** Object:  StoredProcedure [dbo].[HastaRandevuYasort]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[HastaRandevuYasort]
as begin
--hastalar tablsından randevu tarih 21.01.2022 sonra olanların raporlarına göre yas ortalamnası
select Avg(Yas) as 'YAS ORTALAMALARI',RaporDurumu from Hastalar where RandevuTarihi>'2022-01-10' group by RaporDurumu end
GO
/****** Object:  StoredProcedure [dbo].[HastaVeriGetir]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaVeriGetir]
as begin
select *from Hastalar end
GO
/****** Object:  StoredProcedure [dbo].[HastaVeriGuncelleme]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaVeriGuncelleme]
@HastaAdSoyad varchar(50),
@Boy int,
@Kilo int
as begin
update Hastalar set Boy=@Boy,Kilo=@Kilo where HastaAdSoyad=@HastaAdSoyad end
GO
/****** Object:  StoredProcedure [dbo].[PHastaEkle]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PHastaEkle](
@HastaAdSoyad varchar(50),
@TcNo char(11),
@DogumTarihi datetime,
@Boy int,
@Kilo int,
@Yas  int,
@Recete varchar(50),
@RaporDurumu varchar(50),
@RandevuTarihi datetime, 
@DoktorNo int )
as begin
insert into Hastalar(HastaAdSoyad,TcNo,DogumTarihi,Boy,Kilo,Yas,Recete,RaporDurumu,RandevuTarihi,DoktorNo) values (@HastaAdSoyad,@TcNo,@DogumTarihi,
@Boy,@Kilo,@Yas,@Recete,@RaporDurumu,@RandevuTarihi,@DoktorNo) end
GO
/****** Object:  StoredProcedure [dbo].[PListele]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PListele]  --listeme işlmleri için bir prosedure yani method yazalım
as begin
select *from Hastalar
end  ---------------------createden itibaren 4 satırlık bir kalıp bu 
exec Plistele 
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikAdUzman]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[PoliklinikAdUzman]
as begin
--poliklnikler tablsundan poliklinik ada göre toplam poliklinik uzman sayısı bulan sorgu
select Poliklinik_Name,Sum(Poliklinik_Expert_Number) as 'toplam uzman sayısı' from Poliklinik group by Poliklinik_Name end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikadYatakSayisi]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[PoliklinikadYatakSayisi]
as begin
--poliklinik tablosundan poliklinnik ada göre toplam yatak sayısısnda getiren sorgu
select Poliklinik_Name,sum(Bed_Numbers) as 'Yatak Sayısı' from Poliklinik group by Poliklinik_Name end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikArama]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PoliklinikArama](
@PoliklinikNo int)
--@Poliklinik_Name varchar(50)) 
as begin
Select *from Poliklinik where PoliklinikNo like @PoliklinikNo end 
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikDelete]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[PoliklinikDelete]
@PoliklinikNo int
as begin
delete from Poliklinik  where PoliklinikNo=@PoliklinikNo end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikEkle]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[PoliklinikEkle]
@Poliklinik_Name varchar(50),
@Poliklinik_Expert_Number int,
@Poliklinik_President varchar(50),
@Poliklinik_FirstNurse varchar(50),
@Bed_Numbers int,
@ManagerNo int
as begin
insert into Poliklinik(Poliklinik_Name,Poliklinik_Expert_Number,Poliklinik_President,
Poliklinik_FirstNurse,Bed_Numbers,ManagerNo) values(@Poliklinik_Name,@Poliklinik_Expert_Number,@Poliklinik_President,
@Poliklinik_FirstNurse,@Bed_Numbers,@ManagerNo) end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikUpdate]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[PoliklinikUpdate]
@PoliklinikNo int,
@Poliklinik_Name varchar(50),
@Poliklinik_Expert_Number int,
@Poliklinik_President varchar(50),
@Poliklinik_FirstNurse varchar(50),
@Bed_Numbers int,
@ManagerNo int
as begin
update Poliklinik set  Poliklinik_Name=@Poliklinik_Name,
Poliklinik_Expert_Number=@Poliklinik_Expert_Number,Poliklinik_President=@Poliklinik_President,
Poliklinik_FirstNurse=@Poliklinik_FirstNurse, Bed_Numbers=@Bed_Numbers, ManagerNo=@ManagerNo where PoliklinikNo=@PoliklinikNo end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikVeriGetir]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PoliklinikVeriGetir]
as begin
select *from Poliklinik end
GO
/****** Object:  StoredProcedure [dbo].[PPoliklinikEkle]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PPoliklinikEkle]
@Poliklinik_Name varchar(50),
@Poliklinik_Expert_Number int,
@Poliklinik_President varchar(50),
@Poliklinik_FirstNurse varchar(50),
@Bed_Numbers int
as begin
insert into Poliklinik(Poliklinik_Name,Poliklinik_Expert_Number,Poliklinik_President,Poliklinik_FirstNurse,
Bed_Numbers) values (@Poliklinik_Name,@Poliklinik_Expert_Number,@Poliklinik_President,@Poliklinik_FirstNurse,
@Bed_Numbers) end
GO
/****** Object:  StoredProcedure [dbo].[PPolListele]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PPolListele]  --listeme işlmleri için bir prosedure yani method yazalım
as begin
select *from Poliklinik
end  ---------------------createden itibaren 4 satırlık bir kalıp bu 
exec PPollistele 
GO
/****** Object:  StoredProcedure [dbo].[PUserAdd]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PUserAdd](  ---kulanıcı kayıt ol formu
@TC char(11),
@UserTitle varchar(50),
@UserName varchar(50),
@User_Password varchar(50),
@EMail varchar(50),
@Phone varchar(50) )
as begin 
insert into Users(TC,UserTitle,UserName,User_Password,EMail,Phone) values (@TC,@UserTitle,@UserName,@User_Password,@EMail,@Phone) end
GO
/****** Object:  StoredProcedure [dbo].[PYenile]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PYenile]  ---tabloda değiştirme işlemi yaptık 
@HastaNo int,
@HastaAdSoyad varchar(50),
@TcNo char(11),
@DogumTarihi datetime,
@Boy int,
@Kilo int,
@Yas  int,
@Recete varchar(50),
@RaporDurumu varchar(50),
@RandevuTarihi datetime, 
@DoktorNo int 
as begin
update Hastalar set HastaAdSoyad=@HastaAdSoyad,TcNo=@TcNo,DogumTarihi=@DogumTarihi,Boy=@Boy,
Kilo=@Kilo,Yas=@Yas,Recete=@Recete,RaporDurumu=@RaporDurumu,RandevuTarihi=@RandevuTarihi,DoktorNo=@DoktorNo
where HastaNo=@HastaNo end
GO
/****** Object:  StoredProcedure [dbo].[RandevuAl]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RandevuAl] --yani radnevu detaylara ekleme işlemi
@HastaNo int,
@HastaTC char(11),
@HastaAdiSoyadi varchar(50),
@DoktorNo int,
@PoliklinikNo int,
@RandevuTarihi date,
@RandevuSaati time(7)
as begin
insert into Hasta_Randevulari_Details(HastaNo,HastaTC,HastaAdiSoyadi,DoktorNo,PoliklinikNo,RandevuTarihi,RandevuSaati)
values(@HastaNo,@HastaTC,@HastaAdiSoyadi,@DoktorNo,@PoliklinikNo,@RandevuTarihi,@RandevuSaati) end
GO
/****** Object:  StoredProcedure [dbo].[RandevuGoruntule]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RandevuGoruntule]
@HastaNo int
as begin
select *from Hasta_Randevulari_Details where HastaNo=@HastaNo end
GO
/****** Object:  StoredProcedure [dbo].[RandevuSil]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---randevu silme proc
CREATE proc [dbo].[RandevuSil] 
@Hasta_Randevu_ID int
as begin
delete from Hasta_Randevulari_Details where Hasta_Randevu_ID=@Hasta_Randevu_ID end
GO
/****** Object:  StoredProcedure [dbo].[SearchDoktorsfromUsers]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchDoktorsfromUsers]
@DoktorNo int
as begin
Select *from Doktorlar where DoktorNo like @DoktorNo end
GO
/****** Object:  StoredProcedure [dbo].[SifremiUnuttum]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SifremiUnuttum]
@UserTitle varchar(50),
@UserName varchar(50),
@User_Password varchar(50),
@EMail varchar(50)
as begin
update Users set User_Password=@User_Password where UserTitle=@UserTitle and EMail=@EMail and UserName=@UserName
end
GO
/****** Object:  StoredProcedure [dbo].[toGetManagerNo]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[toGetManagerNo]
as begin
select *from Hospital_Managers end
GO
/****** Object:  StoredProcedure [dbo].[UpdateDoktorsfromUsers]    Script Date: 9.03.2022 18:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateDoktorsfromUsers]
@DoktorNo int,
@DoktorAdSoyad varchar(50),
@TC int,
@UzmanlikAlani varchar(50),
@Unvan varchar(50),
@Telefon varchar(50),
@Adres varchar(50),
@DogumTarihi date,
@PoliklinikNo int,
@UserNo int
as begin
update Doktorlar set DoktorAdSoyad=@DoktorAdSoyad,
UzmanlikAlani=@UzmanlikAlani,Unvan=@Unvan,Telefon=@Telefon,
DogumTarihi=@DogumTarihi,PoliklinikNo=@PoliklinikNo,UserNo=@UserNo where DoktorNo=@DoktorNo end
GO
USE [master]
GO
ALTER DATABASE [HastaneProjesi] SET  READ_WRITE 
GO

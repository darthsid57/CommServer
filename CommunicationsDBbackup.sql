USE [master]
GO
/****** Object:  Database [Communications]    Script Date: 3/23/2020 9:03:13 AM ******/
CREATE DATABASE [Communications]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Communications', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Communications.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Communications_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Communications_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Communications] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Communications].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Communications] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Communications] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Communications] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Communications] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Communications] SET ARITHABORT OFF 
GO
ALTER DATABASE [Communications] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Communications] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Communications] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Communications] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Communications] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Communications] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Communications] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Communications] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Communications] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Communications] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Communications] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Communications] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Communications] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Communications] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Communications] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Communications] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Communications] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Communications] SET RECOVERY FULL 
GO
ALTER DATABASE [Communications] SET  MULTI_USER 
GO
ALTER DATABASE [Communications] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Communications] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Communications] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Communications] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Communications] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Communications', N'ON'
GO
ALTER DATABASE [Communications] SET QUERY_STORE = OFF
GO
USE [Communications]
GO
/****** Object:  Table [dbo].[T_Commendation]    Script Date: 3/23/2020 9:03:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Commendation](
	[CommendationID] [bigint] NOT NULL,
	[CustomerDetailID] [bigint] NULL,
	[CommunicationTypeID] [bigint] NULL,
	[CommendationDate] [datetime] NULL,
	[StaffName] [varchar](50) NULL,
	[CommendationReason] [varchar](50) NULL,
	[OfficeName] [varchar](50) NULL,
	[OtherDetails] [varchar](50) NULL,
 CONSTRAINT [PK_T_Commendation] PRIMARY KEY CLUSTERED 
(
	[CommendationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Communication]    Script Date: 3/23/2020 9:03:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Communication](
	[CommunicationID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerDetailID] [bigint] NULL,
	[CommunicationTypeID] [bigint] NULL,
	[IncidentType] [varchar](50) NULL,
	[IncidentTime] [datetime] NULL,
	[IncidentArea] [varchar](50) NULL,
	[SubCategoryID] [bigint] NULL,
	[VehicleNumber] [varchar](50) NULL,
	[DistrictID] [bigint] NULL,
	[IncidentDate] [datetime] NULL,
	[OtherDetails] [varchar](50) NULL,
 CONSTRAINT [PK_T_Communication] PRIMARY KEY CLUSTERED 
(
	[CommunicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_CustomerDetail]    Script Date: 3/23/2020 9:03:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_CustomerDetail](
	[CustomerDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerNumber] [bigint] NULL,
	[CustomerName] [varchar](50) NULL,
	[PhoneContact] [bigint] NULL,
	[EmailAddress] [varchar](50) NULL,
	[RegionID] [bigint] NULL,
	[OfficeID] [bigint] NULL,
	[IDNumber] [varchar](50) NULL,
	[IDTypeID] [bigint] NULL,
 CONSTRAINT [PK_T_CustomerDetail] PRIMARY KEY CLUSTERED 
(
	[CustomerDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_IDType]    Script Date: 3/23/2020 9:03:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_IDType](
	[IDTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDType] [varchar](50) NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_T_IDType] PRIMARY KEY CLUSTERED 
(
	[IDTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Query]    Script Date: 3/23/2020 9:03:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Query](
	[QueryID] [bigint] NOT NULL,
	[CustomerDetailID] [bigint] NULL,
	[CommunicationTypeID] [bigint] NULL,
	[QueryDate] [datetime] NULL,
	[QueryDetails] [varchar](50) NULL,
 CONSTRAINT [PK_T_Query] PRIMARY KEY CLUSTERED 
(
	[QueryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_User]    Script Date: 3/23/2020 9:03:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_User](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Userpassword] [varchar](50) NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_T_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TM_CommunicationType]    Script Date: 3/23/2020 9:03:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_CommunicationType](
	[CommunicationTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[CommunicationType] [varchar](50) NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_TM_CommunicationType] PRIMARY KEY CLUSTERED 
(
	[CommunicationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TM_District]    Script Date: 3/23/2020 9:03:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_District](
	[DistrictID] [bigint] IDENTITY(1,1) NOT NULL,
	[DistrictName] [varchar](50) NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_TM_District] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TM_Office]    Script Date: 3/23/2020 9:03:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_Office](
	[OfficeID] [bigint] IDENTITY(1,1) NOT NULL,
	[OfficeName] [varchar](50) NOT NULL,
	[RegionID] [bigint] NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_TM_Office] PRIMARY KEY CLUSTERED 
(
	[OfficeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TM_Region]    Script Date: 3/23/2020 9:03:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_Region](
	[RegionID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Region] [varchar](50) NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_TM_Region] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TM_SubCategory]    Script Date: 3/23/2020 9:03:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_SubCategory](
	[SubCategoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[SubCategory] [varchar](50) NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_TM_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_Communication] ON 

INSERT [dbo].[T_Communication] ([CommunicationID], [CustomerDetailID], [CommunicationTypeID], [IncidentType], [IncidentTime], [IncidentArea], [SubCategoryID], [VehicleNumber], [DistrictID], [IncidentDate], [OtherDetails]) VALUES (1, 9, 1, N'test', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'test', 1, N'AA123', 1, CAST(N'2020-03-22T00:00:00.000' AS DateTime), N'O')
INSERT [dbo].[T_Communication] ([CommunicationID], [CustomerDetailID], [CommunicationTypeID], [IncidentType], [IncidentTime], [IncidentArea], [SubCategoryID], [VehicleNumber], [DistrictID], [IncidentDate], [OtherDetails]) VALUES (2, 10, 1, N'test', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'test', 1, N'AA123', 1, CAST(N'2020-03-22T00:00:00.000' AS DateTime), N'O')
INSERT [dbo].[T_Communication] ([CommunicationID], [CustomerDetailID], [CommunicationTypeID], [IncidentType], [IncidentTime], [IncidentArea], [SubCategoryID], [VehicleNumber], [DistrictID], [IncidentDate], [OtherDetails]) VALUES (3, 11, 1, N'test', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'test', 1, N'AA123', 1, CAST(N'2020-03-22T00:00:00.000' AS DateTime), N'Other Details Test')
INSERT [dbo].[T_Communication] ([CommunicationID], [CustomerDetailID], [CommunicationTypeID], [IncidentType], [IncidentTime], [IncidentArea], [SubCategoryID], [VehicleNumber], [DistrictID], [IncidentDate], [OtherDetails]) VALUES (4, 3, 1, N'test', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'test', 1, N'AA123', 1, CAST(N'2020-03-22T00:00:00.000' AS DateTime), N'Other Details Test')
INSERT [dbo].[T_Communication] ([CommunicationID], [CustomerDetailID], [CommunicationTypeID], [IncidentType], [IncidentTime], [IncidentArea], [SubCategoryID], [VehicleNumber], [DistrictID], [IncidentDate], [OtherDetails]) VALUES (5, 13, 1, N'test', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'test', 1, N'AA123', 1, CAST(N'2020-03-22T00:00:00.000' AS DateTime), N'Other Details Test')
SET IDENTITY_INSERT [dbo].[T_Communication] OFF
SET IDENTITY_INSERT [dbo].[T_CustomerDetail] ON 

INSERT [dbo].[T_CustomerDetail] ([CustomerDetailID], [CustomerNumber], [CustomerName], [PhoneContact], [EmailAddress], [RegionID], [OfficeID], [IDNumber], [IDTypeID]) VALUES (1, 123456, N'S', 9874564, N's', NULL, NULL, N'*', NULL)
INSERT [dbo].[T_CustomerDetail] ([CustomerDetailID], [CustomerNumber], [CustomerName], [PhoneContact], [EmailAddress], [RegionID], [OfficeID], [IDNumber], [IDTypeID]) VALUES (2, 123456, N'S', 9874564, N's', NULL, NULL, N'*', NULL)
INSERT [dbo].[T_CustomerDetail] ([CustomerDetailID], [CustomerNumber], [CustomerName], [PhoneContact], [EmailAddress], [RegionID], [OfficeID], [IDNumber], [IDTypeID]) VALUES (3, 123456, N'Siddhant Anand', 9874564, N'siddhant.anand@lta.com.fj', NULL, NULL, N'123456', NULL)
INSERT [dbo].[T_CustomerDetail] ([CustomerDetailID], [CustomerNumber], [CustomerName], [PhoneContact], [EmailAddress], [RegionID], [OfficeID], [IDNumber], [IDTypeID]) VALUES (4, 123456, N'Siddhant Anand', 9874564, N'siddhant.anand@lta.com.fj', NULL, NULL, N'123456', NULL)
INSERT [dbo].[T_CustomerDetail] ([CustomerDetailID], [CustomerNumber], [CustomerName], [PhoneContact], [EmailAddress], [RegionID], [OfficeID], [IDNumber], [IDTypeID]) VALUES (5, 123456, N'Siddhant Anand', 9874564, N'siddhant.anand@lta.com.fj', NULL, NULL, N'123456', NULL)
INSERT [dbo].[T_CustomerDetail] ([CustomerDetailID], [CustomerNumber], [CustomerName], [PhoneContact], [EmailAddress], [RegionID], [OfficeID], [IDNumber], [IDTypeID]) VALUES (6, 123456, N'Siddhant Anand', 9874564, N'siddhant.anand@lta.com.fj', NULL, NULL, N'123456', NULL)
INSERT [dbo].[T_CustomerDetail] ([CustomerDetailID], [CustomerNumber], [CustomerName], [PhoneContact], [EmailAddress], [RegionID], [OfficeID], [IDNumber], [IDTypeID]) VALUES (7, 123456, N'Jashneel Prakash', 9874564, N'Jashneel.Prakash@lta.com.fj', NULL, NULL, N'123456', NULL)
INSERT [dbo].[T_CustomerDetail] ([CustomerDetailID], [CustomerNumber], [CustomerName], [PhoneContact], [EmailAddress], [RegionID], [OfficeID], [IDNumber], [IDTypeID]) VALUES (8, 123456, N'Siddhant Anand', 9874564, N'siddhant.anand@lta.com.fj', NULL, NULL, N'123456', NULL)
INSERT [dbo].[T_CustomerDetail] ([CustomerDetailID], [CustomerNumber], [CustomerName], [PhoneContact], [EmailAddress], [RegionID], [OfficeID], [IDNumber], [IDTypeID]) VALUES (9, 123456, N'Siddhant Anand', 9874564, N'siddhant.anand@lta.com.fj', NULL, NULL, N'123456', NULL)
INSERT [dbo].[T_CustomerDetail] ([CustomerDetailID], [CustomerNumber], [CustomerName], [PhoneContact], [EmailAddress], [RegionID], [OfficeID], [IDNumber], [IDTypeID]) VALUES (10, 123456, N'Siddhant Anand', 9874564, N'siddhant.anand@lta.com.fj', NULL, NULL, N'123456', NULL)
INSERT [dbo].[T_CustomerDetail] ([CustomerDetailID], [CustomerNumber], [CustomerName], [PhoneContact], [EmailAddress], [RegionID], [OfficeID], [IDNumber], [IDTypeID]) VALUES (11, 123456, N'Siddhant Anand', 9874564, N'siddhant.anand@lta.com.fj', NULL, NULL, N'123456', NULL)
INSERT [dbo].[T_CustomerDetail] ([CustomerDetailID], [CustomerNumber], [CustomerName], [PhoneContact], [EmailAddress], [RegionID], [OfficeID], [IDNumber], [IDTypeID]) VALUES (13, 123456, N'Siddhant Anand', 9874564, N'siddhant.anand@lta.com.fj', 1, 64, N'123456', 1)
SET IDENTITY_INSERT [dbo].[T_CustomerDetail] OFF
SET IDENTITY_INSERT [dbo].[T_IDType] ON 

INSERT [dbo].[T_IDType] ([IDTypeID], [IDType], [IsActive]) VALUES (1, N'Voter ID Number', 1)
INSERT [dbo].[T_IDType] ([IDTypeID], [IDType], [IsActive]) VALUES (2, N'Joint Card', 1)
INSERT [dbo].[T_IDType] ([IDTypeID], [IDType], [IsActive]) VALUES (3, N'National ID', 1)
INSERT [dbo].[T_IDType] ([IDTypeID], [IDType], [IsActive]) VALUES (4, N'Passport Number', 1)
INSERT [dbo].[T_IDType] ([IDTypeID], [IDType], [IsActive]) VALUES (5, N'Driving Licence Number', 1)
INSERT [dbo].[T_IDType] ([IDTypeID], [IDType], [IsActive]) VALUES (6, N'Birth Certificate Number', 1)
INSERT [dbo].[T_IDType] ([IDTypeID], [IDType], [IsActive]) VALUES (7, N'Others', 1)
SET IDENTITY_INSERT [dbo].[T_IDType] OFF
SET IDENTITY_INSERT [dbo].[T_User] ON 

INSERT [dbo].[T_User] ([UserID], [Username], [Userpassword], [IsActive]) VALUES (1, N'Jashneel.Prakash', N'Welcome1', 1)
INSERT [dbo].[T_User] ([UserID], [Username], [Userpassword], [IsActive]) VALUES (2, N'Siddhant.Anand', N'Welcome1', 1)
INSERT [dbo].[T_User] ([UserID], [Username], [Userpassword], [IsActive]) VALUES (3, N'Asneel.Raj', N'Welcome1', 1)
SET IDENTITY_INSERT [dbo].[T_User] OFF
SET IDENTITY_INSERT [dbo].[TM_CommunicationType] ON 

INSERT [dbo].[TM_CommunicationType] ([CommunicationTypeID], [CommunicationType], [IsActive]) VALUES (1, N'Grievance', 1)
INSERT [dbo].[TM_CommunicationType] ([CommunicationTypeID], [CommunicationType], [IsActive]) VALUES (2, N'Commendation', 1)
INSERT [dbo].[TM_CommunicationType] ([CommunicationTypeID], [CommunicationType], [IsActive]) VALUES (3, N'Query', 1)
SET IDENTITY_INSERT [dbo].[TM_CommunicationType] OFF
SET IDENTITY_INSERT [dbo].[TM_District] ON 

INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (1, N'Ba', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (2, N'Baravi', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (3, N'Batiki', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (4, N'Bau', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (5, N'Beqa', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (6, N'Bua', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (7, N'Cakaudrove', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (8, N'Cicia', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (9, N'Cikobia', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (10, N'Cuvu', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (11, N'Dogotuki', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (12, N'Gau', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (13, N'Itumuta', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (14, N'Itutiu', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (15, N'Juju', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (16, N'Kabara', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (17, N'Koro', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (18, N'Labasa', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (19, N'Lakeba', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (20, N'Lomaivuna', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (21, N'Lomaloma', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (22, N'Macuata', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (23, N'Magodro', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (24, N'Malhaha', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (25, N'Malolo', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (26, N'Malomalo', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (27, N'Matailobau', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (28, N'Matuku', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (29, N'Moala', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (30, N'Moce', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (31, N'Mualevu', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (32, N'Nabukelevu', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (33, N'Naceva', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (34, N'Nadi', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (35, N'Nairai', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (36, N'Naitasiri', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (37, N'Nakasaleka', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (38, N'Nakelo', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (39, N'Nakorotubu', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (40, N'Nalawa', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (41, N'Namosi', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (42, N'Nasavusavu', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (43, N'Nasigatoka', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (44, N'Nasova', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (45, N'Naviti', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (46, N'Navosa', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (47, N'Nawaka', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (48, N'Nayau', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (49, N'Noatau', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (50, N'Noco', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (51, N'Nuku', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (52, N'Oinafa', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (53, N'Oneata', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (54, N'Ono', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (55, N'Other_lau', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (56, N'Other_lomai', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (57, N'Ovalau', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (58, N'Pepjei', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (59, N'Rabi', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (60, N'Rakiraki', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (61, N'Rewa', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (62, N'Ruwailevu', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (63, N'Saivou', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (64, N'Saqani', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (65, N'Sasa', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (66, N'Savusavu', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (67, N'Sawakasa', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (68, N'Serua', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (69, N'Suva', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (70, N'Tavua', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (71, N'Tavuki', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (72, N'Totoya', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (73, N'Tunuloa', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (74, N'Vatulele', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (75, N'Vaturova', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (76, N'Veivatuloa', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (77, N'Verata', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (78, N'Vuda', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (79, N'Vulaga', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (80, N'Vuya', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (81, N'Wailevu', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (82, N'Waimaro', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (83, N'Wainibuka', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (84, N'Wainikeli', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (85, N'Wainikoroiluva', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (86, N'Wainimala', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (87, N'Wainunu', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (88, N'Yasawa', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (89, N'DEUBA', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (90, N'KADAVU', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (91, N'LAMI', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (92, N'LAU', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (93, N'LAUTOKA', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (94, N'LEVUKA', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (95, N'LOMAIVITI', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (96, N'NADROGA & NAVOSA', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (97, N'NAUSORI', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (98, N'NAVUA', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (99, N'RA', 1)
GO
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (100, N'ROTUMA', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (101, N'SIGATOKA', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (102, N'TAILEVU', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (103, N'TOBERUA ISLAND', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (104, N'Nasikawa', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (105, N'Nawairabe', 1)
INSERT [dbo].[TM_District] ([DistrictID], [DistrictName], [IsActive]) VALUES (106, N'Korovou', 1)
SET IDENTITY_INSERT [dbo].[TM_District] OFF
SET IDENTITY_INSERT [dbo].[TM_Office] ON 

INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (64, N'Ba', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (65, N'Labasa', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (66, N'Lautoka', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (67, N'Nadi', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (68, N'Rakiraki', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (69, N'Seaqaqa', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (70, N'Sigatoka', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (71, N'Savusavu', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (72, N'Suva', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (73, N'Tavua', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (74, N'Taveuni', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (75, N'Valelevu', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (76, N'Nausori', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (77, N'Navua', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (78, N'Rotuma', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (79, N'Levuka', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (80, N'Korolevu', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (81, N'Nabouwalu', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (82, N'Lomaloma', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (83, N'Wainikoro', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (84, N'Lakeba', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (85, N'Kadavu', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (86, N'Gau', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (87, N'Koro', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (88, N'Moala', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (89, N'Dreketi', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (90, N'Vanuabalavu', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (91, N'Cicia', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (92, N'Rabi', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (93, N'Tukavesi', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (94, N'Lami', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (95, N'Korovou', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (96, N'Albert Park', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (97, N'Subrail Park', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (98, N'Labasa Town', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (99, N'Mago Island', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (100, N'Sigatoka Town', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (101, N'Nadi Bula Festival', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (102, N'Denarau', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (103, N'Nagado Village', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (104, N'Vunidawa', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (105, N'Vatukoula', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (106, N'Sigatoka Outreach', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (107, N'Nadi Outreach', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (108, N'Lautoka Outreach', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (109, N'Tavua Outreach', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (110, N'Ba Outreach', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (111, N'Nadi Town', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (112, N'Nasinu Court', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (113, N'Nakasi', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (114, N'Online Transaction', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (115, N'Lekutu', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (116, N'Suva Express', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (117, N'Laucala Island', NULL, 1)
INSERT [dbo].[TM_Office] ([OfficeID], [OfficeName], [RegionID], [IsActive]) VALUES (118, N'Lautoka Express', NULL, 1)
SET IDENTITY_INSERT [dbo].[TM_Office] OFF
SET IDENTITY_INSERT [dbo].[TM_Region] ON 

INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (1, N'Ba', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (2, N'Baravi', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (3, N'Batiki', 0)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (4, N'Bau', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (5, N'Beqa', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (6, N'Bua', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (7, N'Cakaudrove', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (8, N'Cicia', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (9, N'Cikobia', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (10, N'Cuvu', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (11, N'Dogotuki', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (12, N'Gau', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (13, N'Itumuta', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (14, N'Itutiu', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (15, N'Juju', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (16, N'Kabara', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (17, N'Koro', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (18, N'Labasa', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (19, N'Lakeba', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (20, N'Lomaivuna', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (21, N'Lomaloma', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (22, N'Macuata', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (23, N'Magodro', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (24, N'Malhaha', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (25, N'Malolo', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (26, N'Malomalo', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (27, N'Matailobau', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (28, N'Matuku', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (29, N'Moala', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (30, N'Moce', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (31, N'Mualevu', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (32, N'Nabukelevu', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (33, N'Naceva', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (34, N'Nadi', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (35, N'Nairai', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (36, N'Naitasiri', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (37, N'Nakasaleka', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (38, N'Nakelo', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (39, N'Nakorotubu', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (40, N'Nalawa', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (41, N'Namosi', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (42, N'Nasavusavu', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (43, N'Nasigatoka', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (44, N'Nasova', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (45, N'Naviti', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (46, N'Navosa', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (47, N'Nawaka', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (48, N'Nayau', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (49, N'Noatau', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (50, N'Noco', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (51, N'Nuku', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (52, N'Oinafa', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (53, N'Oneata', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (54, N'Ono', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (55, N'Other_lau', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (56, N'Other_lomai', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (57, N'Ovalau', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (58, N'Pepjei', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (59, N'Rabi', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (60, N'Rakiraki', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (61, N'Rewa', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (62, N'Ruwailevu', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (63, N'Saivou', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (64, N'Saqani', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (65, N'Sasa', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (66, N'Savusavu', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (67, N'Sawakasa', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (68, N'Serua', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (69, N'Suva', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (70, N'Tavua', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (71, N'Tavuki', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (72, N'Totoya', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (73, N'Tunuloa', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (74, N'Vatulele', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (75, N'Vaturova', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (76, N'Veivatuloa', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (77, N'Verata', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (78, N'Vuda', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (79, N'Vulaga', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (80, N'Vuya', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (81, N'Wailevu', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (82, N'Waimaro', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (83, N'Wainibuka', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (84, N'Wainikeli', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (85, N'Wainikoroiluva', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (86, N'Wainimala', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (87, N'Wainunu', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (88, N'Yasawa', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (89, N'DEUBA', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (90, N'KADAVU', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (91, N'LAMI', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (92, N'LAU', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (93, N'LAUTOKA', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (94, N'LEVUKA', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (95, N'LOMAIVITI', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (96, N'NADROGA & NAVOSA', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (97, N'NAUSORI', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (98, N'NAVUA', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (99, N'RA', 1)
GO
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (100, N'ROTUMA', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (101, N'SIGATOKA', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (102, N'TAILEVU', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (103, N'TOBERUA ISLAND', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (104, N'Nasikawa', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (105, N'Nawairabe', 1)
INSERT [dbo].[TM_Region] ([RegionID], [Region], [IsActive]) VALUES (106, N'Korovou', 1)
SET IDENTITY_INSERT [dbo].[TM_Region] OFF
SET IDENTITY_INSERT [dbo].[TM_SubCategory] ON 

INSERT [dbo].[TM_SubCategory] ([SubCategoryID], [SubCategory], [IsActive]) VALUES (1, N'Enforcement', 1)
INSERT [dbo].[TM_SubCategory] ([SubCategoryID], [SubCategory], [IsActive]) VALUES (2, N'Technical', 1)
INSERT [dbo].[TM_SubCategory] ([SubCategoryID], [SubCategory], [IsActive]) VALUES (3, N'PSV Services', 1)
INSERT [dbo].[TM_SubCategory] ([SubCategoryID], [SubCategory], [IsActive]) VALUES (4, N'Registration and Licensing', 1)
INSERT [dbo].[TM_SubCategory] ([SubCategoryID], [SubCategory], [IsActive]) VALUES (5, N'Red Light Issues', 1)
INSERT [dbo].[TM_SubCategory] ([SubCategoryID], [SubCategory], [IsActive]) VALUES (6, N'Road Safety', 1)
INSERT [dbo].[TM_SubCategory] ([SubCategoryID], [SubCategory], [IsActive]) VALUES (7, N'DDC Certificate Issuance Communication', 1)
INSERT [dbo].[TM_SubCategory] ([SubCategoryID], [SubCategory], [IsActive]) VALUES (8, N'General', 1)
SET IDENTITY_INSERT [dbo].[TM_SubCategory] OFF
ALTER TABLE [dbo].[T_Commendation]  WITH CHECK ADD  CONSTRAINT [FK_T_Commendation_T_CustomerDetail] FOREIGN KEY([CustomerDetailID])
REFERENCES [dbo].[T_CustomerDetail] ([CustomerDetailID])
GO
ALTER TABLE [dbo].[T_Commendation] CHECK CONSTRAINT [FK_T_Commendation_T_CustomerDetail]
GO
ALTER TABLE [dbo].[T_Commendation]  WITH CHECK ADD  CONSTRAINT [FK_T_Commendation_TM_CommunicationType] FOREIGN KEY([CommunicationTypeID])
REFERENCES [dbo].[TM_CommunicationType] ([CommunicationTypeID])
GO
ALTER TABLE [dbo].[T_Commendation] CHECK CONSTRAINT [FK_T_Commendation_TM_CommunicationType]
GO
ALTER TABLE [dbo].[T_Communication]  WITH CHECK ADD  CONSTRAINT [FK_T_Communication_T_CustomerDetail] FOREIGN KEY([CustomerDetailID])
REFERENCES [dbo].[T_CustomerDetail] ([CustomerDetailID])
GO
ALTER TABLE [dbo].[T_Communication] CHECK CONSTRAINT [FK_T_Communication_T_CustomerDetail]
GO
ALTER TABLE [dbo].[T_Communication]  WITH CHECK ADD  CONSTRAINT [FK_T_Communication_TM_CommunicationType] FOREIGN KEY([CommunicationTypeID])
REFERENCES [dbo].[TM_CommunicationType] ([CommunicationTypeID])
GO
ALTER TABLE [dbo].[T_Communication] CHECK CONSTRAINT [FK_T_Communication_TM_CommunicationType]
GO
ALTER TABLE [dbo].[T_Communication]  WITH CHECK ADD  CONSTRAINT [FK_T_Communication_TM_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[TM_SubCategory] ([SubCategoryID])
GO
ALTER TABLE [dbo].[T_Communication] CHECK CONSTRAINT [FK_T_Communication_TM_SubCategory]
GO
ALTER TABLE [dbo].[T_CustomerDetail]  WITH CHECK ADD  CONSTRAINT [FK_T_CustomerDetail_T_IDType] FOREIGN KEY([IDTypeID])
REFERENCES [dbo].[T_IDType] ([IDTypeID])
GO
ALTER TABLE [dbo].[T_CustomerDetail] CHECK CONSTRAINT [FK_T_CustomerDetail_T_IDType]
GO
ALTER TABLE [dbo].[T_CustomerDetail]  WITH CHECK ADD  CONSTRAINT [FK_T_CustomerDetail_TM_Office] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[TM_Office] ([OfficeID])
GO
ALTER TABLE [dbo].[T_CustomerDetail] CHECK CONSTRAINT [FK_T_CustomerDetail_TM_Office]
GO
ALTER TABLE [dbo].[T_CustomerDetail]  WITH CHECK ADD  CONSTRAINT [FK_T_CustomerDetail_TM_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[TM_Region] ([RegionID])
GO
ALTER TABLE [dbo].[T_CustomerDetail] CHECK CONSTRAINT [FK_T_CustomerDetail_TM_Region]
GO
ALTER TABLE [dbo].[T_Query]  WITH CHECK ADD  CONSTRAINT [FK_T_Query_T_CustomerDetail] FOREIGN KEY([CustomerDetailID])
REFERENCES [dbo].[T_CustomerDetail] ([CustomerDetailID])
GO
ALTER TABLE [dbo].[T_Query] CHECK CONSTRAINT [FK_T_Query_T_CustomerDetail]
GO
ALTER TABLE [dbo].[T_Query]  WITH CHECK ADD  CONSTRAINT [FK_T_Query_TM_CommunicationType] FOREIGN KEY([CommunicationTypeID])
REFERENCES [dbo].[TM_CommunicationType] ([CommunicationTypeID])
GO
ALTER TABLE [dbo].[T_Query] CHECK CONSTRAINT [FK_T_Query_TM_CommunicationType]
GO
ALTER TABLE [dbo].[TM_Office]  WITH CHECK ADD  CONSTRAINT [FK_TM_Office_TM_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[TM_Region] ([RegionID])
GO
ALTER TABLE [dbo].[TM_Office] CHECK CONSTRAINT [FK_TM_Office_TM_Region]
GO
USE [master]
GO
ALTER DATABASE [Communications] SET  READ_WRITE 
GO

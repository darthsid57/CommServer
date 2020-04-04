USE [master]
GO
/****** Object:  Database [Communications]    Script Date: 04/04/2020 19:02:39 ******/
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
/****** Object:  Table [dbo].[T_Case]    Script Date: 04/04/2020 19:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Case](
	[caseID] [int] IDENTITY(1,1) NOT NULL,
	[statusID] [int] NULL,
	[dateReceived] [datetime] NULL,
	[dateopened] [datetime] NULL,
	[isOpen] [int] NULL,
	[isClosed] [int] NULL,
	[dateAssigned] [datetime] NULL,
	[dateClosed] [datetime] NULL,
	[assignedTo] [int] NULL,
	[receivedBy] [int] NULL,
	[openedBy] [int] NULL,
	[closedBy] [datetime] NULL,
 CONSTRAINT [PK_Case] PRIMARY KEY CLUSTERED 
(
	[caseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Commendation]    Script Date: 04/04/2020 19:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Commendation](
	[CommendationID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerDetailID] [bigint] NULL,
	[CommunicationTypeID] [bigint] NULL,
	[CommendationDate] [datetime] NULL,
	[StaffName] [varchar](50) NULL,
	[CommendationReason] [varchar](50) NULL,
	[OfficeName] [varchar](50) NULL,
	[OtherDetails] [varchar](50) NULL,
	[declaration] [int] NULL,
	[linkToFile] [varchar](50) NULL,
	[caseID] [int] NULL,
 CONSTRAINT [PK_T_Commendation] PRIMARY KEY CLUSTERED 
(
	[CommendationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Communication]    Script Date: 04/04/2020 19:02:39 ******/
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
	[declaration] [int] NULL,
	[linkToFile] [varchar](50) NULL,
	[caseID] [int] NULL,
 CONSTRAINT [PK_T_Communication] PRIMARY KEY CLUSTERED 
(
	[CommunicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_CustomerDetail]    Script Date: 04/04/2020 19:02:39 ******/
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
/****** Object:  Table [dbo].[T_IDType]    Script Date: 04/04/2020 19:02:39 ******/
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
/****** Object:  Table [dbo].[T_Query]    Script Date: 04/04/2020 19:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Query](
	[QueryID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerDetailID] [bigint] NULL,
	[CommunicationTypeID] [bigint] NULL,
	[QueryDate] [datetime] NULL,
	[QueryDetails] [varchar](50) NULL,
	[declaration] [int] NULL,
	[linkToFile] [varchar](50) NULL,
	[caseID] [int] NULL,
 CONSTRAINT [PK_T_Query] PRIMARY KEY CLUSTERED 
(
	[QueryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_User]    Script Date: 04/04/2020 19:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_User](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[Userpassword] [varchar](100) NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_T_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TM_CommunicationType]    Script Date: 04/04/2020 19:02:39 ******/
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
/****** Object:  Table [dbo].[TM_District]    Script Date: 04/04/2020 19:02:39 ******/
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
/****** Object:  Table [dbo].[TM_Office]    Script Date: 04/04/2020 19:02:39 ******/
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
/****** Object:  Table [dbo].[TM_Region]    Script Date: 04/04/2020 19:02:39 ******/
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
/****** Object:  Table [dbo].[TM_Status]    Script Date: 04/04/2020 19:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TM_Status](
	[statusID] [int] IDENTITY(1,1) NOT NULL,
	[statusType] [varchar](50) NULL,
	[isActive] [int] NULL,
 CONSTRAINT [PK_TM_Status] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TM_SubCategory]    Script Date: 04/04/2020 19:02:39 ******/
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
ALTER TABLE [dbo].[T_Case]  WITH CHECK ADD  CONSTRAINT [FK_T_Case_TM_Status] FOREIGN KEY([statusID])
REFERENCES [dbo].[TM_Status] ([statusID])
GO
ALTER TABLE [dbo].[T_Case] CHECK CONSTRAINT [FK_T_Case_TM_Status]
GO
ALTER TABLE [dbo].[T_Commendation]  WITH CHECK ADD  CONSTRAINT [FK_T_Commendation_T_Case] FOREIGN KEY([caseID])
REFERENCES [dbo].[T_Case] ([caseID])
GO
ALTER TABLE [dbo].[T_Commendation] CHECK CONSTRAINT [FK_T_Commendation_T_Case]
GO
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
ALTER TABLE [dbo].[T_Communication]  WITH CHECK ADD  CONSTRAINT [FK_T_Communication_Case] FOREIGN KEY([caseID])
REFERENCES [dbo].[T_Case] ([caseID])
GO
ALTER TABLE [dbo].[T_Communication] CHECK CONSTRAINT [FK_T_Communication_Case]
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
ALTER TABLE [dbo].[T_Query]  WITH CHECK ADD  CONSTRAINT [FK_T_Query_T_Case] FOREIGN KEY([caseID])
REFERENCES [dbo].[T_Case] ([caseID])
GO
ALTER TABLE [dbo].[T_Query] CHECK CONSTRAINT [FK_T_Query_T_Case]
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

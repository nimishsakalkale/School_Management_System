USE [master]
GO
/****** Object:  Database [SMS]    Script Date: 2/25/2017 9:27:45 PM ******/
CREATE DATABASE [SMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER_2014\MSSQL\DATA\SMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER_2014\MSSQL\DATA\SMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SMS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SMS] SET RECOVERY FULL 
GO
ALTER DATABASE [SMS] SET  MULTI_USER 
GO
ALTER DATABASE [SMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SMS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SMS]
GO
/****** Object:  Table [dbo].[AcademicYear]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AcademicYear](
	[AcademicYearId] [int] NOT NULL,
	[AcademicYear] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AcademicYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExternalUserAcademicInfo]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalUserAcademicInfo](
	[ExternalUserAcademicInfoID] [int] IDENTITY(1,1) NOT NULL,
	[ExternalUserLoginID] [int] NULL,
	[SchoolStandardId] [int] NULL,
	[SchoolSectionId] [int] NULL,
	[AcademicYearId] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[LastUpdatedBy] [int] NULL,
	[LastUpdatedDate] [nchar](10) NULL,
	[SchoolStreamID] [int] NULL,
 CONSTRAINT [PK_ExternalUserTransationsAccount] PRIMARY KEY CLUSTERED 
(
	[ExternalUserAcademicInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExternalUserInfo]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExternalUserInfo](
	[ExternalUserInfoID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[EmailID] [varchar](50) NULL,
	[Pin] [varchar](6) NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExternalUserInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExternalUserLogin]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExternalUserLogin](
	[ExternalUserLoginID] [int] IDENTITY(1,1) NOT NULL,
	[ExternalUserInfoID] [int] NULL,
	[ExternalUserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Disabled] [bit] NULL,
	[FailedLoginCount] [int] NULL,
	[CurrentSuccesfulLogin] [datetime] NULL,
	[LastSuccesfulLogin] [datetime] NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExternalUserLoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ExternalUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExternalUserLogin_UserGroup_Mapping]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalUserLogin_UserGroup_Mapping](
	[ExternalUserLogin_UserGroup_ID] [int] IDENTITY(1,1) NOT NULL,
	[ExternalUserLoginID] [int] NULL,
	[UserGroupId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExternalUserLogin_UserGroup_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExternalUserTransations]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalUserTransations](
	[ExternalUserTransationsID] [int] IDENTITY(1,1) NOT NULL,
	[ExternalUserAcademicInfoID] [int] NULL,
	[Amount] [money] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastUpdatedBy] [int] NULL,
 CONSTRAINT [PK_ExternalUserTransations] PRIMARY KEY CLUSTERED 
(
	[ExternalUserTransationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FeeFrequency]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeeFrequency](
	[FeeFrequencyId] [int] IDENTITY(1,1) NOT NULL,
	[Frequency] [varchar](50) NOT NULL,
	[FeeFrequencyGuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FeeFrequency] PRIMARY KEY CLUSTERED 
(
	[FeeFrequencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeeTypes]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeeTypes](
	[FeeTypeId] [int] NOT NULL,
	[FeeTypeGuid] [uniqueidentifier] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Remarks] [varchar](100) NULL,
 CONSTRAINT [PK_FeeTypes] PRIMARY KEY CLUSTERED 
(
	[FeeTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gender](
	[Gender] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Gender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InternalUser]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InternalUser](
	[InternalUserID] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupId] [int] NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Disabled] [bit] NULL,
	[FailedLoginCount] [int] NULL,
	[EmailID] [varchar](50) NULL,
	[CurrentSuccesfulLogin] [datetime] NULL,
	[LastSuccesfulLogin] [datetime] NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[InternalUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nationality](
	[NationalityId] [int] IDENTITY(1,1) NOT NULL,
	[Nationality] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[NationalityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Religion]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Religion](
	[ReligionId] [int] IDENTITY(1,1) NOT NULL,
	[Religion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Religion] PRIMARY KEY CLUSTERED 
(
	[ReligionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[School]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[School](
	[SchoolID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolName] [varchar](100) NULL,
	[Description] [varchar](500) NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[EmailID] [varchar](50) NULL,
	[Pin] [int] NULL,
	[CreateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SchoolFeeStructure]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SchoolFeeStructure](
	[SchoolFeeStructureId] [int] NOT NULL,
	[SchoolFeeStructureGuid] [uniqueidentifier] NOT NULL,
	[SchoolID] [int] NOT NULL,
	[FeeTypeId] [int] NOT NULL,
	[FeeFrequencyId] [int] NOT NULL,
	[SchoolStandardID] [int] NULL,
	[Amount] [numeric](18, 0) NOT NULL,
	[Remark] [varchar](50) NULL,
	[AcademicYearId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [date] NULL,
	[UpdateDate] [date] NULL,
	[DeletedDate] [date] NULL,
 CONSTRAINT [PK_SchoolFeeStructure] PRIMARY KEY CLUSTERED 
(
	[SchoolFeeStructureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SchoolSection]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolSection](
	[SchoolSectionID] [int] IDENTITY(1,1) NOT NULL,
	[SectionID] [int] NULL,
	[SchoolID] [int] NULL,
 CONSTRAINT [PK_SchoolSection] PRIMARY KEY CLUSTERED 
(
	[SchoolSectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchoolStandard]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolStandard](
	[SchoolStandardID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolID] [int] NULL,
	[StandardID] [int] NULL,
 CONSTRAINT [PK_SchoolStandard] PRIMARY KEY CLUSTERED 
(
	[SchoolStandardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchoolStream]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolStream](
	[SchoolStreamID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolID] [int] NULL,
	[StreamID] [int] NULL,
 CONSTRAINT [PK_SchoolStream] PRIMARY KEY CLUSTERED 
(
	[SchoolStreamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Section](
	[SectionId] [int] NOT NULL,
	[Section] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Standard]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Standard](
	[StandardId] [int] NOT NULL,
	[Standard] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StandardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stream]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stream](
	[StreamId] [int] NOT NULL,
	[Stream] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StreamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentAcademicDetails]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAcademicDetails](
	[StudentAcademicDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[StudentAcademicDetailsGuid] [uniqueidentifier] NOT NULL,
	[StudentId] [int] NOT NULL,
	[SchoolStandardId] [int] NOT NULL,
	[SchoolSectionId] [int] NOT NULL,
	[AcademicYearId] [int] NOT NULL,
	[SchoolStreamID] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [date] NULL,
	[UpdateDate] [date] NULL,
	[DeletedDate] [date] NULL,
 CONSTRAINT [PK_StudentAcademicDetails] PRIMARY KEY CLUSTERED 
(
	[StudentAcademicDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentContacts]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentContacts](
	[StudentContactId] [int] NOT NULL,
	[StudentContactGuid] [uniqueidentifier] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Address1] [varchar](200) NOT NULL,
	[Address2] [varchar](200) NOT NULL,
	[Landmark] [varchar](200) NULL,
	[Area] [varchar](50) NULL,
	[City] [varchar](20) NOT NULL,
	[Zip] [int] NOT NULL,
	[Contact1] [varchar](20) NULL,
	[MobileNumber1] [varchar](20) NOT NULL,
	[MobileNumber2] [varchar](20) NULL,
	[EmailAddress] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[UpdateDate] [date] NULL,
	[DeletedDate] [date] NULL,
 CONSTRAINT [PK_StudentContacts] PRIMARY KEY CLUSTERED 
(
	[StudentContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentFeesDetails]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentFeesDetails](
	[StudentFeesDetailId] [int] NOT NULL,
	[StudentFeesDetailGuid] [uniqueidentifier] NOT NULL,
	[StudentId] [int] NOT NULL,
	[SchoolFeeStructureId] [int] NOT NULL,
	[Amount] [numeric](18, 0) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [date] NULL,
	[UpdateDate] [date] NULL,
	[DeletedDate] [date] NULL,
 CONSTRAINT [PK_StudentFeesDetails] PRIMARY KEY CLUSTERED 
(
	[StudentFeesDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentHistory]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentHistory](
	[StudentHistoryId] [int] NOT NULL,
	[StudentHistoryGuid] [uniqueidentifier] NOT NULL,
	[StudentId] [int] NOT NULL,
	[LastAttendedSchool] [varchar](100) NOT NULL,
	[LastClassCompleted] [varchar](20) NOT NULL,
	[LastAcedemicYear] [varchar](20) NOT NULL,
	[LastAttendedBoard] [varchar](50) NOT NULL,
	[LastClassResult] [decimal](3, 2) NOT NULL,
 CONSTRAINT [PK_StudentHistory] PRIMARY KEY CLUSTERED 
(
	[StudentHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentInfo]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentInfo](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolID] [int] NOT NULL,
	[Firstname] [varchar](50) NOT NULL,
	[Middlename] [varchar](50) NULL,
	[Lastname] [varchar](50) NULL,
	[Nationality] [varchar](50) NOT NULL,
	[BirthPlace] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [varchar](10) NULL,
	[BloodGroup] [varchar](10) NOT NULL,
	[IdentityNumber] [varchar](50) NOT NULL,
	[Religion] [varchar](50) NULL,
	[Category] [varchar](50) NULL,
	[Photo] [image] NULL,
	[MotherTongue] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[UpdateDate] [date] NULL,
	[DeletedDate] [date] NULL,
	[ExternalUserLoginID] [int] NULL,
 CONSTRAINT [PK_StudentInfo] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentParentInfo]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentParentInfo](
	[StudentParentId] [int] NOT NULL,
	[StudentParentGuid] [uniqueidentifier] NOT NULL,
	[StudentId] [int] NOT NULL,
	[ParentType] [varchar](20) NOT NULL,
	[Parentname] [varchar](50) NOT NULL,
	[Qualification] [varchar](50) NULL,
	[Occupation] [varchar](50) NULL,
	[AnnualIncome] [numeric](18, 0) NULL,
	[EmailAddress] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[UpdateDate] [date] NULL,
	[DeletedDate] [date] NULL,
 CONSTRAINT [PK_StudentParentInfo] PRIMARY KEY CLUSTERED 
(
	[StudentParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroups]    Script Date: 2/25/2017 9:27:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroups](
	[UserGroupId] [int] NOT NULL,
	[UserGroupName] [varchar](50) NOT NULL,
	[IsInternal] [bit] NOT NULL,
	[IsExternal] [bit] NOT NULL,
 CONSTRAINT [PK_UserGroups] PRIMARY KEY CLUSTERED 
(
	[UserGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo]  WITH CHECK ADD  CONSTRAINT [FK_ExternalUserAcademicInfo_AcademicYear] FOREIGN KEY([AcademicYearId])
REFERENCES [dbo].[AcademicYear] ([AcademicYearId])
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo] CHECK CONSTRAINT [FK_ExternalUserAcademicInfo_AcademicYear]
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo]  WITH CHECK ADD  CONSTRAINT [FK_ExternalUserAcademicInfo_ExternalUserLogin] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ExternalUserLogin] ([ExternalUserLoginID])
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo] CHECK CONSTRAINT [FK_ExternalUserAcademicInfo_ExternalUserLogin]
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo]  WITH CHECK ADD  CONSTRAINT [FK_ExternalUserAcademicInfo_ExternalUserLogin1] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[ExternalUserLogin] ([ExternalUserLoginID])
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo] CHECK CONSTRAINT [FK_ExternalUserAcademicInfo_ExternalUserLogin1]
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo]  WITH CHECK ADD  CONSTRAINT [FK_ExternalUserAcademicInfo_ExternalUserLogin2] FOREIGN KEY([ExternalUserLoginID])
REFERENCES [dbo].[ExternalUserLogin] ([ExternalUserLoginID])
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo] CHECK CONSTRAINT [FK_ExternalUserAcademicInfo_ExternalUserLogin2]
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo]  WITH CHECK ADD  CONSTRAINT [FK_ExternalUserAcademicInfo_SchoolSection] FOREIGN KEY([SchoolSectionId])
REFERENCES [dbo].[SchoolSection] ([SchoolSectionID])
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo] CHECK CONSTRAINT [FK_ExternalUserAcademicInfo_SchoolSection]
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo]  WITH CHECK ADD  CONSTRAINT [FK_ExternalUserAcademicInfo_SchoolStandard] FOREIGN KEY([SchoolStandardId])
REFERENCES [dbo].[SchoolStandard] ([SchoolStandardID])
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo] CHECK CONSTRAINT [FK_ExternalUserAcademicInfo_SchoolStandard]
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo]  WITH CHECK ADD  CONSTRAINT [FK_ExternalUserAcademicInfo_SchoolStream] FOREIGN KEY([SchoolStreamID])
REFERENCES [dbo].[SchoolStream] ([SchoolStreamID])
GO
ALTER TABLE [dbo].[ExternalUserAcademicInfo] CHECK CONSTRAINT [FK_ExternalUserAcademicInfo_SchoolStream]
GO
ALTER TABLE [dbo].[ExternalUserInfo]  WITH CHECK ADD  CONSTRAINT [FK_ExternalUserInfo_School_SchoolID] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[School] ([SchoolID])
GO
ALTER TABLE [dbo].[ExternalUserInfo] CHECK CONSTRAINT [FK_ExternalUserInfo_School_SchoolID]
GO
ALTER TABLE [dbo].[ExternalUserLogin]  WITH CHECK ADD  CONSTRAINT [FK_ExternalUserLogin_ExternalUserInfo_ExternalUserInfoID] FOREIGN KEY([ExternalUserInfoID])
REFERENCES [dbo].[ExternalUserInfo] ([ExternalUserInfoID])
GO
ALTER TABLE [dbo].[ExternalUserLogin] CHECK CONSTRAINT [FK_ExternalUserLogin_ExternalUserInfo_ExternalUserInfoID]
GO
ALTER TABLE [dbo].[ExternalUserLogin_UserGroup_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_ExternalUserLogin_ExternalUserGroup_ExternalUserGroupID] FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroups] ([UserGroupId])
GO
ALTER TABLE [dbo].[ExternalUserLogin_UserGroup_Mapping] CHECK CONSTRAINT [FK_ExternalUserLogin_ExternalUserGroup_ExternalUserGroupID]
GO
ALTER TABLE [dbo].[ExternalUserLogin_UserGroup_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_ExternalUserLogin_ExternalUserGroup_ExternalUserLoginID] FOREIGN KEY([ExternalUserLoginID])
REFERENCES [dbo].[ExternalUserLogin] ([ExternalUserLoginID])
GO
ALTER TABLE [dbo].[ExternalUserLogin_UserGroup_Mapping] CHECK CONSTRAINT [FK_ExternalUserLogin_ExternalUserGroup_ExternalUserLoginID]
GO
ALTER TABLE [dbo].[ExternalUserTransations]  WITH CHECK ADD  CONSTRAINT [FK_ExternalUserTransations_ExternalUserLogin] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ExternalUserLogin] ([ExternalUserLoginID])
GO
ALTER TABLE [dbo].[ExternalUserTransations] CHECK CONSTRAINT [FK_ExternalUserTransations_ExternalUserLogin]
GO
ALTER TABLE [dbo].[ExternalUserTransations]  WITH CHECK ADD  CONSTRAINT [FK_ExternalUserTransations_ExternalUserLogin1] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[ExternalUserLogin] ([ExternalUserLoginID])
GO
ALTER TABLE [dbo].[ExternalUserTransations] CHECK CONSTRAINT [FK_ExternalUserTransations_ExternalUserLogin1]
GO
ALTER TABLE [dbo].[InternalUser]  WITH CHECK ADD  CONSTRAINT [FK_InternalUser_tblUserGroup_InternalUserGroupID] FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroups] ([UserGroupId])
GO
ALTER TABLE [dbo].[InternalUser] CHECK CONSTRAINT [FK_InternalUser_tblUserGroup_InternalUserGroupID]
GO
ALTER TABLE [dbo].[SchoolFeeStructure]  WITH CHECK ADD  CONSTRAINT [FK_SchoolFeeStructure_FeeFrequency] FOREIGN KEY([FeeFrequencyId])
REFERENCES [dbo].[FeeFrequency] ([FeeFrequencyId])
GO
ALTER TABLE [dbo].[SchoolFeeStructure] CHECK CONSTRAINT [FK_SchoolFeeStructure_FeeFrequency]
GO
ALTER TABLE [dbo].[SchoolFeeStructure]  WITH CHECK ADD  CONSTRAINT [FK_SchoolFeeStructure_FeeTypes] FOREIGN KEY([FeeTypeId])
REFERENCES [dbo].[FeeTypes] ([FeeTypeId])
GO
ALTER TABLE [dbo].[SchoolFeeStructure] CHECK CONSTRAINT [FK_SchoolFeeStructure_FeeTypes]
GO
ALTER TABLE [dbo].[SchoolFeeStructure]  WITH CHECK ADD  CONSTRAINT [FK_SchoolFeeStructure_School] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[School] ([SchoolID])
GO
ALTER TABLE [dbo].[SchoolFeeStructure] CHECK CONSTRAINT [FK_SchoolFeeStructure_School]
GO
ALTER TABLE [dbo].[SchoolFeeStructure]  WITH CHECK ADD  CONSTRAINT [FK_SchoolFeeStructure_SchoolStandard] FOREIGN KEY([SchoolStandardID])
REFERENCES [dbo].[SchoolStandard] ([SchoolStandardID])
GO
ALTER TABLE [dbo].[SchoolFeeStructure] CHECK CONSTRAINT [FK_SchoolFeeStructure_SchoolStandard]
GO
ALTER TABLE [dbo].[SchoolSection]  WITH CHECK ADD  CONSTRAINT [FK_SchoolSection_School] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[School] ([SchoolID])
GO
ALTER TABLE [dbo].[SchoolSection] CHECK CONSTRAINT [FK_SchoolSection_School]
GO
ALTER TABLE [dbo].[SchoolSection]  WITH CHECK ADD  CONSTRAINT [FK_SchoolSection_Section] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[SchoolSection] CHECK CONSTRAINT [FK_SchoolSection_Section]
GO
ALTER TABLE [dbo].[SchoolStandard]  WITH CHECK ADD  CONSTRAINT [FK_SchoolStandard_School] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[School] ([SchoolID])
GO
ALTER TABLE [dbo].[SchoolStandard] CHECK CONSTRAINT [FK_SchoolStandard_School]
GO
ALTER TABLE [dbo].[SchoolStandard]  WITH CHECK ADD  CONSTRAINT [FK_SchoolStandard_Standard] FOREIGN KEY([StandardID])
REFERENCES [dbo].[Standard] ([StandardId])
GO
ALTER TABLE [dbo].[SchoolStandard] CHECK CONSTRAINT [FK_SchoolStandard_Standard]
GO
ALTER TABLE [dbo].[SchoolStream]  WITH CHECK ADD  CONSTRAINT [FK_SchoolStream_School] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[School] ([SchoolID])
GO
ALTER TABLE [dbo].[SchoolStream] CHECK CONSTRAINT [FK_SchoolStream_School]
GO
ALTER TABLE [dbo].[SchoolStream]  WITH CHECK ADD  CONSTRAINT [FK_SchoolStream_Stream] FOREIGN KEY([StreamID])
REFERENCES [dbo].[Stream] ([StreamId])
GO
ALTER TABLE [dbo].[SchoolStream] CHECK CONSTRAINT [FK_SchoolStream_Stream]
GO
ALTER TABLE [dbo].[StudentAcademicDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentAcademicDetails_AcademicYear] FOREIGN KEY([AcademicYearId])
REFERENCES [dbo].[AcademicYear] ([AcademicYearId])
GO
ALTER TABLE [dbo].[StudentAcademicDetails] CHECK CONSTRAINT [FK_StudentAcademicDetails_AcademicYear]
GO
ALTER TABLE [dbo].[StudentAcademicDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentAcademicDetails_SchoolSection] FOREIGN KEY([SchoolSectionId])
REFERENCES [dbo].[SchoolSection] ([SchoolSectionID])
GO
ALTER TABLE [dbo].[StudentAcademicDetails] CHECK CONSTRAINT [FK_StudentAcademicDetails_SchoolSection]
GO
ALTER TABLE [dbo].[StudentAcademicDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentAcademicDetails_SchoolStandard] FOREIGN KEY([SchoolStandardId])
REFERENCES [dbo].[SchoolStandard] ([SchoolStandardID])
GO
ALTER TABLE [dbo].[StudentAcademicDetails] CHECK CONSTRAINT [FK_StudentAcademicDetails_SchoolStandard]
GO
ALTER TABLE [dbo].[StudentAcademicDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentAcademicDetails_SchoolStream] FOREIGN KEY([SchoolStreamID])
REFERENCES [dbo].[SchoolStream] ([SchoolStreamID])
GO
ALTER TABLE [dbo].[StudentAcademicDetails] CHECK CONSTRAINT [FK_StudentAcademicDetails_SchoolStream]
GO
ALTER TABLE [dbo].[StudentAcademicDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentAcademicDetails_StudentInfo] FOREIGN KEY([StudentId])
REFERENCES [dbo].[StudentInfo] ([StudentId])
GO
ALTER TABLE [dbo].[StudentAcademicDetails] CHECK CONSTRAINT [FK_StudentAcademicDetails_StudentInfo]
GO
ALTER TABLE [dbo].[StudentContacts]  WITH CHECK ADD  CONSTRAINT [FK_StudentContacts_StudentInfo] FOREIGN KEY([StudentId])
REFERENCES [dbo].[StudentInfo] ([StudentId])
GO
ALTER TABLE [dbo].[StudentContacts] CHECK CONSTRAINT [FK_StudentContacts_StudentInfo]
GO
ALTER TABLE [dbo].[StudentFeesDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentFeesDetails_SchoolFeeStructure] FOREIGN KEY([SchoolFeeStructureId])
REFERENCES [dbo].[SchoolFeeStructure] ([SchoolFeeStructureId])
GO
ALTER TABLE [dbo].[StudentFeesDetails] CHECK CONSTRAINT [FK_StudentFeesDetails_SchoolFeeStructure]
GO
ALTER TABLE [dbo].[StudentFeesDetails]  WITH CHECK ADD  CONSTRAINT [FK_StudentFeesDetails_StudentInfo] FOREIGN KEY([StudentId])
REFERENCES [dbo].[StudentInfo] ([StudentId])
GO
ALTER TABLE [dbo].[StudentFeesDetails] CHECK CONSTRAINT [FK_StudentFeesDetails_StudentInfo]
GO
ALTER TABLE [dbo].[StudentHistory]  WITH CHECK ADD  CONSTRAINT [FK_StudentHistory_StudentInfo] FOREIGN KEY([StudentId])
REFERENCES [dbo].[StudentInfo] ([StudentId])
GO
ALTER TABLE [dbo].[StudentHistory] CHECK CONSTRAINT [FK_StudentHistory_StudentInfo]
GO
ALTER TABLE [dbo].[StudentInfo]  WITH CHECK ADD  CONSTRAINT [FK_StudentInfo_ExternalUserLogin] FOREIGN KEY([ExternalUserLoginID])
REFERENCES [dbo].[ExternalUserLogin] ([ExternalUserLoginID])
GO
ALTER TABLE [dbo].[StudentInfo] CHECK CONSTRAINT [FK_StudentInfo_ExternalUserLogin]
GO
ALTER TABLE [dbo].[StudentInfo]  WITH CHECK ADD  CONSTRAINT [FK_StudentInfo_School] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[School] ([SchoolID])
GO
ALTER TABLE [dbo].[StudentInfo] CHECK CONSTRAINT [FK_StudentInfo_School]
GO
ALTER TABLE [dbo].[StudentParentInfo]  WITH CHECK ADD  CONSTRAINT [FK_StudentParentInfo_StudentInfo] FOREIGN KEY([StudentId])
REFERENCES [dbo].[StudentInfo] ([StudentId])
GO
ALTER TABLE [dbo].[StudentParentInfo] CHECK CONSTRAINT [FK_StudentParentInfo_StudentInfo]
GO
USE [master]
GO
ALTER DATABASE [SMS] SET  READ_WRITE 
GO

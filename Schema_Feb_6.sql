USE [SMS]
GO
/****** Object:  Table [dbo].[AcademicYear]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[ExternalUserAcademicInfo]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[ExternalUserInfo]    Script Date: 31/05/2015 20:51:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExternalUserLogin]    Script Date: 31/05/2015 20:51:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExternalUserLogin_UserGroup_Mapping]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[ExternalUserTransations]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[FeeFrequency]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[FeeTypes]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[Gender]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[InternalUser]    Script Date: 31/05/2015 20:51:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[Religion]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[School]    Script Date: 31/05/2015 20:51:13 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SchoolFeeStructure]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[SchoolSection]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[SchoolStandard]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[SchoolStream]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[Section]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[Standard]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[Stream]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[StudentAcademicDetails]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[StudentContacts]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[StudentFeesDetails]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[StudentHistory]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[StudentInfo]    Script Date: 31/05/2015 20:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentInfo](
	[StudentId] [int] NOT NULL,
	[StudentGuid] [uniqueidentifier] NOT NULL,
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
	[MedicalHistory] [varchar](500) NOT NULL,
	[Photo] [image] NULL,
	[MotherTongue] [varchar](50) NULL,
	[IsDocumentSubmiited] [bit] NOT NULL,
	[DocumentDetails] [varchar](500) NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdateDate] [date] NULL,
	[DeletedDate] [date] NULL,
 CONSTRAINT [PK_StudentInfo] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentParentInfo]    Script Date: 31/05/2015 20:51:13 ******/
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
/****** Object:  Table [dbo].[UserGroups]    Script Date: 31/05/2015 20:51:13 ******/
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
INSERT [dbo].[AcademicYear] ([AcademicYearId], [AcademicYear]) VALUES (1, N'2015 - 2016')
INSERT [dbo].[AcademicYear] ([AcademicYearId], [AcademicYear]) VALUES (2, N'2016 - 2017')
INSERT [dbo].[AcademicYear] ([AcademicYearId], [AcademicYear]) VALUES (3, N'2017 - 2018')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Category]) VALUES (1, N'SC')
INSERT [dbo].[Category] ([CategoryId], [Category]) VALUES (2, N'ST')
INSERT [dbo].[Category] ([CategoryId], [Category]) VALUES (3, N'OPEN')
INSERT [dbo].[Category] ([CategoryId], [Category]) VALUES (4, N'OBC')
INSERT [dbo].[Category] ([CategoryId], [Category]) VALUES (5, N'OTHERS')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[ExternalUserInfo] ON 

INSERT [dbo].[ExternalUserInfo] ([ExternalUserInfoID], [SchoolID], [FirstName], [LastName], [MiddleName], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate]) VALUES (2, 2, N'Dilip', N'Mevada', N'Uttamlal', N'A1-304, Manjari Greenwoods, Opp.Ravi Garden', N'B/h HP Petrol Pump, Pune-Solapur Road, Manjari', N'Pune', N'Maharashtra', N'India', N'dilipmevada@gmail.com', NULL, NULL)
INSERT [dbo].[ExternalUserInfo] ([ExternalUserInfoID], [SchoolID], [FirstName], [LastName], [MiddleName], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate]) VALUES (1002, 12, N'Admin', N'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ExternalUserInfo] ([ExternalUserInfoID], [SchoolID], [FirstName], [LastName], [MiddleName], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate]) VALUES (1005, 17, N'Admin', N'Admin', NULL, NULL, NULL, NULL, NULL, NULL, N'Admin@17.com', NULL, NULL)
INSERT [dbo].[ExternalUserInfo] ([ExternalUserInfoID], [SchoolID], [FirstName], [LastName], [MiddleName], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate]) VALUES (1006, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Admin@19.com', NULL, NULL)
INSERT [dbo].[ExternalUserInfo] ([ExternalUserInfoID], [SchoolID], [FirstName], [LastName], [MiddleName], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate]) VALUES (1007, 20, N'Dilip', N'Mevada', N'Uttamlal', N'A1-304, Manjari Greenwoods, Opp.Ravi Garden', N'B/h HP Petrol Pump, Pune-Solapur Road, Manjari', N'Pune', N'Maharashtra', N'India', N'Admin@20.com', N'412307', NULL)
SET IDENTITY_INSERT [dbo].[ExternalUserInfo] OFF
SET IDENTITY_INSERT [dbo].[ExternalUserLogin] ON 

INSERT [dbo].[ExternalUserLogin] ([ExternalUserLoginID], [ExternalUserInfoID], [ExternalUserName], [Password], [Disabled], [FailedLoginCount], [CurrentSuccesfulLogin], [LastSuccesfulLogin], [CreateDate]) VALUES (1, 1002, N'Shivnagar Prathmic Sala1233_Admin', N'andtech123#', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ExternalUserLogin] ([ExternalUserLoginID], [ExternalUserInfoID], [ExternalUserName], [Password], [Disabled], [FailedLoginCount], [CurrentSuccesfulLogin], [LastSuccesfulLogin], [CreateDate]) VALUES (2, 1005, N'Admin17', N'andtech123#', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ExternalUserLogin] ([ExternalUserLoginID], [ExternalUserInfoID], [ExternalUserName], [Password], [Disabled], [FailedLoginCount], [CurrentSuccesfulLogin], [LastSuccesfulLogin], [CreateDate]) VALUES (3, 1006, N'Admin19', N'andtech123#', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ExternalUserLogin] ([ExternalUserLoginID], [ExternalUserInfoID], [ExternalUserName], [Password], [Disabled], [FailedLoginCount], [CurrentSuccesfulLogin], [LastSuccesfulLogin], [CreateDate]) VALUES (4, 1007, N'Admin20', N'andtech123#', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ExternalUserLogin] OFF
SET IDENTITY_INSERT [dbo].[ExternalUserLogin_UserGroup_Mapping] ON 

INSERT [dbo].[ExternalUserLogin_UserGroup_Mapping] ([ExternalUserLogin_UserGroup_ID], [ExternalUserLoginID], [UserGroupId]) VALUES (1, 2, 1)
INSERT [dbo].[ExternalUserLogin_UserGroup_Mapping] ([ExternalUserLogin_UserGroup_ID], [ExternalUserLoginID], [UserGroupId]) VALUES (2, 3, 1)
INSERT [dbo].[ExternalUserLogin_UserGroup_Mapping] ([ExternalUserLogin_UserGroup_ID], [ExternalUserLoginID], [UserGroupId]) VALUES (3, 4, 1)
SET IDENTITY_INSERT [dbo].[ExternalUserLogin_UserGroup_Mapping] OFF
INSERT [dbo].[FeeTypes] ([FeeTypeId], [FeeTypeGuid], [Type], [Remarks]) VALUES (1, N'aa98155f-886d-4008-ac26-7221b81dd723', N'Admission Fee', NULL)
INSERT [dbo].[FeeTypes] ([FeeTypeId], [FeeTypeGuid], [Type], [Remarks]) VALUES (2, N'dbd8a8da-82b8-4f92-9e01-ddbbc69ac7f3', N'Tition Fee', NULL)
INSERT [dbo].[FeeTypes] ([FeeTypeId], [FeeTypeGuid], [Type], [Remarks]) VALUES (3, N'eba8c052-aa91-4525-92d2-9ce7589bea54', N'Development Fee', NULL)
INSERT [dbo].[FeeTypes] ([FeeTypeId], [FeeTypeGuid], [Type], [Remarks]) VALUES (4, N'e6bdcf5e-bfde-4c37-b55a-d6f9c8bc9ee9', N'Activities Fee', NULL)
INSERT [dbo].[FeeTypes] ([FeeTypeId], [FeeTypeGuid], [Type], [Remarks]) VALUES (5, N'214e467d-5e86-4916-ad68-92fd1618aa01', N'Library Fee', NULL)
INSERT [dbo].[FeeTypes] ([FeeTypeId], [FeeTypeGuid], [Type], [Remarks]) VALUES (6, N'c69dd81e-5c97-4582-a004-16fc68a5a33e', N'Caution Fee', NULL)
INSERT [dbo].[FeeTypes] ([FeeTypeId], [FeeTypeGuid], [Type], [Remarks]) VALUES (7, N'397c2f67-8025-4c51-b25b-e5ce790a1c3b', N'Refundable Deposit', NULL)
INSERT [dbo].[FeeTypes] ([FeeTypeId], [FeeTypeGuid], [Type], [Remarks]) VALUES (8, N'4a9fbe18-43d7-41a5-85b4-59c0bcb2129d', N'Bus Fee', NULL)
INSERT [dbo].[FeeTypes] ([FeeTypeId], [FeeTypeGuid], [Type], [Remarks]) VALUES (9, N'71c74b1d-a978-4e21-9355-8727b9f9176e', N'Miscellaneous Fee', NULL)
INSERT [dbo].[FeeTypes] ([FeeTypeId], [FeeTypeGuid], [Type], [Remarks]) VALUES (10, N'940ca0b4-7d8a-4a87-9a27-892fc2592f92', N'Other Fee', NULL)
INSERT [dbo].[Gender] ([Gender]) VALUES (N'Female')
INSERT [dbo].[Gender] ([Gender]) VALUES (N'Male')
SET IDENTITY_INSERT [dbo].[InternalUser] ON 

INSERT [dbo].[InternalUser] ([InternalUserID], [UserGroupId], [UserName], [Password], [Disabled], [FailedLoginCount], [EmailID], [CurrentSuccesfulLogin], [LastSuccesfulLogin], [CreateDate]) VALUES (1, 1, N'dilip', N'Andtech123', 0, 3, N'test@gmail.com', NULL, NULL, NULL)
INSERT [dbo].[InternalUser] ([InternalUserID], [UserGroupId], [UserName], [Password], [Disabled], [FailedLoginCount], [EmailID], [CurrentSuccesfulLogin], [LastSuccesfulLogin], [CreateDate]) VALUES (2, 2, N'mahesh', N'Andtech123', 0, 3, N'test1@gmail.com', NULL, NULL, NULL)
INSERT [dbo].[InternalUser] ([InternalUserID], [UserGroupId], [UserName], [Password], [Disabled], [FailedLoginCount], [EmailID], [CurrentSuccesfulLogin], [LastSuccesfulLogin], [CreateDate]) VALUES (5, 2, N'nimish', N'Andtech123', 0, 3, N'test2@gmail.com', NULL, NULL, NULL)
INSERT [dbo].[InternalUser] ([InternalUserID], [UserGroupId], [UserName], [Password], [Disabled], [FailedLoginCount], [EmailID], [CurrentSuccesfulLogin], [LastSuccesfulLogin], [CreateDate]) VALUES (7, 1, N'nimish123', N'Andtech123', 0, 3, N'test3@gmail.com', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[InternalUser] OFF
SET IDENTITY_INSERT [dbo].[Nationality] ON 

INSERT [dbo].[Nationality] ([NationalityId], [Nationality]) VALUES (1, N'Indian')
SET IDENTITY_INSERT [dbo].[Nationality] OFF
SET IDENTITY_INSERT [dbo].[Religion] ON 

INSERT [dbo].[Religion] ([ReligionId], [Religion]) VALUES (1, N'Hindu')
INSERT [dbo].[Religion] ([ReligionId], [Religion]) VALUES (2, N'Muslim')
INSERT [dbo].[Religion] ([ReligionId], [Religion]) VALUES (3, N'Sikh')
INSERT [dbo].[Religion] ([ReligionId], [Religion]) VALUES (4, N'Others')
SET IDENTITY_INSERT [dbo].[Religion] OFF
SET IDENTITY_INSERT [dbo].[School] ON 

INSERT [dbo].[School] ([SchoolID], [SchoolName], [Description], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate], [IsActive]) VALUES (2, N'Delhi Public School', N'Second School', N'Camp', NULL, N'Pune', N'MH', N'India', N'dps@gmail.com', 415075, NULL, 1)
INSERT [dbo].[School] ([SchoolID], [SchoolName], [Description], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate], [IsActive]) VALUES (8, N'Angle High School', N'Second School', N'dsfd', N'df', N'dfs', N'df', N'dfd', NULL, NULL, NULL, NULL)
INSERT [dbo].[School] ([SchoolID], [SchoolName], [Description], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate], [IsActive]) VALUES (10, N'Shivnagar Prathmic Sal', N'sdadsaqsdsd', N'shiv nagardsadasdsad', N'deesasdsad', N'deesasdasd', N'GJasdasd', N'sdsdadasd', N'sd11@gmail.com', 123456, NULL, 1)
INSERT [dbo].[School] ([SchoolID], [SchoolName], [Description], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate], [IsActive]) VALUES (12, N'Shivnagar Prathmic Sala1233', N'Second School', N'A1-304, Manjari Greenwoods, Opp.Ravi Garden', N'B/h: HP Petrol Pump, Pune-Solapur Road, Manjari BK', N'Pune', N'Maharastra', N'India', N'dilipmevada@gmail.com', 412307, NULL, 1)
INSERT [dbo].[School] ([SchoolID], [SchoolName], [Description], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate], [IsActive]) VALUES (14, N'Vidhya Mandir', N'asdsad', N'A1-304, Manjari Greenwoods, Opp.Ravi Garden', N'B/h HP Petrol Pump, Pune-Solapur Road, Manjari', N'asdasd', N'Maharashtra', N'India', N'dilip.mevada@gmail.com', 412307, NULL, 1)
INSERT [dbo].[School] ([SchoolID], [SchoolName], [Description], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate], [IsActive]) VALUES (16, N'MyFirstSchool', N'Second School', N'A1-304, Manjari Greenwoods, Opp.Ravi Garden', N'B/h: HP Petrol Pump, Pune-Solapur Road, Manjari BK', N'Pune', N'Maharastra', N'India', N'dilipmev.ada@gmail.com', NULL, NULL, NULL)
INSERT [dbo].[School] ([SchoolID], [SchoolName], [Description], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate], [IsActive]) VALUES (17, N'test schhol', N'Second School', N'A1-304, Manjari Greenwoods, Opp.Ravi Garden', N'B/h: HP Petrol Pump, Pune-Solapur Road, Manjari BK', NULL, NULL, NULL, N'ang2le2@gmail.com', NULL, NULL, NULL)
INSERT [dbo].[School] ([SchoolID], [SchoolName], [Description], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate], [IsActive]) VALUES (19, N'Angle High School111', N'111dsa', N'adsd', N'sad', N'as', N'sada', N'sadasd', N'sd112222@gmail.com', 412307, NULL, 1)
INSERT [dbo].[School] ([SchoolID], [SchoolName], [Description], [Address1], [Address2], [City], [State], [Country], [EmailID], [Pin], [CreateDate], [IsActive]) VALUES (20, N'DGn Vidyalaya', N'Badlapur', N'Badlapur', N'Badlapur', N'Badlapur', N'Maharashtra', N'India', N'nim@gmail.com', 421503, CAST(0x0000816300000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[School] OFF
INSERT [dbo].[Section] ([SectionId], [Section]) VALUES (1, N'A')
INSERT [dbo].[Section] ([SectionId], [Section]) VALUES (2, N'B')
INSERT [dbo].[Section] ([SectionId], [Section]) VALUES (3, N'C')
INSERT [dbo].[Section] ([SectionId], [Section]) VALUES (4, N'D')
INSERT [dbo].[Section] ([SectionId], [Section]) VALUES (5, N'E')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (1, N'Play Group')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (2, N'Nursary')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (3, N'Junior KG')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (4, N'Senior KG')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (5, N'I')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (6, N'II')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (7, N'III')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (8, N'IV')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (9, N'V')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (10, N'VI')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (11, N'VII')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (12, N'VIII')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (13, N'IX')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (14, N'X')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (15, N'XI')
INSERT [dbo].[Standard] ([StandardId], [Standard]) VALUES (16, N'XII')
INSERT [dbo].[Stream] ([StreamId], [Stream]) VALUES (1, N'Art')
INSERT [dbo].[Stream] ([StreamId], [Stream]) VALUES (2, N'Commece')
INSERT [dbo].[Stream] ([StreamId], [Stream]) VALUES (3, N'Science - Bio')
INSERT [dbo].[Stream] ([StreamId], [Stream]) VALUES (4, N'Commece - Maths')
INSERT [dbo].[UserGroups] ([UserGroupId], [UserGroupName], [IsInternal], [IsExternal]) VALUES (1, N'Admin', 1, 1)
INSERT [dbo].[UserGroups] ([UserGroupId], [UserGroupName], [IsInternal], [IsExternal]) VALUES (2, N'Parent', 1, 1)
INSERT [dbo].[UserGroups] ([UserGroupId], [UserGroupName], [IsInternal], [IsExternal]) VALUES (3, N'Student', 1, 1)
INSERT [dbo].[UserGroups] ([UserGroupId], [UserGroupName], [IsInternal], [IsExternal]) VALUES (4, N'Teacher', 1, 1)
INSERT [dbo].[UserGroups] ([UserGroupId], [UserGroupName], [IsInternal], [IsExternal]) VALUES (5, N'View', 1, 1)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__External__7ED91AEE631CD4A2]    Script Date: 31/05/2015 20:51:14 ******/
ALTER TABLE [dbo].[ExternalUserInfo] ADD UNIQUE NONCLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__External__C03C9E439938B7B2]    Script Date: 31/05/2015 20:51:14 ******/
ALTER TABLE [dbo].[ExternalUserLogin] ADD UNIQUE NONCLUSTERED 
(
	[ExternalUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Internal__7ED91AEE6A04084E]    Script Date: 31/05/2015 20:51:14 ******/
ALTER TABLE [dbo].[InternalUser] ADD UNIQUE NONCLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Internal__C9F2845614CA4086]    Script Date: 31/05/2015 20:51:14 ******/
ALTER TABLE [dbo].[InternalUser] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__School__7ED91AEEEC26FDBE]    Script Date: 31/05/2015 20:51:14 ******/
ALTER TABLE [dbo].[School] ADD UNIQUE NONCLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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

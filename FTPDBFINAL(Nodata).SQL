USE [FreshersTrainingPlatform]
GO
/****** Object:  Table [dbo].[WSRTypes]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WSRTypes]') AND type in (N'U'))
DROP TABLE [dbo].[WSRTypes]
GO
/****** Object:  Table [dbo].[WorkShopAttachments]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkShopAttachments]') AND type in (N'U'))
DROP TABLE [dbo].[WorkShopAttachments]
GO
/****** Object:  Table [dbo].[WorkShop]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkShop]') AND type in (N'U'))
DROP TABLE [dbo].[WorkShop]
GO
/****** Object:  Table [dbo].[TraineeTechStack]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TraineeTechStack]') AND type in (N'U'))
DROP TABLE [dbo].[TraineeTechStack]
GO
/****** Object:  Table [dbo].[TraineeSpecialization]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TraineeSpecialization]') AND type in (N'U'))
DROP TABLE [dbo].[TraineeSpecialization]
GO
/****** Object:  Table [dbo].[TraineeAllocation]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TraineeAllocation]') AND type in (N'U'))
DROP TABLE [dbo].[TraineeAllocation]
GO
/****** Object:  Table [dbo].[TechStack]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TechStack]') AND type in (N'U'))
DROP TABLE [dbo].[TechStack]
GO
/****** Object:  Table [dbo].[Stream]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Stream]') AND type in (N'U'))
DROP TABLE [dbo].[Stream]
GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Specialization]') AND type in (N'U'))
DROP TABLE [dbo].[Specialization]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[RatingType]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RatingType]') AND type in (N'U'))
DROP TABLE [dbo].[RatingType]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rating]') AND type in (N'U'))
DROP TABLE [dbo].[Rating]
GO
/****** Object:  Table [dbo].[ProjectStatus]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProjectStatus]') AND type in (N'U'))
DROP TABLE [dbo].[ProjectStatus]
GO
/****** Object:  Table [dbo].[NotificationTypes]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NotificationTypes]') AND type in (N'U'))
DROP TABLE [dbo].[NotificationTypes]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Notifications]') AND type in (N'U'))
DROP TABLE [dbo].[Notifications]
GO
/****** Object:  Table [dbo].[MentorAssessment]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MentorAssessment]') AND type in (N'U'))
DROP TABLE [dbo].[MentorAssessment]
GO
/****** Object:  Table [dbo].[InnovaEmployeeReplica]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InnovaEmployeeReplica]') AND type in (N'U'))
DROP TABLE [dbo].[InnovaEmployeeReplica]
GO
/****** Object:  Table [dbo].[ExamReceipents]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExamReceipents]') AND type in (N'U'))
DROP TABLE [dbo].[ExamReceipents]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Exam]') AND type in (N'U'))
DROP TABLE [dbo].[Exam]
GO
/****** Object:  Table [dbo].[EmpRoleMapping]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmpRoleMapping]') AND type in (N'U'))
DROP TABLE [dbo].[EmpRoleMapping]
GO
/****** Object:  Table [dbo].[EmployeeMentorAssessment]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeMentorAssessment]') AND type in (N'U'))
DROP TABLE [dbo].[EmployeeMentorAssessment]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[College]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[College]') AND type in (N'U'))
DROP TABLE [dbo].[College]
GO
/****** Object:  Table [dbo].[CapstoneWsrStatus]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CapstoneWsrStatus]') AND type in (N'U'))
DROP TABLE [dbo].[CapstoneWsrStatus]
GO
/****** Object:  Table [dbo].[CapstoneWsrRisks]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CapstoneWsrRisks]') AND type in (N'U'))
DROP TABLE [dbo].[CapstoneWsrRisks]
GO
/****** Object:  Table [dbo].[CapstoneWSR]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CapstoneWSR]') AND type in (N'U'))
DROP TABLE [dbo].[CapstoneWSR]
GO
/****** Object:  Table [dbo].[CapstoneTraineeAllocations]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CapstoneTraineeAllocations]') AND type in (N'U'))
DROP TABLE [dbo].[CapstoneTraineeAllocations]
GO
/****** Object:  Table [dbo].[CapstoneProjects]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CapstoneProjects]') AND type in (N'U'))
DROP TABLE [dbo].[CapstoneProjects]
GO
/****** Object:  Table [dbo].[CapstoneMllsAllocations]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CapstoneMllsAllocations]') AND type in (N'U'))
DROP TABLE [dbo].[CapstoneMllsAllocations]
GO
/****** Object:  Table [dbo].[BroadCastNotification]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BroadCastNotification]') AND type in (N'U'))
DROP TABLE [dbo].[BroadCastNotification]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Batch]') AND type in (N'U'))
DROP TABLE [dbo].[Batch]
GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 11/22/2022 6:53:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attachments]') AND type in (N'U'))
DROP TABLE [dbo].[Attachments]
GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttachmentLink] [varchar](50) NULL,
	[AttachmentType] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Attachments_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BatchName] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Batch_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BroadCastNotification]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BroadCastNotification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[NotificationId] [int] NOT NULL,
	[IsRead] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [Pk_BroadCastNotification_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CapstoneMllsAllocations]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapstoneMllsAllocations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NULL,
	[CapstoneProjectId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsAssigned] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_CapstoneMllsAllocations_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CapstoneProjects]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapstoneProjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CapstoneProjectOwnerId] [int] NOT NULL,
	[AttachmentId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_CapstoneProjects_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CapstoneTraineeAllocations]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapstoneTraineeAllocations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TraineeId] [int] NULL,
	[CapstoneProjectId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_CapstoneTraineeAllocations_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CapstoneWSR]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapstoneWSR](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CapstoneProjectId] [int] NOT NULL,
	[SprintName] [varchar](50) NULL,
	[ProjectStatusId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_CapstoneWSR_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CapstoneWsrRisks]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapstoneWsrRisks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CapstoneWsrId] [int] NULL,
	[ItemType] [varchar](50) NULL,
	[ItemDescription] [varchar](50) NULL,
	[AssignedId] [int] NULL,
	[ETA] [varchar](50) NULL,
	[WsrStatusId] [int] NULL,
	[Comments] [varchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_CapstoneWsrRisks_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CapstoneWsrStatus]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapstoneWsrStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CapstoneWsrId] [int] NULL,
	[WSRTypeId] [int] NULL,
	[Title] [varchar](50) NULL,
	[AssignedId] [int] NULL,
	[State] [varchar](50) NULL,
	[ManagerComments] [varchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_CapstoneWsrStatus_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[College]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[College](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_College_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[IsAllocationRequested] [bit] NULL,
	[IsAllocated] [bit] NULL,
	[AllocatedTime] [datetime] NULL,
	[IsReadyToTakeIntoProject] [bit] NULL,
	[DOJ] [date] NULL,
	[TrainingStartDate] [datetime] NULL,
	[CapstoneAvailabilityDate] [datetime] NULL,
	[Location] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Employee_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeMentorAssessment]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeMentorAssessment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MentorAssessmentId] [int] NULL,
	[TraineeId] [int] NULL,
	[TraineeSubmissionFile] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_EmployeeMentorAssessment_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpRoleMapping]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpRoleMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_EmpRoleMapping_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TechStackId] [int] NULL,
	[ExamDate] [datetime] NULL,
	[TypeOfExam] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[BatchId] [int] NULL,
	[IsPublished] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[SpecializationId] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Exam_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamReceipents]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamReceipents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExamId] [int] NOT NULL,
	[ReceipentId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__ExamReceipents__Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InnovaEmployeeReplica]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InnovaEmployeeReplica](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeNumber] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DisplayName] [varchar](50) NULL,
	[RoleName] [varchar](50) NULL,
	[CompanyEmail] [varchar](50) NULL,
	[University] [varchar](200) NULL,
	[CourseName] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_InnovaEmployeeReplica] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__InnovaEmployeeReplica__EmployeeNumber] UNIQUE NONCLUSTERED 
(
	[EmployeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MentorAssessment]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MentorAssessment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MentorId] [int] NOT NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[FileName] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__MentorAssessment__Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](200) NULL,
	[NotificationTypesId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Notifications__Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationTypes]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK__NotificationTypes_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectStatus]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK__ProjectStatus__Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[TraineeId] [int] NULL,
	[FeedbackDate] [datetime] NULL,
	[StarRating] [int] NULL,
	[RatingTypeId] [int] NULL,
	[WeekId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Rating__Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RatingType]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatingType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK__RatingType_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK__Roles__Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[TechStackId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK__Specialization_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stream]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stream](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK__Stream__Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TechStack]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechStack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK__TechStacK__Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TraineeAllocation]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraineeAllocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[BatchId] [int] NULL,
	[JoiningDate] [datetime] NULL,
	[MentorId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__TraineeAllocation__Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TraineeSpecialization]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraineeSpecialization](
	[EmployeeId] [int] NOT NULL,
	[SpecializationId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__TraineeSpecialization__Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TraineeTechStack]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraineeTechStack](
	[EmployeeId] [int] NOT NULL,
	[TechStackId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__TraineeTechStack_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkShop]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkShop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkShopDate] [datetime] NULL,
	[WorkShopMentorId] [int] NULL,
	[TraineeId] [int] NULL,
	[Topics] [varchar](200) NULL,
	[Description] [varchar](500) NULL,
	[Attended] [bit] NULL,
	[ActualScore] [int] NULL,
	[MinScore] [int] NULL,
	[TotalScore] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_WorkShop_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkShopAttachments]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkShopAttachments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkShopId] [int] NULL,
	[AttachmentLink] [varchar](50) NULL,
	[AttachmentType] [varchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__WorkShopAttachments__Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WSRTypes]    Script Date: 11/22/2022 6:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WSRTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK__WSRTypes__Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attachments] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Batch] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Batch] ADD  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[BroadCastNotification] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CapstoneMllsAllocations] ADD  DEFAULT ((1)) FOR [IsAssigned]
GO
ALTER TABLE [dbo].[CapstoneMllsAllocations] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CapstoneProjects] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CapstoneTraineeAllocations] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CapstoneWSR] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CapstoneWsrRisks] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CapstoneWsrStatus] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[EmployeeMentorAssessment] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[EmpRoleMapping] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[EmpRoleMapping] ADD  DEFAULT ((0)) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[Exam] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ExamReceipents] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[InnovaEmployeeReplica] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MentorAssessment] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Rating] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TraineeAllocation] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TraineeSpecialization] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TraineeTechStack] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[WorkShop] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[WorkShopAttachments] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BroadCastNotification]  WITH CHECK ADD  CONSTRAINT [FK_BroadCastNotification_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BroadCastNotification] CHECK CONSTRAINT [FK_BroadCastNotification_EmployeeId]
GO
ALTER TABLE [dbo].[BroadCastNotification]  WITH CHECK ADD  CONSTRAINT [FK_BroadCastNotification_NotificationId] FOREIGN KEY([NotificationId])
REFERENCES [dbo].[Notifications] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BroadCastNotification] CHECK CONSTRAINT [FK_BroadCastNotification_NotificationId]
GO
ALTER TABLE [dbo].[CapstoneMllsAllocations]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneMllsAllocations_CapstoneProjectId] FOREIGN KEY([CapstoneProjectId])
REFERENCES [dbo].[CapstoneProjects] ([Id])
GO
ALTER TABLE [dbo].[CapstoneMllsAllocations] CHECK CONSTRAINT [FK_CapstoneMllsAllocations_CapstoneProjectId]
GO
ALTER TABLE [dbo].[CapstoneMllsAllocations]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneMllsAllocations_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CapstoneMllsAllocations] CHECK CONSTRAINT [FK_CapstoneMllsAllocations_EmployeeId]
GO
ALTER TABLE [dbo].[CapstoneProjects]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneProjects_AttachmentId] FOREIGN KEY([AttachmentId])
REFERENCES [dbo].[Attachments] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CapstoneProjects] CHECK CONSTRAINT [FK_CapstoneProjects_AttachmentId]
GO
ALTER TABLE [dbo].[CapstoneProjects]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneProjects_CapstoneProjectOwnerId] FOREIGN KEY([CapstoneProjectOwnerId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CapstoneProjects] CHECK CONSTRAINT [FK_CapstoneProjects_CapstoneProjectOwnerId]
GO
ALTER TABLE [dbo].[CapstoneTraineeAllocations]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneTraineeAllocations_CapstoneProjectId] FOREIGN KEY([CapstoneProjectId])
REFERENCES [dbo].[CapstoneProjects] ([Id])
GO
ALTER TABLE [dbo].[CapstoneTraineeAllocations] CHECK CONSTRAINT [FK_CapstoneTraineeAllocations_CapstoneProjectId]
GO
ALTER TABLE [dbo].[CapstoneTraineeAllocations]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneTraineeAllocations_TraineeId] FOREIGN KEY([TraineeId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CapstoneTraineeAllocations] CHECK CONSTRAINT [FK_CapstoneTraineeAllocations_TraineeId]
GO
ALTER TABLE [dbo].[CapstoneWSR]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneWSR_CapstoneProjectId] FOREIGN KEY([CapstoneProjectId])
REFERENCES [dbo].[CapstoneProjects] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CapstoneWSR] CHECK CONSTRAINT [FK_CapstoneWSR_CapstoneProjectId]
GO
ALTER TABLE [dbo].[CapstoneWSR]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneWSR_ProjectStatusId] FOREIGN KEY([ProjectStatusId])
REFERENCES [dbo].[ProjectStatus] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CapstoneWSR] CHECK CONSTRAINT [FK_CapstoneWSR_ProjectStatusId]
GO
ALTER TABLE [dbo].[CapstoneWsrRisks]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneWsrRisks_AssignedId] FOREIGN KEY([AssignedId])
REFERENCES [dbo].[CapstoneMllsAllocations] ([Id])
GO
ALTER TABLE [dbo].[CapstoneWsrRisks] CHECK CONSTRAINT [FK_CapstoneWsrRisks_AssignedId]
GO
ALTER TABLE [dbo].[CapstoneWsrRisks]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneWsrRisks_CapstoneWsrId] FOREIGN KEY([CapstoneWsrId])
REFERENCES [dbo].[CapstoneWSR] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CapstoneWsrRisks] CHECK CONSTRAINT [FK_CapstoneWsrRisks_CapstoneWsrId]
GO
ALTER TABLE [dbo].[CapstoneWsrRisks]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneWsrRisks_WsrStatusId] FOREIGN KEY([WsrStatusId])
REFERENCES [dbo].[CapstoneWsrStatus] ([Id])
GO
ALTER TABLE [dbo].[CapstoneWsrRisks] CHECK CONSTRAINT [FK_CapstoneWsrRisks_WsrStatusId]
GO
ALTER TABLE [dbo].[CapstoneWsrStatus]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneWsrStatus_AssignedId] FOREIGN KEY([AssignedId])
REFERENCES [dbo].[CapstoneMllsAllocations] ([Id])
GO
ALTER TABLE [dbo].[CapstoneWsrStatus] CHECK CONSTRAINT [FK_CapstoneWsrStatus_AssignedId]
GO
ALTER TABLE [dbo].[CapstoneWsrStatus]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneWsrStatus_CapstoneWsrId] FOREIGN KEY([CapstoneWsrId])
REFERENCES [dbo].[CapstoneWSR] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CapstoneWsrStatus] CHECK CONSTRAINT [FK_CapstoneWsrStatus_CapstoneWsrId]
GO
ALTER TABLE [dbo].[CapstoneWsrStatus]  WITH CHECK ADD  CONSTRAINT [FK_CapstoneWsrStatus_WSRTypeId] FOREIGN KEY([WSRTypeId])
REFERENCES [dbo].[WSRTypes] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CapstoneWsrStatus] CHECK CONSTRAINT [FK_CapstoneWsrStatus_WSRTypeId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeId]
GO
ALTER TABLE [dbo].[EmployeeMentorAssessment]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeMentorAssessment_MentorAssessmentId] FOREIGN KEY([MentorAssessmentId])
REFERENCES [dbo].[MentorAssessment] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeMentorAssessment] CHECK CONSTRAINT [FK_EmployeeMentorAssessment_MentorAssessmentId]
GO
ALTER TABLE [dbo].[EmployeeMentorAssessment]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeMentorAssessment_TraineeId] FOREIGN KEY([TraineeId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
GO
ALTER TABLE [dbo].[EmployeeMentorAssessment] CHECK CONSTRAINT [FK_EmployeeMentorAssessment_TraineeId]
GO
ALTER TABLE [dbo].[EmpRoleMapping]  WITH CHECK ADD  CONSTRAINT [FK_Emprolemapping_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmpRoleMapping] CHECK CONSTRAINT [FK_Emprolemapping_EmployeeId]
GO
ALTER TABLE [dbo].[EmpRoleMapping]  WITH CHECK ADD  CONSTRAINT [FK_EmpRoleMapping_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[EmpRoleMapping] CHECK CONSTRAINT [FK_EmpRoleMapping_RoleId]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_BatchId]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_SpecializationId] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specialization] ([Id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_SpecializationId]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_TechStackId] FOREIGN KEY([TechStackId])
REFERENCES [dbo].[TechStack] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_TechStackId]
GO
ALTER TABLE [dbo].[ExamReceipents]  WITH CHECK ADD  CONSTRAINT [FK_ExamReceipents_ExamId] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exam] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExamReceipents] CHECK CONSTRAINT [FK_ExamReceipents_ExamId]
GO
ALTER TABLE [dbo].[ExamReceipents]  WITH CHECK ADD  CONSTRAINT [FK_ExamReceipents_ReceipentId] FOREIGN KEY([ReceipentId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExamReceipents] CHECK CONSTRAINT [FK_ExamReceipents_ReceipentId]
GO
ALTER TABLE [dbo].[MentorAssessment]  WITH CHECK ADD  CONSTRAINT [FK_MentorAssessment_MentorId] FOREIGN KEY([MentorId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MentorAssessment] CHECK CONSTRAINT [FK_MentorAssessment_MentorId]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_NotificationTypesId] FOREIGN KEY([NotificationTypesId])
REFERENCES [dbo].[NotificationTypes] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_NotificationTypesId]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_RatingTypeId] FOREIGN KEY([RatingTypeId])
REFERENCES [dbo].[RatingType] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_RatingTypeId]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_TraineeId] FOREIGN KEY([TraineeId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_TraineeId]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_UserId]
GO
ALTER TABLE [dbo].[Specialization]  WITH CHECK ADD  CONSTRAINT [FK_Specialization_TechStackId] FOREIGN KEY([TechStackId])
REFERENCES [dbo].[TechStack] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Specialization] CHECK CONSTRAINT [FK_Specialization_TechStackId]
GO
ALTER TABLE [dbo].[TraineeAllocation]  WITH CHECK ADD  CONSTRAINT [FK_TraineeAllocation_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TraineeAllocation] CHECK CONSTRAINT [FK_TraineeAllocation_BatchId]
GO
ALTER TABLE [dbo].[TraineeAllocation]  WITH CHECK ADD  CONSTRAINT [FK_TraineeAllocation_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TraineeAllocation] CHECK CONSTRAINT [FK_TraineeAllocation_EmployeeId]
GO
ALTER TABLE [dbo].[TraineeAllocation]  WITH CHECK ADD  CONSTRAINT [FK_TraineeAllocation_MentorId] FOREIGN KEY([MentorId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
GO
ALTER TABLE [dbo].[TraineeAllocation] CHECK CONSTRAINT [FK_TraineeAllocation_MentorId]
GO
ALTER TABLE [dbo].[TraineeSpecialization]  WITH CHECK ADD  CONSTRAINT [FK_TraineeSpecialization_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TraineeSpecialization] CHECK CONSTRAINT [FK_TraineeSpecialization_EmployeeId]
GO
ALTER TABLE [dbo].[TraineeSpecialization]  WITH CHECK ADD  CONSTRAINT [FK_TraineeSpecialization_SpecializationId] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specialization] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TraineeSpecialization] CHECK CONSTRAINT [FK_TraineeSpecialization_SpecializationId]
GO
ALTER TABLE [dbo].[TraineeTechStack]  WITH CHECK ADD  CONSTRAINT [FK_TraineeTechStack_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TraineeTechStack] CHECK CONSTRAINT [FK_TraineeTechStack_EmployeeId]
GO
ALTER TABLE [dbo].[TraineeTechStack]  WITH CHECK ADD  CONSTRAINT [FK_TraineeTechStack_TechStackId] FOREIGN KEY([TechStackId])
REFERENCES [dbo].[TechStack] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TraineeTechStack] CHECK CONSTRAINT [FK_TraineeTechStack_TechStackId]
GO
ALTER TABLE [dbo].[WorkShop]  WITH CHECK ADD  CONSTRAINT [FK_WorkShop_TraineeId] FOREIGN KEY([TraineeId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkShop] CHECK CONSTRAINT [FK_WorkShop_TraineeId]
GO
ALTER TABLE [dbo].[WorkShop]  WITH CHECK ADD  CONSTRAINT [FK_WorkShop_WorkShopMentorId] FOREIGN KEY([WorkShopMentorId])
REFERENCES [dbo].[InnovaEmployeeReplica] ([EmployeeNumber])
GO
ALTER TABLE [dbo].[WorkShop] CHECK CONSTRAINT [FK_WorkShop_WorkShopMentorId]
GO
ALTER TABLE [dbo].[WorkShopAttachments]  WITH CHECK ADD  CONSTRAINT [FK_WorkShopAttachments_WorkShopId] FOREIGN KEY([WorkShopId])
REFERENCES [dbo].[WorkShop] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkShopAttachments] CHECK CONSTRAINT [FK_WorkShopAttachments_WorkShopId]
GO

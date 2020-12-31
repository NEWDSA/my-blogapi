USE [master]
GO
/****** Object:  Database [Luciano_DB]    Script Date: 2020/12/31 星期四 下午 6:09:28 ******/
CREATE DATABASE [Luciano_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lucnao_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Lucnao_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lucnao_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Lucnao_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Luciano_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Luciano_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Luciano_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Luciano_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Luciano_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Luciano_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Luciano_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Luciano_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Luciano_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Luciano_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Luciano_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Luciano_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Luciano_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Luciano_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Luciano_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Luciano_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Luciano_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Luciano_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Luciano_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Luciano_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Luciano_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Luciano_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Luciano_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Luciano_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Luciano_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [Luciano_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Luciano_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Luciano_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Luciano_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Luciano_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Luciano_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Luciano_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Luciano_DB', N'ON'
GO
ALTER DATABASE [Luciano_DB] SET QUERY_STORE = OFF
GO
USE [Luciano_DB]
GO
/****** Object:  Table [dbo].[albums]    Script Date: 2020/12/31 星期四 下午 6:09:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[albums](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[thumbnail] [nvarchar](max) NOT NULL,
	[insertTime] [datetime] NOT NULL,
	[updateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_albums] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Luciano_Login]    Script Date: 2020/12/31 星期四 下午 6:09:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luciano_Login](
	[id] [int] NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Luciano_Note]    Script Date: 2020/12/31 星期四 下午 6:09:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luciano_Note](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[content] [nvarchar](max) NULL,
	[insertTime] [datetime] NOT NULL,
	[updateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Luciano_Note] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Luciano_Photo]    Script Date: 2020/12/31 星期四 下午 6:09:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luciano_Photo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[albumsid] [int] NOT NULL,
	[describtion] [nvarchar](max) NULL,
	[title] [nvarchar](50) NULL,
	[url] [nvarchar](max) NULL,
	[insertTime] [datetime] NULL,
	[updateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Luciano_Plan]    Script Date: 2020/12/31 星期四 下午 6:09:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luciano_Plan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[myContent] [varchar](max) NULL,
	[insertTime] [datetime] NULL,
	[updateTime] [datetime] NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[albums] ON 

INSERT [dbo].[albums] ([id], [title], [thumbnail], [insertTime], [updateTime]) VALUES (1, N'我的第一个相册', N'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3565578506,42843461&fm=26&gp=0.jpg', CAST(N'2020-06-04T11:27:04.900' AS DateTime), CAST(N'2020-06-04T11:27:04.900' AS DateTime))
INSERT [dbo].[albums] ([id], [title], [thumbnail], [insertTime], [updateTime]) VALUES (2, N'我的第二个相册', N'http://img2.imgtn.bdimg.com/it/u=1452949182,3739426632&fm=26&gp=0.jpg', CAST(N'2020-06-05T16:44:48.430' AS DateTime), CAST(N'2020-06-05T16:44:48.430' AS DateTime))
SET IDENTITY_INSERT [dbo].[albums] OFF
GO
INSERT [dbo].[Luciano_Login] ([id], [username], [password]) VALUES (1, N'Luciano', N'123')
GO
SET IDENTITY_INSERT [dbo].[Luciano_Note] ON 

INSERT [dbo].[Luciano_Note] ([id], [title], [content], [insertTime], [updateTime]) VALUES (18, N'陈皮皮', N'<p><img src="data:image/jpeg;base64,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"></p><p class="ql-align-center">可爱小猫陈皮皮</p>', CAST(N'2020-06-11T18:27:16.713' AS DateTime), CAST(N'2020-06-11T18:27:16.713' AS DateTime))
SET IDENTITY_INSERT [dbo].[Luciano_Note] OFF
GO
SET IDENTITY_INSERT [dbo].[Luciano_Photo] ON 

INSERT [dbo].[Luciano_Photo] ([id], [albumsid], [describtion], [title], [url], [insertTime], [updateTime]) VALUES (3, 1, N'没有描述', N'《夏日玫瑰》', N'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3565578506,42843461&fm=26&gp=0.jpg', CAST(N'2020-06-04T12:18:06.963' AS DateTime), CAST(N'2020-06-04T12:18:06.963' AS DateTime))
INSERT [dbo].[Luciano_Photo] ([id], [albumsid], [describtion], [title], [url], [insertTime], [updateTime]) VALUES (10, 1, N'没有描述', N'《夏日恋情》', N'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1275609037,3709846252&fm=26&gp=0.jpg', CAST(N'2020-06-04T14:56:31.553' AS DateTime), CAST(N'2020-06-04T14:56:31.553' AS DateTime))
INSERT [dbo].[Luciano_Photo] ([id], [albumsid], [describtion], [title], [url], [insertTime], [updateTime]) VALUES (11, 1, N'没有描述', N'《夏日最爱》', N'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1301743700,3288488513&fm=26&gp=0.jpg', CAST(N'2020-06-04T15:05:11.170' AS DateTime), CAST(N'2020-06-04T15:05:11.170' AS DateTime))
INSERT [dbo].[Luciano_Photo] ([id], [albumsid], [describtion], [title], [url], [insertTime], [updateTime]) VALUES (12, 1, N'没有描述', N'《盛夏果实》', N'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1118125041,1942024976&fm=26&gp=0.jpg', CAST(N'2020-06-04T15:05:51.297' AS DateTime), CAST(N'2020-06-04T15:05:51.297' AS DateTime))
INSERT [dbo].[Luciano_Photo] ([id], [albumsid], [describtion], [title], [url], [insertTime], [updateTime]) VALUES (13, 1, N'没有描述', N'《我的最爱》', N'http://img2.imgtn.bdimg.com/it/u=3760661526,1934632188&fm=26&gp=0.jpg', CAST(N'2020-06-04T15:06:38.130' AS DateTime), CAST(N'2020-06-04T15:06:38.130' AS DateTime))
INSERT [dbo].[Luciano_Photo] ([id], [albumsid], [describtion], [title], [url], [insertTime], [updateTime]) VALUES (14, 2, N'没有描述', N'《哈哈》', N'http://img3.imgtn.bdimg.com/it/u=1228791453,4054831996&fm=26&gp=0.jpg', CAST(N'2020-06-05T16:45:29.030' AS DateTime), CAST(N'2020-06-05T16:45:29.030' AS DateTime))
SET IDENTITY_INSERT [dbo].[Luciano_Photo] OFF
GO
SET IDENTITY_INSERT [dbo].[Luciano_Plan] ON 

INSERT [dbo].[Luciano_Plan] ([id], [Date], [myContent], [insertTime], [updateTime]) VALUES (52, CAST(N'2020-12-22' AS Date), N'学习Vue', CAST(N'2020-12-22T09:48:06.637' AS DateTime), CAST(N'2020-12-29T09:23:06.670' AS DateTime))
INSERT [dbo].[Luciano_Plan] ([id], [Date], [myContent], [insertTime], [updateTime]) VALUES (58, CAST(N'2020-12-10' AS Date), N'111111', CAST(N'2020-12-22T10:29:14.067' AS DateTime), CAST(N'2020-12-22T10:29:14.067' AS DateTime))
INSERT [dbo].[Luciano_Plan] ([id], [Date], [myContent], [insertTime], [updateTime]) VALUES (59, CAST(N'2020-12-25' AS Date), N'圣诞节', CAST(N'2020-12-22T10:29:26.263' AS DateTime), CAST(N'2020-12-29T09:21:27.790' AS DateTime))
INSERT [dbo].[Luciano_Plan] ([id], [Date], [myContent], [insertTime], [updateTime]) VALUES (61, CAST(N'2020-12-09' AS Date), N'4', CAST(N'2020-12-22T10:30:36.517' AS DateTime), CAST(N'2020-12-22T10:30:36.517' AS DateTime))
INSERT [dbo].[Luciano_Plan] ([id], [Date], [myContent], [insertTime], [updateTime]) VALUES (62, CAST(N'2020-12-23' AS Date), N'消费金额：200元4', CAST(N'2020-12-22T10:32:07.120' AS DateTime), CAST(N'2020-12-29T09:22:14.490' AS DateTime))
INSERT [dbo].[Luciano_Plan] ([id], [Date], [myContent], [insertTime], [updateTime]) VALUES (64, CAST(N'2020-12-12' AS Date), N'11111', CAST(N'2020-12-23T10:11:37.277' AS DateTime), CAST(N'2020-12-23T10:11:37.277' AS DateTime))
INSERT [dbo].[Luciano_Plan] ([id], [Date], [myContent], [insertTime], [updateTime]) VALUES (65, CAST(N'2020-12-13' AS Date), N'111', CAST(N'2020-12-25T15:34:47.780' AS DateTime), CAST(N'2020-12-25T15:34:47.780' AS DateTime))
INSERT [dbo].[Luciano_Plan] ([id], [Date], [myContent], [insertTime], [updateTime]) VALUES (66, CAST(N'2020-12-26' AS Date), N'333', CAST(N'2020-12-25T15:35:00.043' AS DateTime), CAST(N'2020-12-29T09:31:36.500' AS DateTime))
INSERT [dbo].[Luciano_Plan] ([id], [Date], [myContent], [insertTime], [updateTime]) VALUES (67, CAST(N'2020-12-19' AS Date), N'444', CAST(N'2020-12-25T15:35:05.720' AS DateTime), CAST(N'2020-12-25T15:35:05.720' AS DateTime))
INSERT [dbo].[Luciano_Plan] ([id], [Date], [myContent], [insertTime], [updateTime]) VALUES (68, CAST(N'2021-01-09' AS Date), N'111', CAST(N'2020-12-27T15:57:45.213' AS DateTime), CAST(N'2020-12-27T15:57:45.213' AS DateTime))
INSERT [dbo].[Luciano_Plan] ([id], [Date], [myContent], [insertTime], [updateTime]) VALUES (69, CAST(N'2020-12-05' AS Date), N'111', CAST(N'2020-12-28T13:32:46.047' AS DateTime), CAST(N'2020-12-28T13:32:46.047' AS DateTime))
INSERT [dbo].[Luciano_Plan] ([id], [Date], [myContent], [insertTime], [updateTime]) VALUES (70, CAST(N'2020-12-24' AS Date), N'平安夜', CAST(N'2020-12-28T13:58:40.860' AS DateTime), CAST(N'2020-12-28T13:58:58.513' AS DateTime))
SET IDENTITY_INSERT [dbo].[Luciano_Plan] OFF
GO
ALTER TABLE [dbo].[albums] ADD  CONSTRAINT [DF_albums_insertTime]  DEFAULT (getdate()) FOR [insertTime]
GO
ALTER TABLE [dbo].[albums] ADD  CONSTRAINT [DF_albums_updateTime]  DEFAULT (getdate()) FOR [updateTime]
GO
ALTER TABLE [dbo].[Luciano_Note] ADD  CONSTRAINT [DF_Luciano_Note_insertTime]  DEFAULT (getdate()) FOR [insertTime]
GO
ALTER TABLE [dbo].[Luciano_Note] ADD  CONSTRAINT [DF_Luciano_Note_updateTime]  DEFAULT (getdate()) FOR [updateTime]
GO
ALTER TABLE [dbo].[Luciano_Photo] ADD  CONSTRAINT [DF_Luciano_Photo_insertTime]  DEFAULT (getdate()) FOR [insertTime]
GO
ALTER TABLE [dbo].[Luciano_Photo] ADD  CONSTRAINT [DF_Luciano_Photo_updateTime]  DEFAULT (getdate()) FOR [updateTime]
GO
ALTER TABLE [dbo].[Luciano_Plan] ADD  CONSTRAINT [DF_Luciano_Plan_insertTime]  DEFAULT (getdate()) FOR [insertTime]
GO
ALTER TABLE [dbo].[Luciano_Plan] ADD  CONSTRAINT [DF_Luciano_Plan_updateTime]  DEFAULT (getdate()) FOR [updateTime]
GO
ALTER TABLE [dbo].[Luciano_Photo]  WITH CHECK ADD  CONSTRAINT [FK_Luciano_Photo_albums] FOREIGN KEY([albumsid])
REFERENCES [dbo].[albums] ([id])
GO
ALTER TABLE [dbo].[Luciano_Photo] CHECK CONSTRAINT [FK_Luciano_Photo_albums]
GO
/****** Object:  StoredProcedure [dbo].[AddPlan]    Script Date: 2020/12/31 星期四 下午 6:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Luciano,Peng>
-- Create date: <2020-12-17>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddPlan]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	@mydate date,
	@content nvarchar(max)=''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
	insert into Luciano_Plan (Date,myContent)values(@mydate,@content);
END
GO
/****** Object:  StoredProcedure [dbo].[Luciano_insert_Note]    Script Date: 2020/12/31 星期四 下午 6:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Luciano>
-- Create date: <2020/6/11>
-- Description:	<插入数据到sqlserver>
-- =============================================
CREATE PROCEDURE [dbo].[Luciano_insert_Note] 
	@title nvarchar(50)='',
	@content nvarchar(max)=''
AS
BEGIN
	insert into Luciano_Note (title,content)values(@title,@content)
END

GO
/****** Object:  StoredProcedure [dbo].[Luciano_TS]    Script Date: 2020/12/31 星期四 下午 6:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[Luciano_TS]
    --@param1 /*parameter name*/ int /*datatype_for_param1*/ = 0, /*default_value_for_param1*/
    --@param2 /*parameter name*/ int /*datatype_for_param1*/ = 0 /*default_value_for_param2*/
    @content nvarchar(100)
-- add more stored procedure parameters here
AS
    -- body of the stored procedure
    --SELECT @param1, @param2
    -- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
      DECLARE @result NVARCHAR(100)
   SELECT @result=title
FROM Luciano_Note
WHERE title LIKE '%'+@content+'%' 
PRINT @result
--    IF(@result!='')
--    BEGIN
--     SELECT *
--     FROM Luciano_Note;
-- END

GO
/****** Object:  StoredProcedure [dbo].[LucianoPlan_Update]    Script Date: 2020/12/31 星期四 下午 6:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Luciano,Peng>
-- Create date: <2020-12-28>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LucianoPlan_Update]
	-- Add the parameters for the stored procedure here
	@myConten nvarchar(100),
	@myDate nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Luciano_Plan set myContent=@myConten,updateTime=(GETDATE()) where Date=@myDate;
END
GO
/****** Object:  StoredProcedure [dbo].[seePlan]    Script Date: 2020/12/31 星期四 下午 6:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Luciano,Peng>
-- Create date: <2020-12-25>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[seePlan]
@mydate nvarchar(100)=''
AS
BEGIN
	SET NOCOUNT ON;
	 if (@mydate != '') 
	 begin
	     select * from Luciano_Plan where Date=@mydate
	  end
	if(@mydate='')
	begin
		select * from Luciano_Plan
	end
END
GO
USE [master]
GO
ALTER DATABASE [Luciano_DB] SET  READ_WRITE 
GO

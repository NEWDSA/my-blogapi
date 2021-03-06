USE [master]
GO
/****** Object:  Database [luciano_DB]    Script Date: 2020/5/27 下午 05:51:09 ******/
CREATE DATABASE [luciano_DB] ON  PRIMARY 
( NAME = N'luciano_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\luciano_DB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'luciano_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\luciano_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [luciano_DB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [luciano_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [luciano_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [luciano_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [luciano_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [luciano_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [luciano_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [luciano_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [luciano_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [luciano_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [luciano_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [luciano_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [luciano_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [luciano_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [luciano_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [luciano_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [luciano_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [luciano_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [luciano_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [luciano_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [luciano_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [luciano_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [luciano_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [luciano_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [luciano_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [luciano_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [luciano_DB] SET  MULTI_USER 
GO
ALTER DATABASE [luciano_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [luciano_DB] SET DB_CHAINING OFF 
GO
USE [luciano_DB]
GO
/****** Object:  Table [dbo].[Luciano_Note]    Script Date: 2020/5/27 下午 05:51:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Luciano_Photo]    Script Date: 2020/5/27 下午 05:51:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luciano_Photo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](max) NULL,
	[insertTime] [datetime] NULL,
	[updateTime] [datetime] NULL,
 CONSTRAINT [PK_Luciano_Photo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Luciano_Note] ON 

INSERT [dbo].[Luciano_Note] ([id], [title], [content], [insertTime], [updateTime]) VALUES (1, N'2020年5月27日', N'我坚信努力不一定成功，但不努力注定失败！人生有太多无奈，和不幸发生 do you want to love you love ', CAST(0x0000ABC801117A4F AS DateTime), CAST(0x0000ABC801117A4F AS DateTime))
INSERT [dbo].[Luciano_Note] ([id], [title], [content], [insertTime], [updateTime]) VALUES (2, N'2020年5月26日', N'今天我终于完成了我的想法，just do it!', CAST(0x0000ABC80111F0D8 AS DateTime), CAST(0x0000ABC80111F0D8 AS DateTime))
INSERT [dbo].[Luciano_Note] ([id], [title], [content], [insertTime], [updateTime]) VALUES (3, N'2020年5月25日', N'今天风和日丽我终于找到了我的mari 遇到她的日子阳光明媚空气也是草莓味的', CAST(0x0000ABC801184DAC AS DateTime), CAST(0x0000ABC801184DAC AS DateTime))
INSERT [dbo].[Luciano_Note] ([id], [title], [content], [insertTime], [updateTime]) VALUES (4, N'2020年5月24日', N'今天再次遇到了mari 好开心。', CAST(0x0000ABC8011891E7 AS DateTime), CAST(0x0000ABC8011891E7 AS DateTime))
INSERT [dbo].[Luciano_Note] ([id], [title], [content], [insertTime], [updateTime]) VALUES (5, N'2020年5月22日', N'今天在学校门口遇到了mari oh my god 她真的超美!', CAST(0x0000ABC8011BC88F AS DateTime), CAST(0x0000ABC8011BC88F AS DateTime))
INSERT [dbo].[Luciano_Note] ([id], [title], [content], [insertTime], [updateTime]) VALUES (6, N'2020年5月21日', N'今天在学校门口和mari 偶遇，心里暖暖的', CAST(0x0000ABC8011C16C9 AS DateTime), CAST(0x0000ABC8011C16C9 AS DateTime))
INSERT [dbo].[Luciano_Note] ([id], [title], [content], [insertTime], [updateTime]) VALUES (7, N'2020年5月20日', N'今天中午在学校食堂遇到了mari她还是那么清瘦', CAST(0x0000ABC8011D15C1 AS DateTime), CAST(0x0000ABC8011D15C1 AS DateTime))
INSERT [dbo].[Luciano_Note] ([id], [title], [content], [insertTime], [updateTime]) VALUES (8, N'2020年5月19日', N'今天..............................................................................', CAST(0x0000ABC8011D47B2 AS DateTime), CAST(0x0000ABC8011D47B2 AS DateTime))
INSERT [dbo].[Luciano_Note] ([id], [title], [content], [insertTime], [updateTime]) VALUES (9, N'2020年5月18日', N'今天风和日丽天气晴朗，心情很是美丽确定你就是我心爱的.', CAST(0x0000ABC8011D9A9B AS DateTime), CAST(0x0000ABC8011D9A9B AS DateTime))
INSERT [dbo].[Luciano_Note] ([id], [title], [content], [insertTime], [updateTime]) VALUES (10, N'2020年5月17日', N'今天听了一首《有点甜》，心里美美的', CAST(0x0000ABC8011DE0EB AS DateTime), CAST(0x0000ABC8011DE0EB AS DateTime))
SET IDENTITY_INSERT [dbo].[Luciano_Note] OFF
ALTER TABLE [dbo].[Luciano_Note] ADD  CONSTRAINT [DF_Luciano_Note_insertTime]  DEFAULT (getdate()) FOR [insertTime]
GO
ALTER TABLE [dbo].[Luciano_Note] ADD  CONSTRAINT [DF_Luciano_Note_updateTime]  DEFAULT (getdate()) FOR [updateTime]
GO
ALTER TABLE [dbo].[Luciano_Photo] ADD  CONSTRAINT [DF_Luciano_Photo_insertTime]  DEFAULT (getdate()) FOR [insertTime]
GO
ALTER TABLE [dbo].[Luciano_Photo] ADD  CONSTRAINT [DF_Luciano_Photo_updateTime]  DEFAULT (getdate()) FOR [updateTime]
GO
USE [master]
GO
ALTER DATABASE [luciano_DB] SET  READ_WRITE 
GO

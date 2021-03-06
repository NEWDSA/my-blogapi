USE [Luciano_DB]
GO
/****** Object:  StoredProcedure [dbo].[Luciano_TS]    Script Date: 2020/5/28 下午 06:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
--execute Luciano_TS '2020'
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
   SELECT *
FROM [Luciano_DB].[dbo].[Luciano_Note]
WHERE title LIKE '%'+@content+'%' 
PRINT @result
   IF(@result!='')
   BEGIN
    SELECT *
    FROM Luciano_Photo;
END

GO
/****** Object:  Table [dbo].[Luciano_Note]    Script Date: 2020/5/28 下午 06:59:35 ******/
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
/****** Object:  Table [dbo].[Luciano_Photo]    Script Date: 2020/5/28 下午 06:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luciano_Photo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[describtion] [nvarchar](max) NULL,
	[title] [nvarchar](50) NULL,
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
SET IDENTITY_INSERT [dbo].[Luciano_Photo] ON 

INSERT [dbo].[Luciano_Photo] ([id], [describtion], [title], [url], [insertTime], [updateTime]) VALUES (1, N'My First time meet people in my life is you', N'美丽日光', N'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3565578506,42843461&fm=26&gp=0.jpg', CAST(0x0000ABC90129E51F AS DateTime), CAST(0x0000ABC90129E51F AS DateTime))
INSERT [dbo].[Luciano_Photo] ([id], [describtion], [title], [url], [insertTime], [updateTime]) VALUES (2, N'Thank you a lot !', N'美丽人生', N'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2628618529,3280183445&fm=26&gp=0.jpghttps://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2628618529,3280183445&fm=26&gp=0.jpg', CAST(0x0000ABC90129E758 AS DateTime), CAST(0x0000ABC90129E758 AS DateTime))
INSERT [dbo].[Luciano_Photo] ([id], [describtion], [title], [url], [insertTime], [updateTime]) VALUES (3, N'THANK YOU SPPED WITH ME EVERY DAY EVERY TIME TO DEAL WITH SOME PROBLEMS IS WILL BE FINE TO ME TO EVERY TIME EVEY YEAR', N'美丽茉莉花', N'https://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20180528/3279979c32484cd7a3cea9f18e941817.jpeg', CAST(0x0000ABC90135BFB5 AS DateTime), CAST(0x0000ABC90135BFB5 AS DateTime))
INSERT [dbo].[Luciano_Photo] ([id], [describtion], [title], [url], [insertTime], [updateTime]) VALUES (4, N'I LIKE GOLDERN YEAR TO ME TO EVERY BODY TO EVERY THINGS TO DO I CAN DO IT PERFERCT ', N'金色年华', N'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590672857683&di=bf84f73470bf3ba4caaff843b2ed9962&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20161015%2Fb5689f7cb69446ddbd555e8ffc063764_th.jpeg', CAST(0x0000ABC901362A29 AS DateTime), CAST(0x0000ABC901362A29 AS DateTime))
INSERT [dbo].[Luciano_Photo] ([id], [describtion], [title], [url], [insertTime], [updateTime]) VALUES (5, N'I LIKE THIS FLOWERS THAN LIKE YOU EVERY TIME EVERY BODY EVERY TIME TO YOU ', N'夏日玫瑰', N'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590673103199&di=c21fc1151f4fe7fe7e16a774baedd74c&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201702%2F10%2F20170210155651_FWGXT.thumb.700_0.jpeg', CAST(0x0000ABC90136C935 AS DateTime), CAST(0x0000ABC90136C935 AS DateTime))
INSERT [dbo].[Luciano_Photo] ([id], [describtion], [title], [url], [insertTime], [updateTime]) VALUES (6, N'pianting by hand flowers for evry young people to live with every body evey why to live in the earth', N'手绘花朵', N'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590673103198&di=9c13f4b2a64cfa88efd759cce95ce14f&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201411%2F25%2F20141125151026_fK8tV.jpeg', CAST(0x0000ABC901373A8B AS DateTime), CAST(0x0000ABC901373A8B AS DateTime))
SET IDENTITY_INSERT [dbo].[Luciano_Photo] OFF
ALTER TABLE [dbo].[Luciano_Note] ADD  CONSTRAINT [DF_Luciano_Note_insertTime]  DEFAULT (getdate()) FOR [insertTime]
GO
ALTER TABLE [dbo].[Luciano_Note] ADD  CONSTRAINT [DF_Luciano_Note_updateTime]  DEFAULT (getdate()) FOR [updateTime]
GO
ALTER TABLE [dbo].[Luciano_Photo] ADD  CONSTRAINT [DF_Luciano_Photo_insertTime]  DEFAULT (getdate()) FOR [insertTime]
GO
ALTER TABLE [dbo].[Luciano_Photo] ADD  CONSTRAINT [DF_Luciano_Photo_updateTime]  DEFAULT (getdate()) FOR [updateTime]
GO

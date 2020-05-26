USE [myapi]
GO
/****** Object:  Table [dbo].[photoinfo]    Script Date: 2020/5/26 9:24:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[photoinfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photoid] [int] NULL,
	[photoname] [nvarchar](50) NULL,
	[author] [nvarchar](50) NULL,
	[photourl] [nvarchar](max) NULL,
	[inserttime] [datetime] NULL,
	[updatetime] [datetime] NULL,
 CONSTRAINT [PK_photoinfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[photoinfo] ON 

INSERT [dbo].[photoinfo] ([id], [photoid], [photoname], [author], [photourl], [inserttime], [updatetime]) VALUES (1005, NULL, N'开心', N'Luciano', N'IMG_20180818_130541.jpg', CAST(0x0000ABC101303890 AS DateTime), CAST(0x0000ABC101303890 AS DateTime))
INSERT [dbo].[photoinfo] ([id], [photoid], [photoname], [author], [photourl], [inserttime], [updatetime]) VALUES (1006, NULL, N'开心', N'Luciano', N'IMG_20180818_130545.jpg', CAST(0x0000ABC1013056DE AS DateTime), CAST(0x0000ABC1013056DE AS DateTime))
INSERT [dbo].[photoinfo] ([id], [photoid], [photoname], [author], [photourl], [inserttime], [updatetime]) VALUES (1007, NULL, N'开心', N'Luciano', N'IMG_20180819_214923.jpg', CAST(0x0000ABC10137AE74 AS DateTime), CAST(0x0000ABC10137AE74 AS DateTime))
INSERT [dbo].[photoinfo] ([id], [photoid], [photoname], [author], [photourl], [inserttime], [updatetime]) VALUES (2003, NULL, N'开心', N'Luciano', N'IMG_20180808_121245.jpg', CAST(0x0000ABC40108A79A AS DateTime), CAST(0x0000ABC40108A79A AS DateTime))
SET IDENTITY_INSERT [dbo].[photoinfo] OFF
ALTER TABLE [dbo].[photoinfo] ADD  CONSTRAINT [DF_photoinfo_inserttime]  DEFAULT (getdate()) FOR [inserttime]
GO
ALTER TABLE [dbo].[photoinfo] ADD  CONSTRAINT [DF_photoinfo_updatetime]  DEFAULT (getdate()) FOR [updatetime]
GO

USE [GameDB]
GO

/****** Object:  Table [dbo].[TBL_CHAR_LEVEL_INFO]    Script Date: 2024-06-09 ���� 7:20:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TBL_CHAR_LEVEL_INFO](
	[ID] [varchar](50) NOT NULL,
	[CURRENT_LEVEL] [int] NULL,
	[CURRENT_EXP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



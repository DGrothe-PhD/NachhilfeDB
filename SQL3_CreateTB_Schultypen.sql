USE [Nachhilfe]
GO

/****** Object:  Table [dbo].[tb_Schultypen]    Script Date: 08.03.2023 11:52:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Schultypen](
	[SchultypID] [smallint] IDENTITY(1,1) NOT NULL,
	[Bezeichnung] [nvarchar](20) NOT NULL,
	[Weiteres] [nvarchar](20) NULL,
 CONSTRAINT [PK_tb_Schultypen] PRIMARY KEY CLUSTERED 
(
	[SchultypID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


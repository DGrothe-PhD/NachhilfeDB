USE [Nachhilfe]
GO

/****** Object:  Table [dbo].[tb_Schultypen]    Script Date: 16.04.2024 18:07:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Schultypen](
	[SchultypID] [int] IDENTITY(1,1) NOT NULL,
	[Bezeichnung] [nvarchar](50) NOT NULL,
	[Weiteres] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_Schultypen] PRIMARY KEY CLUSTERED 
(
	[SchultypID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


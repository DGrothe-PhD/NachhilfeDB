USE [Nachhilfe]
GO

/****** Object:  Table [dbo].[tb_Faecher]    Script Date: 08.03.2023 11:47:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Faecher](
	[FachID] [int] IDENTITY(1,1) NOT NULL,
	[Bezeichnung] [nvarchar](20) NOT NULL,
	[Stufe] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_Faecher] PRIMARY KEY CLUSTERED 
(
	[FachID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


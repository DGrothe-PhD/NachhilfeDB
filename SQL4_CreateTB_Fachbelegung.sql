USE [Nachhilfe]
GO

/****** Object:  Table [dbo].[tb_Fachbelegung]    Script Date: 08.03.2023 11:55:08 ******/
/* m-zu-n Welches Fach man dem/der SchülerIn beibringt*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Fachbelegung](
	[FachBelegID] [int] IDENTITY(1,1) NOT NULL,
	[SchuelerID] [int] NOT NULL,
	[FachID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Fachbelegung] PRIMARY KEY CLUSTERED 
(
	[FachBelegID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


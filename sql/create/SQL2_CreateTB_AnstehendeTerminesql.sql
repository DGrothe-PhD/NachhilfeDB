USE [Nachhilfe]
GO

/****** Object:  Table [dbo].[tb_AnstehendeTermine]    Script Date: 14.05.2024 13:54:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_AnstehendeTermine](
	[TerminID] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [date] NOT NULL,
	[FachbelegungID] [int] NULL,
	[Einheiten] [float] NULL,
	[Bemerkungen] [nvarchar](100) NULL,
	[Uhrzeit] [time](0) NULL,
	[WhInTagen] [int] NULL,
 CONSTRAINT [PK_tb_AnstehendeTermine] PRIMARY KEY CLUSTERED 
(
	[TerminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


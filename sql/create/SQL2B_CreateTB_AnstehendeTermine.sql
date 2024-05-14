USE [Nachhilfe]
GO

/****** Object:  Table [dbo].[tb_AnstehendeTermine]    Script Date: 14.05.2024 15:37:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_AnstehendeTermine](
	[TerminID] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [date] NOT NULL,
	[SchuelerID] [int] NOT NULL,
	[Einheiten] [float] NOT NULL,
	[Bemerkungen] [nvarchar](100) NULL,
	[Uhrzeit] [time](0) NULL,
	[WhInTagen] [int] NULL,
	[UnterrichtsartID] [int] NULL,
 CONSTRAINT [PK_tb_AnstehendeTermine_1] PRIMARY KEY CLUSTERED 
(
	[TerminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_AnstehendeTermine]  WITH CHECK ADD  CONSTRAINT [FK_tb_AnstehendeTermine_tb_Schueler] FOREIGN KEY([SchuelerID])
REFERENCES [dbo].[tb_Schueler] ([SchuelerID])
GO

ALTER TABLE [dbo].[tb_AnstehendeTermine] CHECK CONSTRAINT [FK_tb_AnstehendeTermine_tb_Schueler]
GO

ALTER TABLE [dbo].[tb_AnstehendeTermine]  WITH CHECK ADD  CONSTRAINT [FK_tb_AnstehendeTermine_tb_Unterrichtsart] FOREIGN KEY([UnterrichtsartID])
REFERENCES [dbo].[tb_Unterrichtsart] ([ArtID])
GO

ALTER TABLE [dbo].[tb_AnstehendeTermine] CHECK CONSTRAINT [FK_tb_AnstehendeTermine_tb_Unterrichtsart]
GO


USE [Nachhilfe]
GO

/****** Object:  Table [dbo].[tb_Fachbelegung]    Script Date: 11.05.2023 20:51:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Fachbelegung](
	[FachBelegID] [int] IDENTITY(1,1) NOT NULL,
	[SchuelerID] [int] NOT NULL,
	[FachID] [int] NOT NULL,
	[Anfangsdatum] [date] NOT NULL,
	[Enddatum] [date] NULL,
	[UnterrichtsartID] [int] NULL,
 CONSTRAINT [PK_tb_Fachbelegung] PRIMARY KEY CLUSTERED 
(
	[FachBelegID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Fachbelegung]  WITH CHECK ADD  CONSTRAINT [FK_tb_Fachbelegung_tb_Faecher] FOREIGN KEY([FachID])
REFERENCES [dbo].[tb_Faecher] ([FachID])
GO

ALTER TABLE [dbo].[tb_Fachbelegung] CHECK CONSTRAINT [FK_tb_Fachbelegung_tb_Faecher]
GO

ALTER TABLE [dbo].[tb_Fachbelegung]  WITH CHECK ADD  CONSTRAINT [FK_tb_Fachbelegung_tb_Schueler] FOREIGN KEY([SchuelerID])
REFERENCES [dbo].[tb_Schueler] ([SchuelerID])
GO

ALTER TABLE [dbo].[tb_Fachbelegung] CHECK CONSTRAINT [FK_tb_Fachbelegung_tb_Schueler]
GO

ALTER TABLE [dbo].[tb_Fachbelegung]  WITH CHECK ADD  CONSTRAINT [FK_tb_Fachbelegung_tb_Unterrichtsart] FOREIGN KEY([UnterrichtsartID])
REFERENCES [dbo].[tb_Unterrichtsart] ([ArtID])
GO

ALTER TABLE [dbo].[tb_Fachbelegung] CHECK CONSTRAINT [FK_tb_Fachbelegung_tb_Unterrichtsart]
GO

ALTER TABLE [dbo].[tb_Fachbelegung]  WITH CHECK ADD  CONSTRAINT [CK_tb_Fachbelegung_Nur1Aktiv] CHECK  (([dbo].[sf_ZaehleAktiveAuftraege]([SchuelerID],[FachID])<=(1)))
GO

ALTER TABLE [dbo].[tb_Fachbelegung] CHECK CONSTRAINT [CK_tb_Fachbelegung_Nur1Aktiv]
GO

ALTER TABLE [dbo].[tb_Fachbelegung]  WITH CHECK ADD  CONSTRAINT [CK_tb_Fachbelegung_Zeitfolge] CHECK  ((coalesce([Enddatum],[Anfangsdatum])>=[Anfangsdatum]))
GO

ALTER TABLE [dbo].[tb_Fachbelegung] CHECK CONSTRAINT [CK_tb_Fachbelegung_Zeitfolge]
GO


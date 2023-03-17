USE [Nachhilfe]
GO

/****** Object:  Table [dbo].[tb_Fachbelegung]    Script Date: 17.03.2023 20:01:55 ******/
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
 CONSTRAINT [PK_tb_Fachbelegung] PRIMARY KEY CLUSTERED 
(
	[FachBelegID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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


USE [Nachhilfe]
GO

/****** Object:  Table [dbo].[tb_Kontingent]    Script Date: 10.05.2024 16:28:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Kontingent](
	[KontingentID] [int] IDENTITY(1,1) NOT NULL,
	[SchuelerID] [int] NOT NULL,
	[Jahr] [smallint] NOT NULL,
	[Monat] [smallint] NOT NULL,
	[AnzahlEinheiten] [smallint] NOT NULL,
 CONSTRAINT [PK_tb_Kontingent] PRIMARY KEY CLUSTERED 
(
	[KontingentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Kontingent]  WITH CHECK ADD  CONSTRAINT [FK_tb_Kontingent_tb_Schueler] FOREIGN KEY([SchuelerID])
REFERENCES [dbo].[tb_Schueler] ([SchuelerID])
GO

ALTER TABLE [dbo].[tb_Kontingent] CHECK CONSTRAINT [FK_tb_Kontingent_tb_Schueler]
GO


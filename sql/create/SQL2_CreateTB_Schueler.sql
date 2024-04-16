USE [Nachhilfe]
GO

/****** Object:  Table [dbo].[tb_Schueler]    Script Date: 16.04.2024 18:07:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Schueler](
	[SchuelerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Vorname] [nvarchar](20) NOT NULL,
	[Vater] [nvarchar](20) NULL,
	[Mutter] [nvarchar](20) NULL,
	[Strasse] [nvarchar](30) NULL,
	[Hausnr] [varchar](10) NULL,
	[PLZ] [nchar](5) NULL,
	[Ort] [nvarchar](20) NULL,
	[Klassenstufe] [varchar](5) NULL,
	[Telefon] [varchar](20) NULL,
	[MobilVater] [varchar](20) NULL,
	[MobilMutter] [varchar](20) NULL,
	[MobilSchueler] [varchar](20) NULL,
	[EMail1] [varchar](30) NULL,
	[EMail2] [varchar](30) NULL,
	[Geburtsdatum] [date] NULL,
	[SchultypID] [int] NULL,
 CONSTRAINT [PK_tb_Schueler] PRIMARY KEY CLUSTERED 
(
	[SchuelerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Schueler]  WITH CHECK ADD  CONSTRAINT [FK_tb_Schueler_tb_Schultypen] FOREIGN KEY([SchultypID])
REFERENCES [dbo].[tb_Schultypen] ([SchultypID])
GO

ALTER TABLE [dbo].[tb_Schueler] CHECK CONSTRAINT [FK_tb_Schueler_tb_Schultypen]
GO

ALTER TABLE [dbo].[tb_Schueler]  WITH CHECK ADD  CONSTRAINT [CK_tb_Schueler_HasTelephone] CHECK  (([dbo].[sf_CountTelephoneNumbers]([SchuelerID])>(0)))
GO

ALTER TABLE [dbo].[tb_Schueler] CHECK CONSTRAINT [CK_tb_Schueler_HasTelephone]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tragen Sie wenigstens eine Telefonnummer ein.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Schueler', @level2type=N'CONSTRAINT',@level2name=N'CK_tb_Schueler_HasTelephone'
GO


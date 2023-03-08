USE [Nachhilfe]
GO

/****** Object:  Table [dbo].[tb_Schueler]    Script Date: 08.03.2023 12:13:45 ******/
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
 CONSTRAINT [PK_tb_Schueler] PRIMARY KEY CLUSTERED 
(
	[SchuelerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [Nachhilfe]
GO

/****** Object:  Table [dbo].[tb_Unterricht]    Script Date: 10.03.2023 19:00:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Unterricht](
	[TerminID] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [date] NOT NULL,
	[FachbelegungID] [int] NOT NULL,
	[Einheiten] [float] NOT NULL,
	[Bemerkungen] [nvarchar](100) NULL,
	[Uhrzeit] [time](0) NULL,
 CONSTRAINT [PK_tb_Unterricht] PRIMARY KEY CLUSTERED 
(
	[TerminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Unterricht]  WITH CHECK ADD  CONSTRAINT [CK_tb_Unterricht] CHECK  (([Datum]<=getdate()))
GO

ALTER TABLE [dbo].[tb_Unterricht] CHECK CONSTRAINT [CK_tb_Unterricht]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Keine Zukunftsvortragungen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Unterricht', @level2type=N'CONSTRAINT',@level2name=N'CK_tb_Unterricht'
GO


USE [Nachhilfe]
GO

/****** Object:  Index [IX_tb_Fachbelegung]    Script Date: 17.03.2023 20:04:44 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_Fachbelegung] ON [dbo].[tb_Fachbelegung]
(
	[SchuelerID] ASC,
	[FachID] ASC,
	[Anfangsdatum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


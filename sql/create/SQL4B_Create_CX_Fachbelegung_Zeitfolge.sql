USE [Nachhilfe]
GO

ALTER TABLE [dbo].[tb_Fachbelegung]  WITH CHECK ADD  CONSTRAINT [CK_tb_Fachbelegung_Zeitfolge] CHECK  ((coalesce([Enddatum],[Anfangsdatum])>=[Anfangsdatum]))
GO

ALTER TABLE [dbo].[tb_Fachbelegung] CHECK CONSTRAINT [CK_tb_Fachbelegung_Zeitfolge]
GO


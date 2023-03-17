USE [Nachhilfe]
GO

ALTER TABLE [dbo].[tb_Fachbelegung]  WITH CHECK ADD  CONSTRAINT [CK_tb_Fachbelegung_Nur1Aktiv] CHECK  (([dbo].[sf_ZaehleAktiveAuftraege]([SchuelerID],[FachID])<=(1)))
GO

ALTER TABLE [dbo].[tb_Fachbelegung] CHECK CONSTRAINT [CK_tb_Fachbelegung_Nur1Aktiv]
GO


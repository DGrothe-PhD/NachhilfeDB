USE [Nachhilfe]
GO

ALTER TABLE [dbo].[tb_Unterricht]  WITH CHECK ADD  CONSTRAINT [CK_tb_Unterricht] CHECK  (([Datum]<=getdate()))
GO

ALTER TABLE [dbo].[tb_Unterricht] CHECK CONSTRAINT [CK_tb_Unterricht]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Keine Zukunftsvortragungen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Unterricht', @level2type=N'CONSTRAINT',@level2name=N'CK_tb_Unterricht'
GO


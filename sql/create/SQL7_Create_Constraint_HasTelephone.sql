USE [Nachhilfe]
GO

ALTER TABLE [dbo].[tb_Schueler]  
   WITH CHECK ADD  CONSTRAINT [CK_tb_Schueler_HasTelephone] 
   CHECK  (([dbo].[sf_CountTelephoneNumbers]([SchuelerID])>(0)))
GO

ALTER TABLE [dbo].[tb_Schueler] CHECK CONSTRAINT [CK_tb_Schueler_HasTelephone]
GO

EXEC sys.sp_addextendedproperty 
    @name=N'MS_Description', 
	@value=N'Tragen Sie wenigstens eine Telefonnummer ein.' , 
	@level0type=N'SCHEMA',@level0name=N'dbo', 
	@level1type=N'TABLE',@level1name=N'tb_Schueler', 
	@level2type=N'CONSTRAINT',
	@level2name=N'CK_tb_Schueler_HasTelephone'
GO



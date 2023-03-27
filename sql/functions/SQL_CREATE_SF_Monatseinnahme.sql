USE [Nachhilfe]
GO

/****** Object:  UserDefinedFunction [dbo].[sf_Monatseinnahme]    Script Date: 19.03.2023 12:37:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniela Grothe
-- Create date: 17.03.2023
-- Description:	Monatsbilanz
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[sf_Monatseinnahme] 
(
	@Jahr int, @Monat int, @Tarif float
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @betrag float;
	SELECT @betrag = SUM(@Tarif *Einheiten)
	FROM dbo.tb_Unterricht
	WHERE YEAR(Datum) = @Jahr AND MONTH(Datum) = @Monat;

RETURN @betrag

END
GO



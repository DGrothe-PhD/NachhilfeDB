USE [Nachhilfe]
GO

/****** Object:  UserDefinedFunction [dbo].[sf_Jahreseinnahme]    Script Date: 19.03.2023 12:39:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniela Grothe
-- Create date: 10.03.2023
-- Description:	Jahresbilanz
-- =============================================
CREATE OR ALTER   FUNCTION [dbo].[sf_Jahreseinnahme] 
(
	@Jahr int, @Tarif float
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @betrag float;
	SELECT @betrag = SUM(@Tarif *Einheiten)
	FROM dbo.tb_Unterricht
	WHERE YEAR(Datum) = @Jahr;

RETURN @betrag

END
GO


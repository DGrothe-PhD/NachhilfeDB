USE Nachhilfe;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniela Grothe
-- Create date: 17.03.2023
-- Description:	Monatsbilanz
-- =============================================
CREATE OR ALTER FUNCTION sf_Monatseinnahme 
(
	@Jahr int, @Monat int, @Tarif int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @betrag int;
	SELECT @betrag = SUM(@Tarif *Einheiten)
	FROM dbo.tb_Unterricht
	WHERE YEAR(Datum) = @Jahr AND MONTH(Datum) = @Monat;

RETURN @betrag

END
GO


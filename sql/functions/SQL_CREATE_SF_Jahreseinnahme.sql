USE Nachhilfe;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniela Grothe
-- Create date: 10.03.2023
-- Description:	Jahresbilanz
-- =============================================
CREATE OR ALTER FUNCTION sf_Jahreseinnahme 
(
	@Jahr int, @Tarif int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @betrag int;
	SELECT @betrag = SUM(@Tarif *Einheiten)
	FROM dbo.tb_Unterricht
	WHERE YEAR(Datum) = @Jahr;

RETURN @betrag

END
GO


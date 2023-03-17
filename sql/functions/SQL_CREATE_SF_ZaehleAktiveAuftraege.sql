USE Nachhilfe;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniela Grothe
-- Create date: 17.03.2023
-- Description:	Count active teaching roles
-- =============================================
CREATE OR ALTER FUNCTION sf_ZaehleAktiveAuftraege 
(
	@SchuelerID INT,
	@FachID INT
)
RETURNS INT
AS
BEGIN
	DECLARE @retval int
	SELECT @retval = COUNT(*) FROM
	tb_Fachbelegung
	WHERE SchuelerID = @SchuelerID
	AND FachID = @FachID
	AND Enddatum IS NULL

	-- Return the result of the function
	RETURN @retval

END
GO


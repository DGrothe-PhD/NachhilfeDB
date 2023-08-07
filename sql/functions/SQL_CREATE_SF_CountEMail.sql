USE [Nachhilfe]
GO

/****** Object:  UserDefinedFunction [dbo].[sf_CountTelephoneNumbers]    Script Date: 07.08.2023 19:57:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ========================================================================
-- Author:		Grothe, Daniela
-- Create date: 07.08.2023
-- Description:	Simple helper function to count how many fields are filled
-- ========================================================================
CREATE FUNCTION [dbo].[sf_CountEMail] 
(
	-- Add the parameters for the function here
	@SchuelerID INT
)
RETURNS INT
AS
BEGIN
	-- Declare the return variable here
	DECLARE @CountedPhones INT
	SET @CountedPhones = 0;

	-- Add the T-SQL statements to compute the return value here
	SELECT
		@CountedPhones += CASE WHEN EMail1 IS NOT NULL
		THEN 1 ELSE 0 END,
	    @CountedPhones += CASE WHEN EMail2 IS NOT NULL
		THEN 1 ELSE 0 END
	FROM tb_Schueler
	WHERE SchuelerID = @SchuelerID;

	-- Return the result of the function
	RETURN @CountedPhones

END
GO



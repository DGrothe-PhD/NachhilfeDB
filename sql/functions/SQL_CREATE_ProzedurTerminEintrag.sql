USE [Nachhilfe]
GO

/****** Object:  StoredProcedure [dbo].[pr_TerminEintragen]    Script Date: 27.03.2024 15:01:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =======================================================
-- Author:		Daniela Grothe
-- Create date: 17.03.2023
-- Description:	Eintragen von Unterrichtsstunden
-- Bemerkung:   Auf Geschlechtsspezifika wird verzichtet.
--              Es seien immer (m/w/d) gemeint.
-- =======================================================
CREATE OR ALTER   PROCEDURE [dbo].[pr_TerminEintragen]
	-- Add the parameters for the stored procedure here
	@Vorname nvarchar(20),
	@Name nvarchar(20),
	@Fach nvarchar(20),
	@Datum date,
	@Einheiten float,
	@Uhrzeit time(0),
	@Thema nvarchar(200) = NULL,
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @FachbelegungID int;
	DECLARE @SchuelerID int;

	BEGIN TRY

	DECLARE @msg nvarchar(100);

	-- Validierung von Datum und genommenen Unterrichtseinheiten
	IF @Datum IS NULL
		THROW 50001, 'Bitte ein Datum eingeben!', 1;
	IF @Fach IS NULL
		THROW 50001, 'Bitte Fachbezeichnung eingeben!', 1;

	IF @Einheiten IS NULL
		THROW 50001, 'Bitte die Zahl der Doppelstunden eingeben!', 1;
	ELSE IF @Einheiten > 2 OR @Einheiten < 0.5
		THROW 50007, 'Unrealistisch großer oder kleiner Wert für Einheiten', 1;

	-- Validierung Schuelername und Nachschlagen dessen ID
	SET @msg = 'Bitte den Vornamen angeben und mind. 1. Buchstaben vom Nachnamen.'
	IF @Vorname IS NULL OR @Name IS NULL
	THROW 50001, @msg, 1;

	-- Ist Schueler auffindbar?
	SET @msg = CONCAT_WS(' ','Name', @Vorname, @Name, 'nicht gefunden.');
	IF NOT EXISTS ( 
		SELECT Name 
		FROM tb_Schueler
		WHERE SUBSTRING(Name,1,LEN(@Name)) = @Name
		AND Vorname = @Vorname
	)
	THROW 50003, @msg, 1;
	
	-- Ist Namensangabe eindeutig?
	DECLARE @num int;

	SELECT @num = COUNT(*)
	FROM tb_Schueler
	WHERE SUBSTRING(Name,1,LEN(@Name)) = @Name
	AND Vorname = @Vorname

	IF @num > 1
		THROW 50007, 'Angaben nicht eindeutig', 1;
	
	-- Gutfall, wir ordnen die SchuelerID zu.
	SELECT @SchuelerID = SchuelerID
	FROM tb_Schueler
	WHERE SUBSTRING(Name,1,LEN(@Name)) = @Name
	AND Vorname = @Vorname
	
	-- Weiter mit dem Fach. Pruefe Fach
	SET @msg = CONCAT( 'Fach ', @Fach, ' unterrichten Sie dort nicht.');

	IF NOT EXISTS (
		SELECT FachBelegID 
		FROM tb_Faecher JOIN tb_Fachbelegung
		ON tb_Fachbelegung.FachID = tb_Faecher.FachID
		WHERE Bezeichnung = @Fach AND SchuelerID = @SchuelerID
	)
	THROW 50003, @msg, 1;
	
	-- Schaue Fachbelegung-ID nach
	SELECT @FachBelegungID = FachBelegID 
	FROM tb_Faecher JOIN tb_Fachbelegung
	ON tb_Fachbelegung.FachID = tb_Faecher.FachID
	WHERE Bezeichnung = @Fach AND SchuelerID = @SchuelerID
	
	-- Datensatz eintragen, fertig.
	INSERT INTO tb_Unterricht (Datum, FachbelegungID, Einheiten, Uhrzeit, Thema)
	VALUES (@Datum, @FachbelegungID, @Einheiten, @Uhrzeit, @Thema)

	END TRY
	BEGIN CATCH
		SET @Erfolg = 0; -- nicht geklappt--
		-- 	@Feedback text OUTPUT --Fehlermeldungen etc.
		SET @Feedback = 
			ERROR_MESSAGE() + ' Fehler Nr. '+ CONVERT(varchar, ERROR_NUMBER())
							+ ' Prozedur: '  + ERROR_PROCEDURE()
							+ ' Zeile Nr.: ' + CONVERT(varchar,  ERROR_LINE());
	END CATCH
END
GO



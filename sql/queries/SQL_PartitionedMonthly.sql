/******
Concatenated list of lessons.
Rekursion, nicht an großen Datenbanken getestet, Rekursionstiefe (^= Anzahl Fächer pro Schüler und Termin)
soll nicht überhandnehmen.

Source: https://stackoverflow.com/a/13681687/17677104
******/
-- 
USE [Nachhilfe]
GO

WITH Partitioned AS (
	SELECT TOP (100) PERCENT [Datum], Einheiten AS EINH, [SchuelerIn], Bezeichnung,
		  ROW_NUMBER() OVER (
			 PARTITION BY CONCAT(Datum, SchuelerIn)
			 ORDER BY Datum, SchuelerIn, 
			 Bezeichnung
		   ) AS Zeile,
		  COUNT(*) OVER (PARTITION BY CONCAT(Datum, SchuelerIn)) AS BCount
	  FROM [Nachhilfe].[dbo].[MANachFach]
	  GROUP BY Datum, SchuelerIn, Bezeichnung, Einheiten
),
Concatenated AS (
	SELECT [Datum], EINH, SchuelerIn,
		CAST(Bezeichnung AS nvarchar) AS 'Unterricht',
		Bezeichnung, Zeile, BCount
	FROM Partitioned
	WHERE Zeile = 1

	UNION ALL

	SELECT P.Datum, C.EINH + P.EINH, P.SchuelerIn, 
		CAST(C.Unterricht + '/' + P.Bezeichnung AS nvarchar) AS 'Unterricht',
		P.Bezeichnung, P.Zeile, P.BCount
	FROM Partitioned AS P
		INNER JOIN Concatenated AS C
			ON P.Datum = C.Datum AND P.SchuelerIn = C.SchuelerIn
			AND P.Zeile = C.Zeile + 1
)

-- Order by year & month first for quick overview
SELECT TOP(100) PERCENT
    Datum, EINH as Einheiten, SchuelerIn, Unterricht
FROM Concatenated
WHERE Zeile = BCount
ORDER BY year(Datum), month(datum), SchuelerIn, Datum, Unterricht
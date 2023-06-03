USE [Nachhilfe];
GO

SELECT TOP (100) PERCENT [Datum],[Einheiten],[SchuelerIn],[Bezeichnung]
FROM [Nachhilfe].[dbo].[MANachFach]
WHERE year(Datum) = 2023-- AND Bezeichnung LIKE '%tik'
ORDER BY Bezeichnung;

/** calculating the sum of lessons this year **/
DECLARE @summe DECIMAL;
SELECT TOP (100) PERCENT @summe = sum([Einheiten])
FROM [Nachhilfe].[dbo].[MANachFach] 
WHERE year(Datum) = 2023;

SELECT @summe;

/** percentage of subjects this year **/
SELECT TOP (100) PERCENT [Bezeichnung], 100 * sum([Einheiten])/@summe AS 'Anteil (%)'
FROM [Nachhilfe].[dbo].[MANachFach] 
WHERE year(Datum) = 2023
GROUP BY Bezeichnung;
USE Nachhilfe
GO

-- Note: This is equivalent to KontingentCheck view.
WITH Iststand AS 
(
SELECT dbo.MANachFach.SchuelerIn, dbo.MANachFach.SchuelerID AS s1,
	SUM(dbo.MANachFach.Einheiten) AS Absolviert
	FROM     dbo.MANachFach 
	GROUP BY dbo.MANachFach.SchuelerIn, dbo.MANachFach.SchuelerID
),
Sollstand AS 
(
	SELECT dbo.tb_Kontingent.SchuelerID as s2, SUM(dbo.tb_Kontingent.AnzahlEinheiten) AS Geplant
	FROM     dbo.tb_Kontingent
	GROUP BY dbo.tb_Kontingent.SchuelerID
)

SELECT TOP(100) PERCENT
	SchuelerIn, Absolviert, Geplant
FROM Iststand JOIN Sollstand 
	ON s1 = s2


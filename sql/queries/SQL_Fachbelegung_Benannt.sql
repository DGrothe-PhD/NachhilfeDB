/****** Abfrage der Fachbelegungen mit Nummern ******/
SELECT TOP (100) PERCENT [FachBelegID]
      ,tb_Schueler.[SchuelerID], Name, Vorname
      ,tb_Faecher.[FachID], Bezeichnung
  FROM [Nachhilfe].[dbo].[tb_Fachbelegung]
  JOIN tb_Faecher ON tb_Fachbelegung.FachID = tb_Faecher.FachID
  JOIN tb_Schueler ON tb_Schueler.SchuelerID = tb_Fachbelegung.SchuelerID
  ORDER BY Name ASC, Vorname ASC, Bezeichnung ASC
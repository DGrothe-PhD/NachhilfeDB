/****** Skript für SelectTopNRows-Befehl aus SSMS ******/
SELECT TOP (1000) [Datum]
      ,[Einheiten]
      ,[Name]
      ,[Vorname]
      ,[Bezeichnung]
  FROM [Nachhilfe].[dbo].[MANachFach]
  WHERE Month(Datum) = 3
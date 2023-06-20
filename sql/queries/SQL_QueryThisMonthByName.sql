/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Datum]
      ,[Einheiten]
      ,[SchuelerIn]
      ,[Bezeichnung]
  FROM [Nachhilfe].[dbo].[MANachFach]
  where month(datum) = 6
  order by SchuelerIn, Datum
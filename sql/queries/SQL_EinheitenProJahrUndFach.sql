/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [TerminID]
      ,[Datum]
      ,[Einheiten]
      ,[SchuelerIn]
      ,[Bezeichnung]
      ,[SchuelerID]
  FROM [Nachhilfe].[dbo].[MANachFach]


  SELECT TOP (1000) 
      sum([Einheiten])
      ,[Bezeichnung]
  FROM [Nachhilfe].[dbo].[MANachFach]
  group by Bezeichnung


 --  group by Year and Bezeichnung
 select Jahr, sum(Einheiten), Bezeichnung
 from (
 SELECT TOP (1000) 
		year(Datum)  'Jahr'
      ,[Einheiten]
      ,[Bezeichnung]
  FROM [Nachhilfe].[dbo].[MANachFach]
) tab1
group by Jahr, Bezeichnung
order by Jahr, Bezeichnung
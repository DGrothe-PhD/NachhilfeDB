/****** Script for SelectTopNRows command from SSMS  ******/
-- ref. https://stackoverflow.com/a/10309947/
--
SELECT TOP (1000) [Monat]
      ,[Jahr]
      ,[SchuelerIn]
      ,[Absolviert]
      ,[Geplant]
      ,[Saldo]
	  , SUM(Saldo) OVER (PARTITION BY SchuelerIn
	      ORDER BY Jahr, Monat
		  ROWS UNBOUNDED PRECEDING ) AS 'Aktueller Saldo'
  FROM [Nachhilfe].[dbo].[EinheitenMonatAlphabetisch]
  order by Jahr, Monat, SchuelerIn
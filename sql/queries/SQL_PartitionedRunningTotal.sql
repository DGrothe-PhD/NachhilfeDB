/****** Script for SelectTopNRows command from SSMS  ******/
-- ref. https://stackoverflow.com/a/10309947/
--
USE [Nachhilfe]
GO

SELECT TOP (1000) [Monat]
      ,[Jahr]
      ,Name, Vorname
      ,[Absolviert]
      ,[Geplant]
      ,[Saldo]
	  , SUM(Saldo) OVER (PARTITION BY Name
	      ORDER BY Jahr, Monat
		  ROWS UNBOUNDED PRECEDING ) AS 'Aktueller Saldo'
  FROM [Nachhilfe].[dbo].[EinheitenMonatAlphabetisch]
  where Jahr = 2024
  order by Name, Monat
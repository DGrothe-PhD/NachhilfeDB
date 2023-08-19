/****** Script for SelectTopNRows command from SSMS  ******/
USE Nachhilfe
GO
SELECT avg(Einnahme), [Jahr]
  FROM [Nachhilfe].[dbo].[Monatsabrechnung]
  GROUP BY Jahr
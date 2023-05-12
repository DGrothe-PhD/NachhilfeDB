/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Monat]
      ,[Jahr]
      ,[SchülerIn]
      ,[Expr1]
  FROM [Nachhilfe].[dbo].[EinheitenMonatAlphabetisch]
  WHERE Jahr = 2023 AND Monat BETWEEN 1 AND 5
  ORDER BY Monat ASC, SchülerIn ASC;
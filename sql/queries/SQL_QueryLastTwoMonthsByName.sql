/****** Script for SelectTopNRows command from SSMS  ******/
USE [Nachhilfe];
GO

DECLARE @heute date;
SET @heute = GETDATE();

SELECT TOP (1000) [Datum]
      ,[Uhrzeit]
      ,[Einheiten]
      ,[Name]
      ,[Vorname]
      ,[Bezeichnung]
  FROM [Nachhilfe].[dbo].[MonatsabrechnungNachFach]
  where year(datum) = year(@heute) and month(datum) > month(@heute) - 2
  order by Name, Vorname, Datum ASC
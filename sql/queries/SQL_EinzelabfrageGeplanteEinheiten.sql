/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [KontingentID]
      ,Name, Vorname
      ,[Jahr]
      ,[Monat]
      ,[AnzahlEinheiten]
  FROM [Nachhilfe].[dbo].[tb_Kontingent]
  join tb_Schueler on tb_Kontingent.SchuelerID = tb_Schueler.SchuelerID
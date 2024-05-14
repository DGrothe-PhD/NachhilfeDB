USE [Nachhilfe]
GO

/****** Object:  View [dbo].[Anstehend]    Script Date: 14.05.2024 15:50:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Anstehend]
AS
SELECT dbo.tb_AnstehendeTermine.Datum, dbo.tb_AnstehendeTermine.Uhrzeit, dbo.tb_AnstehendeTermine.Einheiten, dbo.tb_AnstehendeTermine.WhInTagen, dbo.tb_AnstehendeTermine.UnterrichtsartID, dbo.tb_Schueler.Name, 
                  dbo.tb_Schueler.Vorname, dbo.tb_Schueler.Ort, dbo.tb_Unterrichtsart.Bezeichnung, dbo.tb_AnstehendeTermine.Bemerkungen, dbo.tb_AnstehendeTermine.SchuelerID
FROM     dbo.tb_AnstehendeTermine INNER JOIN
                  dbo.tb_Schueler ON dbo.tb_AnstehendeTermine.SchuelerID = dbo.tb_Schueler.SchuelerID LEFT OUTER JOIN
                  dbo.tb_Unterrichtsart ON dbo.tb_AnstehendeTermine.UnterrichtsartID = dbo.tb_Unterrichtsart.ArtID
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_AnstehendeTermine"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 284
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Schueler"
            Begin Extent = 
               Top = 7
               Left = 295
               Bottom = 291
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tb_Unterrichtsart"
            Begin Extent = 
               Top = 143
               Left = 529
               Bottom = 284
               Right = 733
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Anstehend'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Anstehend'
GO


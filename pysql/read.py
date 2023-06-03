# Run this app with `python app.py` and
# visit http://127.0.0.1:8050/ in your web browser.

# python connects to my T-SQLEXPRESS database
# while SSMS 2019 is running
import numpy
import pyodbc
from colorthemes import colorthemes as ct

# -- plotly imports
from dash import Dash, html, dcc
import plotly.express as px
import plotly.graph_objects as go
import plotly.offline as pyo

import pandas as pd

app = Dash(__name__)


class monthlytable:
    plots = []
    titleline = ""
    month_from = 0
    month_to = 0
    year = 0
    
    conn = pyodbc.connect(
        'Driver={SQL Server};'
        'Server=len5\SQLEXPRESS;'
        'Database=Nachhilfe;'
        'Trusted_Connection=yes;'
    )
    
    monate = ["","Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", \
     "August", "September", "Oktober", "November", "Dezember"]
    
    
    def read(self, what):
        print("Read")
        cursor = self.conn.cursor()
        cursor.execute(f"select * from [Nachhilfe].[dbo].[{what}]")
        allrows = cursor.fetchall()
        for row in allrows:
            print(f'row = {row}')
            print()
    
    def set_title(self, year, m_from, m_to):
        self.year = year
        self.titleline = f"Monatsabrechnung für {year} von {self.monate[m_from]} bis {self.monate[m_to]}"
    
    def ThisMonthLessons(self, year, selected_month = 0):
        self.year = year
        monthintitle = f"{self.monate[selected_month]} " if selected_month else ""
        self.monthannex = f"_{self.monate[selected_month]}" if selected_month else ""
        self.titleline = f"Monatsunterricht für {monthintitle}{year}"
        
        print(self.titleline)
        cursor = self.conn.cursor()
        #
        filtertext = f"AND MONTH(Datum) = {selected_month}" if selected_month else ""
        
        allquery = f"SELECT TOP (100) PERCENT [Datum],[Einheiten],[SchuelerIn],[Bezeichnung] " + \
         f"FROM [Nachhilfe].[dbo].[MANachFach] " + \
         f"WHERE year(Datum) = {year} {filtertext} " + \
         f"ORDER BY Datum ASC"
        
        cursor.execute(allquery)
        column_Names  = cursor.description
        allrows = cursor.fetchall()
        result = [{column_Names[index][0]: column for index, column in enumerate(value)} for value in allrows]
        
        self.monthlySubjectsDataFrame = pd.DataFrame(
            result, 
            columns=["Datum", "SchuelerIn", "Einheiten", "Bezeichnung"]
        )
        pass
    
    
    # Write dataframe as table
    def printMonthly(self):
        print(self.monthlySubjectsDataFrame)
        
        with open(f"Monatstermine_{self.year}{self.monthannex}.html", 'w', encoding='utf-8') as f:
            f.write("<html><title>Monatsabrechnung</title>\r\n")
            f.write(""" <link rel="stylesheet" href="styles.css"> """)
            f.write("<body><h1>"+self.titleline+"</h1>\r\n")
            f.write(self.monthlySubjectsDataFrame.to_html())
            f.write("</body></html>")
        pass
    
    # Pie chart
    def makePieChartSubjects(self, year):
        # Pie chart is for whole year. Query for data of whole year
        self.ThisMonthLessons(year)
        df = self.monthlySubjectsDataFrame.groupby(['Bezeichnung'])['Einheiten'].sum().reset_index()
        fig2 = px.pie(
            df,
            values = "Einheiten",
            names = "Bezeichnung",
            title = f"Anteil der Fächer im Jahr {year}",
            color_discrete_sequence = ct.bluegreenpalette
        )
        self.plots.append(fig2)
        pass
    
    def SummaryGivenLessons(self, year, m_from, m_to):
        self.year = year
        self.set_title(year, m_from, m_to)
        print(self.titleline)
        cursor = self.conn.cursor()
        #
        monthlyquery = f"SELECT TOP(100) PERCENT [Monat],[Jahr],[SchuelerIn],[Expr1] AS Einheiten" + \
         " FROM [Nachhilfe].[dbo].[EinheitenMonatAlphabetisch]" + \
         f" WHERE Jahr = {year} AND Monat BETWEEN {m_from} AND {m_to}" + \
         " ORDER BY Monat ASC, SchuelerIn ASC;"
        #
        cursor.execute(monthlyquery)
        column_Names  = cursor.description
        
        allrows = cursor.fetchall()
        result = [{column_Names[index][0]: column for index, column in enumerate(value)} for value in allrows]
        
        self.GivenLessonsDataFrame = pd.DataFrame(result, columns=["Monat", "Jahr", "SchuelerIn", "Einheiten"])
        print(self.GivenLessonsDataFrame)
        
        with open(f"Monatsabrechnung_{year}_{m_from}-{m_to}.html", 'w', encoding='utf-8') as f:
            f.write("<html><title>Monatsabrechnung</title>\r\n")
            f.write(""" <link rel="stylesheet" href="styles.css"> """)
            f.write("<body><h1>"+self.titleline+"</h1>\r\n")
            f.write(self.GivenLessonsDataFrame.to_html())
            f.write("</body></html>")
        pass
        
        
    def makePlotGivenLessons(self):
        fig1 = px.bar(
            self.GivenLessonsDataFrame,
            x="Monat", y="Einheiten", color="SchuelerIn",
            barmode="stack",
            color_discrete_sequence=ct.bluegreenpalette
        )
        self.plots.append(fig1)
        pass
    
    
    def formatter(self):
        div_widths = ["50%", "25%"]
        app.layout = html.Div(
            [html.Div(
            style={"font-family": "Calibri", "width": div_widths[idx]},
            children=[
            html.H1(
            style={"font-family": "Calibri"},
            children=f"Monatsabrechnung für {self.year}"),

            html.Div(children='''
                Aufgeteilt nach Schuelern
            '''),

            dcc.Graph(
                id = f"nachhilfe-graph{idx}",
                figure = x_fig
            )
        ]) for idx, x_fig in enumerate(self.plots)],
        style = {'margin-right' : '0px'}
        )


# Execution	  

if __name__ == '__main__':
    mtt = monthlytable()
    #mtt.read("tb_Fachbelegung")
    print("\n=====================\n\n")
    #mtt.read("Belegungsplan")
    #
    mtt.SummaryGivenLessons( 2023, 1, 5)
    mtt.makePlotGivenLessons()
    #
    mtt.ThisMonthLessons(2023, 5)
    mtt.printMonthly()
    #
    mtt.makePieChartSubjects(2023)
    mtt.formatter()
    app.run_server(debug=True)
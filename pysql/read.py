# Run this app with `python app.py` and
# visit http://127.0.0.1:8050/ in your web browser.

# python connects to my T-SQLEXPRESS database
# while SSMS 2019 is running
import numpy
import pyodbc

# -- plotly imports
from dash import Dash, html, dcc
import plotly.express as px
import pandas as pd

app = Dash(__name__)

conn = pyodbc.connect(
    'Driver={SQL Server};'
    'Server=len5\SQLEXPRESS;'
    'Database=Nachhilfe;'
    'Trusted_Connection=yes;'
    )

# params


def read(conn, what):
    print("Read")
    cursor = conn.cursor()
    cursor.execute(f"select * from [Nachhilfe].[dbo].[{what}]")
    allrows = cursor.fetchall()
    for row in allrows:
        print(f'row = {row}')
        print()

class monthlytable:
    fig = ""
    titleline = ""
    month_from = 0
    month_to = 0

    monate = ["","Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", \
     "August", "September", "Oktober", "November", "Dezember"]
 
    def set_title(self, year, m_from, m_to):
        self.titleline += f"Monatsabrechnung für {year} von {self.monate[m_from]} bis {self.monate[m_to]}"
  
    def Teilsumme(self, conn, year, m_from, m_to):
        self.set_title(year, m_from, m_to)
        print(self.titleline)
        cursor = conn.cursor()
        #
        monthlyquery = f"SELECT TOP(100) PERCENT [Monat],[Jahr],[SchülerIn],[Expr1] AS Einheiten" + \
         " FROM [Nachhilfe].[dbo].[EinheitenMonatAlphabetisch]" + \
         f" WHERE Jahr = {year} AND Monat BETWEEN {m_from} AND {m_to}" + \
         " ORDER BY Monat ASC, SchülerIn ASC;"
        #
        cursor.execute(monthlyquery)
        column_Names  = cursor.description
       
        # DataFrame directly from pandas@sql: requires sqlalchemy
        # df = pd.read_sql(monthlyquery, conn)
        # so instead I just
        
        allrows = cursor.fetchall()
        result = [{column_Names[index][0]: column for index, column in enumerate(value)} for value in allrows]
        
        #for row in allrows:
        #    print(f'row = {row}')
        #    print()
        
        #print(pd.DataFrame(allrows, columns=["Monat", "Jahr", "SchülerIn", "Einheiten"]))
        printabledataframe = pd.DataFrame(result, columns=["Monat", "Jahr", "SchülerIn", "Einheiten"])
        print(printabledataframe)
        
        with open(f"Monatsabrechnung_{year}_{m_from}-{m_to}.html", 'w', encoding='utf-8') as f:
            f.write("<html><title>Monatsabrechnung</title>\r\n")
            f.write(""" <link rel="stylesheet" href="styles.css"> """)
            f.write("<body><h1>"+self.titleline+"</h1>\r\n")
            f.write(printabledataframe.to_html())
            f.write("</body></html>")
        
        # Later used, this shall stick around here
        #fig = px.bar(df, x="SchülerIn", y="Einheiten", color="Monat", barmode="group")


def formatter():
    app.layout = html.Div(children=[
        html.H1(children='Hello Dash'),

        html.Div(children='''
            Dash: A web application framework for your data.
        '''),

        dcc.Graph(
            id='example-graph',
            figure=fig
        )
    ])

# Execution	  
read(conn, "tb_Fachbelegung")

print("\n=====================\n\n")

read(conn, "Belegungsplan")

print("\n=====================\n\n")

if __name__ == '__main__':
    mtt = monthlytable()
    mtt.Teilsumme(conn, 2023, 1, 5)
    #formatter()
    #app.run_server(debug=True)
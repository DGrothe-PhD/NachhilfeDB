use Nachhilfe;
Go


select-- datepart(dw, Datum) i, 
datename(dw, Datum) as 'Wochentag', Uhrzeit, count(*) Anzahl from tb_Unterricht
group by datepart(dw, Datum),
datename(dw, Datum), Uhrzeit
order by datepart(dw, Datum)
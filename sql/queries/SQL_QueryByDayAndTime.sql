use Nachhilfe;
Go

select count(*) from tb_Unterricht

-- nach Wochentag und Zeit
select-- datepart(dw, Datum) i, 
datename(dw, Datum) as 'Wochentag', Uhrzeit, count(*) Anzahl from tb_Unterricht
group by datepart(dw, Datum),
datename(dw, Datum), Uhrzeit
order by datepart(dw, Datum)

-- nach Unterrichtsart
select tb_Unterrichtsart.Bezeichnung 'Medium', count(*) Anzahl 
from tb_Unterricht
left join tb_Fachbelegung on FachbelegungID = FachBelegID
left join tb_Unterrichtsart on UnterrichtsartID = ArtID
group by tb_Unterrichtsart.Bezeichnung
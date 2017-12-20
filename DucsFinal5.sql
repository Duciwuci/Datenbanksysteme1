SELECT * FROM Kursthemen;

SELECT PNR,Name,Vorname,(Lohnstufe-1)*10000+50000 FROM Personen;

SELECT Name,Vorname,Funktionen.Funktion FROM Personen
Join Funktionen
ON Funktionen.FNR = Personen.FNR;

SELECt COUNT (*) AS Anzahl, MIN(Datum) AS frühester, MAX(Datum) AS Spätester FROM Kursbesuche;

SELECT Count(*) FROM
(Select Distinct KNR From Kursbesuche);

SELECT PNR,Vorname,Name FROM Personen
where FNR=1;

Select PNR,Name,Vorname FROM Personen
Join Funktionen
ON Personen.FNR = Funktionen.FNR
where Lohnstufe >= 5
AND (Funktion='Meister'
OR Funktion='Chemiker')
AND Name!='Steffen';

SELECT * FROM Funktionen order by FNR ASC;

SELECT * FROM Funktionen order by FNR DESC;

/* Aufgabe k */
Select Personen.PNR,count(KURSBESUCHE.DATUM) AS Anzahl From PERSONEN
Join KURSBESUCHE
on PERSONEN.PNR = Kursbesuche.PNR
where Kursbesuche.datum > '01-09-1991'
Group by Personen.PNR
having count (KURSBESUCHE.DATUM) > 1;

/* Aufgabe l*/
Select Kurse.KNR,Kurse.Kursbezeichnung FROM Kurse
Join Kursbesuche
on Kurse.KNR = Kursbesuche.KNR
Join PERSONEN 
on Kursbesuche.PNR=PERSONEN.PNR
where Personen.Name in ('Steffen')
AND PERSONEN.VORNAME in('Felix');

Select Kurse.KNR,Kurse.Kursbezeichnung FROM Kurse
Join Kursbesuche
on Kurse.KNR = Kursbesuche.KNR
Join PERSONEN 
on Kursbesuche.PNR=PERSONEN.PNR
where Personen.Name = 'Steffen'
AND PERSONEN.VORNAME = 'Felix';

/* Aufgabe m*/
Select Personen.PNR,Personen.FNR,Personen.Lohnstufe FROM Personen
where Personen.Lohnstufe in
(Select MAX(Personen.Lohnstufe) AS Maximal FROM Personen
Group by Personen.FNR);
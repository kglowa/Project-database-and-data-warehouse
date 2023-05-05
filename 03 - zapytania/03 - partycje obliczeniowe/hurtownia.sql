SELECT DISTINCT h_pojazdy.marka, h_wynajem.ocena AS "Ocena", ROUND((100*COUNT(h_wynajem.ocena )
OVER (PARTITION BY  h_pojazdy.marka, h_wynajem.ocena )/COUNT(h_wynajem.ocena )
OVER (PARTITION BY  h_pojazdy.marka)),2) AS "Procent"
FROM H_OPINIE,H_POJAZDY, H_WYNAJEM
WHERE h_wynajem.id_opinii = h_opinie.id_opinii AND h_wynajem.id_pojazdu = h_pojazdy.id_pojazdu
ORDER BY h_pojazdy.marka, h_wynajem.ocena;

SELECT DISTINCT h_miasto.nazwa, h_rachunki.typ AS "Rodzaj platnosci", ROUND((100*COUNT(h_rachunki.typ)
OVER (PARTITION BY h_miasto.nazwa, h_rachunki.typ)/COUNT(h_rachunki.typ)
OVER (PARTITION BY h_miasto.nazwa)),2) AS "Procent"
FROM   H_WYNAJEM, H_RACHUNKI,H_MIASTO
WHERE h_wynajem.id_rachunku = h_rachunki.id_rachunku AND h_wynajem.id_miasta = h_miasto.id_miasta
ORDER BY h_miasto.nazwa, h_rachunki.typ ;

SELECT DISTINCT h_wojewodztwo.nazwa,  h_wynajem.ocena AS "Ocena",COUNT(h_wynajem.ocena) OVER(PARTITION BY h_wojewodztwo.nazwa,h_wynajem.ocena) AS "Ilosc danej oceny", 
ROUND((100*COUNT(h_wynajem.ocena)OVER (PARTITION BY h_wojewodztwo.nazwa, h_wynajem.ocena)/COUNT(h_wynajem.ocena)
OVER (PARTITION BY h_wojewodztwo.nazwa)),2) AS "Procent[%]"
FROM H_WYNAJEM,H_WOJEWODZTWO
WHERE h_wynajem.id_wojewodztwa = h_wojewodztwo.id_wojewodztwa
ORDER BY h_wojewodztwo.nazwa


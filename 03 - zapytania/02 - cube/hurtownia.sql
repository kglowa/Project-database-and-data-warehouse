SELECT DISTINCT h_pojazdy.marka,h_pracownicy.nazwisko,AVG(h_wynajem.ocena) AS SREDNIA FROM H_PRACOWNICY, H_WYNAJEM,H_POJAZDY
WHERE h_wynajem.id_pojazdu = h_pojazdy.id_pojazdu AND h_wynajem.id_pracownika = h_pracownicy.id_pracownika
GROUP BY CUBE(h_pojazdy.marka,h_pracownicy.nazwisko)
ORDER BY(h_pracownicy.nazwisko) DESC;

SELECT h_wojewodztwo.nazwa,h_pojazdy.marka, COUNT(h_wynajem.id_pojazdu) AS "Ilosc wypozyczen"
FROM H_WYNAJEM, H_POJAZDY,H_WOJEWODZTWO
WHERE h_wynajem.id_pojazdu = h_pojazdy.id_pojazdu AND h_wynajem.id_wojewodztwa = h_wojewodztwo.id_wojewodztwa
GROUP BY CUBE(h_wojewodztwo.nazwa,h_pojazdy.marka);

SELECT h_miasto.nazwa,h_klienci.nazwisko AS "Nazwisko klienta",SUM(h_wynajem.ocena) AS "Ilosc ocen", SUM(h_wynajem.zysk) AS "Wklad klienta"
FROM H_KLIENCI, H_WYNAJEM,H_MIASTO
WHERE h_wynajem.id_klienta = h_klienci.id_klienta AND h_wynajem.id_miasta = h_miasto.id_miasta
GROUP BY CUBE(h_miasto.nazwa,h_klienci.nazwisko);
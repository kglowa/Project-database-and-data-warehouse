//1.CUBE
SELECT DISTINCT model_marka.marka,pracownicy.nazwisko,AVG(opinie.ocena) AS SREDNIA FROM PRACOWNICY, WYNAJEM,KLIENCI,OPINIE,MODEL_MARKA,POJAZDY
WHERE pracownicy.id_pracownika = wynajem.id_wynajmu AND wynajem.id_klienta=klienci.id_klienta AND klienci.id_klienta= opinie.id_klienta AND
 wynajem.id_pojazdu = pojazdy.id_pojazdu AND pojazdy.id_model = model_marka.id_model
GROUP BY CUBE(model_marka.marka,pracownicy.nazwisko)
ORDER BY(pracownicy.nazwisko) DESC;
//2.CUBE 
SELECT wojewodztwo.wojewodztwo,MODEL_MARKA.marka, COUNT(wynajem.id_pojazdu) AS "Ilosc wypozyczen"
FROM MODEL_MARKA, POJAZDY, WYNAJEM,PRACOWNICY,PLACOWKI,MIASTO,WOJEWODZTWO
WHERE MODEL_MARKA.id_model = pojazdy.id_model AND wynajem.id_pojazdu = pojazdy.id_pojazdu AND wynajem.id_pracownika = pracownicy.id_pracownika
AND placowki.id_placowki = pracownicy.id_placowki AND miasto.id_miasta = placowki.id_miasta AND wojewodztwo.id_wojewodztwa = miasto.id_wojewodztwa
GROUP BY CUBE(MODEL_MARKA.marka,wojewodztwo.wojewodztwo);
//3.CUBE
SELECT miasto.miasto,klienci.nazwisko AS "Nazwisko klienta",SUM(opinie.ocena) AS "Ilosc ocen", SUM(rachunki.wartosc_netto ) AS "Wklad klienta"
FROM KLIENCI, WYNAJEM, OPINIE,RACHUNKI,PRACOWNICY,PLACOWKI,MIASTO
WHERE wynajem.id_klienta = klienci.id_klienta AND klienci.id_klienta = opinie.id_opinii AND wynajem.id_wynajmu = rachunki.id_wynajmu
AND wynajem.id_pracownika = pracownicy.id_pracownika AND placowki.id_placowki=pracownicy.id_placowki AND miasto.id_miasta = placowki.id_miasta
GROUP BY CUBE(klienci.nazwisko,miasto.miasto)
ORDER BY(klienci.nazwisko);
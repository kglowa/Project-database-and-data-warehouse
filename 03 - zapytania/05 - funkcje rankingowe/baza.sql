//1.FUNKCJE RANKINGOWE
SELECT miasto.miasto, COUNT(wynajem.id_pojazdu) AS "Ilosc wypozyczen",
DENSE_RANK() OVER (ORDER BY COUNT(wynajem.id_pojazdu) DESC) AS "Ranking"
FROM PLACOWKI,WYNAJEM,PRACOWNICY,MIASTO
WHERE wynajem.id_pracownika = pracownicy.id_pracownika AND pracownicy.id_placowki = placowki.id_placowki
AND miasto.id_miasta = placowki.id_miasta
GROUP BY (miasto.miasto);
//2.FUNKCJE RANKINGOWE
SELECT miasto.miasto, SUM(rachunki.wartosc_netto) AS "Dochod placowki",
DENSE_RANK() OVER (ORDER BY SUM(rachunki.wartosc_netto) DESC) AS "Ranking"
FROM PLACOWKI,WYNAJEM,PRACOWNICY, RACHUNKI,MIASTO
WHERE wynajem.id_pracownika = pracownicy.id_pracownika AND pracownicy.id_placowki = placowki.id_placowki AND rachunki.id_wynajmu = wynajem.id_wynajmu
AND miasto.id_miasta=placowki.id_miasta
GROUP BY (miasto.miasto);
//3.FUNKCJE RANKINGOWE
SELECT model_marka.marka,model_marka.model, SUM(rachunki.wartosc_netto) AS "Zysk",
DENSE_RANK() OVER (ORDER BY SUM(rachunki.wartosc_netto) DESC) AS "Ranking"
FROM WYNAJEM, MODEL_MARKA, POJAZDY, RACHUNKI
WHERE MODEL_MARKA.id_model = pojazdy.id_model
AND pojazdy.id_pojazdu = wynajem.id_pojazdu
AND rachunki.id_wynajmu = wynajem.id_wynajmu
GROUP BY (model_marka.marka,model_marka.model);
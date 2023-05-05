SELECT h_miasto.nazwa, COUNT(h_wynajem.id_pojazdu) AS "Ilosc wypozyczen",
DENSE_RANK() OVER (ORDER BY COUNT(h_wynajem.id_pojazdu) DESC) AS "Ranking"
FROM H_WYNAJEM,H_MIASTO
WHERE h_wynajem.id_miasta = h_miasto.id_miasta
GROUP BY (h_miasto.nazwa);

SELECT h_miasto.nazwa, SUM(h_wynajem.zysk) AS "Dochod placowki",
DENSE_RANK() OVER (ORDER BY SUM(h_wynajem.zysk) DESC) AS "Ranking"
FROM H_WYNAJEM,H_MIASTO
WHERE h_wynajem.id_miasta = h_miasto.id_miasta
GROUP BY (h_miasto.nazwa);

SELECT h_pojazdy.marka,h_pojazdy.model, SUM(h_wynajem.zysk) AS "Zysk",
DENSE_RANK() OVER (ORDER BY SUM(h_wynajem.zysk) DESC) AS "Ranking"
FROM H_WYNAJEM, H_POJAZDY
WHERE h_wynajem.id_pojazdu = h_pojazdy.id_pojazdu
GROUP BY (h_pojazdy.marka,h_pojazdy.model);
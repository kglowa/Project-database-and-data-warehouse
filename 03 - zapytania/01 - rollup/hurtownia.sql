SELECT  h_wojewodztwo.nazwa,h_pojazdy.marka, ROUND(AVG(h_wynajem.ocena),2) AS "Srednia ocena" FROM H_WYNAJEM,H_WOJEWODZTWO,H_POJAZDY
WHERE h_wynajem.id_wojewodztwa = h_wojewodztwo.id_wojewodztwa AND h_wynajem.id_pojazdu = h_pojazdy.id_pojazdu
GROUP BY ROLLUP(h_wojewodztwo.nazwa,h_pojazdy.marka);

SELECT h_wojewodztwo.nazwa,h_miasto.nazwa, SUM(h_wynajem.zysk) AS "ZYSK"
FROM H_WYNAJEM,H_WOJEWODZTWO,H_MIASTO
WHERE h_wynajem.id_wojewodztwa = h_wojewodztwo.id_wojewodztwa AND h_wynajem.id_miasta = h_miasto.id_miasta
GROUP BY ROLLUP( h_wojewodztwo.nazwa,h_miasto.nazwa)
ORDER BY h_wojewodztwo.nazwa;

SELECT h_pojazdy.model,h_pojazdy.marka, SUM(h_wynajem.zysk) AS "ZYSK" FROM H_POJAZDY, H_WYNAJEM
WHERE h_wynajem.id_pojazdu = h_pojazdy.id_pojazdu
GROUP BY ROLLUP(h_pojazdy.model,h_pojazdy.marka)
ORDER BY(ZYSK) DESC;


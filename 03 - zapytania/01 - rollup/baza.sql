//1.ROLLUP 
SELECT  wojewodztwo.wojewodztwo,model_marka.marka, ROUND(AVG(opinie.ocena),2) AS "Srednia ocena" FROM model_marka, opinie, klienci, wynajem, pojazdy,PRACOWNICY,MIASTO,WOJEWODZTWO,PLACOWKI
WHERE model_marka.id_model = pojazdy.id_model AND wynajem.id_pojazdu = pojazdy.id_pojazdu AND klienci.id_klienta = wynajem.id_klienta AND opinie.id_klienta = klienci.id_klienta
AND pracownicy.id_pracownika = wynajem.id_pracownika AND placowki.id_placowki=pracownicy.id_placowki AND placowki.id_miasta = miasto.id_miasta AND miasto.id_wojewodztwa = wojewodztwo.id_wojewodztwa
GROUP BY ROLLUP(model_marka.marka,wojewodztwo.wojewodztwo);
//2.ROLLUP
SELECT wojewodztwo.wojewodztwo,miasto.miasto, SUM(rachunki.Wartosc_netto) AS "Zysk"
FROM PLACOWKI, PRACOWNICY, WYNAJEM, RACHUNKI,WOJEWODZTWO,MIASTO
WHERE rachunki.id_wynajmu= wynajem.id_wynajmu AND pracownicy.id_pracownika = wynajem.id_pracownika AND placowki.id_placowki = pracownicy.id_placowki
AND placowki.id_miasta = miasto.id_miasta AND wojewodztwo.id_wojewodztwa = miasto.id_wojewodztwa
GROUP BY ROLLUP( wojewodztwo.wojewodztwo,miasto.miasto)
ORDER BY wojewodztwo.wojewodztwo;
//3.ROLLUP
SELECT model_marka.model,model_marka.marka, SUM(rachunki.wartosc_netto) AS "ZYSK" FROM POJAZDY,MODEL_MARKA, WYNAJEM, RACHUNKI
WHERE wynajem.id_wynajmu = rachunki.id_wynajmu AND wynajem.id_pojazdu = pojazdy.id_pojazdu AND pojazdy.id_model = model_marka.id_model 
GROUP BY ROLLUP(model_marka.marka,model_marka.model)
ORDER BY(ZYSK) DESC;
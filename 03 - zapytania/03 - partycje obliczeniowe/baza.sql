//1.PARTYCJE OBLICZENIOWE
SELECT DISTINCT model_marka.marka, opinie.ocena AS "Ocena", ROUND((100*COUNT(opinie.ocena)
OVER (PARTITION BY model_marka.marka, opinie.ocena)/COUNT(opinie.ocena)
OVER (PARTITION BY model_marka.marka)),2) AS "Procent"
FROM MODEL_MARKA,OPINIE,POJAZDY, WYNAJEM,KLIENCI 
WHERE model_marka.id_model = pojazdy.id_model AND pojazdy.id_pojazdu = wynajem.id_pojazdu 
AND wynajem.id_klienta = klienci.id_klienta AND klienci.id_klienta = opinie.id_klienta 
ORDER BY model_marka.marka, opinie.ocena;
//2.PARTYCJE OBLICZENIOWE
SELECT DISTINCT miasto.miasto, typ_platnosci.typ_platnosci AS "Rodzaj platnosci", ROUND((100*COUNT(typ_platnosci.typ_platnosci)
OVER (PARTITION BY miasto.miasto, typ_platnosci.typ_platnosci)/COUNT(typ_platnosci.typ_platnosci)
OVER (PARTITION BY miasto.miasto)),2) AS "Procent"
FROM  PLACOWKI, PRACOWNICY, WYNAJEM, RACHUNKI, TYP_PLATNOSCI,MIASTO
WHERE rachunki.id_typu = typ_platnosci.id_typu AND rachunki.id_wynajmu = wynajem.id_wynajmu AND wynajem.id_pracownika = pracownicy.id_pracownika AND pracownicy.id_placowki = placowki.id_placowki
AND miasto.id_miasta = placowki.id_miasta
ORDER BY miasto.miasto, typ_platnosci.typ_platnosci;
//3.PARTYCJE OBLICZENIOWE
SELECT DISTINCT wojewodztwo.wojewodztwo,  opinie.ocena AS "Ocena",COUNT(opinie.ocena) OVER(PARTITION BY wojewodztwo.wojewodztwo,opinie.ocena) AS "Ilosc danej oceny", 
ROUND((100*COUNT(opinie.ocena)OVER (PARTITION BY wojewodztwo.wojewodztwo, opinie.ocena)/COUNT(opinie.ocena)
OVER (PARTITION BY wojewodztwo.wojewodztwo)),2) AS "Procent[%]"
FROM PLACOWKI,PRACOWNICY,WYNAJEM,OPINIE,KLIENCI,MIASTO,WOJEWODZTWO
WHERE wynajem.id_klienta = klienci.id_klienta AND klienci.id_klienta = opinie.id_klienta 
AND wynajem.id_pracownika = pracownicy.id_pracownika AND pracownicy.id_placowki = placowki.id_placowki
AND miasto.id_miasta=placowki.id_placowki AND wojewodztwo.id_wojewodztwa = miasto.id_wojewodztwa
ORDER BY wojewodztwo.wojewodztwo
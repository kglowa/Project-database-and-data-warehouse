//1.Okna czasowe
SELECT MODEL_MARKA.marka,model_marka.model,opinie.ocena,opinie.data_wystawienia
FROM OPINIE,POJAZDY,MODEL_MARKA, KLIENCI, WYNAJEM
WHERE MODEL_MARKA.id_model = pojazdy.id_model AND pojazdy.id_pojazdu = wynajem.id_wynajmu 
AND wynajem.id_klienta = klienci.id_klienta AND opinie.id_klienta = klienci.id_klienta AND EXTRACT
(YEAR FROM opinie.data_wystawienia) BETWEEN 2019 AND EXTRACT (YEAR FROM SYSDATE)
ORDER BY MODEL_MARKA.marka,MODEL_MARKA.model;
//2.Okna czasowe
SELECT DISTINCT klienci.nazwisko as "Identyfikator klienta",
SUM(rachunki.wartosc_brutto) OVER (PARTITION BY klienci.nazwisko)
as "Wklad klienta do końca 2022r" FROM KLIENCI, WYNAJEM, RACHUNKI
WHERE wynajem.id_wynajmu = rachunki.id_wynajmu AND
klienci.id_klienta = wynajem.id_klienta AND EXTRACT(YEAR FROM wynajem.data_wyp)
BETWEEN EXTRACT (YEAR FROM SYSDATE) AND 2022
ORDER BY "Wklad klienta do końca 2022r" DESC;
//3.Okna czasowe
SELECT model_marka.marka,model_marka.marka AS "Identyfikator auta",przeglady.data_waznosci AS "Data waznosci przegladu",
SUM(przeglady.koszt) OVER (PARTITION BY przeglady.id_przeglad)  AS "Kwota do zapłaty"
FROM PRZEGLADY,POJAZDY,MODEL_MARKA, WYNAJEM
WHERE MODEL_MARKA.id_model = pojazdy.id_model AND pojazdy.id_pojazdu = wynajem.id_wynajmu AND
pojazdy.id_pojazdu = przeglady.id_pojazdu AND model_marka.id_model = pojazdy.id_model AND EXTRACT
(YEAR FROM przeglady.data_waznosci) BETWEEN EXTRACT (YEAR FROM SYSDATE) AND 2021
ORDER BY przeglady.data_waznosci;
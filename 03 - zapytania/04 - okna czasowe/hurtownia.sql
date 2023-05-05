SELECT h_pojazdy.marka,h_pojazdy.model,h_wynajem.ocena,h_opinie.data_wystawienia_opinii
FROM H_OPINIE,H_POJAZDY, H_WYNAJEM
WHERE h_wynajem.id_opinii = h_opinie.id_opinii AND h_wynajem.id_pojazdu = h_pojazdy.id_pojazdu AND EXTRACT
(YEAR FROM h_opinie.data_wystawienia_opinii) BETWEEN 2019 AND EXTRACT (YEAR FROM SYSDATE)
ORDER BY h_pojazdy.marka,h_pojazdy.model;

SELECT DISTINCT h_klienci.nazwisko as "Identyfikator klienta",
SUM(h_wynajem.zysk) OVER (PARTITION BY h_klienci.nazwisko)
as "Wklad klienta do końca 2022r" FROM H_KLIENCI, H_WYNAJEM
WHERE h_klienci.id_klienta = h_wynajem.id_klienta AND EXTRACT(YEAR FROM h_wynajem.data_wynajmu)
BETWEEN EXTRACT (YEAR FROM SYSDATE) AND 2022
ORDER BY "Wklad klienta do końca 2022r" DESC;

SELECT h_pojazdy.marka,h_pojazdy.marka AS "Identyfikator auta",h_przeglady.data_przegladu AS "Data waznosci przegladu",
SUM(h_wynajem.koszt_przegladu) OVER (PARTITION BY h_przeglady.id_przegladu)  AS "Kwota do zapłaty"
FROM H_POJAZDY, H_WYNAJEM, H_PRZEGLADY
WHERE h_wynajem.id_pojazdu = h_pojazdy.id_pojazdu AND h_wynajem.id_przegladu = h_przeglady.id_przegladu AND EXTRACT
(YEAR FROM h_przeglady.data_przegladu) BETWEEN EXTRACT (YEAR FROM SYSDATE) AND 2021
ORDER BY h_przeglady.data_przegladu;
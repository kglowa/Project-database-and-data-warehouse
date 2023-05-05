--H_PRZEGLAD
SELECT przeglady.id_przeglad, przeglady.data_waznosci FROM PRZEGLADY;
--H_OPINIE
SELECT o.id_opinii, o.data_wystawienia FROM OPINIE o;
--H_KLIENCI
SELECT k.id_klienta, k.imie, k.nazwisko FROM KLIENCI k;
--H_POJAZDY
SELECT p.id_pojazdu, m.model, m.marka FROM POJAZDY p, MODEL_MARKA m
WHERE p.id_model = m.id_model;
--H_PRACOWNICY
SELECT p.id_pracownika, p.imie, p.nazwisko FROM PRACOWNICY p;
--H_WOJEWODZTWO
SELECT w.id_wojewodztwa, w.wojewodztwo FROM WOJEWODZTWO w;
--H_MIASTO
SELECT m.id_miasta, m.miasto FROM MIASTO m;
--H_RACHUNKI
SELECT r.id_rachunku, t.typ_platnosci FROM RACHUNKI r, TYP_PLATNOSCI t
WHERE r.id_typu = t.id_typu
--H_WYNAJEM
SELECT w.id_wynajmu, w.id_pojazdu, w.id_klienta, w.id_pracownika,
przeg.id_przeglad,o.id_opinii,pl.id_miasta,o.ocena,woj.id_wojewodztwa,
r.wartosc_netto,r.id_rachunku,przeg.koszt,w.data_wyp 
FROM WYNAJEM w, POJAZDY p, PRACOWNICY pr, PRZEGLADY przeg, PLACOWKI pl, MIASTO m,
WOJEWODZTWO woj,RACHUNKI r, OPINIE o, KLIENCI k
WHERE w.id_pracownika = pr.id_pracownika AND
w.id_klienta = k.id_klienta AND
w.id_pojazdu = p.id_pojazdu AND
w.id_wynajmu = r.id_wynajmu AND
k.id_klienta = o.id_klienta AND
o.id_opinii = w.id_klienta AND
p.id_pojazdu = przeg.id_pojazdu AND
pr.id_placowki = pl.id_placowki AND
pl.id_miasta = m.id_miasta AND
woj.id_wojewodztwa = m.id_wojewodztwa
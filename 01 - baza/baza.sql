DROP TABLE DOKUMENTACJA_USLUGI CASCADE CONSTRAINTS;
--
DROP TABLE USLUGI CASCADE CONSTRAINTS;
--
DROP TABLE DOKUMENTACJA_SERWISU CASCADE CONSTRAINTS;
--
DROP TABLE RACHUNKI CASCADE CONSTRAINTS;
--
DROP TABLE TYP_PLATNOSCI CASCADE CONSTRAINTS;
--
DROP TABLE WYNAJEM CASCADE CONSTRAINTS;
--
DROP TABLE KLIENCI CASCADE CONSTRAINTS;
--
DROP TABLE OPINIE CASCADE CONSTRAINTS;
--
DROP TABLE CENNIK CASCADE CONSTRAINTS;
--
DROP TABLE PRZEGLADY CASCADE CONSTRAINTS;
--
DROP TABLE UBEZPIECZENIA CASCADE CONSTRAINTS;
--
DROP TABLE POJAZDY CASCADE CONSTRAINTS;
--
DROP TABLE MODEL_MARKA CASCADE CONSTRAINTS;
--
DROP TABLE GRAFIK CASCADE CONSTRAINTS;
--
DROP TABLE PRACOWNICY CASCADE CONSTRAINTS;
--
DROP TABLE PLACOWKI CASCADE CONSTRAINTS;
--
DROP TABLE MIASTO CASCADE CONSTRAINTS;
--
DROP TABLE WOJEWODZTWO CASCADE CONSTRAINTS;
--
DROP TABLE RODZAJ_UBEZPIECZENIA CASCADE CONSTRAINTS;
--
CREATE TABLE WOJEWODZTWO(
id_wojewodztwa NUMBER NOT NULL CONSTRAINT woj_pk PRIMARY KEY,
wojewodztwo VARCHAR2(50) NOT NULL
);
--
CREATE TABLE MIASTO(
id_miasta NUMBER NOT NULL CONSTRAINT miast_pk PRIMARY KEY,
id_wojewodztwa NUMBER NOT NULL CONSTRAINT miasto_woj_fk REFERENCES Wojewodztwo(id_wojewodztwa),
miasto VARCHAR2(50) NOT NULL
);
--
CREATE TABLE PLACOWKI(
id_placowki NUMBER NOT NULL CONSTRAINT plac_pk PRIMARY KEY,
id_miasta NUMBER NOT NULL CONSTRAINT miasto_pl_fk REFERENCES Miasto(id_miasta),
ulica VARCHAR2(35) NOT NULL,
numer VARCHAR2(25) NOT NULL
);
--
CREATE TABLE PRACOWNICY(
id_pracownika NUMBER NOT NULL CONSTRAINT pracownicy_pk PRIMARY KEY,
id_placowki NUMBER NOT NULL CONSTRAINT pr_pl_fk REFERENCES Placowki(id_placowki),
imie VARCHAR2(20) NOT NULL,
nazwisko VARCHAR2(20) NOT NULL,
stanowisko VARCHAR2(20) NOT NULL,
pensja NUMBER NOT NULL CONSTRAINT pensja CHECK(pensja>=1600),
numer_telefonu VARCHAR2(20),
data_zatrudnienia DATE NOT NULL
);
--
CREATE TABLE GRAFIK(
id_grafik NUMBER NOT NULL CONSTRAINT grafik_pk PRIMARY KEY,
id_pracownika NUMBER NOT NULL CONSTRAINT pr_gr_fk REFERENCES Pracownicy(id_pracownika),
data_grafik DATE NOT NULL,
zmiana NUMBER
);
--
CREATE TABLE MODEL_MARKA(
id_model NUMBER NOT NULL CONSTRAINT model_pk PRIMARY KEY,
marka VARCHAR2(20),
model VARCHAR2(20)
);
--
CREATE TABLE CENNIK(
id_cennik NUMBER NOT NULL CONSTRAINT cennik_pk PRIMARY KEY,
cena_za_24h NUMBER NOT NULL,
kaucja NUMBER NOT NULL
);
--
CREATE TABLE POJAZDY(
id_pojazdu NUMBER NOT NULL CONSTRAINT pojazd_pk PRIMARY KEY,
id_model NUMBER NOT NULL CONSTRAINT mod_poj_fk REFERENCES Model_marka(id_model),
id_cennik NUMBER NOT NULL CONSTRAINT poj_cen_fk REFERENCES Cennik(id_cennik),
przebieg NUMBER,
czy_dostepny VARCHAR2(3),
nr_rejestracyjny VARCHAR2(7)
);
--
CREATE TABLE KLIENCI(
id_klienta NUMBER NOT NULL CONSTRAINT klienci_pk PRIMARY KEY,
id_miasta NUMBER NOT NULL CONSTRAINT miasto_kl_fk REFERENCES Miasto(id_miasta),
imie VARCHAR2(20) NOT NULL,
nazwisko VARCHAR2(20) NOT NULL,
pesel VARCHAR2(11) NOT NULL,
numer_telefonu VARCHAR2(20),
adres_email VARCHAR2(45),
ulica VARCHAR2(45) NOT NULL,
numer VARCHAR2(10) NOT NULL,
nr_karty_kred VARCHAR2(16) NOT NULL
);
--
CREATE TABLE OPINIE(
id_opinii NUMBER NOT NULL CONSTRAINT opinia_pk PRIMARY KEY,
id_klienta NUMBER NOT NULL CONSTRAINT op_kl_fk REFERENCES Klienci(id_klienta),
ocena NUMBER NOT NULL CONSTRAINT ch_ocena CHECK((ocena>=0) AND (ocena<=5)),
data_wystawienia DATE NOT NULL
);
--
CREATE TABLE RODZAJ_UBEZPIECZENIA(
id_rodzaj_ubezp NUMBER NOT NULL CONSTRAINT rodz_ubez_pk PRIMARY KEY,
pakiet VARCHAR2(15),
rodzaj_ubezp VARCHAR2(50)
);
--
CREATE TABLE UBEZPIECZENIA(
id_ubezpieczenia NUMBER NOT NULL CONSTRAINT ubezpieczenia_pk PRIMARY KEY,
id_pojazdu NUMBER NOT NULL CONSTRAINT ub_poj_fk REFERENCES Pojazdy(id_pojazdu),
id_rodzaj_ubezp NUMBER NOT NULL CONSTRAINT ub_rodz_fk REFERENCES Rodzaj_ubezpieczenia(id_rodzaj_ubezp),
data_poczatku DATE NOT NULL,
data_konca DATE NOT NULL,
skladka_roczna NUMBER NOT NULL
);
--
CREATE TABLE PRZEGLADY(
id_przeglad NUMBER NOT NULL CONSTRAINT przeglady_pk PRIMARY KEY,
id_pojazdu NUMBER NOT NULL CONSTRAINT prz_poj_fk REFERENCES Pojazdy(id_pojazdu),
data_przegladu DATE,
data_waznosci DATE,
koszt NUMBER
);
--
CREATE TABLE WYNAJEM(
id_wynajmu NUMBER NOT NULL CONSTRAINT wynajem_pk PRIMARY KEY,
id_pojazdu NUMBER NOT NULL CONSTRAINT wyn_poj_fk REFERENCES Pojazdy(id_pojazdu),
id_klienta NUMBER NOT NULL CONSTRAINT kl_wyn_fk REFERENCES Klienci(id_klienta),
id_pracownika NUMBER NOT NULL CONSTRAINT pr_wyn_fk REFERENCES Pracownicy(id_pracownika),
data_wyp DATE NOT NULL,
data_zwrotu DATE
);
--
CREATE TABLE TYP_PLATNOSCI(
id_typu NUMBER NOT NULL CONSTRAINT typ_pk PRIMARY KEY,
typ_platnosci VARCHAR2(25)
);
--
CREATE TABLE RACHUNKI(
id_rachunku NUMBER NOT NULL CONSTRAINT rachunki_pk PRIMARY KEY,
id_wynajmu NUMBER NOT NULL CONSTRAINT wyn_rach_fk REFERENCES Wynajem(id_wynajmu),
id_typu NUMBER NOT NULL CONSTRAINT typ_rach_fk REFERENCES Typ_platnosci(id_typu),
wartosc_netto NUMBER,
wartosc_brutto NUMBER NOT NULL
);
--
CREATE TABLE DOKUMENTACJA_SERWISU(
id_dokumentacji NUMBER NOT NULL CONSTRAINT dok_pk PRIMARY KEY,
id_pojazdu NUMBER NOT NULL CONSTRAINT dok_poj_fk REFERENCES Pojazdy(id_pojazdu),
data_przyjecia DATE NOT NULL,
data_ukonczenia DATE
);
--
CREATE TABLE USLUGI(
id_uslugi NUMBER NOT NULL CONSTRAINT usl_pk PRIMARY KEY,
rodzaj_uslugi VARCHAR2(100),
cena_uslugi NUMBER NOT NULL
);
--
CREATE TABLE DOKUMENTACJA_USLUGI(
id_dokumentacji NUMBER NOT NULL CONSTRAINT dok_usl_fk REFERENCES Dokumentacja_serwisu(id_dokumentacji),
id_uslugi NUMBER NOT NULL CONSTRAINT usl_dok_fk REFERENCES Uslugi(id_uslugi)
);

DROP TABLE H_WYNAJEM CASCADE CONSTRAINTS;
--
DROP TABLE H_KLIENCI CASCADE CONSTRAINTS;
--
DROP TABLE H_POJAZDY CASCADE CONSTRAINTS;
--
DROP TABLE H_PRACOWNICY CASCADE CONSTRAINTS;
--
DROP TABLE H_WOJEWODZTWO CASCADE CONSTRAINTS;
--
DROP TABLE H_MIASTO CASCADE CONSTRAINTS;
--
DROP TABLE H_OPINIE CASCADE CONSTRAINTS;
--
DROP TABLE H_PRZEGLADY CASCADE CONSTRAINTS;
--
DROP TABLE H_RACHUNKI CASCADE CONSTRAINTS;





--
CREATE TABLE H_PRACOWNICY(
id_pracownika NUMBER NOT NULL CONSTRAINT h_pracownicy_pk PRIMARY KEY,
imie VARCHAR2(20) NOT NULL,
nazwisko VARCHAR2(20) NOT NULL
);
--
CREATE TABLE H_POJAZDY(
id_pojazdu NUMBER NOT NULL CONSTRAINT h_pojazd_pk PRIMARY KEY,
marka VARCHAR(30),
model VARCHAR(30)
);
--
CREATE TABLE H_KLIENCI(
id_klienta NUMBER NOT NULL CONSTRAINT h_klienci_pk PRIMARY KEY,
imie VARCHAR2(20) NOT NULL,
nazwisko VARCHAR2(20) NOT NULL
);

--
CREATE TABLE H_WOJEWODZTWO(
id_wojewodztwa NUMBER NOT NULL CONSTRAINT h_wojewo_pk PRIMARY KEY,
nazwa VARCHAR2(80) NOT NULL
);
--
CREATE TABLE H_MIASTO(
id_miasta NUMBER NOT NULL CONSTRAINT h_miasta_pk PRIMARY KEY,
nazwa VARCHAR2(80) NOT NULL
);
--
CREATE TABLE H_OPINIE(
id_opinii NUMBER NOT NULL CONSTRAINT h_opini_pk PRIMARY KEY,
data_wystawienia_opinii DATE
);
--
CREATE TABLE H_PRZEGLADY(
id_przegladu NUMBER NOT NULL CONSTRAINT h_przeg_pk PRIMARY KEY,
data_przegladu DATE
);
--
CREATE TABLE H_RACHUNKI(
id_rachunku NUMBER NOT NULL CONSTRAINT h_rachu_pk PRIMARY KEY,
typ VARCHAR(10)
);
--
CREATE TABLE H_WYNAJEM(
id_wynajem NUMBER NOT NULL CONSTRAINT h_wynajem_pk PRIMARY KEY,
id_pojazdu NUMBER NOT NULL CONSTRAINT h_wyn_poj_fk REFERENCES H_Pojazdy(id_pojazdu),
id_klienta NUMBER NOT NULL CONSTRAINT h_kl_wyn_fk REFERENCES H_Klienci(id_klienta),
id_pracownika NUMBER NOT NULL CONSTRAINT h_pr_wyn_fk REFERENCES H_Pracownicy(id_pracownika),
id_przegladu NUMBER NOT NULL CONSTRAINT h_prze_wyn_fk REFERENCES H_Przeglady(id_przegladu),
id_opinii NUMBER NOT NULL CONSTRAINT h_op_wyn_fk REFERENCES H_Opinie(id_opinii),
id_miasta NUMBER NOT NULL CONSTRAINT h_mias_wyn_fk REFERENCES H_Miasto(id_miasta),
id_wojewodztwa NUMBER NOT NULL CONSTRAINT h_woj_wyn_fk REFERENCES H_Wojewodztwo(id_wojewodztwa),
id_rachunku NUMBER NOT NULL CONSTRAINT h_rach_wyn_fk REFERENCES H_Rachunki(id_rachunku),
ocena NUMBER NOT NULL CONSTRAINT h_ch_ocena CHECK((ocena>=0) AND (ocena<=5)),
zysk NUMBER NOT NULL,
koszt_przegladu NUMBER NOT NULL,
data_wynajmu DATE
);
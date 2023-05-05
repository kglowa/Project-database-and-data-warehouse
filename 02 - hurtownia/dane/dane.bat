cd
sqlldr HR/hr@localhost control=h_rachunki.txt
sqlldr HR/hr@localhost control=h_przeglady.txt
sqlldr HR/hr@localhost control=h_miasto.txt
sqlldr HR/hr@localhost control=h_wojewodztwo.txt
sqlldr HR/hr@localhost control=h_opinie.txt
sqlldr HR/hr@localhost control=h_klienci.txt
sqlldr HR/hr@localhost control=h_pojazdy.txt
sqlldr HR/hr@localhost control=h_pracownicy.txt
sqlldr HR/hr@localhost control=h_wynajem.txt
del *.log
del *.bad
pause
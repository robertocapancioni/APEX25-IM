Oracle REVOKE

Introduzione: In questa lezione vediamo come utilizzare il comando REVOKE di Oracle per revocare privilegi di sistema e privilegi su oggetti a uno specifico utente.

Introduzione al comando REVOKE di Oracle
Il comando REVOKE serve per revocare privilegi di sistema e privilegi su oggetti assegnati a un utente. La sintassi di base è la seguente:

REVOKE {privilegio_di_sistema | privilegio_su_oggetto} FROM utente;

Spiegazione della sintassi:
- Prima si specificano i privilegi di sistema o di oggetto che si vogliono revocare.
- Poi si indica l’utente dal quale si vogliono revocare i privilegi.

Per revocare un privilegio di sistema, è necessario aver ricevuto quel privilegio con l’opzione ADMIN OPTION.

Per revocare un privilegio su oggetto, è necessario averlo precedentemente assegnato all’utente oppure avere il privilegio di sistema GRANT ANY OBJECT PRIVILEGE.

Inoltre, REVOKE può revocare solo privilegi assegnati direttamente tramite un comando GRANT. Non è possibile revocare con REVOKE privilegi concessi tramite il sistema operativo o tramite ruoli.

Per revocare tutti i privilegi di sistema da un utente, si può usare:

REVOKE ALL PRIVILEGES FROM utente;

Esempio pratico con Oracle REVOKE

1) Creare un utente bob e assegnare il privilegio di sistema CREATE SESSION per permettergli di accedere al database:

CREATE USER bob IDENTIFIED BY abcd1234;
GRANT CREATE SESSION TO bob;

2) Concedere a bob anche il privilegio di sistema CREATE TABLE:

GRANT CREATE TABLE TO bob;

3) Assegnare a bob i privilegi di oggetto SELECT, INSERT, UPDATE e DELETE sulla tabella ot.customers:

GRANT SELECT, INSERT, UPDATE, DELETE ON ot.customers TO bob;

A questo punto, bob può creare una nuova tabella nel suo schema e manipolare i dati nella tabella ot.customers.

4) Accedendo come bob, è possibile eseguire le seguenti istruzioni senza errori:

CREATE TABLE t1(id int);

SELECT 
    name
FROM 
    customers
ORDER BY 
    name
FETCH FIRST 5 ROWS ONLY;

Entrambe le query funzionano perché bob dispone dei privilegi necessari.

5) Revocare i privilegi di oggetto da bob:

REVOKE SELECT, INSERT, UPDATE, DELETE ON ot.customers FROM bob;

6) Se ora bob prova a selezionare dati dalla tabella ot.customers:

SELECT 
    name
FROM 
    customers
ORDER BY 
    name
FETCH FIRST 5 ROWS ONLY;

Oracle restituirà l’errore:
ORA-00942: table or view does not exist

Questo è corretto, perché bob non possiede più il privilegio SELECT sulla tabella ot.customers.

7) Revocare il privilegio di sistema CREATE TABLE da bob:

REVOKE CREATE TABLE FROM bob;

8) Se bob prova a creare una nuova tabella:

CREATE TABLE t2(id INT);

Riceverà l’errore:
ORA-01031: insufficient privileges

9) Se non vuoi più che bob acceda al database, puoi revocargli anche il privilegio CREATE SESSION:

REVOKE CREATE SESSION FROM bob;

Da questo momento, bob non potrà più accedere al database Oracle.



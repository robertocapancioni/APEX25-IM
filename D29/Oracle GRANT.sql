Oracle GRANT

Introduzione: In questa lezione vediamo come utilizzare il comando GRANT di Oracle per assegnare privilegi a uno specifico utente.

Panoramica sui privilegi in Oracle
Dopo aver creato un utente, è necessario stabilire quali azioni potrà compiere nel database.

Nel tutorial su CREATE USER, abbiamo usato il comando GRANT per concedere all’utente john il privilegio di sistema CREATE SESSION, necessario per consentire l’accesso al database Oracle:

GRANT CREATE SESSION TO john;

Cos’è un privilegio?
Un privilegio è il diritto di eseguire un’istruzione SQL o di accedere a un oggetto appartenente a un altro utente.

Oracle distingue due principali tipi di privilegi:
- Privilegi di sistema (system privileges)
- Privilegi sugli oggetti (object privileges)

Privilegi di sistema
I privilegi di sistema determinano cosa un utente può fare all’interno del database. Consentono, ad esempio, di creare tabelle, viste, procedure o di amministrare il database.  
I più importanti sono:
- CREATE SESSION
- CREATE TABLE
- CREATE VIEW
- CREATE PROCEDURE
- SYSDBA
- SYSOPER

Privilegi sugli oggetti
I privilegi sugli oggetti regolano le operazioni che un utente può effettuare su tabelle, viste o altri oggetti del database.  
Esempi comuni:
- INSERT
- UPDATE
- DELETE
- INDEX
- EXECUTE

Il comando GRANT
Il comando GRANT serve per assegnare uno o più privilegi a uno specifico utente. La sintassi base è:

GRANT {privilegi_di_sistema | privilegi_su_oggetti}
TO utente
[WITH ADMIN OPTION]

Dove:
- Dopo GRANT si indicano uno o più privilegi, separati da virgola.
- Dopo TO si indica l’utente che riceve i privilegi.
- L’opzione WITH ADMIN OPTION permette all’utente di concedere a sua volta quel privilegio ad altri utenti.

Nota: il comando GRANT si può usare anche con i ruoli (roles).

Esempi pratici

1) Concedere privilegi di sistema e di oggetto a un utente
Supponiamo di aver creato l’utente john e di avergli concesso CREATE SESSION:

CREATE USER john IDENTIFIED BY abcd1234;
GRANT CREATE SESSION TO john;

Se john prova a creare una tabella:
CREATE TABLE t1(id NUMBER PRIMARY KEY);

Riceverà l’errore:
ORA-01031: insufficient privileges

Per consentirgli di creare tabelle:
GRANT CREATE TABLE TO john;

Ora john potrà creare la tabella senza errori.

Per visualizzare i privilegi dell’utente attuale:
SELECT * FROM session_privs;

Risultato di esempio:
PRIVILEGE
------------------
CREATE SESSION
CREATE TABLE

Se john prova a inserire dati nella tabella t1:
INSERT INTO t1(id) VALUES(10);

Può ricevere l’errore:
ORA-01950: no privileges on tablespace 'USERS'

Questo perché non ha quota sulla tablespace USERS.  
Per risolvere:
ALTER USER john QUOTA UNLIMITED ON USERS;

Dopo questa operazione, john potrà inserire e leggere dati:

INSERT INTO t1(id) VALUES(10);
SELECT * FROM t1;

Risultato:
   ID
-----
   10

2) Utilizzo di WITH ADMIN OPTION
Creiamo un nuovo utente jack e assegniamogli CREATE SESSION:

CREATE USER jack IDENTIFIED BY abcd1234
    QUOTA UNLIMITED ON users;
GRANT CREATE SESSION TO jack;

Concediamo a john il privilegio CREATE TABLE con opzione amministrativa:
GRANT CREATE TABLE TO john WITH ADMIN OPTION;

Ora john può a sua volta concedere CREATE TABLE a jack:
GRANT CREATE TABLE TO jack;

jack ora può creare tabelle nel suo schema:
CREATE TABLE t2(id NUMBER PRIMARY KEY);

3) Privilegi ANY
Alcuni privilegi includono la parola chiave ANY e permettono di agire su oggetti di qualsiasi schema.  
Ad esempio, SELECT ANY TABLE permette di selezionare dati da qualsiasi tabella.

Se jack prova a eseguire:
SELECT * FROM john.t1;
Riceverà:
ORA-00942: table or view does not exist

L’amministratore può concedere il privilegio:
GRANT SELECT ANY TABLE TO jack;

Ora jack può leggere dati da t1 nello schema di john.

4) Concedere privilegi su oggetti specifici
Come amministratore, creiamo una tabella t2 e inseriamo dei dati:
CREATE TABLE t2(id INT);
INSERT INTO t2(id) VALUES(1);
INSERT INTO t2(id) VALUES(2);

Se john prova a leggere dati da ot.t2:
SELECT * FROM ot.t2;

Ottiene:
ORA-00942: table or view does not exist

Concediamo a john il privilegio SELECT sulla tabella:
GRANT SELECT ON ot.t2 TO john;

Ora john potrà leggere dati:
SELECT * FROM ot.t2

Se vuole inserire dati e non ha il privilegio, otterrà:
ORA-01031: insufficient privileges

Per consentire anche insert e update:
GRANT INSERT, UPDATE ON ot.t2 TO john;

Ora john può inserire e modificare dati nella tabella.



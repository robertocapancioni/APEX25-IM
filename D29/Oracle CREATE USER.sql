Oracle CREATE USER

Introduzione al comando CREATE USER
Il comando CREATE USER permette di creare un nuovo utente all’interno del database Oracle. L’utente così creato potrà accedere (previo rilascio dei privilegi) e lavorare con gli oggetti del database.

Sintassi base
La sintassi di base per creare un utente è la seguente:

CREATE USER nome_utente
    IDENTIFIED BY password
    [DEFAULT TABLESPACE tablespace]
    [QUOTA {dimensione | UNLIMITED} ON tablespace]
    [PROFILE profilo]
    [PASSWORD EXPIRE]
    [ACCOUNT {LOCK | UNLOCK}];

Spiegazione delle clausole:
- CREATE USER nome_utente: specifica il nome del nuovo utente.
- IDENTIFIED BY password: imposta la password che l’utente dovrà usare per accedere.
- DEFAULT TABLESPACE: specifica la tablespace di default in cui verranno creati gli oggetti dell’utente (tabelle, viste, ecc.). Se non indicato, Oracle usa la tablespace predefinita del database (tipicamente USERS, o SYSTEM se non esiste una tablespace predefinita).
- QUOTA: definisce lo spazio massimo che l’utente può usare nella tablespace specificata. Si può usare UNLIMITED per non imporre limiti.
- PROFILE profilo: consente di assegnare un profilo di risorse e regole per la password all’utente. Se omesso, viene usato il profilo DEFAULT.
- PASSWORD EXPIRE: forza l’utente a cambiare la password al primo accesso.
- ACCOUNT {LOCK | UNLOCK}: permette di bloccare (LOCK) o sbloccare (UNLOCK) l’account dell’utente.

Nota: Per eseguire CREATE USER bisogna avere il privilegio di sistema corrispondente.

Privilegi dopo la creazione dell’utente
Un utente appena creato non può accedere al database finché non riceve il privilegio CREATE SESSION.
Per concederlo si usa:

GRANT CREATE SESSION TO nome_utente;

Esempi pratici

sqlplus sys@freepdb1 as sysdba

1. Creazione di un nuovo utente locale
CREATE USER john IDENTIFIED BY abcd1234;

Risultato:
User JOHN created.

Nota: L’utente può essere visualizzato con la seguente query:
SELECT username, default_tablespace, profile, authentication_type
FROM dba_users
WHERE account_status = 'OPEN';

Se provi a collegarti senza aver concesso CREATE SESSION, otterrai:
ORA-01045: user JOHN lacks CREATE SESSION privilege; logon denied


sqlplus john/abcd1234@localhost:1521/freepdb1
sqlplus john/abcd1234@freepdb1



Per abilitarlo all’accesso:
GRANT CREATE SESSION TO john;

Ora l’utente potrà accedere con le proprie credenziali.

2. Creazione di un utente con password scaduta
CREATE USER jane IDENTIFIED BY abcd1234 PASSWORD EXPIRE;

Verifica la creazione dell’utente come sopra.

Concedi il privilegio di accesso:
GRANT CREATE SESSION TO jane;

sqlplus jane/abcd1234@freepdb1
Se l’utente prova a collegarsi, Oracle chiederà subito di cambiare la password:
ORA-28001: the password has expired

L’utente dovrà scegliere una nuova password al primo login.

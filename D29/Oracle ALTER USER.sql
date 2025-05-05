Oracle ALTER USER

Introduzione: In questa lezione imparerai come utilizzare il comando ALTER USER di Oracle per modificare l’autenticazione o le risorse di database associate a un utente.

Il comando ALTER USER permette di cambiare le caratteristiche di autenticazione o le risorse di database di un utente.  
Generalmente, per eseguire ALTER USER occorre avere il privilegio di sistema ALTER USER. Tuttavia, ogni utente può cambiare la propria password usando ALTER USER senza possedere questo privilegio di sistema.

Esempio: creiamo un utente chiamato dolphin e concediamogli il privilegio di sistema CREATE SESSION:

CREATE USER dolphin IDENTIFIED BY abcd1234;
GRANT CREATE SESSION TO dolphin;

1) Cambiare la password di un utente con ALTER USER
Per modificare la password dell’utente dolphin:
ALTER USER dolphin IDENTIFIED BY xyz123;

Ora l’utente dolphin potrà autenticarsi con la nuova password xyz123.

2) Bloccare/Sbloccare un utente con ALTER USER
Per bloccare l’utente dolphin:
ALTER USER dolphin ACCOUNT LOCK;

Se provi ad accedere come dolphin otterrai:
ORA-28000: the account is locked

Per sbloccare l’utente:
ALTER USER dolphin ACCOUNT UNLOCK;

Ora dolphin potrà di nuovo accedere al database.

3) Impostare la password scaduta per un utente
Per impostare la password di dolphin come scaduta:
ALTER USER dolphin PASSWORD EXPIRE;

Al prossimo accesso, Oracle segnalerà la password scaduta:
ORA-28001: the password has expired

A quel punto sarà richiesto all’utente di cambiare password.

4) Assegnare un profilo a un utente con ALTER USER
Per vedere il profilo attuale dell’utente dolphin:
SELECT username, profile FROM dba_users WHERE username ='DOLPHIN';

Se crei un utente senza specificare un profilo, Oracle assegna il profilo DEFAULT.

Per creare un nuovo profilo ocean:
CREATE PROFILE ocean LIMIT
    SESSIONS_PER_USER          UNLIMITED 
    CPU_PER_SESSION            UNLIMITED 
    CPU_PER_CALL               3000 
    CONNECT_TIME               60;

Per assegnarlo all’utente dolphin:
ALTER USER dolphin PROFILE ocean;

Ora il profilo di default di dolphin è ocean.

5) Impostare ruoli di default per un utente con ALTER USER
Se verifichi i ruoli dell’utente dolphin:
SELECT * FROM session_roles;

Di default, nessun ruolo è assegnato.

Per creare un ruolo rescue (sessione utente OT):
CREATE ROLE rescue;
GRANT CREATE TABLE, CREATE VIEW TO rescue;

Concedi questo ruolo a dolphin:
GRANT rescue TO dolphin;

Dopo aver effettuato l’accesso, dolphin avrà il ruolo rescue come ruolo di default:
SELECT * FROM session_roles;

Risultato:
ROLE
---------
RESCUE

Per creare un altro ruolo super e assegnargli tutti i privilegi:
CREATE ROLE super;
GRANT ALL PRIVILEGES TO super;

Assegna il ruolo super a dolphin:
GRANT super TO dolphin;

Imposta il ruolo di default per dolphin su super:
ALTER USER dolphin DEFAULT ROLE super;

Dopo la disconnessione e un nuovo accesso come dolphin:
SELECT * FROM session_roles;

Risultato:
ROLE
---------
SUPER

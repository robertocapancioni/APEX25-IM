
# Oracle `CREATE ROLE`: Creare Ruoli nel Database

## Introduzione

Un **ruolo** in Oracle è un insieme di **privilegi**. Invece di assegnare singolarmente i privilegi agli utenti, è più efficiente creare un ruolo con i privilegi necessari e assegnare quel ruolo agli utenti.

Questo facilita la **gestione centralizzata dei permessi**.

## Sintassi Base

```sql
CREATE ROLE nome_ruolo
[IDENTIFIED BY password]
[NOT IDENTIFIED];
```

- `nome_ruolo`: nome del ruolo da creare.
- `IDENTIFIED BY password`: obbliga chi attiva il ruolo a fornire una password.
- `NOT IDENTIFIED`: indica che non serve alcuna password per attivare il ruolo.

⚠️ Un ruolo appena creato **non ha privilegi**. È necessario assegnarli con `GRANT`.

## Assegnare Privilegi a un Ruolo

```sql
GRANT {privilegi_di_sistema | privilegi_sugli_oggetti} TO nome_ruolo;
```

È anche possibile assegnare un ruolo a un altro ruolo:

```sql
GRANT nome_ruolo TO altro_ruolo;
```

---

## Esempio 1: Creare un Ruolo Senza Password

Creazione del ruolo `mdm` (master data management):

```sql
CREATE ROLE mdm;
```

Assegnare privilegi su varie tabelle:

```sql
GRANT SELECT, INSERT, UPDATE, DELETE ON customers TO mdm;
GRANT SELECT, INSERT, UPDATE, DELETE ON contacts TO mdm;
GRANT SELECT, INSERT, UPDATE, DELETE ON products TO mdm;
GRANT SELECT, INSERT, UPDATE, DELETE ON product_categories TO mdm;
GRANT SELECT, INSERT, UPDATE, DELETE ON warehouses TO mdm;
GRANT SELECT, INSERT, UPDATE, DELETE ON locations TO mdm;
GRANT SELECT, INSERT, UPDATE, DELETE ON employees TO mdm;
```

Creazione dell’utente `alice`:

```sql
CREATE USER alice IDENTIFIED BY abcd1234;
GRANT CREATE SESSION TO alice;
```

Se `alice` prova a interrogare:

```sql
SELECT * FROM ot.employees;
```

riceverà errore:

```
ORA-00942: table or view does not exist
```

Ora, assegnare il ruolo a `alice`:

```sql
GRANT mdm TO alice;
```

Attivare il ruolo nella sessione di `alice`:

```sql
SET ROLE mdm;
```

Verificare i ruoli attivi:

```sql
SELECT * FROM session_roles;
```

Risultato:

```
ROLE
-----
MDM
```

Ora `alice` può lavorare sulle tabelle `customers`, `employees`, ecc.

---

## Esempio 2: Creare un Ruolo con Password

Creazione del ruolo `order_entry` con password:

```sql
CREATE ROLE order_entry IDENTIFIED BY xyz123;
```

Assegnare privilegi su `orders` e `order_items`:

```sql
GRANT SELECT, INSERT, UPDATE, DELETE ON orders TO order_entry;
GRANT SELECT, INSERT, UPDATE, DELETE ON order_items TO order_entry;
```

Assegnare il ruolo a `alice`:

```sql
GRANT order_entry TO alice;
```

Attivare i ruoli `order_entry` (con password) e `mdm`:

```sql
SET ROLE 
    order_entry IDENTIFIED BY xyz123,
    mdm;
```

Verificare i ruoli attivi:

```sql
SELECT * FROM session_roles;
```

Risultato:

```
ROLE
-------------
MDM
ORDER_ENTRY
```

---

## Conclusione

Con `CREATE ROLE` puoi:

- Centralizzare la gestione dei privilegi
- Assegnare ruoli a utenti o altri ruoli
- Proteggere l’accesso ai ruoli con password

È uno strumento essenziale per una **gestione sicura e ordinata dei permessi** in Oracle.


Ruoli di default
Puoi controllare i ruoli attivi automaticamente con:

```sql
SELECT * FROM dba_role_privs WHERE grantee = 'NOME_UTENTE';
```
Per rendere un ruolo attivo automaticamente all’avvio della sessione, si usa:

```sql
ALTER USER nome_utente DEFAULT ROLE nome_ruolo;
```
Oppure per attivare tutti i ruoli assegnati:

```sql
ALTER USER nome_utente DEFAULT ROLE ALL;
```
Se invece vuoi evitare che venga attivato in automatico (es. per ruoli protetti da password):

```sql
ALTER USER nome_utente DEFAULT ROLE NONE;
```
Esempio completo
```sql
GRANT mdm TO alice;

ALTER USER alice DEFAULT ROLE mdm;
```
In questo modo, alice avrà il ruolo mdm attivo a ogni login, senza dover usare SET ROLE.
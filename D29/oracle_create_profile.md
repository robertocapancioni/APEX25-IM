
# Oracle `CREATE PROFILE`: Creare Profili Utente

## Introduzione

In Oracle, un **profilo utente** è un insieme di **limiti** che si possono applicare:

- alle **risorse** che l’utente può usare nel database,
- e alla **gestione della password** (es. durata, tentativi falliti, riutilizzo ecc.).

Una volta assegnato un profilo a un utente, Oracle applica automaticamente questi limiti.

## Sintassi Base

```sql
CREATE PROFILE nome_profilo
LIMIT parametri_risorse_o_password;
```

- `nome_profilo`: nome del profilo.
- `LIMIT`: elenco di limiti da applicare (risorse o password).

---

## Parametri Relativi alle Risorse

| Parametro               | Descrizione |
|-------------------------|-------------|
| `SESSIONS_PER_USER`     | Sessioni contemporanee massime per utente. |
| `CPU_PER_SESSION`       | Tempo CPU massimo per sessione (centesimi di secondo). |
| `CPU_PER_CALL`          | Tempo CPU massimo per operazione (es. query). |
| `CONNECT_TIME`          | Durata massima della sessione (in minuti). |
| `IDLE_TIME`             | Tempo massimo di inattività (in minuti). |
| `LOGICAL_READS_PER_SESSION` | Blocchi letti totali in una sessione. |
| `LOGICAL_READS_PER_CALL`    | Blocchi letti per ogni operazione SQL. |
| `PRIVATE_SGA`           | Memoria privata massima nella SGA. |
| `COMPOSITE_LIMIT`       | Limite composito totale (CPU + tempo + letture + memoria). |

---

## Parametri Relativi alla Password

| Parametro               | Descrizione |
|-------------------------|-------------|
| `FAILED_LOGIN_ATTEMPTS` | Tentativi falliti prima del blocco dell’account (default: 10). |
| `PASSWORD_LIFE_TIME`    | Durata della password (default: 180 giorni). |
| `PASSWORD_REUSE_TIME`   | Giorni da attendere prima di riusare una password. |
| `PASSWORD_REUSE_MAX`    | Numero minimo di password diverse prima del riutilizzo. |
| `PASSWORD_LOCK_TIME`    | Durata del blocco dell’account (default: 1 giorno). |
| `PASSWORD_GRACE_TIME`   | Giorni di avviso prima che la password scada (default: 7). |

> ⚠️ È necessario il privilegio `CREATE PROFILE` per creare nuovi profili.

---

## Verificare il Profilo di un Utente

```sql
SELECT username, profile
FROM dba_users
WHERE username = 'OT';
```

Il profilo predefinito è `DEFAULT`. Per visualizzare i limiti del profilo DEFAULT:

```sql
SELECT *
FROM dba_profiles
WHERE profile = 'DEFAULT'
ORDER BY resource_type, resource_name;
```

---

## Esempio 1: Profilo con Limiti sulle Risorse

```sql
CREATE PROFILE CRM_USERS LIMIT 
    SESSIONS_PER_USER     UNLIMITED
    CPU_PER_SESSION       UNLIMITED 
    CPU_PER_CALL          3000 
    CONNECT_TIME          15;
```

Creazione utente con il profilo:

```sql
CREATE USER crm IDENTIFIED BY abcd1234
PROFILE crm_users;
```

Verifica:

```sql
SELECT username, profile
FROM dba_users
WHERE username = 'CRM';
```

**Effetti:**
- Sessioni illimitate.
- Nessun limite CPU per sessione.
- Massimo 30 secondi di CPU per ogni chiamata.
- Sessione dura massimo 15 minuti.

---

## Esempio 2: Profilo con Limiti sulla Password

```sql
CREATE PROFILE erp_users LIMIT
    FAILED_LOGIN_ATTEMPTS 5
    PASSWORD_LIFE_TIME    90;
```

Creazione utente:

```sql
CREATE USER sap IDENTIFIED BY abcd1234
PROFILE erp_users;
```

**Effetti:**
- Account bloccato dopo 5 tentativi falliti.
- Password da cambiare ogni 90 giorni.

---

## Conclusione

Il comando `CREATE PROFILE` consente di definire:

- Limiti di **risorse** per evitare sovraccarichi.
- Regole di **sicurezza** per le password.

È uno strumento utile per migliorare la **gestione utenti** e la **sicurezza** in ambienti Oracle.

---

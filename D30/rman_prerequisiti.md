
# ✅ Prerequisiti per l'utilizzo di RMAN (Recovery Manager)

## 🔐 1. Connessione al database target
- RMAN deve potersi connettere al database da proteggere.
- È possibile connettersi come:
  - `SYSDBA`
  - `SYSBACKUP` (consigliato da Oracle per backup)

## 👤 2. Privilegi utente
- L'utente deve avere privilegi adeguati:
  - `SYSDBA` per operazioni complete di backup/recovery
  - `SYSBACKUP` se si vogliono limitare i privilegi solo alle operazioni di RMAN

## 🔄 3. Modalità ARCHIVELOG
- Per eseguire backup con database attivo (a caldo), il database deve essere in modalità `ARCHIVELOG`.
- Verifica con:
  ```sql
  ARCHIVE LOG LIST;
  ```

## 💽 4. Spazio e directory per backup
- Deve essere disponibile una directory dove salvare i backup:
  - Flash Recovery Area (FRA) configurata
  - oppure una directory manuale specificata con `FORMAT`

## 🔧 5. Autenticazione del sistema operativo
- Su Linux/Unix:
  - L’utente deve appartenere al gruppo `dba` (o equivalente)
- Su Windows:
  - L’utente deve appartenere al gruppo `ORA_DBA`

## 🧩 6. Listener attivo (per connessioni remote)
- Il listener Oracle deve essere in esecuzione per permettere connessioni da client RMAN.
- Verifica con:
  ```bash
  lsnrctl status
  ```

## 📦 7. Compatibilità delle versioni
- Il client RMAN deve essere:
  - della **stessa versione** del database
  - oppure di una **versione inferiore o uguale** (mai superiore)

## 📚 8. (Opzionale) Recovery Catalog
- Può essere configurato un catalogo esterno (altro database) per salvare i metadati dei backup.
- Richiede:
  - Database di catalogo creato
  - Utente dedicato e schema registrato

## 🔄 9. Database in stato appropriato
- Per eseguire diverse operazioni:
  - **Backup a caldo**: database deve essere **OPEN**
  - **Backup a freddo**: database deve essere **MOUNTED**
  - **Recovery completo**: stato **MOUNTED**, poi `ALTER DATABASE OPEN`

## 🛑 10. File di configurazione accessibili
- `spfile` e `controlfile` devono essere accessibili e salvabili da RMAN.
- Puoi eseguire:
  ```sql
  SHOW PARAMETER control_files;
  SHOW PARAMETER spfile;
  ```

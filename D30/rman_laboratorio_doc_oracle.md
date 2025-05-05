
# 🧪 Laboratorio RMAN - Basato sulla Documentazione Ufficiale Oracle

## 🎯 Obiettivo
Eseguire una serie di operazioni pratiche con RMAN seguendo esempi e scenari tratti dalla documentazione Oracle.

---

## 🔧 Prerequisiti
- Database Oracle in esecuzione (preferibilmente in modalità ARCHIVELOG)
- Accesso CLI con privilegi SYSDBA o SYSBACKUP
- RMAN client installato (`rman`)

---

## 🟢 FASE 1 – Avvio RMAN e connessione al database

### ✅ Comandi:
```bash
rman target /
```
oppure:
```bash
rman target sys/password@tns_alias
```

---

## 📋 FASE 2 – Verifica della configurazione RMAN

```sql
SHOW ALL;
```

Visualizza la configurazione corrente del backup.

---

## 💾 FASE 3 – Esecuzione di un backup completo

```sql
BACKUP DATABASE;
```

Per includere anche gli archivelog:
```sql
BACKUP DATABASE PLUS ARCHIVELOG;
```

Per creare un'immagine copia:
```sql
BACKUP AS COPY DATABASE;
```

---

## 🧱 FASE 4 – Backup incrementale

### Livello 0:
```sql
BACKUP INCREMENTAL LEVEL 0 DATABASE;
```

### Livello 1 (differenziale):
```sql
BACKUP INCREMENTAL LEVEL 1 DATABASE;
```

### Livello 1 cumulativo:
```sql
BACKUP INCREMENTAL LEVEL 1 CUMULATIVE DATABASE;
```

---

## 📁 FASE 5 – Uso di FORMAT e TAG

```sql
BACKUP
  FORMAT '/u01/backup/db_%U.bkp'
  TAG 'weekly_full'
  DATABASE;
```

---

## 🔎 FASE 6 – Validazione backup

```sql
BACKUP VALIDATE CHECK LOGICAL DATABASE ARCHIVELOG ALL;
```

---

## 🔄 FASE 7 – Restore e Recover

### Ripristino database:
```sql
STARTUP MOUNT;
RESTORE DATABASE;
RECOVER DATABASE;
ALTER DATABASE OPEN;
```

### Ripristino tablespace:
```sql
ALTER TABLESPACE users OFFLINE;
RESTORE TABLESPACE users;
RECOVER TABLESPACE users;
ALTER TABLESPACE users ONLINE;
```

---

## ⏳ FASE 8 – Point-in-Time Recovery

```sql
RUN {
  SET UNTIL TIME "TO_DATE('2025-05-01 10:00:00','YYYY-MM-DD HH24:MI:SS')";
  RESTORE DATABASE;
  RECOVER DATABASE;
  ALTER DATABASE OPEN RESETLOGS;
}
```

---

## 🧠 FASE 9 – RMAN scripting

### File `rman_script.rcv`:
```text
CONNECT TARGET /
BACKUP DATABASE PLUS ARCHIVELOG;
LIST BACKUP;
EXIT;
```

### Esecuzione:
```bash
rman @/path/rman_script.rcv
```

---

## 📊 FASE 10 – Report e pulizia

### Elenco backup:
```sql
LIST BACKUP;
```

### Report configurazione:
```sql
REPORT OBSOLETE;
DELETE OBSOLETE;
```

### Crosscheck:
```sql
CROSSCHECK BACKUP;
DELETE EXPIRED BACKUP;
```

---

## 🧪 FASE 11 – Flashback database (se configurato)

```sql
FLASHBACK DATABASE TO TIMESTAMP TO_DATE('2025-05-01 10:00:00','YYYY-MM-DD HH24:MI:SS');
```

---

## ✅ Conclusione

Hai sperimentato i comandi fondamentali e avanzati di RMAN così come descritti nella documentazione ufficiale Oracle, eseguendo backup, restore, recovery, report, validazioni, e flashback.


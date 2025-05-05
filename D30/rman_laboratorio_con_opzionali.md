
# 🧪 Laboratorio RMAN con Esercizi e Parti Opzionali Evidenziate

## 🎯 Obiettivo
Comprendere le operazioni fondamentali di RMAN distinguendo tra componenti ESSENZIALI e OPZIONALI, attraverso esercizi guidati.

---

## 🔧 Prerequisiti
- Oracle Database 23c (o simile) installato
- Modalità ARCHIVELOG attiva
- Accesso CLI a `rman`
- Privilegi SYSDBA o SYSBACKUP

---

## 🧩 Esercizio 1 – Connessione e verifica ambiente

### ✅ Comandi:
```bash
rman target /
```

```sql
ARCHIVE LOG LIST;
```

### 🎓 Obiettivo:
Verificare se il database è in modalità ARCHIVELOG (**opzionale ma raccomandata per backup a caldo**).

---

## 💾 Esercizio 2 – Backup completo del database (ESSENZIALE)

```sql
BACKUP DATABASE;
```

### 🎓 Obiettivo:
Eseguire un backup fisico completo (backup set predefinito).

---

## 🧱 Esercizio 3 – Backup di SPFILE e Control File (ESSENZIALI)

```sql
BACKUP SPFILE;
BACKUP CURRENT CONTROLFILE;
```

---

## 📁 Esercizio 4 – Backup in FRA (**OPZIONALE ma consigliato**)

### ✅ Comandi:
```sql
SHOW PARAMETER db_recovery_file_dest;
```

### 🎓 Obiettivo:
Verificare se è configurata una Fast Recovery Area (FRA). In alternativa, usare FORMAT:

```sql
BACKUP DATABASE FORMAT '/u01/backup/db_%U.bkp';
```

---

## 🔄 Esercizio 5 – Backup incrementale

### ✅ Livello 0 (completo):
```sql
BACKUP INCREMENTAL LEVEL 0 DATABASE;
```

### ✅ Livello 1 (solo modifiche):
```sql
BACKUP INCREMENTAL LEVEL 1 DATABASE;
```

---

## 🧩 Esercizio 6 – Backup degli Archived Redo Log (**OPZIONALE, richiesto per recovery point-in-time**)

```sql
BACKUP ARCHIVELOG ALL;
```

---

## 🔍 Esercizio 7 – Validazione dei backup (ESSENZIALE)

```sql
RESTORE VALIDATE DATABASE;
VALIDATE BACKUPSET 1;
```

---

## 🧪 Esercizio 8 – Simulazione perdita tablespace

### ✅ Step:
1. Prendere offline il tablespace:
```sql
ALTER TABLESPACE users OFFLINE IMMEDIATE;
```

2. Rimuovere fisicamente il file:
```bash
rm /opt/oracle/oradata/FREE/users01.dbf
```

---

## 🔁 Esercizio 9 – Ripristino tablespace (ESSENZIALE)

```sql
STARTUP MOUNT;
RESTORE TABLESPACE users;
RECOVER TABLESPACE users;
ALTER DATABASE OPEN;
```

---

## ⏳ Esercizio 10 – Point-in-Time Recovery (**OPZIONALE**)

```sql
RUN {
  SET UNTIL TIME "TO_DATE('2025-05-05 10:00:00','YYYY-MM-DD HH24:MI:SS')";
  RESTORE DATABASE;
  RECOVER DATABASE;
}
```

---

## 🧽 Esercizio 11 – Pulizia backup obsoleti

```sql
REPORT OBSOLETE;
DELETE OBSOLETE;
```

---

## 📜 Esercizio 12 – Uso di retention policy (ESSENZIALE)

```sql
CONFIGURE RETENTION POLICY TO REDUNDANCY 2;
SHOW RETENTION POLICY;
```

---

## 🧵 Esercizio 13 – Allocazione di channel (**OPZIONALE, per tuning**)

```sql
RUN {
  ALLOCATE CHANNEL ch1 DEVICE TYPE DISK;
  BACKUP DATABASE;
  RELEASE CHANNEL ch1;
}
```

---

## 🧠 Conclusione

Hai eseguito operazioni fondamentali di backup, restore e recovery con RMAN, distinguendo chiaramente le parti essenziali da quelle opzionali, utili in scenari avanzati o complessi.

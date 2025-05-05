
# 🧪 Laboratorio completo: Utilizzo di RMAN

## 📝 Obiettivo
Eseguire una serie completa di operazioni con RMAN: backup, restore e recovery del database Oracle in modalità ARCHIVELOG.

---

## 🧰 Requisiti
- Oracle Database installato (consigliato: Oracle 23c Free)
- Modalità ARCHIVELOG attiva
- Accesso CLI a RMAN (`rman target /`)
- Utente con privilegi SYSDBA o SYSBACKUP

---

## 🔹 STEP 1 – Backup completo del database

### ✅ Comando:
```bash
rman target /
```
```sql
BACKUP DATABASE;
```

### 🔍 Verifica:
Controlla la directory di backup e i log per conferma.

---

## 🔹 STEP 2 – Backup del control file e dello SPFILE

```sql
BACKUP CURRENT CONTROLFILE;
BACKUP SPFILE;
```

---

## 🔹 STEP 3 – Backup incrementale

### 🔁 Livello 0 (base)
```sql
BACKUP INCREMENTAL LEVEL 0 DATABASE;
```

### 🔁 Livello 1 (solo modifiche dal livello 0)
```sql
BACKUP INCREMENTAL LEVEL 1 DATABASE;
```

---

## 🔹 STEP 4 – Validazione backup

```sql
RESTORE VALIDATE DATABASE;
```

---

## 🔹 STEP 5 – Simulazione perdita tablespace

### ⚠️ Attenzione: eseguire solo in ambiente di test!
```sql
ALTER TABLESPACE users OFFLINE IMMEDIATE;
```

### Da terminale:
```bash
rm /opt/oracle/oradata/FREE/users01.dbf
```

---

## 🔹 STEP 6 – Ripristino tablespace

```sql
STARTUP MOUNT;
RESTORE TABLESPACE users;
RECOVER TABLESPACE users;
ALTER DATABASE OPEN;
```

---

## 🔹 STEP 7 – Recovery fino a un punto nel tempo (facoltativo)

### Imposta un tempo specifico:
```sql
RUN {
  SET UNTIL TIME "TO_DATE('2025-05-05 10:30:00','YYYY-MM-DD HH24:MI:SS')";
  RESTORE DATABASE;
  RECOVER DATABASE;
}
```

---

## 🔹 STEP 8 – Script automatico di backup

### `backup_rman.sh`:
```bash
#!/bin/bash
rman target / <<EOF
BACKUP DATABASE PLUS ARCHIVELOG DELETE INPUT;
EXIT;
EOF
```

---

## 🔚 Conclusione

Con questo laboratorio hai eseguito un ciclo completo:
- Backup completo e incrementale
- Validazione e restore
- Recovery point-in-time
- Automazione del backup


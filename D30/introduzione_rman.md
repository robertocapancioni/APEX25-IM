
# 🧭 Introduzione a RMAN – Recovery Manager

## Cos'è RMAN?
**RMAN (Recovery Manager)** è uno strumento a riga di comando fornito da Oracle che consente di:
- Eseguire **backup** (completi o incrementali)
- Ripristinare (**restore**) file di database
- Recuperare (**recover**) dati in caso di perdita, corruzione o errore umano
- Automatizzare la **strategia di protezione dei dati**

---

## 🔧 Componenti essenziali dell'ambiente RMAN

| Componente | Descrizione |
|------------|-------------|
| **Target Database** | Il database su cui si eseguono le operazioni di backup/recovery. |
| **RMAN Client** | L'eseguibile `rman` che interpreta i comandi e coordina le operazioni. |
| **Control File** | File del database che contiene i metadati sui backup eseguiti. |

> Questi tre componenti sono **necessari** per usare RMAN anche nella configurazione più semplice.

---

## ⚙️ Componenti opzionali

| Componente | Utilità |
|------------|---------|
| **Fast Recovery Area (FRA)** | Area disco gestita da Oracle per archiviare in modo ordinato backup, archivelog, e altri file. |
| **Recovery Catalog** | Database esterno dove RMAN può salvare una copia duratura dei metadati di backup. |
| **Media Management Software** | Software esterno per backup su nastro (es. librerie tape o sistemi di backup centralizzati). |

---

## ▶️ Come iniziare con RMAN

1. **Avvio del client RMAN**:
   ```bash
   rman target /
   ```
   oppure:
   ```bash
   rman target sys/password@tns_alias
   ```

2. **Connessione al database target**:
   È richiesta un'autenticazione con privilegi `SYSDBA` o `SYSBACKUP`:
   ```sql
   CONNECT TARGET 'utente@servizio AS SYSBACKUP';
   ```

3. **Visualizzazione configurazione attuale**:
   ```sql
   SHOW ALL;
   ```

---

## 💡 Perché usare RMAN?

- È **integrato** in Oracle (niente licenze aggiuntive)
- È più sicuro e automatizzato rispetto a metodi manuali
- Permette backup **a caldo** (con il DB attivo) in modalità `ARCHIVELOG`
- Supporta backup **incrementali** per ridurre tempo e spazio
- Si integra con soluzioni aziendali (FRA, tape, cataloghi)

---

## 📘 Approfondimenti consigliati

- RMAN Architecture
- Tipi di backup (FULL, INCREMENTAL)
- Strategie di recovery (complete, point-in-time, block-level)
- Comandi principali: `BACKUP`, `RESTORE`, `RECOVER`, `VALIDATE`, `LIST`, `REPORT`

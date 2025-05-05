/*
USER_*: mostra solo gli oggetti e i privilegi dell’utente corrente.

ALL_*: mostra gli oggetti accessibili dall’utente corrente (i suoi + quelli a cui ha accesso).

DBA_*: mostra tutti gli oggetti del database (necessita privilegio DBA).
*/

Le viste di sistema più usate e utili
Oggetti
USER_TABLES / ALL_TABLES / DBA_TABLES
Elenco delle tabelle.

USER_VIEWS / ALL_VIEWS / DBA_VIEWS
Elenco delle viste.

USER_TAB_COLUMNS / ALL_TAB_COLUMNS / DBA_TAB_COLUMNS
Colonne di tutte le tabelle e viste.

USER_INDEXES / ALL_INDEXES / DBA_INDEXES
Indici.

USER_CONSTRAINTS / ALL_CONSTRAINTS / DBA_CONSTRAINTS
Vincoli (chiavi primarie, univocità, foreign key, etc).

USER_SEQUENCES / ALL_SEQUENCES / DBA_SEQUENCES
Sequenze.

USER_SYNONYMS / ALL_SYNONYMS / DBA_SYNONYMS
Sinonimi (alias di oggetti).

USER_TAB_COMMENTS / ALL_TAB_COMMENTS / DBA_TAB_COMMENTS
Commenti su tabelle e viste.

USER_COL_COMMENTS / ALL_COL_COMMENTS / DBA_COL_COMMENTS
Commenti sulle colonne.

Privilegi e Sicurezza
USER_ROLE_PRIVS / DBA_ROLE_PRIVS / ALL_ROLE_PRIVS
Ruoli assegnati agli utenti.

USER_SYS_PRIVS / DBA_SYS_PRIVS / ALL_SYS_PRIVS
Privilegi di sistema concessi.

USER_TAB_PRIVS / DBA_TAB_PRIVS / ALL_TAB_PRIVS
Privilegi su tabelle (SELECT, INSERT, ecc.).

USER_OBJECTS / ALL_OBJECTS / DBA_OBJECTS
Tutti gli oggetti posseduti/accessibili (tabelle, viste, indici, trigger, etc).

Utenti e Ruoli
DBA_USERS / ALL_USERS / USER_USERS
Informazioni sugli utenti del database.

DBA_ROLES
Elenco di tutti i ruoli definiti.

Constraint & Relazioni
USER_CONS_COLUMNS / ALL_CONS_COLUMNS / DBA_CONS_COLUMNS
Colonne coinvolte nei vincoli.

USER_TRIGGERS / ALL_TRIGGERS / DBA_TRIGGERS
Trigger definiti.

USER_DEPENDENCIES / ALL_DEPENDENCIES / DBA_DEPENDENCIES
Dipendenze tra oggetti (chi dipende da cosa).

Spazio e Storage
USER_SEGMENTS / DBA_SEGMENTS
Informazioni sullo spazio occupato dagli oggetti.

DBA_DATA_FILES
File di dati delle tablespace.

DBA_TABLESPACES
Elenco delle tablespace.

DBA_TEMP_FILES
File temporanei delle tablespace temporanee.

Performance e Sessioni
V$SESSION
Informazioni sulle sessioni attive (non è un prefisso USER/ALL/DBA, ma molto usata).

DBA_HIST_ / V$ACTIVE_SESSION_HISTORY*
Storico delle sessioni (richiede licenza specifica).

Pacchetti e Procedure
USER_PROCEDURES / ALL_PROCEDURES / DBA_PROCEDURES
Procedure e funzioni PL/SQL.

USER_SOURCE / ALL_SOURCE / DBA_SOURCE
Codice sorgente di procedure, funzioni, pacchetti.

Suggerimento pratico
Puoi esplorare tutte le viste disponibili nel tuo ambiente Oracle con la query:
*/

SELECT table_name FROM dictionary
WHERE table_name LIKE 'USER\_%' ESCAPE '\'
   OR table_name LIKE 'ALL\_%' ESCAPE '\'
   OR table_name LIKE 'DBA\_%' ESCAPE '\'
ORDER BY table_name;

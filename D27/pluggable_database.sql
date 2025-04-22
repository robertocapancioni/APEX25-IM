-- Esempio 1: Creazione di un PDB da PDB$SEED con FILE_NAME_CONVERT
-- Questo comando crea un nuovo PDB copiando i file dal seed in un nuovo percorso

CREATE PLUGGABLE DATABASE mio_pdb
  ADMIN USER admin IDENTIFIED BY Password123
  FILE_NAME_CONVERT = (
    '/opt/oracle/oradata/FREE/pdbseed/',  -- percorso file del seed
    '/opt/oracle/oradata/FREE/mio_pdb/'   -- nuovo percorso per i file del nuovo PDB
  );

-- Dopo la creazione, è necessario aprire il PDB:
ALTER PLUGGABLE DATABASE mio_pdb OPEN;

-- Verifica lo stato:
SELECT name, open_mode  FROM v$pdbs;


show con_name;

alter session set container=mio_pdb;

------------------------------------------------------------

-- Esempio 2.1: Stacco (unplug)  un PDB 

ALTER PLUGGABLE DATABASE mio_pdb CLOSE IMMEDIATE;
ALTER PLUGGABLE DATABASE mio_pdb UNPLUG INTO '/opt/oracle/oradata/FREE/mio_pdb.xml';

DROP PLUGGABLE DATABASE mio_pdb KEEP DATAFILES;

------------------------------------------------------------

-- Esempio 2.2: RiatControllo compatibilità  di un PDB precedentemente staccato

SET SERVEROUTPUT ON;
DECLARE
  compatible BOOLEAN;
BEGIN
  compatible := DBMS_PDB.CHECK_PLUG_COMPATIBILITY(
    pdb_descr_file => '/opt/oracle/oradata/FREE/mio_pdb.xml',
    pdb_name       => 'mio_pdb');
  IF compatible THEN
    DBMS_OUTPUT.PUT_LINE('Compatibile');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Non compatibile');
  END IF;
END;
/


------------------------------------------------------------

-- Esempio 2.3: Riattacco (plug) di un PDB precedentemente staccato
-- Si usa il file XML generato con UNPLUG per ricreare il PDB nel CDB
-- FILE_NAME_CONVERT serve a specificare il nuovo path per i file fisici

CREATE PLUGGABLE DATABASE mio_pdb 
   USING '/opt/oracle/oradata/FREE/mio_pdb.xml'  
  NOCOPY
  TEMPFILE REUSE;


mkdir /opt/oracle/oradata/FREE/mio_pdb_new


CREATE PLUGGABLE DATABASE mio_pdb_new
  USING '/opt/oracle/oradata/FREE/mio_pdb.xml'                  -- XML creato con UNPLUG
  FILE_NAME_CONVERT = (
    '/opt/oracle/oradata/FREE/mio_pdb',                        -- percorso originario dei file
    '/opt/oracle/oradata/FREE/mio_pdb_new'                         -- nuovo percorso desiderato
  );

-- Apertura del PDB in modalità READ WRITE
ALTER PLUGGABLE DATABASE mio_pdb OPEN READ WRITE;

------------------------------------------------------------

-- Verifica compatibilità prima di attaccare il PDB
SET SERVEROUTPUT ON;
DECLARE
  compatible BOOLEAN;
BEGIN
  compatible := DBMS_PDB.CHECK_PLUG_COMPATIBILITY(
    pdb_descr_file => '/u01/pdb1.xml',
    pdb_name       => 'mio_pdb');
  IF compatible THEN
    DBMS_OUTPUT.PUT_LINE('Compatibile');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Non compatibile');
  END IF;
END;
/

------------------------------------------------------------

-- In alternativa a FILE_NAME_CONVERT si possono usare:
-- - NOCOPY: non sposta i file (deve già trovarsi nella posizione corretta)
-- - COPY: copia i file dal percorso originale
-- - MOVE: sposta fisicamente i file

-- Esempio:
CREATE PLUGGABLE DATABASE mio_pdb
  USING '/u01/pdb1.xml'
  NOCOPY;

-- Assicurarsi che i file siano già nel percorso corretto.


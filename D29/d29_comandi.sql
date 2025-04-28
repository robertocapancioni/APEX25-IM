ALTER DATABASE DEFAULT TEMPORARY TABLESPACE nome_tablespace;



SELECT property_name, property_value 
FROM database_properties 
WHERE property_name='DEFAULT_TEMP_TABLESPACE';



SELECT * FROM dba_temp_free_space;



/*
CREATE TEMPORARY TABLESPACE nome_tablespace
    TEMPFILE 'percorso_file'
    SIZE dimensione;
*/


CREATE TEMPORARY TABLESPACE temp2
    TEMPFILE '/opt/oracle/oradata/FREE/FREEPDB1/temp2.dbf'
    SIZE 100m;
Visualizzare tutte le tablespace temporanee
Per vedere tutte le tablespace temporanee presenti nel database:




SELECT tablespace_name, file_name, bytes/1024/1024 MB, status
FROM dba_temp_files;




ALTER DATABASE DEFAULT TEMPORARY TABLESPACE temp2;



DROP TABLESPACE temp2 INCLUDING CONTENTS AND DATAFILES;

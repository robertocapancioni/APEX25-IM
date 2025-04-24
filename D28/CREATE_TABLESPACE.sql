CREATE TABLESPACE tbs1 
   DATAFILE '/opt/oracle/oradata/FREE/FREEPDB1/tbs1_data.dbf' 
   SIZE 10m;

SELECT 
   tablespace_name, 
   file_name, 
   bytes / 1024/ 1024  MB
FROM
   dba_data_files;


CREATE TABLE t1(
   id INT GENERATED ALWAYS AS IDENTITY, 
   c1 VARCHAR2(32)
) TABLESPACE tbs1;

BEGIN
   FOR counter IN 1..10000 loop
      INSERT INTO t1(c1)
      VALUES(sys_guid());
   END loop;
END;
/

SELECT 
   tablespace_name, 
   bytes / 1024 / 1024 MB
FROM 
   dba_free_space
WHERE 
   tablespace_name = 'TBS1';

BEGIN
   FOR counter IN 1..10000 loop
      INSERT INTO t1(c1)
      VALUES(sys_guid());
   END loop;
END;
/


ALTER DATABASE
   DATAFILE '/opt/oracle/oradata/FREE/FREEPDB1/tbs1.dbf' 
   RESIZE 10m;

CREATE TABLESPACE tbs1
   DATAFILE '/opt/oracle/oradata/FREE/FREEPDB1/tbs1.dbf'
   SIZE 10m
   AUTOEXTEND 20m;


----------------------------------------------------------
DROP TABLESPACE tablespace_name
    [INCLUDING CONTENTS [AND | KEEP] DATAFILES]
    [CASCADE CONSTRAINTS];

CREATE TABLESPACE tbs1
    DATAFILE '/opt/oracle/oradata/FREE/FREEPDB1/tbs1_data.dbf'
    SIZE 10m;

DROP TABLESPACE tbs1;

CREATE TABLESPACE tbs2
    DATAFILE '/opt/oracle/oradata/FREE/FREEPDB1/tbs2_data.dbf'
    SIZE 10m;

CREATE TABLE t2 (
    c1 INT
) TABLESPACE tbs2;

DROP TABLESPACE tbs2;

DROP TABLESPACE tbs2
    INCLUDING CONTENTS;


CREATE TABLESPACE tbs3
    DATAFILE '/opt/oracle/oradata/FREE/FREEPDB1/tbs3_data.dbf'
    SIZE 10m;

CREATE TABLESPACE tbs4
    DATAFILE '/opt/oracle/oradata/FREE/FREEPDB1/tbs4_data.dbf'
    SIZE 10m;

CREATE TABLE t3(
    c1 INT PRIMARY KEY
) TABLESPACE tbs3;

CREATE TABLE t4(
    c1 INT PRIMARY KEY,
    c2 INT NOT NULL,
    FOREIGN KEY(c2) REFERENCES t3(c1)
) TABLESPACE tbs4;

DROP TABLESPACE tbs3
    INCLUDING CONTENTS;


DROP TABLESPACE tbs3
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

------------------------------------------------------------
ALTER TABLESPACE tablespace_name
    ADD DATAFILE 'path_to_datafile'
    SIZE size;

ALTER TABLESPACE tablespace_name
    ADD DATAFILE 'path_to_datafile'
    SIZE size
    AUTOEXTEND ON;

First, create a new tablespace called tbs10 with the size10mB:

CREATE TABLESPACE tbs10 
    DATAFILE '/opt/oracle/oradata/FREE/FREEPDB1/tbs10.dbf' SIZE10m;

CREATE TABLE t1(id INT PRIMARY  KEY) 
TABLESPACE tbs10;

BEGIN
    FOR counter IN 1..1000000 loop
        INSERT INTO t1(id)
        VALUES(counter);
    END loop;
END;
/


ALTER TABLESPACE tbs10
    ADD DATAFILE '/opt/oracle/oradata/FREE/FREEPDB1/tbs10_2.dbf'
    SIZE 10m
    AUTOEXTEND ON;

SELECT count(*) FROM t1;


ALTER DATABASE
    DATAFILE 'path_to_datafile'
    RESIZE size;


CREATE TABLESPACE tbs11
    DATAFILE '/opt/oracle/oradata/FREE/FREEPDB1/tbs11.dbf'
    SIZE 10m;

CREATE TABLE t2(
    c INT PRIMARY KEY
) TABLESPACE tbs11;

SELECT 
    tablespace_name, 
    bytes / 1024 / 1024 MB
FROM 
    dba_free_space
WHERE 
    tablespace_name = 'TBS11';

ALTER DATABASE 
    DATAFILE '/opt/oracle/oradata/FREE/FREEPDB1/tbs11.dbf' 
    RESIZE 15m;

SELECT 
    tablespace_name, 
    bytes / 1024 / 1024 MB
FROM 
    dba_free_space
WHERE 
    tablespace_name = 'TBS11';
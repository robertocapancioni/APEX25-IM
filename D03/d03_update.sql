select min(EMPNO),max(EMPNO) from emp

-- 1. Aggiornare un singolo campo di un singolo record
UPDATE EMP 
SET SAL = 5000 
WHERE EMPNO = 7369;

-- 2. Aggiornare più campi di un singolo record
UPDATE EMP 
SET SAL = 6000, JOB = 'MANAGER' 
WHERE EMPNO = 7934;

-- 3. Aggiornare più record con una condizione
UPDATE EMP 
SET SAL = SAL * 1.10 
WHERE JOB = 'CLERK';

-- 4. Aggiornare con una sottoquery (subquery)
UPDATE EMP 
SET SAL = (SELECT AVG(SAL) FROM EMP) 
WHERE JOB = 'SALESMAN';

-- 5. Usare un join in un aggiornamento (UPDATE con JOIN)
UPDATE EMP e
SET DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES')
WHERE e.ENAME = 'SCOTT';

-- 6. Aggiornare una colonna con un valore condizionale (CASE)
UPDATE EMP 
SET SAL = 
    CASE 
        WHEN JOB = 'MANAGER' THEN SAL * 1.15
        WHEN JOB = 'SALESMAN' THEN SAL * 1.10
        ELSE SAL * 1.05
    END;

-- 7. Aggiornare un campo con un valore derivato da un'altra colonna
UPDATE EMP 
SET SAL = SAL + NVL(COMM, 0);

-- 8. Aggiornare tutti i record della tabella (senza WHERE)
UPDATE DEPT 
SET LOC = 'UNKNOWN';

-- 9. Aggiornare solo i primi N record ordinati (UPDATE con ROWNUM e subquery)
UPDATE EMP a
SET SAL = SAL * 1.05
WHERE EMPNO IN (SELECT b.EMPNO FROM EMP b  ORDER BY b.HIREDATE ASC fetch next 5 rows only);

-- 9 bis. ERRORE DOPPIO con rownum e orderby --Aggiornare solo i primi N record ordinati (UPDATE con ROWNUM e subquery)
UPDATE EMP a
SET SAL = SAL * 1.05
WHERE EMPNO IN (SELECT b.EMPNO FROM EMP b WHERE ROWNUM <= 5 ORDER BY b.HIREDATE ASC);

-- 10. Aggiornare utilizzando una condizione basata su un'altra tabella
UPDATE EMP 
SET DEPTNO = 10 
WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'NEW YORK');

-- 11. UPDATE con JOIN senza subquery usando MERGE INTO
MERGE INTO EMP e
USING DEPT d
ON (e.DEPTNO = d.DEPTNO)
WHEN MATCHED THEN
    UPDATE SET e.SAL = e.SAL * 1.10
    WHERE d.DNAME = 'SALES';

-- 12. UPDATE con JOIN diretto (disponibile da Oracle 23c)
UPDATE EMP e
SET e.SAL = e.SAL * 1.10
FROM DEPT d
WHERE e.DEPTNO = d.DEPTNO
  AND d.DNAME = 'SALES';





SELECT * FROM EMP b WHERE ROWNUM <= 1 ORDER BY b.HIREDATE ASC

SELECT * FROM EMP b  ORDER BY b.HIREDATE ASC fetch next 5 rows only

select * from (SELECT * FROM EMP b  ORDER BY b.HIREDATE ASC) WHERE ROWNUM <= 1
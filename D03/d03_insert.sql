insert into EMP ( EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM, DEPTNO) 
     values     ( 8000,'BIANCHI','IMPIEGATO',7782,date'2024-03-18',1500,null, 10); 

insert into EMP 
     values     ( 8003,'BIANCHI','IMPIEGATO',7782,date'2024-03-18',1500,null,null); 


insert into EMP ( EMPNO
                 ,ENAME
                 ,JOB
                 ,MGR
                 ,HIREDATE
                 ,SAL
                 ,COMM
                 ,DEPTNO ) 
         values ( 8001
                 ,'VERDI'
                 ,'IMPIEGATO'
                 ,(select EMPNO from EMP where ENAME='BLAKE')
                 ,date'2024-03-18'
                 ,1500
                 ,null
                 , (select DEPTNO from DEPT where DNAME='ACCOUNTING')); 

DECLARE 
   c_EMPNO emp.EMPNO%type; 
   c_ENAME emp.ENAME%type; 
   c_JOB emp.JOB%type; 
   CURSOR c_emps is 
      SELECT EMPNO, ENAME, JOB FROM emp; 
BEGIN 
   OPEN c_emps; 
   LOOP 
   FETCH c_emps into c_EMPNO, c_ENAME, c_JOB; 
      EXIT WHEN c_emps%notfound; 
      dbms_output.put_line(c_EMPNO || ' ' || c_ENAME || ' ' || c_JOB); 
   END LOOP; 
   CLOSE c_emps; 
END; 
/

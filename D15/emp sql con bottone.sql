select EMPNO,
       'link' link,
       '<button type="button" data-id="'||DEPTNO||'" class=" dept t-Button t-Button--icon t-Button--hot t-Button--iconLeft"><span aria-hidden="true" class="t-Icon t-Icon--left fa fa-ai-sparkle-enhance-color"></span>Mio Testo</button>'link2,
       ENAME,
       JOB,
       MGR,
       HIREDATE,
       SAL,
       COMM,
       DEPTNO
  from EMP

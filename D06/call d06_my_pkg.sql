begin
  d06_my_pkg.venduto(p_venduto => 100000);
end;
/

declare
l_venduto_txt varchar2(100) := null;
begin
  d06_my_pkg.venduto( p_venduto => 100000,
                      p_venduto_txt =>  l_venduto_txt); 
  dbms_output.put_line( l_venduto_txt );
end;
/


begin
  d06_my_pkg.venduto( p_venduto => 100000); 
end;
/

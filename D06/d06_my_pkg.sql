create or replace package d06_my_pkg
is
procedure venduto(p_venduto in number default 0);
procedure venduto(p_venduto in number default 0,
                      p_venduto_txt out varchar2);

function get_venduto(p_venduto in number default 0)
return varchar2;
end d06_my_pkg;
/
  
create or replace package body d06_my_pkg
is
procedure venduto(p_venduto in number default 0)
is
begin
   if p_venduto > 100000 then 
      dbms_output.put_line( 'Venduto > 100k ' ); 
   elsif p_venduto > 50000 then 
      dbms_output.put_line( 'Venduto > 50k ' ); 
   else
      dbms_output.put_line( 'Venduto <= 50k ' ); 
   end if; 
end venduto;

procedure venduto(p_venduto in number default 0,
                  p_venduto_txt out varchar2)
is
begin
   if p_venduto > 100000 then 
      p_venduto_txt := 'Venduto > 100k '; 
   elsif p_venduto > 50000 then 
      p_venduto_txt := 'Venduto > 50k '; 
   else
      p_venduto_txt := 'Venduto <= 50k '; 
   end if; 
end venduto;

function get_venduto(p_venduto in number default 0)
return varchar2
is
l_return varchar2(100);
begin
   if p_venduto > 100000 then 
      l_return := 'Venduto > 100k '; 
   elsif p_venduto > 50000 then 
      l_return := 'Venduto > 50k '; 
   else
      l_return := 'Venduto <= 50k '; 
   end if; 
   return l_return;
end get_venduto;
end d06_my_pkg;
/

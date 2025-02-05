begin 
    dbms_output.put_line ('Hello World!'); 
end;
/

---------------------------------------------------------------
declare 
   l_message varchar2( 255 ) := 'Hello World!'; 
begin 
   dbms_output.put_line( l_message ); 
end;
/

--------------------------------------------------------------
declare
      v_result number;
begin
   v_result := 1 / 0;
   exception
     when zero_divide then
         dbms_output.put_line('Non puoi dividere per zero');
     when others then
         dbms_output.put_line( sqlerrm );
end;
/

--------------------------------------------------------------
declare
  l_data date;
begin

  select sysdate
    into l_data
    from dual;

  dbms_output.put_line(to_char(l_data,'DD/MM/YYYY HH24:MM:SS'));
end;
/

--------------------------------------------------------------
declare 
  l_venduto number := 100000; 
begin 
   if l_venduto > 100000 then 
      dbms_output.put_line( 'Venduto > 100k' ); 
   elsif l_venduto > 50000 then 
      dbms_output.put_line( 'Venduto > 50k' ); 
   else
      dbms_output.put_line( 'Venduto <= 50k' ); 
   end if; 
end;
/

--------------------------------------------------------------
declare
  l_voto char( 1 );
  l_giudizio  varchar2( 20 );
begin
  l_voto := 'B';
  case l_voto
  when 'A' then
    l_giudizio := 'Eccellente' ;
  when 'B' then
    l_giudizio := 'Ottimo' ;
  when 'C' then
    l_giudizio := 'Buono' ;
  when 'D' then
    l_giudizio := 'Sufficiente' ;
  else
    l_giudizio := 'Insufficiente' ;
  end case;
  dbms_output.put_line( l_giudizio );
end;
/

-------------------------------------------------------
declare
  l_venduto     number;
  l_commissione number;
begin
  l_venduto := 150000;
  case
  when l_venduto    > 200000 then
    l_commissione := 0.2;
  when l_venduto   >= 100000 and l_venduto < 200000 then
    l_commissione := 0.15;
  when l_venduto   >= 50000 and l_venduto < 100000 then
    l_commissione := 0.1;
  when l_venduto    > 30000 then
    l_commissione := 0.05;
  else
    l_commissione := 0;
  end case;

  dbms_output.put_line( 'Commissioni:  ' || l_commissione * 100 || '%' );
end;
/

----------------------------------------------------------------------------
declare

begin
  for c in (select level numero from dual connect by level <=10)
  loop
     dbms_output.put_line( 'Numero-->  ' || c.numero  );
  end loop;
  
end;

--------------------------------------------------------------------------
declare 
  l_venduto number := 100000; 
begin 
   if l_venduto > 100000 then 
      dbms_output.put_line( 'Venduto > 100k ' ); 
   elsif l_venduto > 50000 then 
      dbms_output.put_line( 'Venduto > 50k ' ); 
   else
      dbms_output.put_line( 'Venduto <= 50k ' ); 
   end if; 
end;
/


-----------------------------------------------------------------------
create or replace procedure d06_venduto 
                  ( 
                   p_venduto in number default 0
                  )
is
begin
   if p_venduto > 100000 then 
      dbms_output.put_line( 'Venduto > 100k ' ); 
   elsif p_venduto > 50000 then 
      dbms_output.put_line( 'Venduto > 50k ' ); 
   else
      dbms_output.put_line( 'Venduto <= 50k ' ); 
   end if; 
end;
/

begin
  d06_venduto(p_venduto => 100000);
end;
/

-------------------------------------------------------------------
declare 
  l_venduto number := 100000; 
begin 
   if l_venduto > 100000 then 
      dbms_output.put_line( 'Venduto > 100k ' ); 
   elsif l_venduto > 50000 then 
      dbms_output.put_line( 'Venduto > 50k ' ); 
   else
      dbms_output.put_line( 'Venduto <= 50k ' ); 
   end if; 
end;
/

-----------------------------------------------------------------

create or replace function d06_get_venduto 
                (
                 p_venduto in number default 0
                 ) 
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
end;
/


declare
l_venduto varchar2(100) := null;
begin
  l_venduto := d06_get_venduto( p_venduto => 100000 ); 
  dbms_output.put_line( l_venduto );
end;
/

------------------------------------------------------------

create or replace procedure d06_get_venduto 
                (
                 p_venduto in number default 0,
                 p_venduto_txt out varchar2
                 ) 
is
begin
   if p_venduto > 100000 then 
      p_venduto_txt := 'Venduto > 100k '; 
   elsif p_venduto > 50000 then 
      p_venduto_txt := 'Venduto > 50k '; 
   else
      p_venduto_txt := 'Venduto <= 50k '; 
   end if; 
end;
/


declare
l_venduto_txt varchar2(100) := null;
begin
  d06_get_venduto( p_venduto => 100000,
                   p_venduto_txt =>  l_venduto_txt); 
  dbms_output.put_line( l_venduto_txt );
end;
/

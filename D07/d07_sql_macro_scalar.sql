create or replace function show_date(p_value date)
return varchar2 sql_macro(scalar)
is
begin
 return q'{ to_char(p_value, 'YYYY-MM-DD HH24:MI:SS') }';
end;
/

select show_date(sysdate) from dual
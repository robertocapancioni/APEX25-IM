for index in lower_bound .. upper_bound
loop 
    statements; 
end loop;

---------------------------------------------
begin
  for l_counter in 1..5
  loop
    dbms_output.put_line( l_counter );
  end loop;
end;

---------------------------------------------
declare
  l_step  pls_integer := 2;
begin
  for l_counter in 1..5 loop
    dbms_output.put_line (l_counter*l_step);
  end loop;
end;


---------------------------------------------
declare
  l_counter pls_integer := 10;
begin
  for l_counter in 1.. 5 loop
    dbms_output.put_line (l_counter);
  end loop;
  dbms_output.put_line (l_counter);
end; 

---------------------------------------------
<<esterno>>
declare
  l_counter pls_integer := 10;
begin
  for l_counter in 1.. 5 loop
    dbms_output.put_line ('Contatore Interno:' ||  l_counter);
    esterno.l_counter := l_counter;
  end loop;

  dbms_output.put_line ('Contatore Esterno' || l_counter);
end esterno;


---------------------------------------------
begin
  for l_index in 1..3 loop
    dbms_output.put_line (l_index);
  end loop;
  dbms_output.put_line (l_index);
end;

---------------------------------------------
begin
  for l_counter in reverse 1..3
  loop
    dbms_output.put_line( l_counter );
  end loop;
end;

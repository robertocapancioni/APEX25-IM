loop
    exit;
end loop; 

---------------------------------------------
loop
    if condition then
        exit;
    end if;
end loop;




---------------------------------------------
declare
  l_counter number := 0;
begin
  loop
    l_counter := l_counter + 1;
    if l_counter > 3 then
      exit;
    end if;
    dbms_output.put_line( 'Dentro il loop: ' || l_counter )  ;
  end loop;

  dbms_output.put_line( 'Dopo il loop: ' || l_counter );
end;

---------------------------------------------

declare
  l_i number := 0;
  l_j number := 0;
begin
  <<loop_esterno>>
  loop
    l_i := l_i + 1;
    exit loop_esterno when l_i > 2;    
    dbms_output.put_line('Contatore Esterno ' || l_i);
    -- reset contatore interno
    l_j := 0;
      <<loop_interno>> loop
      l_j := l_j + 1;
      exit loop_interno when l_j > 3;
      dbms_output.put_line('Contatore Interno ' || l_j);
    end loop loop_interno;
  end loop loop_esterno;
end;







---------------------------------------------
declare
  l_i number := 0;
  l_j number := 0;
begin
  <<loop_esterno>>
  loop
    l_i := l_i + 1;
    exit loop_esterno when l_i > 2;    
    dbms_output.put_line('Contatore Esterno ' || l_i);
    -- reset contatore interno
    l_j := 0;
      <<loop_interno>> loop
      l_j := l_j + 1;
      exit loop_interno when l_j > 3;
      dbms_output.put_line(' Contatore Interno ' || l_j);
    end loop loop_interno;
  end loop loop_esterno;
end;

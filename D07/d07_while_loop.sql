DECLARE
  n_counter NUMBER := 1;
BEGIN
  WHILE n_counter <= 5
  LOOP
    DBMS_OUTPUT.PUT_LINE( 'Contatore : ' || n_counter );
    n_counter := n_counter + 1;
  END LOOP;
END;

--------------------------------------------
DECLARE
   n_counter NUMBER := 1;
BEGIN
   WHILE n_counter <= 5
      LOOP
        DBMS_OUTPUT.PUT_LINE( 'Contatore : ' || n_counter );
        n_counter := n_counter + 1;
        EXIT WHEN n_counter = 3;
      END LOOP;
   END;

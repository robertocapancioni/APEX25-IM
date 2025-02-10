BEGIN
  FOR n_index IN 1 .. 10
  LOOP
    -- salta i numeri dispari
    IF MOD( n_index, 2 ) = 1 THEN
      CONTINUE;
    END IF;
    DBMS_OUTPUT.PUT_LINE( n_index );
  END LOOP;
END;

--------------------------------------------
BEGIN
  FOR n_index IN 1 .. 10
  LOOP
    -- salta i numeri pari
    CONTINUE WHEN MOD( n_index, 2 ) = 0;
    DBMS_OUTPUT.PUT_LINE( n_index );
  END LOOP;
END;

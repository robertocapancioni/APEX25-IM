for c1 in (select column_value id 
             from apex_string.split(:P7_SELECTED_IDS,':')
          )
loop
   insert into d18_appuntamento (DATA_INIZIO,DATA_FINE,DESCRIZIONE,TIPO_APPUNTAMENTO_ID,NOME_ID)values
                                (:P7_DATA_INIZIO,:P7_DATA_INIZIO,'Appuntamento',1,c1.id);
end loop;

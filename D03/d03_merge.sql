
create table d03_vendita2 as
select DATA,PRODOTTO,CLIENTE,ZONA_CLIENTE,QUANTITA,IMPORTO from d03_vendita order by id fetch next 2 rows only;


merge into d03_vendita2 d
         using d03_vendita s
            on (    s.data     = d.data 
                and s.prodotto = d.prodotto
                and s.cliente  = d.cliente
               )
    when matched then
          update set
                 --d.data         = s.data,
                 --d.prodotto     = s.prodotto,
                 --d.cliente      = s.cliente,
                 d.zona_cliente = s.zona_cliente,
                 d.quantita     = s.quantita,
                 d.importo      = s.importo
    when not matched then
          insert (d.data,d.prodotto,d.cliente,d.zona_cliente,d.quantita,d.importo)
          values (s.data,s.prodotto,s.cliente,s.zona_cliente,s.quantita,s.importo);
  
 merge into d03_vendita2 d
         using (select  
                 trunc(sysdate) data,
                         'Pane' prodotto,
                  'Mario Rossi' cliente,
                         'NORD' zona_cliente,
                            100 quantita,
                            400 importo 
                           from dual) s
            on (    s.data     = d.data 
                and s.prodotto = d.prodotto
                and s.cliente  = d.cliente
               ) 
    when matched then
          update set
                 d.zona_cliente = s.zona_cliente,
                 d.quantita     = s.quantita,
                 d.importo      = s.importo
    when not matched then
          insert (d.data,d.prodotto,d.cliente,d.zona_cliente,d.quantita,d.importo)
          values (s.data,s.prodotto,s.cliente,s.zona_cliente,s.quantita,s.importo);

    merge into d03_vendita2 d
         using d03_vendita s
            on (    s.data     = d.data 
                and s.prodotto = d.prodotto
                and s.cliente  = d.cliente
               )
    when matched then
          update set
                 d.zona_cliente = s.zona_cliente,
                 d.quantita     = s.quantita,
                 d.importo      = s.importo
                 where d.importo < 100
          delete where d.importo < 100
    when not matched then
          insert (d.data,d.prodotto,d.cliente,d.zona_cliente,d.quantita,d.importo)
          values (s.data,s.prodotto,s.cliente,s.zona_cliente,s.quantita,s.importo)
           where s.importo < 100;

    merge into d03_vendita2 d
         using d03_vendita s
            on (    s.data     = d.data 
                and s.prodotto = d.prodotto
                and s.cliente  = d.cliente
               )
    when matched then
          update set
                 d.zona_cliente = s.zona_cliente,
                 d.quantita     = s.quantita,
                 d.importo      = s.importo
           where d.importo < 100
    when not matched then
          insert (d.data,d.prodotto,d.cliente,d.zona_cliente,d.quantita,d.importo)
          values (s.data,s.prodotto,s.cliente,s.zona_cliente,s.quantita,s.importo);
          
    merge into d03_vendita2 d
         using d03_vendita s
            on (    s.data     = d.data 
                and s.prodotto = d.prodotto
                and s.cliente  = d.cliente
               )
    when matched then
          update set
                 d.zona_cliente = s.zona_cliente,
                 d.quantita     = s.quantita,
                 d.importo      = s.importo
           where d.importo < 100
    delete where d.importo > 900
    when not matched then
          insert (d.data,d.prodotto,d.cliente,d.zona_cliente,d.quantita,d.importo)
          values (s.data,s.prodotto,s.cliente,s.zona_cliente,s.quantita,s.importo)
           where s.importo < 100;

create unique index d03_vendita2_uq1
    on d03_vendita2 (data,prodotto,cliente);

begin
   DBMS_STATS.GATHER_TABLE_STATS(null, 'd03_vendita');
   DBMS_STATS.GATHER_TABLE_STATS(null, 'd03_vendita2');
end;


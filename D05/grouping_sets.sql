    select cliente,
           zona_cliente,
           sum(quantita) quantita,
           sum(importo) importo
      from d05_vendita   
  group by 
  grouping sets(
    (cliente,zona_cliente),
    (zona_cliente),
    (cliente),
    ()
  );

    select null cliente,
           null zona_cliente,
           sum(quantita) quantita,
           sum(importo) importo
      from d05_vendita
   union all
    select cliente,
           null zona_cliente,
           sum(quantita) quantita,
           sum(importo) importo
      from d05_vendita   
  group by cliente
 union all
    select zona_cliente,
           null zona_cliente,
           sum(quantita) quantita,
           sum(importo) importo
      from d05_vendita   
  group by zona_cliente 
     union all
    select cliente,
           zona_cliente,
           sum(quantita) quantita,
           sum(importo) importo
      from d05_vendita   
  group by cliente,
           zona_cliente

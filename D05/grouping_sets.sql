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

select zona_cliente,
       cliente,
       grouping(zona_cliente)                   raggr_zona_cliente,
       grouping(cliente)                        raggr_cliente,
       grouping(zona_cliente)*grouping(cliente) raggr_zona_cliente_cliente,
       sum(quantita) quantita, 
       sum(importo) importo
  from d05_vendita
 group by 
     grouping sets(
       (zona_cliente,cliente),
       (zona_cliente),
       (cliente),
       ()
     )
order by zona_cliente,cliente;



select zona_cliente,
       cliente,
       grouping(zona_cliente)                   raggr_zona_cliente,
       grouping(cliente)                        raggr_cliente,
       grouping(zona_cliente)*grouping(cliente) raggr_zona_cliente_cliente,
       sum(quantita) quantita, 
       sum(importo) importo
  from d05_vendita
 group by 
     cube(zona_cliente,cliente)
order by zona_cliente,cliente;


select zona_cliente,
       cliente,
       grouping(zona_cliente)                   raggr_zona_cliente,
       grouping(cliente)                        raggr_cliente,
       grouping(zona_cliente)*grouping(cliente) raggr_zona_cliente_cliente,
       sum(quantita) quantita, 
       sum(importo) importo
  from d05_vendita
 group by 
     rollup(zona_cliente,cliente)
order by zona_cliente,cliente;

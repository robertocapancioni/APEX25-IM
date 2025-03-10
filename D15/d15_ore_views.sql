create or replace view d15_persona_vw as
select p.id,
       p.nome,
       p.ruolo_id,
       r.ruolo,
       r.tariffa_oraria 
  from d15_persona p
  join d15_ruolo r on p.ruolo_id = r.id;

create or replace view d15_progetto_vw as
select p.id,
       p.cliente_id,
       c.cliente,
       p.progetto
  from d15_progetto p
  join d15_cliente c on p.cliente_id = c.id;

create or replace view d15_commessa_vw as
select m.id,
       m.codice_commessa,
       m.descrizione_commessa,
       m.progetto_id,
       p.cliente_id,
       c.cliente,
       p.progetto
  from d15_commessa m
  join d15_progetto p on m.progetto_id = p.id
  join d15_cliente c on p.cliente_id = c.id;

create or replace view d15_ore_vw as
select o.id,
       o.persona_id,
       p.nome,
       p.ruolo,
       p.tariffa_oraria,
       o.commessa_id,
       m.codice_commessa,
       m.descrizione_commessa,
       m.cliente,
       m.progetto,
       o.data,
       o.ore,
       o.costo
  from d15_ore o
  join d15_persona_vw p on o.persona_id = p.id
  join d15_commessa_vw m on o.commessa_id = m.id;

select nome,
       sum(ore)ore,
       sum(costo)costo,
       case when sum(ore)<> 0 
            then round(sum(costo)/sum(ore),2)
            else 0 
             end costo_orario_medio  
  from d15_ore_vw
 group by nome;

 select cliente,
       sum(ore)ore,
       sum(costo)costo,
       case when sum(ore)<> 0 
            then round(sum(costo)/sum(ore),2)
            else 0 
             end costo_orario_medio  
  from d15_ore_vw
 group by cliente;

  select codice_commessa,
       sum(ore)ore,
       sum(costo)costo,
       case when sum(ore)<> 0 
            then round(sum(costo)/sum(ore),2)
            else 0 
             end costo_orario_medio  
  from d15_ore_vw
 group by codice_commessa;

   select data,
       sum(ore)ore,
       sum(costo)costo,
       case when sum(ore)<> 0 
            then round(sum(costo)/sum(ore),2)
            else 0 
             end costo_orario_medio   
  from d15_ore_vw
 group by data;


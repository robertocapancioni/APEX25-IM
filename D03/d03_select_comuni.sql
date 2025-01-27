select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d03_comune c
  join d03_provincia p
    on c.provincia_cod = p.provincia_cod
    
delete 
  from d03_comune 
 where provincia_cod in ('BG','BS','CO')

delete 
  from d03_provincia 
 where provincia_cod in ('MN','PV','SO','VA')

select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d03_comune c
  left
  join d03_provincia p
    on c.provincia_cod = p.provincia_cod

select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d03_comune c
  left
  join d03_provincia p
    on c.provincia_cod = p.provincia_cod

select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d03_comune c
 right
  join d03_provincia p
    on c.provincia_cod = p.provincia_cod

select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d03_comune c
  full
  join d03_provincia p
    on c.provincia_cod = p.provincia_cod

insert 
  into d03_comune 
       (comune,provincia_cod)
values ('Arese','MI')

insert 
  into d03_provincia
       (provincia_cod,provincia)
values ('MI','Milano (doppio)')

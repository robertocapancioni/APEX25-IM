-- create tables

create table d15_persona (
    id              number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
                    constraint d15_persona_id_pk primary key,
    regione_id      number,
    provincia_id    number,
    comune_id       number,
    nome            varchar2(20 char) not null
);

-- table index
create index d15_persona_i1 on d15_persona (regione_id);

create index d15_persona_i2 on d15_persona (provincia_id);

create index d15_persona_i3 on d15_persona (comune_id);



alter table d15_persona add constraint d15_persona_regione_id_fk foreign key (regione_id) references d15_regione;

alter table d15_persona add constraint d15_persona_provincia_id_fk foreign key (provincia_id) references d15_provincia;

alter table d15_persona add constraint d15_persona_comune_id_fk foreign key (comune_id) references d15_comune;

-- Generated by Quick SQL 1.2.9 10/03/2025, 11:35:52

/*
d15_persona
  nome vc20 /nn
  regione_id /nn /fk d15_regione
  provincia_id /nn /fk d15_provincia
  comune_id /nn /fk d15_comune

 Non-default options:
# settings = {}

*/

insert into d15_ruolo (ruolo,tariffa_oraria) values ('Junior',50);
insert into d15_ruolo (ruolo,tariffa_oraria) values ('Senior',100);
insert into d15_ruolo (ruolo,tariffa_oraria) values ('Principal',150);

insert into d15_persona (nome,ruolo_id) values ('Mario',(select id from d15_ruolo where ruolo='Junior'));
insert into d15_persona (nome,ruolo_id) values ('Anna',(select id from d15_ruolo where ruolo='Senior'));
insert into d15_persona (nome,ruolo_id) values ('Paolo',(select id from d15_ruolo where ruolo='Senior'));
insert into d15_persona (nome,ruolo_id) values ('Carla',(select id from d15_ruolo where ruolo='Principal'));

insert into d15_cliente (cliente) values ('Microsoft');
insert into d15_cliente (cliente) values ('Oracle');
insert into d15_cliente (cliente) values ('Ibm');
insert into d15_cliente (cliente) values ('Apple');
insert into d15_cliente (cliente) values ('Amazon');

insert into d15_progetto (progetto,cliente_id) values ('Sviluppo in Microsoft',(select id from d15_cliente where cliente='Microsoft'));
insert into d15_progetto (progetto,cliente_id) values ('Formazone in Apple',(select id from d15_cliente where cliente='Apple'));
insert into d15_progetto (progetto,cliente_id) values ('Analisi Dati in Oracle',(select id from d15_cliente where cliente='Oracle'));
insert into d15_progetto (progetto,cliente_id) values ('Cloud in Amazon',(select id from d15_cliente where cliente='Amazon'));
insert into d15_progetto (progetto,cliente_id) values ('IA in Ibm',(select id from d15_cliente where cliente='Ibm'));


insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('MST001','MST001',(select id from d15_progetto where progetto='Sviluppo in Microsoft'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('MST002','MST002',(select id from d15_progetto where progetto='Sviluppo in Microsoft'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('MST003','MST003',(select id from d15_progetto where progetto='Sviluppo in Microsoft'));

insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('APP001','APP001',(select id from d15_progetto where progetto='Formazone in Apple'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('APP002','APP002',(select id from d15_progetto where progetto='Formazone in Apple'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('APP003','APP003',(select id from d15_progetto where progetto='Formazone in Apple'));

insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('ORA001','ORA001',(select id from d15_progetto where progetto='Analisi Dati in Oracle'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('ORA002','ORA002',(select id from d15_progetto where progetto='Analisi Dati in Oracle'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('ORA003','ORA003',(select id from d15_progetto where progetto='Analisi Dati in Oracle'));

insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('AZN001','AZN001',(select id from d15_progetto where progetto='Cloud in Amazon'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('AZN002','AZN002',(select id from d15_progetto where progetto='Cloud in Amazon'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('AZN003','AZN003',(select id from d15_progetto where progetto='Cloud in Amazon'));

insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('IBM001','IBM001',(select id from d15_progetto where progetto='IA in Ibm'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('IBM002','IBM002',(select id from d15_progetto where progetto='IA in Ibm'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('IBM003','IBM003',(select id from d15_progetto where progetto='IA in Ibm'));

insert into d15_ruolo (ruolo,tariffa_oraria) values ('Junior',50);
insert into d15_ruolo (ruolo,tariffa_oraria) values ('Senior',100);
insert into d15_ruolo (ruolo,tariffa_oraria) values ('Principal',150);

insert into d15_persona (nome,ruolo_id) values ('Mario',(select id from d15_ruolo where ruolo='Junior'));
insert into d15_persona (nome,ruolo_id) values ('Anna',(select id from d15_ruolo where ruolo='Senior'));
insert into d15_persona (nome,ruolo_id) values ('Paolo',(select id from d15_ruolo where ruolo='Senior'));
insert into d15_persona (nome,ruolo_id) values ('Carla',(select id from d15_ruolo where ruolo='Principal'));

insert into d15_cliente (cliente) values ('Microsoft');
insert into d15_cliente (cliente) values ('Oracle');
insert into d15_cliente (cliente) values ('Ibm');
insert into d15_cliente (cliente) values ('Apple');
insert into d15_cliente (cliente) values ('Amazon');

insert into d15_progetto (progetto,cliente_id) values ('Sviluppo in Microsoft',(select id from d15_cliente where cliente='Microsoft'));
insert into d15_progetto (progetto,cliente_id) values ('Formazone in Apple',(select id from d15_cliente where cliente='Apple'));
insert into d15_progetto (progetto,cliente_id) values ('Analisi Dati in Oracle',(select id from d15_cliente where cliente='Oracle'));
insert into d15_progetto (progetto,cliente_id) values ('Cloud in Amazon',(select id from d15_cliente where cliente='Amazon'));
insert into d15_progetto (progetto,cliente_id) values ('IA in Ibm',(select id from d15_cliente where cliente='Ibm'));


insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('MST001','MST001',(select id from d15_progetto where progetto='Sviluppo in Microsoft'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('MST002','MST002',(select id from d15_progetto where progetto='Sviluppo in Microsoft'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('MST003','MST003',(select id from d15_progetto where progetto='Sviluppo in Microsoft'));

insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('APP001','APP001',(select id from d15_progetto where progetto='Formazone in Apple'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('APP002','APP002',(select id from d15_progetto where progetto='Formazone in Apple'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('APP003','APP003',(select id from d15_progetto where progetto='Formazone in Apple'));

insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('ORA001','ORA001',(select id from d15_progetto where progetto='Analisi Dati in Oracle'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('ORA002','ORA002',(select id from d15_progetto where progetto='Analisi Dati in Oracle'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('ORA003','ORA003',(select id from d15_progetto where progetto='Analisi Dati in Oracle'));

insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('AZN001','AZN001',(select id from d15_progetto where progetto='Cloud in Amazon'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('AZN002','AZN002',(select id from d15_progetto where progetto='Cloud in Amazon'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('AZN003','AZN003',(select id from d15_progetto where progetto='Cloud in Amazon'));

insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('IBM001','IBM001',(select id from d15_progetto where progetto='IA in Ibm'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('IBM002','IBM002',(select id from d15_progetto where progetto='IA in Ibm'));
insert into d15_commessa (codice_commessa,descrizione_commessa,progetto_id) values ('IBM003','IBM003',(select id from d15_progetto where progetto='IA in Ibm'));


insert into d15_ore (data,ore,costo,persona_id,commessa_id) values (date'2024-04-14',5,5*(select r.tariffa_oraria from d15_persona p join d15_ruolo r on p.ruolo_id = r.id where p.nome='Mario'),
                                                                                         (select id from d15_persona where nome='Mario'),
                                                                                         (select id from d15_commessa where codice_commessa='IBM001'));

insert into d15_ore (data,ore,costo,persona_id,commessa_id) values (date'2024-04-14',3,3*(select r.tariffa_oraria from d15_persona p join d15_ruolo r on p.ruolo_id = r.id where p.nome='Mario'),
                                                                                         (select id from d15_persona where nome='Mario'),
                                                                                         (select id from d15_commessa where codice_commessa='AZN001'));

insert into d15_ore (data,ore,costo,persona_id,commessa_id) values (date'2024-04-10',4,4*(select r.tariffa_oraria from d15_persona p join d15_ruolo r on p.ruolo_id = r.id where p.nome='Carla'),
                                                                                         (select id from d15_persona where nome='Carla'),
                                                                                         (select id from d15_commessa where codice_commessa='ORA001'));

insert into d15_ore (data,ore,costo,persona_id,commessa_id) values (date'2024-04-10',4,4*(select r.tariffa_oraria from d15_persona p join d15_ruolo r on p.ruolo_id = r.id where p.nome='Carla'),
                                                                                         (select id from d15_persona where nome='Carla'),
                                                                                         (select id from d15_commessa where codice_commessa='ORA002'));

insert into d15_ore (data,ore,costo,persona_id,commessa_id) values (date'2024-04-14',7,7*(select r.tariffa_oraria from d15_persona p join d15_ruolo r on p.ruolo_id = r.id where p.nome='Anna'),
                                                                                         (select id from d15_persona where nome='Anna'),
                                                                                         (select id from d15_commessa where codice_commessa='MST001'));

insert into d15_ore (data,ore,costo,persona_id,commessa_id) values (date'2024-04-14',1,1*(select r.tariffa_oraria from d15_persona p join d15_ruolo r on p.ruolo_id = r.id where p.nome='Anna'),
                                                                                         (select id from d15_persona where nome='Anna'),
                                                                                         (select id from d15_commessa where codice_commessa='APP001'));

insert into d15_ore (data,ore,costo,persona_id,commessa_id) values (date'2024-04-14',2,2*(select r.tariffa_oraria from d15_persona p join d15_ruolo r on p.ruolo_id = r.id where p.nome='Paolo'),
                                                                                         (select id from d15_persona where nome='Paolo'),
                                                                                         (select id from d15_commessa where codice_commessa='APP001'));

insert into d15_ore (data,ore,costo,persona_id,commessa_id) values (date'2024-04-14',6,6*(select r.tariffa_oraria from d15_persona p join d15_ruolo r on p.ruolo_id = r.id where p.nome='Paolo'),
                                                                                         (select id from d15_persona where nome='Paolo'),
                                                                                         (select id from d15_commessa where codice_commessa='IBM001'));

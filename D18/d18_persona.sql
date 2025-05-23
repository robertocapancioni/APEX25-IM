-- create tables

create table d18_persona (
    id              number default on null to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') 
                    constraint d18_persona_id_pk primary key,
    Nome            varchar2(50 char),
    Cognome         varchar2(50 char),
    Telefono        varchar2(50 char),
    Email           varchar2(50 char),
    Data_Nascita    date,
    created         date not null,
    created_by      varchar2(255 char) not null,
    updated         date not null,
    updated_by      varchar2(255 char) not null
);



-- triggers
create or replace trigger d18_persona_biu
    before insert or update
    on d18_persona
    for each row
begin
    if inserting then
        :new.created := sysdate;
        :new.created_by := user;
    end if;
    :new.updated := sysdate;
    :new.updated_by := user;
end d18_persona_biu;
/

BEGIN
    DBMS_ERRLOG.CREATE_ERROR_LOG(
        dml_table_name => 'D18_PERSONA', 
        err_log_table_name => 'D18_PERSONA_ERR$'
    );
END;
/
-- Generated by Quick SQL 1.2.9 19/03/2025, 09:37:32

/*
Persona
  Nome vc50
  Cognome vc50
  Telefono vc50
  Email vc50
  Data_Nascita d




 Non-default options:
# settings = {"auditcols":true,"prefix":"d18"}

*/

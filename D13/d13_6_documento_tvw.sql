create or replace view d13_documento_tvw as
select 
 id,
 tipo_documento_id,
 codice,
 data_documento,
 categoria
 from d13_documento;

create or replace trigger d13_documento_tvw_itrg 
instead of insert on d13_documento_tvw 
for each row 
begin 
        d13_documento_api.insert_row (
            p_id                          => :new.id,
            p_tipo_documento_id           => :new.tipo_documento_id,
            p_codice                      => :new.codice,
            p_data_documento              => :new.data_documento,
            p_categoria                   => :new.categoria
            );
end; 
/

create or replace trigger d13_documento_tvw_utrg 
instead of update on d13_documento_tvw 
for each row 
begin 
        d13_documento_api.update_row (
            p_id                          => :new.id,
            p_tipo_documento_id           => :new.tipo_documento_id,
            p_codice                      => :new.codice,
            p_data_documento              => :new.data_documento,
            p_categoria                   => :new.categoria
            );
end; 
/

create or replace trigger d13_documento_tvw_utrg 
instead of delete on d13_documento_tvw 
for each row 
begin 
        d13_documento_api.delete_row (
            p_id                          => :old.id
            );
end; 
/
CREATE OR REPLACE EDITIONABLE TRIGGER "D13_TIPO_DOCUMENTO_BIU" 
    before insert or update 
    on d13_tipo_documento 
    for each row 
begin 
     if :new.tipo_documento like '% %' then
          raise_application_error(-20001,'Il tipo tipo_documento non può contenere spazi');
     end if;
    if inserting then 
        :new.created := sysdate; 
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
    end if; 
    :new.updated := sysdate; 
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
end d13_tipo_documento_biu; 
/


create or replace TRIGGER "D13_TIPO_DOCUMENTO_BIU" 
    before insert or update 
    on d13_tipo_documento 
    for each row 
declare
l_rec d13_tipo_documento%rowtype;
begin 
    l_rec.tipo_documento        := :new.tipo_documento;
    --l_rec.descrizione   := :new.descrizione;
    --l_rec.prezzo        := :new.prezzo;

    d13_vld.tipo_documento(p_rec => l_rec);
    if inserting then 
        :new.created := sysdate; 
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
    end if; 
    :new.updated := sysdate; 
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user); 
end d13_tipo_documento_biu;
/

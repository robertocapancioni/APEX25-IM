begin
    --APEX_COLLECTION.DELETE_COLLECTION ('FATTURA_CL');
if not apex_collection.collection_exists('FATTURA_CL') then
    apex_collection.create_collection('FATTURA_CL');
  for r in (select anno,
                   numero,
                   riga,
                   descrizione,
                   quantita,
                   importo,
                   codice_cliente,
                   ragione_sociale,
                   piva
              from d08_fattura_vw )
  loop
    apex_collection.add_member(p_collection_name=>'FATTURA_CL'
                              ,p_n001 => r.anno
                              ,p_n002 => r.numero
                              ,p_n003 => r.riga
                              ,p_c001 => r.descrizione
                              ,p_n004 => r.quantita
                              ,p_n005 => r.importo
                              ,p_c002 => r.codice_cliente
                              ,p_c003 => r.ragione_sociale
                              ,p_c004 => r.piva
    );
  end loop;
end if;
end;


select seq_id id
      ,n001 anno
      ,n002 numero
      ,n003 riga
      ,c001 descrizione
      ,n004 quantita
      ,n005 importo
      ,c002 codice_cliente
      ,c003 ragione_sociale
      ,c004 piva
  from apex_collections where collection_name='FATTURA_CL';

INSERT INTO d18_persona (Nome, Cognome, telefono, email,data_nascita)
        SELECT p.col001,p.col002,p.col003,p.col004,null from apex_application_temp_files f,
             TABLE(apex_data_parser.parse(
                 p_content => f.blob_content,
                 p_add_headers_row => 'Y',
                 p_file_name => 'dummy.xlsx'
             )) p
        WHERE f.name = :P1_FILE1
        and p.col001<>'Nome'
        LOG ERRORS INTO d18_persona_err$ REJECT LIMIT UNLIMITED;

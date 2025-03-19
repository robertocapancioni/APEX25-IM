INSERT INTO d18_persona (Nome, Cognome, telefono, email,data_nascita)
        SELECT p.col001,p.col002,p.col003,p.col004,null from apex_application_temp_files f,
             TABLE(apex_data_parser.parse(
                 p_content => f.blob_content,
                 p_add_headers_row => 'Y',
                 p_file_name => 'dummy.xlsx'
             )) p
        WHERE f.name = :P1_FILE
        and p.col001<>'Nome'
        LOG ERRORS INTO d18_persona_err$ REJECT LIMIT UNLIMITED;

INSERT INTO d18_persona (Nome, Cognome, telefono, email,data_nascita)
        SELECT p.col001 as nome,p.col002 as cognome,p.col003 as telefono,p.col004 as email,to_date(p.col005,'YYYY-MM-DD') as data_nascita from apex_application_temp_files f,
             TABLE(apex_data_parser.parse(
                 p_content => f.blob_content,
                 p_add_headers_row => 'Y',
                 p_file_name => 'dummy.xlsx'
             )) p
        WHERE f.name = :P1_FILE
        and f.application_id = :APP_ID 
        and p.col001<>'Nome'
        and p.line_number >
        (SELECT pp.line_number from apex_application_temp_files ff,
             TABLE(apex_data_parser.parse(
                 p_content => ff.blob_content,
                 p_add_headers_row => 'Y',
                 p_file_name => 'dummy.xlsx'
             )) pp
        WHERE ff.name = :P1_FILE
        and ff.application_id = :APP_ID 
        and pp.col001='Nome' )
        LOG ERRORS INTO d18_persona_err$ REJECT LIMIT UNLIMITED;

CREATE OR REPLACE PACKAGE d13_documento_api_ext IS 
/*
BEGIN
    d13_DOCUMENTO_API_EXT.SET_ROW(P_ROW_STATUS => :APEX$ROW_STATUS, 
                                  P_ID => :PX_ID, 
                                  P_TIPO_DOCUMENTO_ID => :PX_TIPO_DOCUMENTO_ID, 
                                  P_CODICE => :PX_CODICE, 
                                  P_DATA_DOCUMENTO => :PX_DATA_DOCUMENTO,
                                  P_FIRMA_YN => :PX_FIRMA_YN, 
                                  P_CATEGORIA => :PX_CATEGORIA);
END;
*/
    PROCEDURE set_row (
        p_row_status        IN VARCHAR2 DEFAULT NULL,
        p_id                IN d13_documento.id%TYPE DEFAULT NULL,
        p_tipo_documento_id IN d13_documento.tipo_documento_id%TYPE DEFAULT NULL,
        p_codice            IN d13_documento.codice%TYPE DEFAULT NULL,
        p_data_documento    IN d13_documento.data_documento%TYPE DEFAULT NULL,
        p_firma_yn          IN d13_documento.firma_yn%TYPE DEFAULT NULL,
        p_categoria         IN d13_documento.categoria%TYPE DEFAULT NULL
    );

END d13_documento_api_ext;
/

CREATE OR REPLACE PACKAGE BODY d13_documento_api_ext IS

    PROCEDURE set_row (
        p_row_status        IN VARCHAR2 DEFAULT NULL,
        p_id                IN d13_documento.id%TYPE DEFAULT NULL,
        p_tipo_documento_id IN d13_documento.tipo_documento_id%TYPE DEFAULT NULL,
        p_codice            IN d13_documento.codice%TYPE DEFAULT NULL,
        p_data_documento    IN d13_documento.data_documento%TYPE DEFAULT NULL,
        p_firma_yn          IN d13_documento.firma_yn%TYPE DEFAULT NULL,
        p_categoria         IN d13_documento.categoria%TYPE DEFAULT NULL
    ) IS
    BEGIN
        CASE p_row_status
            WHEN 'C' THEN
                d13_documento_api.insert_row(p_id => p_id, 
                                             p_tipo_documento_id => p_tipo_documento_id, 
                                             p_codice => p_codice, 
                                             p_data_documento => p_data_documento, 
                                             p_firma_yn => p_firma_yn,
                                             p_categoria => p_categoria);
            WHEN 'U' THEN
                d13_documento_api.update_row(p_id => p_id,
                                             p_tipo_documento_id => p_tipo_documento_id,
                                             p_codice => p_codice,
                                             p_data_documento => p_data_documento,
                                             p_firma_yn => p_firma_yn,
                                             p_categoria => p_categoria);
            WHEN 'D' THEN
                 d13_documento_api.delete_row(p_id => p_id);
        END CASE;
    END set_row;

END d13_documento_api_ext;
/
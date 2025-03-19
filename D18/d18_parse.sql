https://docs.oracle.com/en/database/oracle/apex/24.2/aeapi/APEX_DATA_PARSER.PARSE-Function.html

subtype t_file_type is pls_integer range 1..5;
c_file_type_xlsx              constant t_file_type := 1; -- File Type Constant
c_file_type_csv               constant t_file_type := 2; -- File Type Constant
c_file_type_xml               constant t_file_type := 3; -- File Type Constant
c_file_type_json              constant t_file_type := 4; -- File Type Constant
c_file_type_ics               constant t_file_type := 5; -- File Type Constant


type t_file_profile is record(
    file_type               t_file_type,
    file_charset            VARCHAR2(128),
    row_selector            VARCHAR2(32767),
    is_single_row           BOOLEAN,
    first_row_headings      BOOLEAN,
    xlsx_worksheet          VARCHAR2(128),
    xml_namespaces          VARCHAR2(4000),
    csv_delimiter           VARCHAR2(4),
    csv_enclosed            VARCHAR2(4),
    null_if                 VARCHAR2(20),
    force_trim_whitespace   BOOLEAN,
    skip_rows               PLS_INTEGER,
    file_columns            t_file_columns
);


type t_file_column is record(
    col_seq         PLS_INTEGER,
    name            VARCHAR2(128),
    data_type       apex_exec_api.t_data_type,
    data_type_len   PLS_INTEGER,
    is_json         BOOLEAN,
    selector        VARCHAR2(32767),
    decimal_char    VARCHAR2(4),
    group_char      VARCHAR2(4),
    format_mask     VARCHAR2(128),
    clob_column     PLS_INTEGER
);

type t_file_columns is table of t_file_column index by pls_integer;


DECLARE
	is_valid_file_type boolean;
BEGIN
	is_valid_file_type := apex_data_parser.assert_file_type(
		p_file_name => 'test.csv',
		p_file_type => apex_data_parser.c_file_type_csv );
END;


APEX_DATA_PARSER.GET_FILE_PROFILE RETURN CLOB;

select line_number, col001,col002,col003,col004,col005,col006,col007,col008 
   from table( 
              apex_data_parser.parse(
                  p_content         => {BLOB containing XLSX file},
                  p_file_name       => 'test.xlsx',
                  p_xlsx_sheet_name => 'sheet1.xml') ) ;

select apex_data_parser.get_file_profile from dual;


APEX_DATA_PARSER.GET_FILE_TYPE (
    p_file_name IN VARCHAR2 )
RETURN t_file_type;

DECLARE 
   l_file_type apex_data_parser.t_file_type;
BEGIN
    l_file_type := apex_data_parser.get_file_type( 'test.xlsx' );
END;


APEX_DATA_PARSER.GET_XLSX_WORKSHEETS (
    p_content   IN BLOB )
RETURN apex_t_parser_worksheets;



APEX_DATA_PARSER.PARSE (
    p_content                      IN BLOB,
    p_file_name                    IN VARCHAR2     DEFAULT NULL,
    p_file_type                    in t_file_type  DEFAULT NULL,
    p_file_profile                 IN CLOB         DEFAULT NULL,
    --
    p_detect_data_types            IN VARCHAR2     DEFAULT 'Y',
    p_decimal_char                 IN VARCHAR2     DEFAULT NULL,
    --
    p_xlsx_sheet_name              IN VARCHAR2     DEFAULT NULL,
    --
    p_row_selector                 IN VARCHAR2     DEFAULT NULL,
    --
    p_csv_row_delimiter            IN VARCHAR2     DEFAULT LF,
    p_csv_col_delimiter            IN VARCHAR2     DEFAULT NULL,
    p_csv_enclosed                 IN VARCHAR2     DEFAULT '"',
    --
    p_skip_rows                    IN PLS_INTEGER  DEFAULT NULL,
    p_add_headers_row              IN VARCHAR2     DEFAULT 'N',
    --
    p_nullif                       IN VARCHAR2     DEFAULT NULL,
    p_force_trim_whitespace        IN VARCHAR2     DEFAULT 'N',
    --
    p_file_charset                 IN VARCHAR2     DEFAULT 'AL32UTF8',
    p_max_rows                     IN NUMBER       DEFAULT NULL,
    p_return_rows                  IN NUMBER       DEFAULT NULL,
    --
    p_store_profile_to_collection  IN VARCHAR2     DEFAULT NULL,
    p_xml_namespaces               IN VARCHAR2     DEFAULT NULL,
    --
    p_fix_excel_precision          IN VARCHAR2     DEFAULT 'N' )
    RETURN apex_t_parser_table pipelined;


    select line_number, col001,col002,col003,col004,col005,col006,col007,col008
   from table( 
              apex_data_parser.parse(
                  p_content         => {BLOB containing XLSX spreadsheet},
                  p_file_name       => 'test.xlsx',
                  p_xlsx_sheet_name => 'sheet1.xml') ) ;


 


--DISCOVER() = parse() and then get_file_profile().



APEX_DATA_PARSER.DISCOVER (
    p_content                   IN BLOB,
    p_file_name                 IN VARCHAR2,
    --
    p_decimal_char              IN VARCHAR2     DEFAULT NULL,
    --
    p_xlsx_sheet_name           IN VARCHAR2     DEFAULT NULL,
    --
    p_row_selector              IN VARCHAR2     DEFAULT NULL,
    --
    p_csv_row_delimiter         IN VARCHAR2     DEFAULT LF,
    p_csv_col_delimiter         IN VARCHAR2     DEFAULT NULL,
    p_csv_enclosed              IN VARCHAR2     DEFAULT '"',
    --
    p_skip_rows                 IN PLS_INTEGER  DEFAULT NULL,
    --
    p_nullif                    IN VARCHAR2     DEFAULT NULL,
    p_force_trim_whitespace     IN VARCHAR2     DEFAULT 'Y',
    --
    p_file_charset              IN VARCHAR2     DEFAULT 'AL32UTF8',
    p_max_rows                  IN NUMBER       DEFAULT 200,
    --
    p_xml_namespaces            IN VARCHAR2     DEFAULT NULL )
    RETURN CLOB;

    select apex_data_parser.discover(
           p_content => {BLOB containing XLSX file},
           p_file_name=>'large.xlsx' ) as profile_json
from dual;


APEX_DATA_PARSER.GET_COLUMNS (
    p_profile             IN CLOB )
    RETURN apex_t_parser_columns PIPELINED;


select *
      from table(
                  apex_data_parser.get_columns(
                      apex_data_parser.discover(
                          p_content => {BLOB containing XLSX file},
                          p_file_name=>'large.xlsx' )));                 
CREATE PROCEDURE grant_select_all_tables(
    from_user VARCHAR2, 
    to_user VARCHAR2)
AS   
BEGIN
    FOR r IN (
        SELECT owner, table_name 
        FROM all_tables 
        WHERE owner = from_user
    )
    LOOP
        EXECUTE IMMEDIATE 
            'GRANT SELECT ON '||r.owner||'.'||r.table_name||' to ' || to_user;
    END LOOP;
END; 

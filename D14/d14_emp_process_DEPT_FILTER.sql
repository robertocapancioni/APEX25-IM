DECLARE
    l_region_id number;
    l_report_id number;
BEGIN
    -- Get region id based on current app and current page and static id
    select region_id
    into l_region_id
    from apex_application_page_regions
    where application_id = :APP_ID
    and page_id = :APP_PAGE_ID
    and upper(static_id) = upper('ir-emp')    ;

    -- Get report id for last view
    l_report_id := APEX_IR.GET_LAST_VIEWED_REPORT_ID (
        p_page_id  => :APP_PAGE_ID,
        p_region_id => l_region_id
    );

    -- Clear all filters
    APEX_IR.CLEAR_REPORT(
        p_page_id  => :APP_PAGE_ID,
        p_region_id => l_region_id,
        p_report_id => l_report_id
    );
    IF apex_application.g_x01 IS NOT NULL THEN
    APEX_IR.ADD_FILTER(
        p_page_id => :APP_PAGE_ID,
        p_region_id => l_region_id,
        p_report_column => apex_application.g_x01,
        p_filter_value => apex_application.g_x02,
        p_operator_abbr => apex_application.g_x03,
        p_report_id => l_report_id
    );
END IF;

APEX_JSON.OPEN_OBJECT;
APEX_JSON.WRITE('status', 'ok');
APEX_JSON.CLOSE_OBJECT;

EXCEPTION
    WHEN OTHERS THEN
        APEX_JSON.OPEN_OBJECT;
        APEX_JSON.WRITE('status', 'err');
        APEX_JSON.CLOSE_OBJECT;
END;

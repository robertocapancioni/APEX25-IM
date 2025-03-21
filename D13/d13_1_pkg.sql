create or replace PACKAGE d13_pkg is  

    function apex_error_handling (  
        p_error in apex_error.t_error )  
        return apex_error.t_error_result;  
      
end d13_pkg; 
/

create or replace PACKAGE BODY d13_pkg as   
    function apex_error_handling (  
        p_error in apex_error.t_error )  
        return apex_error.t_error_result  
    is  
        l_result          apex_error.t_error_result;  
        l_constraint_name varchar2(255);  
    begin  
        l_result := apex_error.init_error_result (  
                        p_error => p_error );  
        -- If it's an internal error raised by APEX, like an invalid statement or  
        -- code which can't be executed, the error text might contain security sensitive  
        -- information. To avoid this security problem we can rewrite the error to  
        -- a generic error message and log the original error message for further  
        -- investigation by the help desk.  
        if p_error.is_internal_error then  
            -- mask all errors that are not common runtime errors (Access Denied  
            -- errors raised by application / page authorization and all errors  
            -- regarding session and session state)  
            --if not p_error.is_common_runtime_error then          
            --    -- Change the message to the generic error message which doesn't expose  
            --    -- any sensitive information.  
            --    add_error_log( p_error );  
            --    l_result.message         := 'An unexpected internal application error has occurred. ';  
            --    l_result.additional_info := null;                        
            --end if;  
            null;
        else  
            -- Always show the error as inline error  
            -- Note: If you have created manual tabular forms (using the package  
            --       apex_item/htmldb_item in the SQL statement) you should still  
            --       use "On error page" on that pages to avoid loosing entered data  
            l_result.display_location := case  
                                           when l_result.display_location = apex_error.c_on_error_page then apex_error.c_inline_in_notification  
                                           else l_result.display_location  
                                         end;  
            -- If it's a constraint violation like  
            --  
            --   -) ORA-00001: unique constraint violated  
            --   -) ORA-02091: transaction rolled back (-> can hide a deferred constraint)  
            --   -) ORA-02290: check constraint violated  
            --   -) ORA-02291: integrity constraint violated - parent key not found  
            --   -) ORA-02292: integrity constraint violated - child record found  
            --  
            -- we try to get a friendly error message from our constraint lookup configuration.  
            -- If we don't find the constraint in our lookup table we fallback to  
            -- the original ORA error message.  
            if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292) then  
                l_constraint_name := apex_error.extract_constraint_name (  
                                         p_error => p_error );  
                begin  
                    select message  
                      into l_result.message  
                      from d13_error_lookup  
                     where constraint_name = l_constraint_name;  
                exception when no_data_found then null; -- not every constraint has to be in our lookup table  
                end;  
            end if;  
            -- If an ORA error has been raised, for example a raise_application_error(-20xxx, '...')  
            -- in a table trigger or in a PL/SQL package called by a process and we  
            -- haven't found the error in our lookup table, then we just want to see  
            -- the actual error text and not the full error stack with all the ORA error numbers.  
            if p_error.ora_sqlcode is not null and l_result.message = p_error.message then  
                l_result.message := apex_error.get_first_ora_error_text (  
                                        p_error => p_error );  
            end if;  
            -- If no associated page item/tabular form column has been set, we can use  
            -- apex_error.auto_set_associated_item to automatically guess the affected  
            -- error field by examine the ORA error for constraint names or column names.  
            if l_result.page_item_name is null and l_result.column_alias is null then  
                apex_error.auto_set_associated_item (  
                    p_error        => p_error,  
                    p_error_result => l_result );  
            end if;  
        end if;  
        return l_result;  
    end apex_error_handling;  
        
end d13_pkg;  
/

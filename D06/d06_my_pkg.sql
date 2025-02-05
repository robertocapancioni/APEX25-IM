create or replace package d06_my_pkg
is
procedure venduto(p_venduto in number default 0);
procedure venduto(p_venduto in number default 0,
                      p_venduto_txt out varchar2);

function get_venduto(p_venduto in number default 0)
return varchar2;
end d06_my_pkg;
/

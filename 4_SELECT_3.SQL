declare
    --테이블 타입 정의
    type t_empno_list is table of emp.empno%type        index by binary_integer;
    type t_ename_list is table of emp.ename%type        index by binary_integer;
    type t_hiredate_list is table of emp.hiredate%type  index by binary_integer;

    --테이블 변수 선언
    tbl_empno_list      t_empno_list;
    tbl_ename_list      t_ename_list;
    tbl_hiredate_list   t_hiredate_list;
    
    l binary_integer := 0;
begin
    for k in (select empno, ename, hiredate from emp where empno >= 1) loop
        l := l + 1;
        tbl_empno_list(l) := k.empno;
        tbl_ename_list(l) := k.ename;
        tbl_hiredate_list(l) := k.hiredate;
        
        dbms_output.put_line(tbl_empno_list(l) || ' / ' ||tbl_ename_list(l) || ' / ' || tbl_hiredate_list(l));
        
    end loop;

    
exception
    when no_data_found then
            dbms_output.put_line('no data found !!!');
    when too_many_rows then
            dbms_output.put_line('too many rows found !!!');
end;
/
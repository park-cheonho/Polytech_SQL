-- (record)
SET SERVEROUTPUT ON
declare
    type t_emp is record(
        t_empno     emp.empno%type,
        t_ename     emp.ename%type,
        t_hiredate  emp.hiredate%type
    );
    
rec_emp t_emp;
l binary_integer := 0;
begin
    -- record의 field에 값을 대입
    for k in (select empno, ename, hiredate from emp where empno >= 1) loop
        
        rec_emp.t_empno := k.empno;
        rec_emp.t_ename := k.ename;
        rec_emp.t_hiredate := k.hiredate;
        
        dbms_output.put_line(rec_emp.t_empno || ' / ' ||rec_emp.t_ename || ' / ' || rec_emp.t_hiredate);
        
    end loop;
    
exception
    when no_data_found then
            dbms_output.put_line('no data found !!!');
    when too_many_rows then
            dbms_output.put_line('too many rows found !!!');
end;
/
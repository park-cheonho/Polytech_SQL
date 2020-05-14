--1
update T_EMP set sal=0 where deptno= 10; 
--3
select deptno,ename,sal from T_emp  
where deptno = 10;
--4
COMMIT;
--다른세션
--2
select  deptno,ename,sal from T_emp  
where deptno = 10; --? 3때 실행하면 반영 X
--5
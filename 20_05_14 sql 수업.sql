--1
update T_EMP set sal=0 where deptno= 10; 
--3
select deptno,ename,sal from T_emp  
where deptno = 10;
--4
COMMIT;
--�ٸ�����
--2
select  deptno,ename,sal from T_emp  
where deptno = 10; --? 3�� �����ϸ� �ݿ� X
--5
desc dbms_output

select ename, sal, rowid
from emp;

UPDATE emp set sal = 999
where rowid in(select rowid from emp where ename like 'A%');

select ename,sal from emp where ename like 'A%';
rollback;
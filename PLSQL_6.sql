BEGIN 
    SELECT job, hiredate, sal, deptno 
    INTO :jobtype, :hired, :salary, :dept FROM emp 
    WHERE ename = UPPER(:empname); 
/* Get number of people whose length of * service is longer */ 
    SELECT count(*) 
    INTO :worked_longer FROM emp 
    WHERE hiredate < :hired; 
/* Get number of people with a higher salary */
    SELECT count(*) INTO :higher_sal FROM emp 
    WHERE sal > :salary; 
/* Get number of people in the same department*/
    SELECT count(*) INTO :total_in_dept FROM emp 
    WHERE deptno = :dept; 
end;

@@C:\Users\HP\Desktop\myGit\SQL\6_FUNTION_1.SQL
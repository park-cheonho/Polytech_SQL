-- ���� 1
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD-HH24:MI:SSSSS')FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD-HH24:MI:SS')FROM DUAL;
select systimestamp from dual;
select current_timestamp from dual;
select to_char(systimestamp, 'YYYY-MM-DD HH24:MI:SSFF') from dual;
select to_char(systimestamp, 'YYYY-MM-DD HH24:MI:SSFF3') from dual;
select to_char(systimestamp, 'YYYY-MM-DD HH24:MI:SSFF4') from dual;
select to_char(systimestamp, 'YYYY-MM-DD HH24:MI:SSFF5') from dual;
SELECT to_char(current_timestamp, 'HH:MI:SS.FF3') FROM dummy;
SELECT to_char(current_timestamp, 'HH:MI:SS.FF2') FROM dummy;
--date�ȿ��� �����Ͻú��ʰ� �������� ���� �Ⱥ��� ������?
--����2
/*
������ ���� ������ UNION, UNION ALL,INTERSECT, MINUS�� �������� 
������ ���� SQL�� ������ ����� �� ���ĵǴ��� ���� �Ͻʽÿ�.
������ ���Ͽ� ���Ͽ� ��
������ ���ͷ�Ʈ
������ ���̳ʽ�
����Ŭ ������ �������� ����, UNION ALL�� 
�ߺ��� �����ϴ� �۾��� ���� �ʱ� ������ UNION ALL ������ ������ �� ����.
select
[union/unionall/interect/minus]
select
order by �÷�
*/

DESC EMP;
SELECT* FROM EMP ORDER BY EMPNO;
SELECT JOB,ENAME,COMM,SAL
FROM EMP
WHERE SAL > 1500
ORDER BY ENAME;
--7��
SELECT JOB, ENAME, COMM, SAL
FROM EMP
WHERE EMPNO >=7700
ORDER BY ENAME;
--8��
--���� �ҷ��� ��� �ߺ� 4�� Ŭ�� ���� ŷ ����
SELECT JOB, ENAME, COMM, SAL
FROM EMP
WHERE EMPNO >=7700

UNION 

SELECT JOB,ENAME,COMM,SAL
FROM EMP
WHERE SAL > 1500
ORDER BY ENAME,JOB;
--ORDER BY ; ���� DBMS�� ���� ó���ϴ� ���� Ȯ�� ��Ŭ�� ��ȹ

SELECT JOB, ENAME, COMM, SAL
FROM EMP
WHERE EMPNO >=7700

UNION ALL

SELECT JOB,ENAME,COMM,SAL
FROM EMP
WHERE SAL > 1500;
-- 7�� 8�� �ߺ��ؼ� 15�� ǥ�� �ߺ��� �����ϴ� �۾��� ���� �ʱ� ������ UNION ALL ������ ������ �� ����.

SELECT JOB, ENAME, COMM, SAL
FROM EMP
WHERE EMPNO >=7700

INTERSECT

SELECT JOB,ENAME,COMM,SAL
FROM EMP
WHERE SAL > 1500;
-- �ߺ� 4�� Ŭ�� ���� ŷ ����

SELECT JOB, ENAME, COMM, SAL
FROM EMP
WHERE EMPNO >=7700

MINUS

SELECT JOB,ENAME,COMM,SAL
FROM EMP
WHERE SAL > 1500;
-- B���� ���ͼ�Ʈ�� �� 4��

SELECT DEPTNO FROM DEPT WHERE DEPTNO >= 10
UNION
SELECT DEPTNO FROM EMP WHERE DEPTNO <= 30;

SELECT DEPTNO FROM DEPT WHERE DEPTNO >= 10
UNION ALL
SELECT DEPTNO FROM EMP WHERE DEPTNO <= 30;

SELECT DEPTNO FROM DEPT
INTERSECT
SELECT DEPTNO FROM EMP;

SELECT DEPTNO FROM DEPT
MINUS
SELECT DEPTNO FROM EMP;

--����3 Interactive SQL �� Embeded SQL�� ���� �ϰ� ������ ��뿹�� ã�Ƽ� ����ϰ� �ؼ� �Ͻʽÿ�.
/*
���ͷ�Ƽ�� SQL�� DBMS�� ���� ������ ���Ǹ� �ϰ� ����޴� ���� �����ϴ� �Ű� �츮�� ���� ����ϴ� ��
�Ӻ���� SQL�� �ٸ� �� �Ἥ ȣ���þ� �Ἥ ���Ǹ� �� �� �ִ� ��
�̹� ¥���� �͸� ���ø� ó�� ������� ���·� ���� ���� ���� ������ �޴� �� 
sql�� dbms�� ���Ӱ����� ������ ���� ������ Ÿ������ dbms�� ����ϱ� ���� ���Ǵ� sql
���ͷ�Ƽ�� SQL�� DBMS������ ���� ���� ����Ǵ� �츮�� �����߿� �ϴ°� ���� ���Ǹ� �ְ� �޴�
�Ӻ���� sql�� �ٸ� ���ν� dbms�� �����ϰ��� �Ҷ� dbms�� ������ ����� sql�� �̿��Ͽ� dbms�� ����ϴ� ��� - �̹��� ���� 
*/

-- ����4 
/*
�μ��� ���� ���ʽ� ��� SQL�� �ۼ� �Ͻʽÿ�    
10�� �μ� �޿��� 0.3% , 20���μ� �޿��� 20%, 30�� �μ� �޿��� 10%,  ������ ��� �μ� 1%     
  - DECODE �Ǵ� CASE
�μ� ��ȣ, �̸�,����,�޿�,���ʽ� 
  - SELECT   
�μ���, �ְ� ���ʽ� ������ ����  
  - ORDER BY
�Ҽ��� ���� 
*/
SELECT DEPTNO,ENAME,JOB,SAL,
    CASE WHEN DEPTNO = 10 THEN TRUNC(SAL*0.003)
         WHEN DEPTNO = 20 THEN TRUNC(SAL*0.2)
         WHEN DEPTNO = 30 THEN TRUNC(SAL*01)
    ELSE TRUNC(SAL*0.01)
    END AS BONUS
FROM EMP
ORDER BY DEPTNO, BONUS DESC;
-- SELECT DEPTNO,ENAME,JOB,SAL,TRUNC(DECODE(DEPTNO,10,SAL*0.003,20,SAL*0.2,30,SAL*0.1,SAL*0.01))AS BONUS FROM EMP ORDER BY DEPTNO ASC,BONUS DESC;
-- ���� 5 �Ʒ��� SQL�� �����Ͽ� �ֻ��� �޿��� 5���� ��ȸ�ϴ� SQL���� �ۼ� �Ͻʽÿ� 
/*
SELECT  DEPTNO,ENAME,SAL  
FROM EMP  
WHERE  ROWNUM <= 5 
ORDER  BY SAL DESC ; 
TOP_N , BOTTOM_N ��� �̸� ������ ����Ʈ �� �ֻ��������� ������ ������
ROWNUM ORDER BY �������� ����!!!!! ���������� �߿�
*/
SELECT  DEPTNO,ENAME,SAL,ROWNUM
FROM (SELECT DEPTNO,ENAME,SAL FROM EMP ORDER BY SAL DESC)
WHERE  ROWNUM <= 5;
--���� 6 SQL�� ������� �ʴ� ������ ��¥ ���� YY �� RR�� �������� �������� ���� �Ͻʽÿ�
/*

SELECT ENAME,HIREDATE,SAL 
FROM EMP 
WHERE HIREDATE between to_date('81/02/20','yy/mm/dd') and to_date('82/12/09','yy/mm/dd');
*/
SELECT ENAME,HIREDATE,SAL 
FROM EMP 
WHERE HIREDATE between to_date('81/02/20','yy/mm/dd') and to_date('82/12/09','yy/mm/dd');
-- YY�� ��� ���濡 �ִ� ������ �ð��� �������� ���ڸ� ���ڸ� ���� 20�� ���� ���̺� 2081�� �Ի��ڰ� ���� �׷��� �÷��� ��� ���� �ȳ��û�
SELECT ENAME,HIREDATE,SAL 
FROM EMP 
WHERE HIREDATE between to_date('1981/02/20','YYyy/mm/dd') and to_date('1982/12/09','YYyy/mm/dd');
SELECT ENAME,HIREDATE,SAL 
FROM EMP 
WHERE HIREDATE between to_date('81/02/20','RR/mm/dd') and to_date('82/12/09','RR/mm/dd');
--RR�� ��� 00-49 50--99 ����⵵ 2020 �Է³⵵81 �������� 
-- �� 2020�� 30 �� ��� ���缼�� 2030
-- �� 2060�� ���� �ð� �̰� �Է� �⵵ 30�̸� 2130 ��������
-- �� 2060�� �����ð� �̰� �Է� �⵵ 70�̸� 2070 ���缼��
/*
yy�� ������ ���� �ð��� �������� yy�� �Է��ϸ� 2081���Ի��ڸ� ã�µ� ���� �� ���Ǵ� 2081�� �Ի��ڰ� ���⿡ �÷��� ����
�ذ� ��� rr�� ���� 
rr�� �ݿø��� ����ϸ鼭 �����ؾ���
        �����ð�     ���Խð�
00 49   2020   00 49  01 2001
00 49   2020   50 99  81 1981
50 99   2060   00 49  01 2101
50 99   2060   50 99  99 2099
*/
SELECT ROUND(DBMS_RANDOM.VALUE(0,21)) AS PRISENTER FROM DUAL;



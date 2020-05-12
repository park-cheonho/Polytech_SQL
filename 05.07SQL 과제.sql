-- 과제 1
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
--date안에는 연월일시분초가 다잇지만 눈에 안보인 이유는?
--과제2
/*
다음의 집합 연산자 UNION, UNION ALL,INTERSECT, MINUS를 공부한후 
각각의 예제 SQL을 만든후 결과가 왜 정렬되는지 설명 하십시오.
합집합 유니온 유니온 올
교집합 인터렉트
차집합 마이너스
오라클 성능의 관점으로 보면, UNION ALL은 
중복을 제거하는 작업을 하지 않기 때문에 UNION ALL 연산이 성능이 더 좋다.
select
[union/unionall/interect/minus]
select
order by 컬럼
*/

DESC EMP;
SELECT* FROM EMP ORDER BY EMPNO;
SELECT JOB,ENAME,COMM,SAL
FROM EMP
WHERE SAL > 1500
ORDER BY ENAME;
--7개
SELECT JOB, ENAME, COMM, SAL
FROM EMP
WHERE EMPNO >=7700
ORDER BY ENAME;
--8개
--예제 할려는 대상 중복 4개 클락 포드 킹 스콧
SELECT JOB, ENAME, COMM, SAL
FROM EMP
WHERE EMPNO >=7700

UNION 

SELECT JOB,ENAME,COMM,SAL
FROM EMP
WHERE SAL > 1500
ORDER BY ENAME,JOB;
--ORDER BY ; 기준 DBMS이 먼저 처리하는 순서 확인 우클릭 계획

SELECT JOB, ENAME, COMM, SAL
FROM EMP
WHERE EMPNO >=7700

UNION ALL

SELECT JOB,ENAME,COMM,SAL
FROM EMP
WHERE SAL > 1500;
-- 7개 8개 중복해서 15개 표현 중복을 제거하는 작업을 하지 않기 때문에 UNION ALL 연산이 성능이 더 좋다.

SELECT JOB, ENAME, COMM, SAL
FROM EMP
WHERE EMPNO >=7700

INTERSECT

SELECT JOB,ENAME,COMM,SAL
FROM EMP
WHERE SAL > 1500;
-- 중복 4개 클락 포드 킹 스콧

SELECT JOB, ENAME, COMM, SAL
FROM EMP
WHERE EMPNO >=7700

MINUS

SELECT JOB,ENAME,COMM,SAL
FROM EMP
WHERE SAL > 1500;
-- B에서 인터섹트를 뺀 4개

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

--과제3 Interactive SQL 과 Embeded SQL를 설명 하고 각각의 사용예를 찾아서 기록하고 해석 하십시오.
/*
인터렉티브 SQL은 DBMS가 직접 서버에 질의를 하고 응답받는 것을 직접하는 거고 우리가 지금 사용하는 것
임베디드 SQL은 다른 언어를 써서 호스팅언어를 써서 질의를 할 수 있는 것
이미 짜여진 것만 템플릿 처럼 만들어진 상태로 넣은 값에 대한 변수만 받는 것 
sql은 dbms에 접속가능한 유일한 언어기 때문에 타언어에서도 dbms를 사용하기 위해 사용되는 sql
인터랙티브 SQL은 DBMS서버와 끊임 없이 연결되는 우리가 수업중에 하는것 직접 질의를 주고 받는
임베디드 sql은 다른 언어로써 dbms에 접근하고자 할때 dbms의 유일한 언어인 sql을 이용하여 dbms를 사용하는 방법 - 이미지 파일 
*/

-- 과제4 
/*
부서별 차등 보너스 계산 SQL을 작성 하십시요    
10번 부서 급여의 0.3% , 20번부서 급여의 20%, 30번 부서 급여의 10%,  나머지 모든 부서 1%     
  - DECODE 또는 CASE
부서 번호, 이름,직무,급여,보너스 
  - SELECT   
부서별, 최고 보너스 순으로 정렬  
  - ORDER BY
소수점 절삭 
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
-- 과제 5 아래의 SQL을 참조하여 최상위 급여자 5명을 조회하는 SQL문을 작성 하십시요 
/*
SELECT  DEPTNO,ENAME,SAL  
FROM EMP  
WHERE  ROWNUM <= 5 
ORDER  BY SAL DESC ; 
TOP_N , BOTTOM_N 라는 이름 붙혀서 리스트 업 최상위데이터 최하위 데이터
ROWNUM ORDER BY 서브쿼리 쓰기!!!!! 서브쿼리가 중요
*/
SELECT  DEPTNO,ENAME,SAL,ROWNUM
FROM (SELECT DEPTNO,ENAME,SAL FROM EMP ORDER BY SAL DESC)
WHERE  ROWNUM <= 5;
--과제 6 SQL이 실행되지 않는 이유를 날짜 포맷 YY 와 RR의 차이점을 조사한후 설명 하십시요
/*

SELECT ENAME,HIREDATE,SAL 
FROM EMP 
WHERE HIREDATE between to_date('81/02/20','yy/mm/dd') and to_date('82/12/09','yy/mm/dd');
*/
SELECT ENAME,HIREDATE,SAL 
FROM EMP 
WHERE HIREDATE between to_date('81/02/20','yy/mm/dd') and to_date('82/12/09','yy/mm/dd');
-- YY의 경우 옆방에 있는 서버의 시간을 기준으로 두자리 숫자를 쓰면 20이 붙음 테이블에 2081년 입사자가 없음 그래서 컬럼은 살고 값이 안나올뿐
SELECT ENAME,HIREDATE,SAL 
FROM EMP 
WHERE HIREDATE between to_date('1981/02/20','YYyy/mm/dd') and to_date('1982/12/09','YYyy/mm/dd');
SELECT ENAME,HIREDATE,SAL 
FROM EMP 
WHERE HIREDATE between to_date('81/02/20','RR/mm/dd') and to_date('82/12/09','RR/mm/dd');
--RR의 경우 00-49 50--99 현재년도 2020 입력년도81 이전세기 
-- 예 2020년 30 의 경우 현재세기 2030
-- 예 2060년 서버 시간 이고 입력 년도 30이면 2130 다음세기
-- 예 2060년 서버시간 이고 입력 년도 70이면 2070 현재세기
/*
yy는 서버의 현재 시각을 기준으로 yy를 입력하면 2081년입사자를 찾는데 현재 저 질의는 2081년 입사자가 업기에 컬럼만 나옴
해결 방안 rr로 변경 
rr은 반올림을 기억하면서 이해해야함
        서버시간     기입시간
00 49   2020   00 49  01 2001
00 49   2020   50 99  81 1981
50 99   2060   00 49  01 2101
50 99   2060   50 99  99 2099
*/
SELECT ROUND(DBMS_RANDOM.VALUE(0,21)) AS PRISENTER FROM DUAL;



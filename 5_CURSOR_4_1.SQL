DECLARE
	CURSOR CUR_EMP IS
		SELECT ENAME,JOB,SAL,COMM FROM EMP WHERE DEPTNO = 10;
	
BEGIN
	FOR R_CUR_EMP IN CUR_EMP
	LOOP
		INSERT INTO BONUS(ENAME,JOB,SAL,COMM)
			VALUES(R_CUR_EMP.ENAME,R_CUR_EMP.JOB,R_CUR_EMP.SAL,R_CUR_EMP.COMM);
	END LOOP;

	--DBMS_OUTPUT.PUT_LINE('TOTAL '||TO_CHAR(CUR_EMP%ROWCOUNT)||'ROWS PROCESSED');
	COMMIT;
END;
/

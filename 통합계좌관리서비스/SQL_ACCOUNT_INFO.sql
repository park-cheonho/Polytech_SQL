-- users ���̺�
CREATE TABLE USERS(
    NAME VARCHAR2(10),
    ID VARCHAR(20) PRIMARY KEY,
    PWD VARCHAR(20),
    SEQ NUMBER,
    REG_DATE DATE
);
-- account ���̺�
CREATE TABLE ACCOUNT(
    NAME VARCHAR2(10),
    ID VARCHAR(20),
    ACCOUNT_NUMBER VARCHAR(20),
    BALANCE NUMBER,
    BANK_CODE VARCHAR(3),
    BANK_NAME VARCHAR(30),
    NICKNAME VARCHAR(50)
);

-- �������� �߰�

alter table ACCOUNT
add constraint ACCOUNT_ck_BAL 
check (BALANCE >= 0);

--�α��� ����

SELECT ID, PWD, NAME, REG_DATE
FROM USERS
WHERE ID = ? AND PWD = ? ;

--���̵� �ߺ� Ȯ�� ����

SELECT ID
FROM USERS
WHERE ID = ?;

--ȸ������ ���� 

insert into USERS(ID, PWD, NAME) 
 values(?,?,?) ;

--���� ��� ���� 
insert into ACCOUNT(BANK_NAME, ACCOUNT_NUMBER, NAME, ID, BALANCE, BANK_CODE, NICKNAME
values(?,?,?,?,?,?,?);

--���¹�ȣ�� �����ϴ� ��� ����

delete from  ACCOUNT 
where ACCOUNT_NUMBER = ? and ID = ?;

--�� ��ü���¸� ��ȸ�ϴ� ��� ����

SELECT * FROM ACCOUNT WHERE NAME = ?;

--�Է��� ���¹�ȣ�� ���¸� ��ȸ�ϴ� ���

select *  from ACCOUNT where account_number = ? and name = ?;

--������ü���� ���� �����ϴ� �������

select * from ACCOUNT where account_number = ? and name = ?;

--�Է��� ������  ���¸� ��ȸ�ϴ� ���

select *from ACCOUNT where bank_name = ? and name = ?;

--���� ��ȣ�� ���¸� �����Ͽ� ���� ���� �����ϱ�

update ACCOUNT  set NICKNAME = ?  where ID = ? and ACCOUNT_NUMBER = ?;

--���¿� �Ա��ϴ� ���

UPDATE ACCOUNT SET BALANCE = BALANCE + ?  WHERE ACCOUNT_NUMBER = ? and BANK_NAME = ? ;

--���¿��� ����ϴ� ���

UPDATE ACCOUNT SET BALANCE = BALANCE - ? WHERE ACCOUNT_NUMBER = ? and BANK_NAME = ?;

--�ٸ� ���·� �۱��ϴ� ���

UPDATE ACCOUNT SET BALANCE = BALANCE - ? WHERE ACCOUNT_NUMBER = ? ;
UPDATE ACCOUNT SET BALANCE = BALANCE + ? WHERE ACCOUNT_NUMBER = ? ;

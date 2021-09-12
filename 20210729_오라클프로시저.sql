--���ν���(����Ŭ�� �Լ�)

drop table test CASCADE CONSTRAINTS;  -- ���̺� ���� ����

create table test(
code VARCHAR2(10) PRIMARY KEY,
name VARCHAR2(20),
age number(5)
);

select * from test;
--***************************************************************************************************************************************
--���ν��� ���� (�� �Ʒ��� �־���Ѵ�.)(�μ�Ʈ)
--DROP PROCEDURE testinsert;
--���� ����� �� �Ⱦ� (CREATE or REPLACE �� ���� �ٽ� ����� ����)
CREATE or REPLACE PROCEDURE testinsert(
--�Ű�����
    pcode IN VARCHAR2,
    pname IN VARCHAR2,
    page IN NUMBER
)
IS
BEGIN
    --���๮
    INSERT INTO test(code, name, age) VALUES (pcode, pname, page);
END;

--���ν��� ����
EXEC testinsert('m001', 'ȣȣȣ', 20);

--***************************************************************************************************************************************
--���ν��� ����(update)
CREATE OR REPLACE PROCEDURE testupdate(
    --�Ű������� Ÿ���� ���̺��� ��������
    pcode IN test.code%TYPE,
    pname IN test.name%TYPE,
    page IN test.age%TYPE
)
IS
BEGIN
    --���๮
    UPDATE test
    set name = pname,
    age = page
    where code = pcode;
END;

--������Ʈ ���ν��� ���
EXEC testupdate('m002', '������', 30);

CREATE OR REPLACE PROCEDURE testdelet(
    --�Ű�����
    pcode IN TEST.CODE%TYPE
)
IS
BEGIN
    --���๮
    DELETE FROM test
    WHERE code = pcode;
END;

--�׽�Ʈ����Ʈ ����
EXEC testdelet ('m002');

--***************************************************************************************************************************************
--���ν��� ���� (�μ�Ʈ �Ǵ� ������Ʈ)
--�����Ͱ� ������ �μ�Ʈ ������ ������Ʈ
CREATE OR REPLACE PROCEDURE tset_insert_update(
    --�Ű����� (IN : �ܺο��� ���� �޴´�.)
    pcode IN TEST.CODE%TYPE,
    pname IN TEST.NAME%TYPE,
    page  IN TEST.AGE%TYPE
)
IS
--���� ����
    CNT NUMBER;
BEGIN
    --��ȸ
    SELECT count(*) INTO CNT FROM test where code = pcode; --����Ʈ�� �Ǽ��� CNT������ �ִ´�.
    -- ����Ŭ������ ���ٶ�� ���� = �ϳ�
    IF CNT = 0 THEN -- ���� ����Ʈ�� ����� 0�̶��
        INSERT INTO test(code, name, age) VALUES (pcode, pname, page);
    ELSE -- ���� ����Ʈ�� ����� 0�� �ƴ϶��
        UPDATE TEST SET NAME = PNAME, AGE = PAGE WHERE code = pcode;
    END IF;
END;

EXEC tset_insert_update ('m003','������', 30);

--***************************************************************************************************************************************
--�������� �Ǽ��� ��ȯ�ϴ� ���ν���
CREATE OR REPLACE PROCEDURE testcount(
    --�Ű�����
    cnt OUT NUMBER -- ������� ��ȯ
)
IS
BEGIN
    SELECT COUNT(*) INTO CNT FROM test; --����� ���� CNT�� �־��
END;

--�ܼ�â�� ��� ON
SET SERVEROUTPUT ON;

--testcount�� �׽�Ʈ �ϱ����� �͸� ���
DECLARE -- ������ ������ �͸� ����
    CNT NUMBER;
BEGIN
    testcount(CNT);
    DBMS_OUTPUT.put_line('�Ǽ�: ' || CNT);
END;

--***************************************************************************************************************************************
--�ǽ�)CODE�� 'm001'�� �̸��� ��ȯ
--�Ű������� �ް� �̸� ���� ���
CREATE OR REPLACE PROCEDURE test_name_age(
    pcode in test.code%TYPE,
    rname OUT test.NAME%TYPE,
    rage OUT test.AGE%TYPE
)
IS
BEGIN
    SELECT name,age INTO rname,rage FROM test WHERE code = pcode;
END;

--test_name_age �׽�Ʈ �ϱ����� �͸� ���
DECLARE -- ������ ������ �͸� ����
    rage test.AGE%TYPE;
    rname test.NAME%TYPE;
    --rname VARCHAR2(10); ������ �ҰŸ� ������ �����ؾ���
BEGIN
    test_name_age('m001', rname, rage);
    DBMS_OUTPUT.put_line('�̸�: ' || rname);
    DBMS_OUTPUT.put_line('����: ' || rage);
END;

CREATE OR REPLACE PROCEDURE TEST_SELECT(
    PCODE IN OUT TEST.CODE%TYPE,
    RNAME OUT TEST.NAME%TYPE,
    RAGE OUT TEST.AGE%TYPE
)
IS
BEGIN
    SELECT NAME, AGE INTO RNAME, RAGE FROM TEST WHERE CODE = PCODE;
    PCODE := 'HONG';--IN OUT �׽�Ʈ�� (:= ���Կ����� ȫ�� PCODE�� �ְڴ�)
END;

--TEST_SELECT�� �׽�Ʈ
DECLARE
    CODE TEST.CODE%TYPE :=  'java';
    NAME VARCHAR2(20);
    AGE NUMBER;
BEGIN
    TEST_SELECT(CODE, NAME, AGE);
    DBMS_OUTPUT.put_line('�ڵ�:' || CODE);
    DBMS_OUTPUT.put_line('�̸�:' || NAME);
    DBMS_OUTPUT.put_line('����:' || AGE);
END;

--***************************************************************************************************************************************
--Ŀ�� (CURSOR)
--�Ͻ��� Ŀ�� (�μ�Ʈ, ������Ʈ, ����Ʈ, 1���� �ο츦 ����Ʈ �ҋ�)
BEGIN
    DELETE FROM TEST WHERE CODE = 'm004';
    IF SQL%FOUND THEN --������ �Ǿ��ٸ�
    --IF SQL%NOTFOUND THEN --������ ���� �ʾҴٸ�
        DBMS_OUTPUT.PUT_LINE('������ ���� �Ϸ�');
    ELSE
        DBMS_OUTPUT.PUT_LINE('������ ������');
    END IF;
END;

--***************************************************************************************************************************************
--ONEROW
DECLARE
    RNAME TEST.NAME%TYPE;
BEGIN
    SELECT NAME INTO RNAME FROM TEST WHERE CODE = 'm005';
    DBMS_OUTPUT.PUT_LINE('��ȸ�Ǽ�: ' || SQL%ROWCOUNT);
    --����ó�� (�����Ͱ� ������� ���)
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
             DBMS_OUTPUT.PUT_LINE('�����Ͱ� �����ϴ�.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('���� �߻�');
END;

--***************************************************************************************************************************************
--����� Ŀ�� (���߰� MULTIROW)
--������ Ŀ�� �����
DECLARE
    --����Ʈ ������� ���� Ŀ�� ����
    CURSOR TEST_CUR
    IS
    SELECT * FROM TEST;
    --����
    TEST_REC TEST%ROWTYPE; --�׽�Ʈ�� �� ��ü
BEGIN
    OPEN TEST_CUR;  --Ŀ�� ���� (����)
    LOOP --���� �ݺ���
        FETCH TEST_CUR INTO TEST_REC;  --����
        EXIT WHEN TEST_CUR%NOTFOUND; --�ݺ��� �������� ���� ����
        DBMS_OUTPUT.PUT_LINE(TEST_REC.CODE || ' ' || TEST_REC.NAME || ' ' || TEST_REC.AGE);
    END LOOP;
    CLOSE TEST_CUR;
END;

--***************************************************************************************************************************************
--FOR Ű���带 �̿��ؼ� Ŀ�� ����(�ݺ������� �迭 ���)
BEGIN
    --�������� �ѰǾ� TEST_REC�� �����Ͽ� LOOP����
    FOR TEST_REC IN (
        SELECT * FROM TEST
    )
    LOOP
         DBMS_OUTPUT.PUT_LINE(TEST_REC.CODE || ' ' || TEST_REC.NAME || ' ' || TEST_REC.AGE);
    END LOOP;
END;

--***************************************************************************************************************************************
--�������� Ŀ���� ��ȯ (����� Ŀ��)
CREATE OR REPLACE PROCEDURE TEST_SELECTLIST(
    TEST_CUR OUT SYS_REFCURSOR  --����Ʈ ����Ʈ�� �������ִ� Ŀ�� ��ȯ
)
IS
BEGIN
    OPEN TEST_CUR FOR
    SELECT * FROM TEST;
END;

--��ȯ�Ǵ� Ŀ�� �׽�Ʈ
 --:TEST_CUR ��ȯ�� ���� ������ ��ڴ�.
VAR TEST_CUR REFCURSOR
EXEC TEST_SELECTLIST(:TEST_CUR)
PRINT TEST_CUR;

select * from test;

--***************************************************************************************************************************************
--���ν��� : �Խù� ��ȸ�� +1 
--���ۿ��� ȣ���ϴ� ������� ���� ����
CREATE OR REPLACE PROCEDURE P_UPDATE_READ_CNT(
    PGUBUN IN USERMANGE.GUBUN%TYPE,  --1: �Խù� 2: ���
    PNUM IN USERMANGE.NUM%TYPE,  -- �Խù� ��ȣ
    PUSERID IN USERMANGE.USERID%TYPE, --���� id
    Plikegubun IN USERMANGE.likegubun%TYPE --��ȸ
)
IS
    CNT NUMBER;
BEGIN
    --���� ��ȸ ���� ���� ���� count
    SELECT COUNT(*) INTO CNT FROM USERMANGE
    WHERE GUBUN = PGUBUN
    AND NUM = PNUM
    AND USERID = PUSERID;
    --���࿡ ���� ���� ī���Ͱ� 0 �̶�� �Խù� ��ȸ�� +1, �����Ŵ��� ���̺� insert
    IF CNT=0 THEN
   		UPDATE BOARD
		SET READCNT = READCNT +1
		WHERE BNUM = PNUM;
        
        --���� �Ŵ��� ���̺� �μ�Ʈ
   		INSERT INTO USERMANGE (GUBUN, NUM, USERID, likegubun)
		VALUES (PGUBUN,PNUM, PUSERID, Plikegubun);

    END IF;
        
END;

EXEC P_UPDATE_READ_CNT('1', '2', 'java','0' );




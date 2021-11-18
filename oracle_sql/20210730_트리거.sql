--Ʈ����(trigger)
--�ڵ� ����

ROLLBACK;
COMMIT;

SELECT * FROM TEST;
SELECT * FROM TEST_LOG;
INSERT INTO test(code, name, age) VALUES ('Z002', 'īīī', '20');

UPDATE test
set name = '������',
age = 22
where code = 'Z001';

DELETE FROM TEST
WHERE CODE = 'Z002';

--***************************************************************************************************************************************
--TEST���̺��� ���������� ����� ���̺� ����
DROP TABLE TEST_LOG;
CREATE TABLE TEST_LOG(
    CODE VARCHAR2(10),
    JOBCOBON CHAR(1), --1:�߰� 2:���� 3:����
    CHGDATE DATE DEFAULT SYSDATE
);

--***************************************************************************************************************************************
DROP TRIGGER TRIG_AFTER_TEST;
--Ʈ���� ����
--TEST���̺�  INSERT�� �Ͼ �Ŀ� �� ROW����
CREATE OR REPLACE TRIGGER TRIG_INSERT_TEST
AFTER INSERT ON TEST FOR EACH ROW
BEGIN
    --:NEW ���� ���Ե� Ʃ���� ���� ����Ű�� ������
    INSERT INTO TEST_LOG(CODE, JOBCOBON) VALUES(:NEW.CODE, '1');
END;

--***************************************************************************************************************************************
--TEST���̺� UPDATE�� �Ͼ �Ŀ�
CREATE OR REPLACE TRIGGER TRIG_UPDATE_TEST
AFTER UPDATE ON TEST FOR EACH ROW
BEGIN
    --:NEW ���� ���Ե� Ʃ���� ���� ����Ű�� ������
    INSERT INTO TEST_LOG(CODE, JOBCOBON) VALUES(:NEW.CODE, '2');
END;

--***************************************************************************************************************************************
--TEST���̺� DELETE�� �Ͼ �Ŀ�
CREATE OR REPLACE TRIGGER TRIG_DELETE_TEST
AFTER DELETE ON TEST FOR EACH ROW
BEGIN
    --:OLD �������� ����Ű�� ������
    INSERT INTO TEST_LOG(CODE, JOBCOBON) VALUES(:OLD.CODE, '3');
END;

--***************************************************************************************************************************************

--Ʈ���� �ǽ�
--ȸ������ ��Ȳ
DROP TABLE JOINSTATE;
CREATE TABLE JOINSTATE(
    JOINDATE VARCHAR2(10) PRIMARY KEY,
    JOIN_ORG NUMBER(10) DEFAULT 0, --�Ϲݰ���
    JOIN_NAV NUMBER(10) DEFAULT 0, --���̹�
    JOIN_KAKA NUMBER(10) DEFAULT 0 --īī�� ����
);

SELECT * FROM MEMBER;
SELECT COUNT(JOIN0) FROM JOINSTATE;
SELECT * FROM JOINSTATE
order by JOINDATE;
DELETE FROM JOINSTATE;

INSERT INTO JOINSTATE(JOINDATE, JOIN_ORG, JOIN_NAV, JOIN_KAKA) 
VALUES('2021-07-28', 5,7,3);


INSERT INTO member(userid, passwd, email, zip, addr1, addr2, filename, memo,simplejoin)
VALUES ('28','1','1','1','1','1','1','1','2');

--��� Ʈ����
--INSERT OR DELET �� �ѹ��� ó�� ����
CREATE OR REPLACE TRIGGER TRIG_AFTER_INSERT_JOIN
AFTER INSERT ON MEMBER FOR EACH ROW
DECLARE
    CNT NUMBER;
    SIMPLEJOIN CHAR(1); --:�Ϲݰ���, 1:���̹�, 2:īī��
BEGIN
    --������ �ִ� ������ ��ȸ
    SELECT COUNT(*) INTO CNT FROM JOINSTATE
    WHERE JOINDATE = TO_CHAR(:NEW.regdate, 'YYYY-MM-DD');
    
    SIMPLEJOIN := :NEW.SIMPLEJOIN;
   -- regdate := TO_CHAR(:NEW.regdate, 'YYYY-MM-DD');
    IF CNT > 0 THEN
    --���� �Ѵٸ� UPDATE
        IF SIMPLEJOIN = 0 THEN
            UPDATE JOINSTATE SET JOIN_ORG = JOIN_ORG+1
            WHERE JOINDATE = TO_CHAR(:NEW.regdate, 'YYYY-MM-DD');
        ELSIF SIMPLEJOIN = 1 THEN
            UPDATE JOINSTATE SET JOIN_NAV = JOIN_NAV+1
            WHERE JOINDATE = TO_CHAR(:NEW.regdate, 'YYYY-MM-DD');
        ELSIF SIMPLEJOIN = 2 THEN
            UPDATE JOINSTATE SET JOIN_KAKA = JOIN_KAKA+1
            WHERE JOINDATE = TO_CHAR(:NEW.regdate, 'YYYY-MM-DD');
        END IF;
    ELSE
    --�������� �ʴ´ٸ� INSERT
        IF SIMPLEJOIN = 0 THEN
            INSERT INTO JOINSTATE(JOINDATE, JOIN_ORG) VALUES(TO_CHAR(:NEW.regdate, 'YYYY-MM-DD'), 1);
        ELSIF SIMPLEJOIN = 1 THEN
            INSERT INTO JOINSTATE(JOINDATE, JOIN_NAV) VALUES(TO_CHAR(:NEW.regdate, 'YYYY-MM-DD'), 1);
        ELSIF SIMPLEJOIN = 2 THEN
            INSERT INTO JOINSTATE(JOINDATE, JOIN_KAKA) VALUES(TO_CHAR(:NEW.regdate, 'YYYY-MM-DD'), 1);
        END IF;
    END IF;
    --����ó�� (�����Ͱ� ������� ���)
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
             DBMS_OUTPUT.PUT_LINE('�����Ͱ� �����ϴ�.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('���� �߻�');
END;











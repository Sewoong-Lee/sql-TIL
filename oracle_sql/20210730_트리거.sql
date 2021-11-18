--트리거(trigger)
--자동 실행

ROLLBACK;
COMMIT;

SELECT * FROM TEST;
SELECT * FROM TEST_LOG;
INSERT INTO test(code, name, age) VALUES ('Z002', '카카카', '20');

UPDATE test
set name = '샤샤샤',
age = 22
where code = 'Z001';

DELETE FROM TEST
WHERE CODE = 'Z002';

--***************************************************************************************************************************************
--TEST테이블의 변동사항을 기록할 테이블 생성
DROP TABLE TEST_LOG;
CREATE TABLE TEST_LOG(
    CODE VARCHAR2(10),
    JOBCOBON CHAR(1), --1:추가 2:수정 3:삭제
    CHGDATE DATE DEFAULT SYSDATE
);

--***************************************************************************************************************************************
DROP TRIGGER TRIG_AFTER_TEST;
--트리거 생성
--TEST테이블에  INSERT가 일어난 후에 각 ROW실행
CREATE OR REPLACE TRIGGER TRIG_INSERT_TEST
AFTER INSERT ON TEST FOR EACH ROW
BEGIN
    --:NEW 새로 삽입될 튜플의 값을 가리키는 지정자
    INSERT INTO TEST_LOG(CODE, JOBCOBON) VALUES(:NEW.CODE, '1');
END;

--***************************************************************************************************************************************
--TEST테이블에 UPDATE가 일어난 후에
CREATE OR REPLACE TRIGGER TRIG_UPDATE_TEST
AFTER UPDATE ON TEST FOR EACH ROW
BEGIN
    --:NEW 새로 삽입될 튜플의 값을 가리키는 지정자
    INSERT INTO TEST_LOG(CODE, JOBCOBON) VALUES(:NEW.CODE, '2');
END;

--***************************************************************************************************************************************
--TEST테이블에 DELETE가 일어난 후에
CREATE OR REPLACE TRIGGER TRIG_DELETE_TEST
AFTER DELETE ON TEST FOR EACH ROW
BEGIN
    --:OLD 기존값을 가르키는 지정자
    INSERT INTO TEST_LOG(CODE, JOBCOBON) VALUES(:OLD.CODE, '3');
END;

--***************************************************************************************************************************************

--트리거 실습
--회원가입 현황
DROP TABLE JOINSTATE;
CREATE TABLE JOINSTATE(
    JOINDATE VARCHAR2(10) PRIMARY KEY,
    JOIN_ORG NUMBER(10) DEFAULT 0, --일반가입
    JOIN_NAV NUMBER(10) DEFAULT 0, --네이버
    JOIN_KAKA NUMBER(10) DEFAULT 0 --카카오 가입
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

--멤버 트리거
--INSERT OR DELET 로 한번에 처리 가능
CREATE OR REPLACE TRIGGER TRIG_AFTER_INSERT_JOIN
AFTER INSERT ON MEMBER FOR EACH ROW
DECLARE
    CNT NUMBER;
    SIMPLEJOIN CHAR(1); --:일반가입, 1:네이버, 2:카카오
BEGIN
    --기존에 있는 데이터 조회
    SELECT COUNT(*) INTO CNT FROM JOINSTATE
    WHERE JOINDATE = TO_CHAR(:NEW.regdate, 'YYYY-MM-DD');
    
    SIMPLEJOIN := :NEW.SIMPLEJOIN;
   -- regdate := TO_CHAR(:NEW.regdate, 'YYYY-MM-DD');
    IF CNT > 0 THEN
    --존재 한다면 UPDATE
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
    --존재하지 않는다면 INSERT
        IF SIMPLEJOIN = 0 THEN
            INSERT INTO JOINSTATE(JOINDATE, JOIN_ORG) VALUES(TO_CHAR(:NEW.regdate, 'YYYY-MM-DD'), 1);
        ELSIF SIMPLEJOIN = 1 THEN
            INSERT INTO JOINSTATE(JOINDATE, JOIN_NAV) VALUES(TO_CHAR(:NEW.regdate, 'YYYY-MM-DD'), 1);
        ELSIF SIMPLEJOIN = 2 THEN
            INSERT INTO JOINSTATE(JOINDATE, JOIN_KAKA) VALUES(TO_CHAR(:NEW.regdate, 'YYYY-MM-DD'), 1);
        END IF;
    END IF;
    --예외처리 (데이터가 없을경우 출력)
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
             DBMS_OUTPUT.PUT_LINE('데이터가 없습니다.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('예외 발생');
END;











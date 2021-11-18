--프로시저(오라클의 함수)

drop table test CASCADE CONSTRAINTS;  -- 테이블 강제 삭제

create table test(
code VARCHAR2(10) PRIMARY KEY,
name VARCHAR2(20),
age number(5)
);

select * from test;
--***************************************************************************************************************************************
--프로시저 생성 (맨 아래에 있어야한다.)(인서트)
--DROP PROCEDURE testinsert;
--보통 드랍을 잘 안씀 (CREATE or REPLACE 를 쓰면 다시 재생성 가능)
CREATE or REPLACE PROCEDURE testinsert(
--매개변수
    pcode IN VARCHAR2,
    pname IN VARCHAR2,
    page IN NUMBER
)
IS
BEGIN
    --실행문
    INSERT INTO test(code, name, age) VALUES (pcode, pname, page);
END;

--프로시저 실행
EXEC testinsert('m001', '호호호', 20);

--***************************************************************************************************************************************
--프로시저 생성(update)
CREATE OR REPLACE PROCEDURE testupdate(
    --매개변수의 타입을 테이블에서 가져오기
    pcode IN test.code%TYPE,
    pname IN test.name%TYPE,
    page IN test.age%TYPE
)
IS
BEGIN
    --실행문
    UPDATE test
    set name = pname,
    age = page
    where code = pcode;
END;

--업데이트 프로시저 사용
EXEC testupdate('m002', '히히히', 30);

CREATE OR REPLACE PROCEDURE testdelet(
    --매개변수
    pcode IN TEST.CODE%TYPE
)
IS
BEGIN
    --실행문
    DELETE FROM test
    WHERE code = pcode;
END;

--테스트딜리트 실행
EXEC testdelet ('m002');

--***************************************************************************************************************************************
--프로시저 생성 (인서트 또는 업데이트)
--데이터가 없으면 인서트 없으면 업데이트
CREATE OR REPLACE PROCEDURE tset_insert_update(
    --매개변수 (IN : 외부에서 값을 받는다.)
    pcode IN TEST.CODE%TYPE,
    pname IN TEST.NAME%TYPE,
    page  IN TEST.AGE%TYPE
)
IS
--변수 선언
    CNT NUMBER;
BEGIN
    --조회
    SELECT count(*) INTO CNT FROM test where code = pcode; --셀렉트한 건수를 CNT변수에 넣는다.
    -- 오라클에서는 같다라는 뜻이 = 하나
    IF CNT = 0 THEN -- 만약 셀렉트한 결과가 0이라면
        INSERT INTO test(code, name, age) VALUES (pcode, pname, page);
    ELSE -- 만약 셀렉트한 결과가 0이 아니라면
        UPDATE TEST SET NAME = PNAME, AGE = PAGE WHERE code = pcode;
    END IF;
END;

EXEC tset_insert_update ('m003','슈슈슈', 30);

--***************************************************************************************************************************************
--데이터의 건수를 반환하는 프로시저
CREATE OR REPLACE PROCEDURE testcount(
    --매개변수
    cnt OUT NUMBER -- 결과값을 반환
)
IS
BEGIN
    SELECT COUNT(*) INTO CNT FROM test; --결과를 위의 CNT에 넣어라
END;

--콘솔창에 출력 ON
SET SERVEROUTPUT ON;

--testcount를 테스트 하기위한 익명 블록
DECLARE -- 변수를 선언할 익명 공간
    CNT NUMBER;
BEGIN
    testcount(CNT);
    DBMS_OUTPUT.put_line('건수: ' || CNT);
END;

--***************************************************************************************************************************************
--실습)CODE가 'm001'인 이름을 반환
--매개변수를 받고 이름 값을 출력
CREATE OR REPLACE PROCEDURE test_name_age(
    pcode in test.code%TYPE,
    rname OUT test.NAME%TYPE,
    rage OUT test.AGE%TYPE
)
IS
BEGIN
    SELECT name,age INTO rname,rage FROM test WHERE code = pcode;
END;

--test_name_age 테스트 하기위한 익명 블록
DECLARE -- 변수를 선언할 익명 공간
    rage test.AGE%TYPE;
    rname test.NAME%TYPE;
    --rname VARCHAR2(10); 바차로 할거면 사이즈 지정해야함
BEGIN
    test_name_age('m001', rname, rage);
    DBMS_OUTPUT.put_line('이름: ' || rname);
    DBMS_OUTPUT.put_line('나이: ' || rage);
END;

CREATE OR REPLACE PROCEDURE TEST_SELECT(
    PCODE IN OUT TEST.CODE%TYPE,
    RNAME OUT TEST.NAME%TYPE,
    RAGE OUT TEST.AGE%TYPE
)
IS
BEGIN
    SELECT NAME, AGE INTO RNAME, RAGE FROM TEST WHERE CODE = PCODE;
    PCODE := 'HONG';--IN OUT 테스트용 (:= 대입연산자 홍을 PCODE에 넣겠다)
END;

--TEST_SELECT를 테스트
DECLARE
    CODE TEST.CODE%TYPE :=  'java';
    NAME VARCHAR2(20);
    AGE NUMBER;
BEGIN
    TEST_SELECT(CODE, NAME, AGE);
    DBMS_OUTPUT.put_line('코드:' || CODE);
    DBMS_OUTPUT.put_line('이름:' || NAME);
    DBMS_OUTPUT.put_line('나이:' || AGE);
END;

--***************************************************************************************************************************************
--커서 (CURSOR)
--암시적 커서 (인서트, 업데이트, 델리트, 1개의 로우를 셀렉트 할떄)
BEGIN
    DELETE FROM TEST WHERE CODE = 'm004';
    IF SQL%FOUND THEN --삭제가 되었다면
    --IF SQL%NOTFOUND THEN --삭제가 되지 않았다면
        DBMS_OUTPUT.PUT_LINE('데이터 삭제 완료');
    ELSE
        DBMS_OUTPUT.PUT_LINE('데이터 미존재');
    END IF;
END;

--***************************************************************************************************************************************
--ONEROW
DECLARE
    RNAME TEST.NAME%TYPE;
BEGIN
    SELECT NAME INTO RNAME FROM TEST WHERE CODE = 'm005';
    DBMS_OUTPUT.PUT_LINE('조회건수: ' || SQL%ROWCOUNT);
    --예외처리 (데이터가 없을경우 출력)
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
             DBMS_OUTPUT.PUT_LINE('데이터가 없습니다.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('예외 발생');
END;

--***************************************************************************************************************************************
--명시적 커서 (다중값 MULTIROW)
--변수로 커서 만들기
DECLARE
    --셀렉트 결과값에 대한 커서 선언
    CURSOR TEST_CUR
    IS
    SELECT * FROM TEST;
    --변수
    TEST_REC TEST%ROWTYPE; --테스트의 행 전체
BEGIN
    OPEN TEST_CUR;  --커서 접근 (열기)
    LOOP --무한 반복문
        FETCH TEST_CUR INTO TEST_REC;  --한행
        EXIT WHEN TEST_CUR%NOTFOUND; --반복문 빠져나갈 조건 생성
        DBMS_OUTPUT.PUT_LINE(TEST_REC.CODE || ' ' || TEST_REC.NAME || ' ' || TEST_REC.AGE);
    END LOOP;
    CLOSE TEST_CUR;
END;

--***************************************************************************************************************************************
--FOR 키워드를 이용해서 커서 생성(반복문으로 배열 출력)
BEGIN
    --여러건을 한건씩 TEST_REC에 대입하여 LOOP실행
    FOR TEST_REC IN (
        SELECT * FROM TEST
    )
    LOOP
         DBMS_OUTPUT.PUT_LINE(TEST_REC.CODE || ' ' || TEST_REC.NAME || ' ' || TEST_REC.AGE);
    END LOOP;
END;

--***************************************************************************************************************************************
--여러줄의 커서를 반환 (명시적 커서)
CREATE OR REPLACE PROCEDURE TEST_SELECTLIST(
    TEST_CUR OUT SYS_REFCURSOR  --셀렉트 리스트를 가지고있는 커서 반환
)
IS
BEGIN
    OPEN TEST_CUR FOR
    SELECT * FROM TEST;
END;

--반환되는 커서 테스트
 --:TEST_CUR 반환된 값을 변수에 담겠다.
VAR TEST_CUR REFCURSOR
EXEC TEST_SELECTLIST(:TEST_CUR)
PRINT TEST_CUR;

select * from test;

--***************************************************************************************************************************************
--프로시저 : 게시물 조회수 +1 
--매퍼에서 호출하는 순서대로 값을 받음
CREATE OR REPLACE PROCEDURE P_UPDATE_READ_CNT(
    PGUBUN IN USERMANGE.GUBUN%TYPE,  --1: 게시물 2: 댓글
    PNUM IN USERMANGE.NUM%TYPE,  -- 게시물 번호
    PUSERID IN USERMANGE.USERID%TYPE, --유저 id
    Plikegubun IN USERMANGE.likegubun%TYPE --조회
)
IS
    CNT NUMBER;
BEGIN
    --유저 조회 정보 존재 여부 count
    SELECT COUNT(*) INTO CNT FROM USERMANGE
    WHERE GUBUN = PGUBUN
    AND NUM = PNUM
    AND USERID = PUSERID;
    --만약에 유저 정보 카운터가 0 이라면 게시물 조회수 +1, 유저매니저 테이블에 insert
    IF CNT=0 THEN
   		UPDATE BOARD
		SET READCNT = READCNT +1
		WHERE BNUM = PNUM;
        
        --유저 매니저 테이블에 인서트
   		INSERT INTO USERMANGE (GUBUN, NUM, USERID, likegubun)
		VALUES (PGUBUN,PNUM, PUSERID, Plikegubun);

    END IF;
        
END;

EXEC P_UPDATE_READ_CNT('1', '2', 'java','0' );




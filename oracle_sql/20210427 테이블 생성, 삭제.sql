--DDL : 테이블을 만들고 정의하고, 수정하고, 삭제함, 테이블의 틀을 만짐
-- 데이터 정의어 
--테이블 만들기

DROP TABLE ITEM;  --테이블을 삭제, 삭제해서 다시 만들면 됨

--ITEMCODE CHAR(4) NOT NULL PRIMARY KEY   --PRIMARY KEY : PK : 유일키, 중복 금지, NULL 금지  --거의 옆에 안붙임
CREATE TABLE ITEM ( -- 테이블 생성
ITEMCODE CHAR(4) NOT NULL,    --최대 길이가 10바이트다 VARCHAR2는 가변길이 10중 4만 써도 4만 쓰임 
ITEMNAME VARCHAR2(50) NOT NULL ,  --CHAR은 고정길이 10바이트에서 4바이트만 써도 6바이트는 낭비
PRICE NUMBER(10) NOT NULL,  --NOT NUL 반드시 넣어야 하는것
BIGO VARCHAR2(100), -- 비고
REGDATE DATE DEFAULT SYSDATE, --등록일자  /  DEFAULT : 자동 등록  --SYSDATE : 현재의 날짜 가져오기
PRIMARY KEY(ITEMCODE,ITEMNAME)  --PK  (2개 이상의 필드를 하나의 PK로 가능)  유일키, 중복 금지, NULL 금지
);

DESC ITEM;
SELECT * FROM ITEM;



--DML : 데이터 추가  (넣을 값만 지정을 하여 개수가 달라고 저장 가능)
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8801', '코카', 1500); 
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE,BIGO)VALUES('8802','팹시',1200, '팹시맨');
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE )VALUES('8803','삼양라면',1400);
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8804','신라면',1000); 
--INSERT INTO ITEM (ITEMCODE)VALUES('8804');  --낫널 적용, 에러뜸



-- 저 위의 인서트는 임시 저장임 아래의 커밋을 해야 저장 완료
--트랙잭션 : 작업의 수행단위
COMMIT;  --확정 (이 작업을 안하연 외부에서 아무리 봐도 작업내용이 없음)

ROLLBACK; --커밋 하기 전에 작업을 롤백 가능 (인서트, 업데이트, 딜리트 작업만)

--!!주의!! : 트랜잭션이 종료 후 다른 트랜잭션 시작이 가능


-- DML : 데이터 수정
UPDATE ITEM 
SET ITEMNAME = '코카스콜라'
WHERE ITEMCODE = '8801';  --PK를 잡아서 바꿔야함 (유일한 키)



--DML : 데이터 삭제 
DELETE FROM ITEM 
WHERE ITEMCODE = '8801'; -- PK를 잡아서 삭제




--여러건 조회 : 
SELECT * FROM ITEM  --전체 조회
WHERE ITEMNAME LIKE '%라면%';  --라면이라는 키워드로 셀렉 (%는 앞에 뭐가 있고 뒤에 뭐가있든 이라는뜻)


--한건만 조회
SELECT * FROM ITEM
WHERE ITEMCODE = '8803';








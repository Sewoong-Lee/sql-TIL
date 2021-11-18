--게스트 북

DROP TABLE guestbook;
--TRUNCATE : DROP과 비슷 하지만 롤백이 안됨
TRUNCATE TABLE guestbook;

CREATE TABLE guestbook(
SEQ NUMBER(5),
nicname VARCHAR2(30),
email VARCHAR2(30),
CONTENT VARCHAR2(100),
regdate date DEFAULT sysdate,
PRIMARY KEY (SEQ)
);

SELECT * FROM guestbook;

SELECT * FROM guestbook
where seq = 5;

SELECT * FROM guestbook
where nicname like '%' || '하' || '%'
or email like '%' || 'naver' || '%';

INSERT INTO guestbook (SEQ,nicname,email,CONTENT)  VALUES (11,'쿠쿠','ja@naver.com','니나노~~');
INSERT INTO guestbook (SEQ,nicname,email,CONTENT)  VALUES (guest_seq.NEXTVAL,'하하','qq@naver.com','니나노~~');

UPDATE guestbook  SET nicname = '무야호', 
email = 'cca@naver.com', content = '테스트2' WHERE SEQ = 1;

DELETE FROM guestbook WHERE seq = 21;


DROP SEQUENCE guest_seq;
CREATE SEQUENCE guest_seq;
--시퀀스 추가 기능
--START WITH 3 --시작숫자
--MINVALUE 1 --최소값
--MAXVALUE 5  --최대값
--INCREMENT BY 1  --증감숫자
--CYCLE --반복
--NOCACHE; --캐쉬

SELECT guest_seq.NEXTVAL FROM DUAL;  --자동 번호 증가

ROLLBACK;
COMMIT;

--오라클 반복문 (익명)(오라클 프로시저)
begin
    for i in 1..10 loop
        INSERT INTO guestbook (SEQ,nicname,email,CONTENT) 
        VALUES (guest_seq.NEXTVAL,'하하','qq@naver.com','니나노~~');
    end loop;
end;
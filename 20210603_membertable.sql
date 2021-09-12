--회원 관리 테이블
--이메일, 비밀번호, 닉네임, 전화번호,주소,등록일자

DROP TABLE member;

CREATE TABLE member(
email VARCHAR2(30),
passwd VARCHAR2(20) not null,
nicname VARCHAR2(30) not null,
phone VARCHAR2(15),
addr VARCHAR2(100),
regdate date DEFAULT SYSDATE,
modifydate date DEFAULT SYSDATE,
PRIMARY KEY(email)
);

select * from member;

INSERT into member(email, passwd, nicname, phone, addr) 
values ('cc@naver.com','1111','히히','010-1111-1111', '하하시 하하구 하하동');


SELECT * FROM  member WHERE email = 'zz@naver.com';

SELECT * FROM  member WHERE email like '%' || 'zz' || '%';

--폰과 주소가 널이면 대신 출력값 설정
SELECT nvl(phone, '000-0000-0000'), nvl(addr,'주소') FROM  member;

DELETE FROM member WHERE email = 'zz@naver.com';



UPDATE member  SET passwd = '789', nicname = 'ccccc', 
phone = '111-1111-1111', addr = '456'
WHERE email = 'zz@naver.com';


ROLLBACK;
COMMIT;
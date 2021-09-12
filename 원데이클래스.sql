--원데이 클래스

--멤버 테이블

DROP TABLE member CASCADE CONSTRAINTS;

CREATE TABLE member(
userid VARCHAR2(30) not null,
passwd VARCHAR2(64) not null,
salt VARCHAR2(24) not null,
name VARCHAR2(30) not null,
regdate DATE DEFAULT SYSDATE,
CONSTRAINT PK_member_userid PRIMARY KEY (userid)
);

SELECT * FROM member;

SELECT * FROM member
WHERE userid = 'ss';

INSERT INTO member (userid,passwd,salt,name)  
VALUES ('ss','1111', 'ss','ss');

UPDATE member  SET passwd = '2222',
name = 'zz'
WHERE userid = 'ss';

DELETE FROM member WHERE userid = 'qqq';
SELECT * FROM member;


--키워드 테이블
DROP TABLE keyword;

CREATE TABLE keyword(
kwcode CHAR(3) not null,
kwname VARCHAR2(50) not null,
CONSTRAINT PK_keyword_kwcode PRIMARY KEY (kwcode)
);

SELECT * FROM keyword;

SELECT * FROM keyword
WHERE kwcode = '001';

INSERT INTO keyword (kwcode,kwname)  VALUES ('003','정적');

UPDATE keyword  SET kwname = '2222'
WHERE kwcode = '001';

DELETE FROM keyword WHERE kwcode = '001';



--과목 테이블
DROP TABLE subject;

CREATE TABLE subject(
subcode CHAR(3) not null,
subname VARCHAR2(50) not null,
price number(5) DEFAULT 0 not null,
filename VARCHAR2(100),
kwcode CHAR(3) not null,
CONSTRAINT PK_subject_subcode PRIMARY KEY (subcode),
CONSTRAINT FK_subject_kwcode FOREIGN KEY (kwcode) REFERENCES keyword(kwcode)
);

SELECT * FROM subject;

SELECT s.subcode, s.subname, s.price, s.filename, k.KWNAME, k.KWCODE
FROM subject s 
inner join keyword k on (s.KWCODE = k.KWCODE);

SELECT s.subcode, s.subname, s.price, s.filename, k.KWNAME, k.KWCODE
FROM subject s 
inner join keyword k on (s.KWCODE = k.KWCODE)
WHERE s.subcode = '001';


SELECT s.subcode, s.subname, s.price, s.filename, k.KWNAME, k.KWCODE
FROM subject s 
inner join keyword k on (s.KWCODE = k.KWCODE)
WHERE s.subname  like '%' || '스' || '%'
order by  s.price DESC;



SELECT * FROM subject
WHERE subcode = '001';

INSERT INTO subject (subcode,subname,price,filename,kwcode)  VALUES ('001','zzqq',1000,'zz','001');

UPDATE subject  SET subname = '2222',
price = 2000,
filename = 'qq',
kwcode = '001'
WHERE subcode = '001';

DELETE FROM subject WHERE subcode = '001';

--수강신청 테이블
DROP TABLE sales;

CREATE TABLE sales(
seq number(5) not null,
saledate CHAR(10) not null,
subcode CHAR(3) not null,
userid VARCHAR2(30) not null,
cnt number(5) not null,
amount number(10) not null,
CONSTRAINT PK_sales_seq PRIMARY KEY (seq),
CONSTRAINT FK_sales_subcode FOREIGN KEY (subcode) REFERENCES subject(subcode),
CONSTRAINT FK_sales_userid FOREIGN KEY (userid) REFERENCES member(userid)
);

SELECT s.saledate, s.subcode, sb.subname, sb.price, s.userid, m.name, s.cnt, s.amount
FROM sales s 
inner join subject sb on (s.subcode = sb.subcode)
join member m on (s.userid = m.userid)
WHERE s.saledate BETWEEN '2020-01-01' and '2021-12-30'
order by  s.saledate;


SELECT * FROM sales
order by  subcode;
--집계
SELECT s.subcode, sb.subname, sb.price,sum(s.cnt) cnt, sum(s.amount) amount
FROM sales s 
inner join subject sb on (s.subcode = sb.subcode)
WHERE s.saledate BETWEEN '2021-06-16' and '2021-06-16'
GROUP BY s.subcode, sb.subname, sb.price
order by  amount;


DROP SEQUENCE sales_seq;
CREATE SEQUENCE sales_seq;


SELECT * FROM sales
WHERE seq = '4';

INSERT INTO sales (seq,saledate,subcode,userid,cnt,amount)
VALUES (sales_seq.NEXTVAL,'2020-08-06','001','ss',3,3000);

UPDATE sales  SET saledate = '2020-00-00',
subcode = '001',
userid = 'ss',
cnt = 5,
amount = 2000
WHERE seq = '1';

DELETE FROM sales WHERE seq = '4';



ROLLBACK;
COMMIT;

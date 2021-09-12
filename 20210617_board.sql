--게시판
DROP TABLE boardfile;
DROP TABLE board;
DROP TABLE member CASCADE CONSTRAINTS;

COMMIT;

--멤버의 passwd, salt 전체 변경
UPDATE member
set passwd = (SELECT passwd FROM member WHERE userid='qqwwee'),
salt = (SELECT salt FROM member WHERE userid='qqwwee')
WHERE userid !='qqwwee';

SELECT passwd FROM member WHERE userid='qqwwee';

SELECT * FROM member
WHERE userid = 'qwe';

SELECT * FROM board;

CREATE TABLE member(
userid VARCHAR2(30) not null,
passwd VARCHAR2(64) not null,
salt VARCHAR2(24) not null,
name VARCHAR2(30) not null,
regdate DATE DEFAULT SYSDATE,
CONSTRAINT PK_member_userid PRIMARY KEY (userid)
);

CREATE TABLE board(
bnum number(5), --순번
userid VARCHAR2(30) not null, --작성자id
subject VARCHAR2(100) not null, --제목
content VARCHAR2(1000) not null, --내용
readcount number(3) DEFAULT 0, --조회수
ip VARCHAR2(20) not null, --작성자 ip
ref number(5) not null, --그룹번호 (댓글)
restep number(5) DEFAULT 0, --글 순서 (댓글)
relevel number(5) DEFAULT 0, --글 레벨 (댓글)
regdate date DEFAULT sysdate, --등록일자
modifydate date DEFAULT sysdate,  --수정일자
PRIMARY KEY (bnum),
FOREIGN KEY (userid) REFERENCES member(userid)
);

CREATE TABLE boardfile(
fnum number(8), --파일 순번
bnum number(5), --보드 순번
filename VARCHAR2(50), --파일 이름
PRIMARY KEY (fnum),
FOREIGN KEY (bnum) REFERENCES board(bnum)
);

ALTER TABLE board
add FOREIGN KEY (userid) REFERENCES member(userid);

SELECT * FROM board
order by bnum desc;

--오라클 페이징처리 (ROWNUM는 순번)
--서브쿼리
SELECT * 
FROM (SELECT ROWNUM rwon, b.*
        FROM (SELECT * FROM board
                    WHERE USERID = '하하'
                    and relevel = 0
                    order by bnum desc) b)
where rwon BETWEEN 1 and 10;

--전체 게시물 수
SELECT COUNT(*) totcnt
FROM board;
            

--조회수 +1
UPDATE board
set readcount = readcount + 1
WHERE bnum = 5;

UPDATE board
set subject = '수정테스트', 
content = '수정테스트',
ip = '11',
modifydate= sysdate
WHERE bnum = 5;

--레벨 순서 +1
UPDATE board
set restep = restep + 1
WHERE ref = 1
and restep > 0;

SELECT * FROM board
order by ref desc, restep asc;

DELETE FROM board WHERE bnum = '3';

SELECT * FROM board
WHERE subject 
like '%' || '1' || '%' or content like '%' || '1' || '%';

SELECT * FROM board
where relevel = 0 
order by ref desc, restep asc;

--댓글 조회
SELECT * FROM board
where ref = 5
and relevel != 0
order by restep;



SELECT * FROM board
order by ref desc, restep asc;

SELECT * FROM boardfile;
SELECT * FROM board;
DELETE FROM board WHERE bnum = '2';
DELETE FROM boardfile WHERE fnum = '2';

INSERT INTO board (bnum,userid,subject,content,ip,ref,restep,relevel) ;

SELECT *
FROM board b 
left join boardfile f on (b.bnum = f.bnum)
WHERE b.bnum = 1;

CREATE TABLE boardfile(
fnum number(8), --파일 순번
bnum number(5), --보드 순번
filename VARCHAR2(50), --파일 이름
PRIMARY KEY (fnum),
FOREIGN KEY (bnum) REFERENCES board(bnum)
);

DELETE FROM boardfile WHERE bnum = '1';

DROP SEQUENCE S (board_bnum,'zzqq','ㅋ','ㅋㅋㅋㅋㅋ','0000',1,0,0);

DROP SEQUENCE board_bnum;
CREATE SEQUENCE board_bnum 
start with 501;

board_num.NEXTVAL;

select board_bnum.nextval from dual;

SELECT * FROMboardfile_fnum;
CREATE SEQUENCE boardfile_fnum;


SELECT * FROM boardfile;

INSERT INTO boardfile (fnum,bnum,filename) 
VALUES (boardfile_fnum.nextval, 24 , '테스트파일네임');








ROLLBACK;
COMMIT;

--오라클 익명 프로시저 (반복문) (얘 아래에 쿼리문 있으면 같이 읽힘....)
begin
    for i in 1..5 loop
        INSERT INTO board (bnum, userid, subject, content, ip, ref, restep, relevel) 
        VALUES (board_bnum.nextval,'하하','반복테스트','내용','0000',board_bnum.nextval,0,0);
    end loop;
end;


--게시물 관리

ROLLBACK;
COMMIT;

SELECT * FROM PRODUCT_COMPONENT_VERSION;

DROP TABLE usermange cascade constraints;
DROP TABLE reply cascade constraints;
DROP TABLE boardfile cascade constraints;
DROP TABLE board cascade constraints;
DROP TABLE member cascade constraints;

----------------------------필요 테이블---------------------
--회원테이블

CREATE TABLE member(
userid VARCHAR2(43) not null, --유저 아이디
passwd CHAR(60) not null, -- 암호화된 비밀번호
email VARCHAR2(30) UNIQUE not null, ---이메일
zip VARCHAR2(5),  --우편번호
addr1 VARCHAR2(100),  --도로명주소
addr2 VARCHAR2(100),  --상세주소
filename VARCHAR2(100),  --프로필사진명
memo VARCHAR2(100), --소개글
admin char(1) default '1', --0 : 어드민, 1: 레벨1, 2:레벨2
emailauth char(1) DEFAULT '0',  --0:미인증, 1: 인증
simplejoin char(1) DEFAULT '0',  -- 0:일반가입, 1: 네이버 간편가입, 2:카카오 간편가입
regdate date DEFAULT sysdate,  --등록일자
CONSTRAINT pk_member_userid PRIMARY KEY (userid)
);
-- 아이디 사이즈 변경
ALTER TABLE member MODIFY (userid VARCHAR2(20));

desc member;

update member
set emailauth = '1'
where userid = 'zzz'; 

--일반 가입
INSERT INTO member(userid, passwd, email, zip, addr1, addr2, filename, memo)
VALUES ('ddd','ddd','1','1','1','1','1','1');

--네이버 간편 가입
INSERT INTO member(userid, passwd, email, simplejoin)
VALUES ('ooo','naver','ggg@ggg.com','1');

select * from member;

select * from member
WHERE userid = 'ppp';

DELETE FROM member
WHERE userid = 'JiJIHV-pCdm9TlJiKysmiVxbB-xjMBaitFeA8d2KKVg';

--게시물 테이블

CREATE TABLE board(
bnum number(5) not null,  --게시물 번호
userid VARCHAR2(20) not null,  --작성자 아이디
subject VARCHAR2(100) not null, --게시물 제목
content VARCHAR2(1000) not null,  --내용
readcnt number(3) DEFAULT 0, --조회수
likecnt number(3) DEFAULT 0, --좋아요
dislikecnt number(3) DEFAULT 0, --싫어요
ip VARCHAR2(20) not null,  --작성자 ip
regdate date DEFAULT sysdate,  --등록일자
modifydate date DEFAULT sysdate,  --수정일자
removeyn char(1) DEFAULT 'n',--삭제 여부(y:삭제, n:삭제안됨)
PRIMARY KEY (bnum),
FOREIGN key (userid) REFERENCES member (userid)
);
--기존 테이블의 칼럼 추가
alter table board add (removeyn char(1) DEFAULT 'n');

update board
set removeyn = 'n'
where bnum = 2;

commit;

UPDATE board
set likecnt = 0;

SELECT * FROM board
WHERE bnum  = 1;

SELECT * FROM usermange
WHERE num  = 17 ;

--게시물 상세조회
SELECT b.*, m.email
FROM board b join member m on (b.userid = m.userid)
WHERE bnum  = 5 ;

--조회수 +1
update board
set readcnt = readcnt +1
where bnum = 5;

--좋아요 +1
update board
set likecnt = likecnt +1
where bnum = 5;

select * from usermange;
-- 좋아요 누른거오 바꿈
update usermange
set likegubun ='1'
where gubun = '1'
and num = 2
and userid = 'ddd';

SELECT count(*) totcnt FROM board
WHERE content  like '%' || '1' || '%';

--페이징처리 (10개씩만 가져오기)
SELECT b.* FROM
    (SELECT ROWNUM  rnum, b.* FROM
        (SELECT * FROM board
        WHERE subject  like '%' || '1' || '%'
        order by bnum desc) b ) b
where b.rnum BETWEEN 1 and 10;

--페이징처리 (10개씩만 가져오기) + 댓글 개수 가져오기
SELECT b.* FROM
    (SELECT ROWNUM  rnum, b.* FROM
        (SELECT b.*, NVL(r.rcnt,0) rcnt
FROM board b left join
(SELECT bnum, COUNT(*) rcnt
from reply
group by bnum) r
on (b.bnum = r.bnum)
WHERE subject  like '%' || '1' || '%'
order by b.bnum desc) b ) b
where b.rnum BETWEEN 1 and 10;

-- 이거 다음 위에꺼 만들었엉
SELECT b.*, r.rcnt
FROM board b left join
(SELECT bnum, COUNT(*) rcnt
from reply
group by bnum) r
on (b.bnum = r.bnum)
WHERE subject  like '%' || '1' || '%'
order by b.bnum desc;



select r.*, NVL(um.likegubun,0) likegubun
		from reply r left join 
		    (select * from usermange
		    WHERE gubun = '2'
		    and userid = #{userid}) um
		on (r.rnum = um.num)
		where bnum = #{bnum}
		ORDER by restep



SELECT bnum, COUNT(*) rcnt
from reply
group by bnum;




DELETE FROM board
WHERE bnum = 13;

SELECT * FROM usermange
where gubun = '1'
and num = 2
and userid = 'ddd';

--게시물 조회(세션의 유저의 상태 조회)
SELECT b.*, um.likegubun 
FROM board b left join usermange um on (b.bnum = um.num) 
WHERE b.bnum = 2
and um.GUBUN = '1'
and um.userid = 'ddd';

SELECT B.*, UM.likegubun
FROM board B LEFT JOIN 
    (SELECT * FROM usermange
      WHERE GUBUN = '1'
        AND userid = 'ddd') UM 
ON (B.bnum = UM.num)
WHERE B.bnum = 2;


SELECT * FROM board;

insert into board(bnum,userid,subject,content,ip)
VALUES (bseq.nextval,'ddd','1','1',1);

UPDATE board
set 
subject = '11',
content =  '11',
ip = '111.111.1.111',
modifydate = sysdate
WHERE bnum = 1;


--게시물 시퀀스
DROP SEQUENCE bseq;
create SEQUENCE bseq
START WITH 1; --시작숫자

bseq.NEXTVAL;


select bseq.nextval from dual;


--게시물 파일 테이블
ROLLBACK;
COMMIT;
--게시물의 파일테이블
create table boardfile(
fnum number(8) not null, 
bnum number(5) not null,
filename varchar2(50) not null,
regdate date default sysdate,
primary key(fnum),
FOREIGN KEY (BNUM) REFERENCES BOARD(BNUM)
);

SELECT * FROM boardfile;

--한꺼번에 삭제
DELETE FROM boardfile
WHERE fnum in (4, 5, 6);

DELETE FROM boardfile
WHERE fnum = 4;

SELECT * FROM boardfile
WHERE bnum  = 14 ;

insert into boardfile(fnum,bnum,filename) VALUES (fseq.nextval,1,'1');


--게시물파일 시퀀스
DROP SEQUENCE fseq;

create SEQUENCE fseq
START WITH 1; --시작숫자

SELECT * FROM boardfile;

-- 여러건 저장
-- 아래는 넥스트발이 안댐 (유니크에러)
INSERT ALL 
INTO BOARDFILE (fnum, bnum, filename) values (1, 2, 'a' ) 
INTO BOARDFILE (fnum, bnum, filename) values (2, 2, 'b' ) 
SELECT * FROM DUAL;

--여러건의 파일명 저장
INSERT into BOARDFILE(fnum, bnum, filename)
select fseq.nextval, f.* from (
select 2, 'a' from dual 
union all
select 2, 'b'  from dual) f ;

--댓글 테이블
create table reply(
rnum number(5) not null, --댓글 번호
bnum number(5) not null, --게시물번호
userid VARCHAR2(20) not null,  --작성자 아이디
content VARCHAR2(1000) not null,  --내용
likecnt number(3) DEFAULT 0, --좋아요
dislikecnt number(3) DEFAULT 0, --싫어요
ip VARCHAR2(20) not null,  --작성자 ip
restep number(3) not null, --글 순서
relevel number(3) not null, --글 레벨
regdate date DEFAULT sysdate,  --등록일자
modifydate date DEFAULT sysdate,  --수정일자
PRIMARY KEY (rnum),
FOREIGN key (bnum) REFERENCES board (bnum),
FOREIGN key (userid) REFERENCES member (userid)
);
DELETE FROM reply
WHERE rnum = 14;

update reply
set content = '댓글 수정'
where rnum = 14;

--댓글의 리스트 조회
select * from reply
where bnum = 2
ORDER by restep desc;

--댓글의 restep +1
update reply
set restep = restep+1
where bnum = 2
and restep >= 2;


insert into reply(rnum, bnum, userid, content, likecnt, dislikecnt, ip, restep, relevel)
VALUES (rseq.nextval,'2','www','댓댓',0,0,'11',0,0);

select * from reply;

DROP SEQUENCE rseq;

create SEQUENCE rseq
START WITH 1; --시작숫자

--댓글의 리스트 + 댓글의 좋아요 싫어요 상태 확인
select r.*, um.likegubun 
from reply r left join 
    (select * from usermange
    WHERE gubun = '2'
    and userid = 'ddd') um
on (r.rnum = um.num)
where bnum = 2
ORDER by restep;

------------------------------------------------------------------------------------------
--조회수/좋아요/싫어요 유저 테이블
create table usermange(
gubun char(1), --1:게시글, 2:댓글
num number(5),  --게시글 또는 댓글의 번호
userid VARCHAR2(20) not null, --유저 아이디
likegubun char(1), --0:조회, 1:좋아요, 2:싫어요
PRIMARY KEY (gubun, num, userid),
FOREIGN key (userid) REFERENCES member (userid)
);



DELETE FROM usermange;

select * from usermange;
select * from item;

select * from usermange
where gubun = '1'
and num = 2
and userid = 'ddd';

INSERT INTO usermange (gubun, num, userid, likegubun)
VALUES ('1', '2', 'ddd', '0');



--오라클 익명 프로시저 (반복문) (얘 아래에 쿼리문 있으면 같이 읽힘....)
begin
    for i in 1..100 loop
        INSERT INTO board board(bnum,userid,subject,content,ip)
        VALUES (bseq.nextval,'ddd','1','1',1);
    end loop;
end;

--프로시저 : 게시물 조회수 +1 
CREATE OR REPLACE PROCEDURE P_UPDATE_READ_CNT(
    PGUBUN IN USERMANGE.GUBUN%TYPE,
    PNUM IN USERMANGE.NUM%TYPE,
    PUSERID IN USERMANGE.USERID%TYPE,
    Plikegubun IN USERMANGE.likegubun%TYPE
)
IS
    CNT NUMBER;
BEGIN
    --유저 조회 정보 select
    SELECT COUNT(*) INTO CNT FROM USERMANGE
    WHERE GUBUN = PGUBUN
    AND NUM = PNUM
    AND USERID = PUSERID;
    --만약에 유저 정보가 없다면 게시물 조회수 +1, 유저매니저 테이블에 insert
    IF CNT=0 THEN
   		UPDATE BOARD
		SET READCNT = READCNT +1
		WHERE BNUM = PNUM;
    
   		INSERT INTO USERMANGE (GUBUN, NUM, USERID, likegubun)
		VALUES (PGUBUN,PNUM, PUSERID, Plikegubun);

    END IF;
        
END;

EXEC P_UPDATE_READ_CNT('1', '2', 'java','0' );


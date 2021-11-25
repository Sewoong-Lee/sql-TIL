--회원 3
drop table state;
drop table MV_USER_TAG CASCADE CONSTRAINTS PURGE;
drop table MV_GENRE CASCADE CONSTRAINTS PURGE;    --영화장르 테이블
drop table MV_USER CASCADE CONSTRAINTS PURGE; 

--영화 파트 8+1
drop table MV_SALES_SEATS CASCADE CONSTRAINTS PURGE;
drop table MV_SEATS CASCADE CONSTRAINTS PURGE;
drop table MV_SALES CASCADE CONSTRAINTS PURGE;
drop table MV_TIME CASCADE CONSTRAINTS PURGE;
drop table CINEMA CASCADE CONSTRAINTS PURGE;
drop table MV_CITY CASCADE CONSTRAINTS PURGE;
drop table MV_MOVIE_REPLY CASCADE CONSTRAINTS PURGE;
drop table MV_MOVIE_DATA CASCADE CONSTRAINTS PURGE;

--공지사항 파트 3
drop table MV_BOARD_REPLY;
drop table MV_BOARD_FILE;
drop table MV_BOARD;
-------------------------------------------------
drop TABLE MV_USER CASCADE CONSTRAINTS;

SELECT count(*) totcnt FROM MV_BOARD;

select *from MV_TAG;
commit;
ROLLBACK;

--회원 테이블(MV_USER)				
create table MV_USER(
USER_ID	VARCHAR2(20) not null,	--pk 회원 id
PASSWD CHAR(60) not null,		--비밀번호
USER_NAME VARCHAR2(20) not null,	--	회원 이름
EMAIL VARCHAR2(30) not null,		--이메일
TEL	VARCHAR2(15),			--전화번호
ZIP	VARCHAR2(5),			--우편번호
ADDR1 VARCHAR2(100),		--	주소1
ADDR2 VARCHAR2(100),		--	주소2
FILE_NAME VARCHAR2(100),	--	프로필 파일명
ADMIN char(1)DEFAULT 1 not null,			    --권한 및 등급 (0:관리자, 1:일반 3:골드 4:vip)
EMAIL_AUTH char(1) DEFAULT 0,		    --	이메일 인증 여부 (0:미인증, 1: 인증)
SIMPLE_JOIN char(1)DEFAULT 0,		--	가입 경로(예정)(0:일반가입, 1: 네이버 간편가입, 2:카카오 간편가입)
REG_DATE date DEFAULT sysdate,		--	등록일자
PRIMARY KEY(USER_ID)
);
insert into MV_USER(USER_ID, PASSWD, USER_NAME, EMAIL) 
values ('ddd','ddd','디디디','ddd@ddd.com');

--장르(MV_GENRE)			
create table MV_GENRE(
GENRE_CODE VARCHAR2(5) not null,     --	pk	태그 코드
GENRE_NAME VARCHAR2(50) not null,	--	태그명 이름
PRIMARY KEY(GENRE_CODE)
);
select * from MV_GENRE;

--고객 예매정보 조회
select * 
    from MV_TIME MT
    join MV_SALES MS
      on MT.TIME_CODE = MS.TIME_CODE
    JOIN MV_MOVIE_DATA MMD
      ON MT.MOVIE_NUM = MMD.MOVIE_NUM
    JOIN MV_USER MU
      ON MS.USER_ID = MU.USER_ID
WHERE MS.USER_ID = 'ddd';


--회원테그(MV_USER_TAG)				
create table MV_USER_TAG(
GENRE_CODE VARCHAR2(5) not null,	--pk/fk	테그 코드
USER_ID	VARCHAR2(20) not null,	    --pk/fk	회원 id
PRIMARY KEY(GENRE_CODE,USER_ID),
FOREIGN key(GENRE_CODE) REFERENCES MV_GENRE(GENRE_CODE),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);

--좋아요&싫어요(state)	--보류	
create table MV_state(
gubun char(1) not null,	        --pk 0:영화 댓글, 1:게시글(공지), 2:댓글
num	number(5) not null,	        --pk 게시글 또는 댓글의 번호
USER_ID VARCHAR2(20) not null,	-- pk/fk 사용자 아이디
stategubun char(1) not null,	--	0:조회, 1:좋아요, 2:싫어요
PRIMARY KEY(gubun,num,USER_ID),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);


--영화 파트 -----------------------------------------------

-- 장르 테이블 인서트 (네이버제공)
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0001','드라마');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0002','판타지');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0003','서부');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0004','공포');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0005','로맨스');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0006','모험');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0007','스릴러');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0008','느와르');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0009','컬트');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0010','다큐멘터리');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0011','코미디');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0012','가족');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0013','미스터리');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0014','전쟁');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0015','애니메이션');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0016','범죄');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0017','뮤지컬');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0018','SF');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0019','액션');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0020','무협');
commit;
ROLLBACK;

--영화 정보(MV_MOVIE_DATA)				
create table MV_MOVIE_DATA(
GENRE_CODE	VARCHAR2(5) not null,	--fk	영화 장르 코드 (장르 테이블 참조)
MOVIE_NUM number(5) not null,	    --pk	영화 순번
COUNTRY_NAME VARCHAR2(20) not null,	--	제작 국가 이름
MOVIE_NAME VARCHAR2(50) not null,	--	영화 이름
DIRECTOR VARCHAR2(20) not null,		--감독
MOVIE_MEMO VARCHAR2(200),			--소개
MOVIE_POSTER_LINK VARCHAR2(100),	--		영화의 대표 포스터 링크
ACTOR_NAME VARCHAR2(100) not null,	--	배우 이름
REG_DATE date DEFAULT sysdate,		--	등록일자
MODIFY_DATE	date DEFAULT sysdate,	--		수정일자(수정시 업데이트)
PRIMARY KEY(MOVIE_NUM),
FOREIGN key(GENRE_CODE) REFERENCES MV_GENRE(GENRE_CODE)
);
insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM, COUNTRY_NAME, MOVIE_NAME, DIRECTOR, 
MOVIE_MEMO, MOVIE_POSTER_LINK, ACTOR_NAME)
values('c0001',1, '한국', '하이염', '감독', '소개', '링크', '배우1 | 배우2 | 배우3');

--영화 댓글(MV_MOVIE_REPLY) 영화 디테일 화면의 고객평		
create table MV_MOVIE_REPLY(
MR_NUM number(5) not null,	    --pk 영화 댓글 순서
MOVIE_NUM number(5) not null,	--fk 영화 순번
USER_ID	VARCHAR2(20) not null,	--fk 작성자 아이디
CONTENT	VARCHAR2(1000) not null, --	내용
LIKE_CNT number(3) DEFAULT 0,	 --	좋아요
DIS_LIKE_CNT number(3) DEFAULT 0, --싫어요
IP	VARCHAR2(20) not null,		    --ip
RE_STEP	number(3), 		            --글 순서
RE_LEVEL number(3),			        --글 레벨
REG_DATE date DEFAULT sysdate,		--등록일자
MODIFY_DATE	date DEFAULT sysdate,	--	수정일자
PRIMARY KEY(MR_NUM),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);

--*****************************************************************************************************
--극장 시 지역 테이블(MV_CITY)	
create table MV_CITY(
CITY_CODE VARCHAR2(3) not null, 	-- pk 시 지역 코드
CITY_NAME VARCHAR2(20) not null,	-- 시 지역 이름 ex) 서울시, 부천시
PRIMARY KEY(CITY_CODE)
);

insert into MV_CITY(CITY_CODE,CITY_NAME)values('ct1','서울');
insert into MV_CITY(CITY_CODE,CITY_NAME)values('ct2','부천');
insert into MV_CITY(CITY_CODE,CITY_NAME)values('ct3','인천');

select * from MV_CITY;

--*****************************************************************************************************
--영화관 테이블(CINEMA)	
drop table CINEMA;
DELETE FROM CINEMA;

select * from CINEMA;
create table CINEMA(
CINEMA_CODE	VARCHAR2(5) not null,	-- PK 영화관 PK용
CITY_CODE VARCHAR2(3) not null,	    --FK 시 지역
CINEMA_NAME VARCHAR2(20) not null,	-- 영화관 이름
CINEMA_TEL VARCHAR2(15)	 ,           -- 연락처
PRIMARY KEY(CINEMA_CODE),
FOREIGN key(CITY_CODE) REFERENCES MV_CITY(CITY_CODE)
);				
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn01','ct1','신촌 CCV',0211111111);
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn02','ct1','홍대 CCV',0222222222);
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn03','ct1','강남 CCV',0233333333);
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn04','ct2','부천역 CCV',0324444444);
            
SELECT cine.*
FROM CINEMA cine join MV_CITY city on (cine.CITY_CODE = city.CITY_CODE)
WHERE cine.CITY_CODE  = 'ct1' ;

SELECT * FROM CINEMA
where CITY_CODE = 'ct1';

--*****************************************************************************************************
--상영(MV_TIME)
DROP TABLE MV_TIME CASCADE CONSTRAINTS PURGE;

create table MV_TIME(
TIME_CODE VARCHAR2(5) not null,	    --PK	상영 코드
CINEMA_CODE	VARCHAR2(5)	not null,	--FK	영화관 코드 (영화관 테이블 참조)
MOVIE_NUM number(5)	not null,	    --FK	영화 순번 (영화 정보 테이블 참조)
TIME_DAY CHAR(10) not null,		--상영 날짜
TIME_TIME VARCHAR2(20) not null,		--상영 시간
PRIMARY KEY(TIME_CODE),
FOREIGN key(CINEMA_CODE) REFERENCES CINEMA(CINEMA_CODE),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM)
);

SELECT * FROM MV_TIME;
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti01','cn01',1,'2021-08-04','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti02','cn01',1,'2021-08-05','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti03','cn01',1,'2021-08-06','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti15','cn01',1,'2021-08-14','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti16','cn01',1,'2021-08-14','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti17','cn01',1,'2021-08-15','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti18','cn01',1,'2021-08-15','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti19','cn01',1,'2021-08-16','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti20','cn01',1,'2021-08-16','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti21','cn01',1,'2021-08-17','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti22','cn01',1,'2021-08-17','07:00~09:00');

insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti38','cn01',40,'2021-11-27','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti39','cn01',39,'2021-11-27','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti40','cn01',40,'2021-11-27','10:00~12:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti41','cn01',39,'2021-11-27','10:00~12:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti42','cn01',40,'2021-11-28','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti43','cn01',39,'2021-11-28','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti44','cn01',40,'2021-11-28','10:00~12:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti45','cn01',39,'2021-11-28','10:00~12:00');

insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti46','cn01',40,'2021-11-30','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti47','cn01',39,'2021-11-30','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti48','cn01',40,'2021-11-30','10:00~12:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti49','cn01',39,'2021-11-30','10:00~12:00');

insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti50','cn01',40,'2021-12-01','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti51','cn01',39,'2021-12-01','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti52','cn01',40,'2021-12-01','10:00~12:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti53','cn01',39,'2021-12-01','10:00~12:00');


SELECT TO_CHAR(sysdate,'YYYY-MM-DD') FROM DUAL;

--현재 날짜와 같은 상영 날짜 뽑기
select * from MV_TIME
where TIME_DAY = TO_CHAR(sysdate,'YYYY-MM-DD');

--현재 날짜부터 일정 기간 내의 정보 뽑기
select * from MV_TIME
where TIME_DAY BETWEEN TO_CHAR(sysdate,'YYYY-MM-DD') 
AND TO_CHAR(sysdate+7,'YYYY-MM-DD')
AND ROWID IN (SELECT MAX(ROWID) FROM MV_TIME GROUP BY TIME_DAY)
AND MOVIE_NUM = 1
ORDER BY TIME_DAY;
--선택한 영화관의 상영 시간 정보
SELECT TI.* 
FROM MV_TIME TI JOIN CINEMA CN ON (TI.CINEMA_CODE = CN.CINEMA_CODE)
WHERE TI.CINEMA_CODE  = 'cn01'
and TI.TIME_CODE = 'ti01'
and ti.MOVIE_NUM = 1;

--*****************************************************************************************************
--예매 정보(MV_SALES)		
DROP TABLE MV_SALES CASCADE CONSTRAINTS PURGE;

create table MV_SALES(
SAL_NUM	number(10) not null,	    --pk 예매 번호 
TIME_CODE VARCHAR2(5) not null,	    --FK 상영 코드 (상영 테이블 참조)
USER_ID	VARCHAR2(20) not null,	    --FK "고객 아이디, 어드민 권한 및 등급 (0:관리자, 1:일반 3:골드 4:vip)
TICKETS	number(10) not null,	    -- 티켓 매수
PRICE number(10) not null,		    -- 가격
SALES_CHECK	VARCHAR2(5)	not null,   -- 결제 여부 (0: 미결제, 1:결제)
REG_DATE date DEFAULT sysdate,	    -- 예매 날짜
PRIMARY KEY(SAL_NUM),
FOREIGN key(TIME_CODE) REFERENCES MV_TIME(TIME_CODE),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);
--예매 정보 조회
select * 
    from MV_TIME MT
    join MV_SALES MS
      on MT.TIME_CODE = MS.TIME_CODE
    JOIN MV_MOVIE_DATA MMD
      ON MT.MOVIE_NUM = MMD.MOVIE_NUM
    JOIN MV_USER MU
      ON MS.USER_ID = MU.USER_ID
WHERE MS.USER_ID = 'ddd';

insert into MV_SALES(SAL_NUM, TIME_CODE, USER_ID, TICKETS, PRICE, SALES_CHECK) 
values(1,'ti01', 'ddd', 1, 1000, 1);

--*****************************************************************************************************
--좌석 테이블마스터(MV_SEATS)		전체 좌석 테이블		
DROP TABLE MV_SEATS CASCADE CONSTRAINTS PURGE;

create table MV_SEATS(
SEATS_CODE VARCHAR2(5),		-- PK 좌석 코드
SEATS_ROW NUMBER(10),		-- 좌석 행
SEATS_COL VARCHAR2(10),		-- 좌석 열
PRIMARY KEY(SEATS_CODE)
);
SELECT *FROM MV_SEATS;
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('A-1',1,'A');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('A-2',2,'A');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('A-3',3,'A');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('A-4',4,'A');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('B-1',1,'B');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('B-2',2,'B');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('B-3',3,'B');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('B-4',4,'B');
SELECT *FROM MV_SEATS;

--예약 좌석 테이블(MV_SALES_SEATS)	예약한 좌석 테이블		
DROP TABLE MV_SALES_SEATS CASCADE CONSTRAINTS PURGE;

create table MV_SALES_SEATS(
SAL_NUM	number(10) not null,         --	Pk/FK	예매번호
SEATS_CODE	VARCHAR2(5),		        --pk/fk	예약좌석 코드
PRIMARY KEY(SAL_NUM,SEATS_CODE),
FOREIGN key(SAL_NUM) REFERENCES MV_SALES(SAL_NUM),
FOREIGN key(SEATS_CODE) REFERENCES MV_SEATS(SEATS_CODE)
);
insert into MV_SALES_SEATS(SAL_NUM, SEATS_CODE) 
values (1, 'A-1');

--상영 시간에 따른 예매한 좌석 확인
select * from 
MV_SALES sa join MV_SALES_SEATS se on (sa.SAL_NUM = se.SAL_NUM)
where TIME_CODE = 'ti01';

--not 사용 안되나....
SELECT *FROM MV_SEATS
WHERE not (SELECT SEATS_CODE FROM MV_SALES_SEATS where SAL_NUM = 1);

--*****************************************************************************************************

--------공지사항 파트--------
--공지사항 게시물(MV_BOARD)				
create table MV_BOARD(
BOARD_NUM number(5) not null,	    --pk 게시물 순번
USER_ID	VARCHAR2(20) not null,	    --fk 작성자
SUBJECT	VARCHAR2(100) not null,		--제목
CONTENT	VARCHAR2(1000) not null,	--내용
READ_CNT number(3) DEFAULT 0,		--조회수
LIKE_CNT number(3) DEFAULT 0,		--좋아요(필요할지 의문)
IP VARCHAR2(20) not null,		    --ip
REG_DATE date DEFAULT sysdate,		--	작성일
MODIFY_DATE	date DEFAULT sysdate,	--	수정일
PRIMARY KEY(BOARD_NUM),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);

--게시물 파일(MV_BOARD_FILE)				
create table MV_BOARD_FILE(
Board_File_NUM number(5) not null,	    --pk	게시물 파일 순번
Board_NUM number(5)	not null,	        --fk	게시물 순번
Board_FILE_NAME VARCHAR2(50) not null,	--	게시물 파일 이름
REG_DATE date DEFAULT sysdate,			--작성일
PRIMARY KEY(Board_File_NUM),
FOREIGN key(Board_NUM) REFERENCES MV_BOARD(Board_NUM)
);

--게시물(공지) 댓글(MV_BOARD_REPLY)				
create table MV_BOARD_REPLY(
BOARD_REPLY_NUM	number(5) not null,	--pk	게시물(공지) 댓글 순서
Board_NUM number(5) not null,	    --fk	게시물(공지) 순번
USER_ID	VARCHAR2(20) not null,	    --fk	작성자 아이디
CONTENT	VARCHAR2(1000) not null,	--내용
IP VARCHAR2(20) not null,		    --ip
RE_STEP	number(3),			        --글 순서
RE_LEVEL number(3),			        --글 레벨
REG_DATE date DEFAULT sysdate,		--	등록일자
MODIFY_DATE date DEFAULT sysdate,	--	수정일자
PRIMARY KEY(BOARD_REPLY_NUM),
FOREIGN key(Board_NUM) REFERENCES MV_BOARD(Board_NUM),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);




--영화 파일(MV_MOVIE_FILE)			--보류	
create table MV_MOVIE_FILE(
MF_NUM number(5) not null,	        --pk 영화 파일 순번
MOVIE_NUM number(5) not null,	    --fk 영화 순번
MF_FILE_NAME VARCHAR2(50) not null,	--게시물 파일 이름
REG_DATE date DEFAULT sysdate,		--작성일
PRIMARY KEY(MF_NUM),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM)
);







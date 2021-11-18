drop table MV_TAG;
drop table MV_USER;
drop table MV_USER_TAG;
drop table state;
drop table MV_CATEGORIES;
drop table MV_MOVIE_DATA;
drop table MV_TIME;
drop table CINEMA;
drop table MV_CITY;
drop table MV_MOVIE_REPLY;
drop table MV_ACTOR;
drop table MV_MOVIE_FILE;
drop table MV_MOVIE_TAG;

drop TABLE MV_USER CASCADE CONSTRAINTS;

--테그(MV_TAG)				
create table MV_TAG(
TAG_CODE VARCHAR2(5) not null,	--pk테그 코드
TAG_NAME VARCHAR2(50) not null,	--테그명 이름
PRIMARY KEY(TAG_CODE)
);

--회원 테이블(MV_USER)				
create table MV_USER(
USER_ID	VARCHAR2(20) not null,	--pk 회원 id
PASSWD CHAR(60) not null,		--비밀번호
USER_NAME VARCHAR2(20) not null,	--	회원 이름
EMAIL VARCHAR2(30) not null,		--이메일
TEL	VARCHAR2(5),			--전화번호
ZIP	VARCHAR2(100),			--우편번호
ADDR1 VARCHAR2(100),		--	주소1
ADDR2 VARCHAR2(100),		--	주소2
FILE_NAME VARCHAR2(100),	--	프로필 파일명
ADMIN char(1)not null,			    --권한 및 등급 (0:관리자, 1:일반 3:골드 4:vip)
EMAIL_AUTH char(1),		    --	이메일 인증 여부 (0:미인증, 1: 인증)
SIMPLE_JOIN char(1),		--	가입 경로(예정)(0:일반가입, 1: 네이버 간편가입, 2:카카오 간편가입)
REG_DATE date DEFAULT sysdate,		--	등록일자
MODIFY_DATE	date DEFAULT sysdate,
PRIMARY KEY(USER_ID)
);

--회원테그(MV_USER_TAG)				
create table MV_USER_TAG(
TAG_CODE VARCHAR2(5) not null,	--pk/fk	테그 코드
USER_ID	VARCHAR2(20) not null,	--pk/fk	회원 id
PRIMARY KEY(TAG_CODE,USER_ID),
FOREIGN key(TAG_CODE) REFERENCES MV_TAG(TAG_CODE),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);

--좋아요&싫어요(state)	--보류	
create table state(
gubun char(1) not null,	        --pk 0:영화 댓글, 1:게시글(공지), 2:댓글
num	number(5) not null,	        --pk 게시글 또는 댓글의 번호
USER_ID VARCHAR2(20) not null,	-- pk/fk 사용자 아이디
stategubun char(1) not null,	--	0:조회, 1:좋아요, 2:싫어요
PRIMARY KEY(gubun,num,USER_ID),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);

--영화 파트 -------------------

--카테고리(MV_CATEGORIES)				
create table MV_CATEGORIES(
CATEGORIES_CODE VARCHAR2(5)	not null,	-- pk 카테고리 코드
CATEGORIES_NAME VARCHAR2(20) not null,	-- 카테고리 이름
PRIMARY KEY(CATEGORIES_CODE)
);

--영화 정보(MV_MOVIE_DATA)				
create table MV_MOVIE_DATA(
CATEGORIES_CODE VARCHAR2(5) not null,	--fk 카테고리 코드
MOVIE_NUM number(5)	not null,	        --pk 영화 순번
COUNTRY_NAME VARCHAR2(20) not null,		--제작 국가 이름
MOVIE_NAME VARCHAR2(50) not null,		--영화 이름
DIRECTOR VARCHAR2(20) not null,		    --감독
MOVIE_MEMO VARCHAR2(200),			    --소개
REG_DATE date DEFAULT sysdate,			--등록일자
MODIFY_DATE	date DEFAULT sysdate,		--수정일자(수정시 업데이트)
PRIMARY KEY(MOVIE_NUM),
FOREIGN key(CATEGORIES_CODE) REFERENCES MV_CATEGORIES(CATEGORIES_CODE)
);

--영화테그(MV_MOVIE_TAG)		
create table MV_MOVIE_TAG(
TAG_CODE VARCHAR2(5) not null,	--pk/fk	테그 코드
MOVIE_NUM number(5) not null,	--pk/fk	영화 순번
PRIMARY KEY(TAG_CODE,MOVIE_NUM),
FOREIGN key(TAG_CODE) REFERENCES MV_TAG(TAG_CODE),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM)
);

--영화 파일(MV_MOVIE_FILE)				
create table MV_MOVIE_FILE(
MF_NUM number(5) not null,	        --pk 영화 파일 순번
MOVIE_NUM number(5) not null,	    --fk 영화 순번
MF_FILE_NAME VARCHAR2(50) not null,	--게시물 파일 이름
REG_DATE date DEFAULT sysdate,		--작성일
PRIMARY KEY(MF_NUM),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM)
);

--배우(MV_ACTOR)				
create table MV_ACTOR(
ACTOR_NUM number(5) not null,	    --pk 배우 순번
MOVIE_NUM number(5) not null,	    --fk 영화 순번
ACTOR_NAME VARCHAR2(100) not null,	-- 배우 이름
REG_DATE date DEFAULT sysdate,		-- 등록일
PRIMARY KEY(ACTOR_NUM),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM)
);

--영화 댓글(MV_MOVIE_REPLY)				
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

--극장 시 지역 테이블(MV_CITY)				
create table MV_CITY(
CITY_CODE VARCHAR2(3) not null, 	-- pk 시 지역 코드
CITY_NAME VARCHAR2(20) not null,	-- 시 지역 이름 ex) 서울시, 부천시
PRIMARY KEY(CITY_CODE)
);

--영화관 테이블(CINEMA)				
create table CINEMA(
CINEMA_CODE	VARCHAR2(5) not null,	-- PK 영화관 PK용
CITY_CODE VARCHAR2(3) not null,	    --FK 시 지역
CINEMA_NAME VARCHAR2(20) not null,	-- 영화관 이름
CINEMA_SEATS NUMBER(3) not null,	-- 좌석
CINEMA_TEL VARCHAR2(15)	 ,           -- 연락처
PRIMARY KEY(CINEMA_CODE),
FOREIGN key(CITY_CODE) REFERENCES MV_CITY(CITY_CODE)
);				

--상영(MV_TIME)				
create table MV_TIME(
CINEMA_CODE	VARCHAR2(5)	not null,	-- PK/FK	영화관 코드
MOVIE_NUM number(5)	not null,	    -- PK/FK	영화 순번
TIME_DAY VARCHAR2(10) not null,		-- PK 상영 날짜
TIME_TIME VARCHAR2(5) not null,	    -- PK 상영 시간
PRIMARY KEY(CINEMA_CODE,MOVIE_NUM,TIME_DAY,TIME_TIME),
FOREIGN key(CINEMA_CODE) REFERENCES CINEMA(CINEMA_CODE),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM)
);

drop table MV_TIME;

--예매 정보(MV_SALES)				
create table MV_SALES(
SAL_NUM number(10) not null,	    --pk예매 번호
USER_ID VARCHAR2(20) not null,  	--FK고객 아이디
MOVIE_NUM number(5) not null,	    --FK영화 순번
CINEMA_CODE	VARCHAR2(5) not null,	--FK영화관
TICKETS	VARCHAR2(20) not null,		--티켓 매수
SEATS number(10) not null,		    --좌석
PRICE number(10) not null,		    --가격
TIME_DATE date not null,		    --날짜
TIME VARCHAR2(20) not null,		    --시간
SALES_CHECK	VARCHAR2(5)	not null,	--결제 여부 (0: 미결제, 1:결제)
TIME_DAY VARCHAR2(10) not null,	    --FK 상영 날짜
TIME_TIME VARCHAR2(5) not null,	    --FK 상영 시간
ADMIN char(1),		                --FK 권한 및 등급 (0:관리자, 1:일반 3:골드 4:vip)
PRIMARY KEY(SAL_NUM),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM),
FOREIGN key(CINEMA_CODE) REFERENCES CINEMA(CINEMA_CODE),

FOREIGN key(TIME_DAY) REFERENCES MV_TIME(TIME_DAY),
FOREIGN key(TIME_TIME) REFERENCES MV_TIME(TIME_TIME)
);

drop table MV_SALES;





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






commit;

--회원 테이블
create table MV_USER(
USER_ID VARCHAR2(43) not null, --회원id
PASSWD CHAR(60) not null,       --비밀번호
USER_NAME VARCHAR2(20) not null,--회원 이름
EMAIL VARCHAR2(30) not null,    --이메일
TEL VARCHAR2(11),                --전화번호
ZIP number(5),              --우편번호
ADDR1 VARCHAR2(100)	,           --주소1
ADDR2 VARCHAR2(100),	        --주소2
FILE_NAME VARCHAR2(100),	    --프로필 파일명
ADMIN char(1) DEFAULT '1' NOT NULL,	              --권한 및 등급 (0:관리자, 1:일반 3:골드 4:vip)
EMAIL_AUTH char(1) DEFAULT '0',	        -- 이메일 인증 여부 (0:미인증, 1: 인증)
SIMPLE_JOIN char(1) DEFAULT '0',	    -- 가입 경로(예정)(0:일반가입, 1: 네이버 간편가입, 2:카카오 간편가입)
REG_DATE date DEFAULT sysdate,	--등록일자
PRIMARY KEY(USER_ID)
);
DELETE FROM MV_USER;

select * from MV_USER;

--장르(MV_GENRE)			
create table MV_GENRE(
GENRE_CODE VARCHAR2(5) not null,     --	pk	태그 코드
GENRE_NAME VARCHAR2(50) not null,	--	태그명 이름
PRIMARY KEY(GENRE_CODE)
);

--*********************************************************************************************
--회원테그(MV_USER_TAG) 사용x	
--create table MV_USER_TAG(
--USER_ID VARCHAR2(20), -- 회원 id
--TAG_CODE VARCHAR2(5), -- 태그 코드
--FOREIGN KEY (USER_ID) REFERENCES MV_USER(USER_ID)
--    ON DELETE CASCADE,
--FOREIGN KEY (TAG_CODE) REFERENCES MV_GENRE(GENRE_CODE),
--CONSTRAINT MV_USER_TAG_PK PRIMARY KEY(USER_ID, TAG_CODE)
--);
--회원테그(MV_USER_TAG)				
create table MV_USER_TAG(
GENRE_CODE VARCHAR2(5) not null,	--pk/fk	테그 코드
USER_ID	VARCHAR2(20) not null,	    --pk/fk	회원 id
FOREIGN KEY (USER_ID) REFERENCES MV_USER(USER_ID)
    ON DELETE CASCADE,
FOREIGN KEY (GENRE_CODE) REFERENCES MV_GENRE(GENRE_CODE),
CONSTRAINT MV_USER_TAG_PK PRIMARY KEY(USER_ID, GENRE_CODE)
);

select * from MV_USER_TAG;

--좋아요&싫어요(state)	--보류	
--create table state(
--gubun char(1) not null,	        --pk 0:영화 댓글, 1:게시글(공지), 2:댓글
--num	number(5) not null,	        --pk 게시글 또는 댓글의 번호
--USER_ID VARCHAR2(20) not null,	-- pk/fk 사용자 아이디
--stategubun char(1) not null,	--	0:조회, 1:좋아요, 2:싫어요
--PRIMARY KEY(gubun,num,USER_ID),
--FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
--);

select * from MV_state;
drop table MV_state;
create table MV_state(
gubun char(1) not null,	        --pk 0:영화 댓글, 1:게시글(공지), 2:댓글
num	number(5) not null,	        --pk 게시글 또는 댓글의 번호
USER_ID VARCHAR2(20) not null,	-- pk 사용자 아이디, 아이피
stategubun char(1) not null,	--	0:조회
PRIMARY KEY(gubun,num,USER_ID)
);

--영화 정보(MV_MOVIE_DATA)				
create table MV_MOVIE_DATA(
GENRE_CODE	VARCHAR2(5) not null,	--fk	영화 장르 코드 (장르 테이블 참조)
MOVIE_NUM number(5) not null,	    --pk	영화 순번
COUNTRY_NAME VARCHAR2(20) not null,	--	제작 국가 이름
MOVIE_NAME VARCHAR2(50) not null,	--	영화 이름
DIRECTOR VARCHAR2(50) not null,		--감독
MOVIE_MEMO VARCHAR2(200),			--소개
MOVIE_POSTER_LINK VARCHAR2(100),	--		영화의 대표 포스터 링크
ACTOR_NAME VARCHAR2(100) not null,	--	배우 이름
REG_DATE date DEFAULT sysdate,		--	등록일자
MODIFY_DATE	date DEFAULT sysdate,	--		수정일자(수정시 업데이트)
youtube_link varchar(20),
PRIMARY KEY(MOVIE_NUM),
FOREIGN key(GENRE_CODE) REFERENCES MV_GENRE(GENRE_CODE)
);

--영화 정보 번호 시퀀스
CREATE SEQUENCE MV_MOVIE_DATA_NUM
START WITH 1;

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
star_rating number(2,1),		--별점
PRIMARY KEY(MR_NUM),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);

영화 댓글 테이블 시퀀스  
create SEQUENCE MR_NUM_seq;

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
CINEMA_TEL VARCHAR2(15)	 ,           -- 연락처
PRIMARY KEY(CINEMA_CODE),
FOREIGN key(CITY_CODE) REFERENCES MV_CITY(CITY_CODE)
);				


--상영(MV_TIME)
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

--예매 정보(MV_SALES)	
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

--예매번호 시퀀스
create SEQUENCE SALES_NUM
START WITH 5; --시작숫자

--좌석 테이블마스터(MV_SEATS)		전체 좌석 테이블	
create table MV_SEATS(
SEATS_CODE VARCHAR2(5),		-- PK 좌석 코드
SEATS_ROW NUMBER(10),		-- 좌석 행
SEATS_COL VARCHAR2(10),		-- 좌석 열
PRIMARY KEY(SEATS_CODE)
);

--예약 좌석 테이블(MV_SALES_SEATS)	예약한 좌석 테이블
create table MV_SALES_SEATS(
SAL_NUM	number(10) not null,         --	Pk/FK	예매번호
SEATS_CODE	VARCHAR2(5),		        --pk/fk	예약좌석 코드
PRIMARY KEY(SAL_NUM,SEATS_CODE),
FOREIGN key(SAL_NUM) REFERENCES MV_SALES(SAL_NUM),
FOREIGN key(SEATS_CODE) REFERENCES MV_SEATS(SEATS_CODE)
);

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


--게시물 번호 시퀀스
create SEQUENCE mv_bseq
START WITH 1; --시작숫자


--게시물 파일(MV_BOARD_FILE)				
create table MV_BOARD_FILE(
Board_File_NUM number(5) not null,	    --pk	게시물 파일 순번
Board_NUM number(5)	not null,	        --fk	게시물 순번
Board_FILE_NAME VARCHAR2(50) not null,	--	게시물 파일 이름
REG_DATE date DEFAULT sysdate,			--작성일
PRIMARY KEY(Board_File_NUM),
FOREIGN key(Board_NUM) REFERENCES MV_BOARD(Board_NUM)
);


--게시물 파일 시퀀스
create SEQUENCE mv_fseq
START WITH 1; --시작숫자


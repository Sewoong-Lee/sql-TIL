commit;

--ȸ�� ���̺�
create table MV_USER(
USER_ID VARCHAR2(43) not null, --ȸ��id
PASSWD CHAR(60) not null,       --��й�ȣ
USER_NAME VARCHAR2(20) not null,--ȸ�� �̸�
EMAIL VARCHAR2(30) not null,    --�̸���
TEL VARCHAR2(11),                --��ȭ��ȣ
ZIP number(5),              --�����ȣ
ADDR1 VARCHAR2(100)	,           --�ּ�1
ADDR2 VARCHAR2(100),	        --�ּ�2
FILE_NAME VARCHAR2(100),	    --������ ���ϸ�
ADMIN char(1) DEFAULT '1' NOT NULL,	              --���� �� ��� (0:������, 1:�Ϲ� 3:��� 4:vip)
EMAIL_AUTH char(1) DEFAULT '0',	        -- �̸��� ���� ���� (0:������, 1: ����)
SIMPLE_JOIN char(1) DEFAULT '0',	    -- ���� ���(����)(0:�Ϲݰ���, 1: ���̹� ������, 2:īī�� ������)
REG_DATE date DEFAULT sysdate,	--�������
PRIMARY KEY(USER_ID)
);
DELETE FROM MV_USER;

select * from MV_USER;

--�帣(MV_GENRE)			
create table MV_GENRE(
GENRE_CODE VARCHAR2(5) not null,     --	pk	�±� �ڵ�
GENRE_NAME VARCHAR2(50) not null,	--	�±׸� �̸�
PRIMARY KEY(GENRE_CODE)
);

--*********************************************************************************************
--ȸ���ױ�(MV_USER_TAG) ���x	
--create table MV_USER_TAG(
--USER_ID VARCHAR2(20), -- ȸ�� id
--TAG_CODE VARCHAR2(5), -- �±� �ڵ�
--FOREIGN KEY (USER_ID) REFERENCES MV_USER(USER_ID)
--    ON DELETE CASCADE,
--FOREIGN KEY (TAG_CODE) REFERENCES MV_GENRE(GENRE_CODE),
--CONSTRAINT MV_USER_TAG_PK PRIMARY KEY(USER_ID, TAG_CODE)
--);
--ȸ���ױ�(MV_USER_TAG)				
create table MV_USER_TAG(
GENRE_CODE VARCHAR2(5) not null,	--pk/fk	�ױ� �ڵ�
USER_ID	VARCHAR2(20) not null,	    --pk/fk	ȸ�� id
FOREIGN KEY (USER_ID) REFERENCES MV_USER(USER_ID)
    ON DELETE CASCADE,
FOREIGN KEY (GENRE_CODE) REFERENCES MV_GENRE(GENRE_CODE),
CONSTRAINT MV_USER_TAG_PK PRIMARY KEY(USER_ID, GENRE_CODE)
);

select * from MV_USER_TAG;

--���ƿ�&�Ⱦ��(state)	--����	
--create table state(
--gubun char(1) not null,	        --pk 0:��ȭ ���, 1:�Խñ�(����), 2:���
--num	number(5) not null,	        --pk �Խñ� �Ǵ� ����� ��ȣ
--USER_ID VARCHAR2(20) not null,	-- pk/fk ����� ���̵�
--stategubun char(1) not null,	--	0:��ȸ, 1:���ƿ�, 2:�Ⱦ��
--PRIMARY KEY(gubun,num,USER_ID),
--FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
--);

select * from MV_state;
drop table MV_state;
create table MV_state(
gubun char(1) not null,	        --pk 0:��ȭ ���, 1:�Խñ�(����), 2:���
num	number(5) not null,	        --pk �Խñ� �Ǵ� ����� ��ȣ
USER_ID VARCHAR2(20) not null,	-- pk ����� ���̵�, ������
stategubun char(1) not null,	--	0:��ȸ
PRIMARY KEY(gubun,num,USER_ID)
);

--��ȭ ����(MV_MOVIE_DATA)				
create table MV_MOVIE_DATA(
GENRE_CODE	VARCHAR2(5) not null,	--fk	��ȭ �帣 �ڵ� (�帣 ���̺� ����)
MOVIE_NUM number(5) not null,	    --pk	��ȭ ����
COUNTRY_NAME VARCHAR2(20) not null,	--	���� ���� �̸�
MOVIE_NAME VARCHAR2(50) not null,	--	��ȭ �̸�
DIRECTOR VARCHAR2(50) not null,		--����
MOVIE_MEMO VARCHAR2(200),			--�Ұ�
MOVIE_POSTER_LINK VARCHAR2(100),	--		��ȭ�� ��ǥ ������ ��ũ
ACTOR_NAME VARCHAR2(100) not null,	--	��� �̸�
REG_DATE date DEFAULT sysdate,		--	�������
MODIFY_DATE	date DEFAULT sysdate,	--		��������(������ ������Ʈ)
youtube_link varchar(20),
PRIMARY KEY(MOVIE_NUM),
FOREIGN key(GENRE_CODE) REFERENCES MV_GENRE(GENRE_CODE)
);

--��ȭ ���� ��ȣ ������
CREATE SEQUENCE MV_MOVIE_DATA_NUM
START WITH 1;

--��ȭ ���(MV_MOVIE_REPLY) ��ȭ ������ ȭ���� ����		
create table MV_MOVIE_REPLY(
MR_NUM number(5) not null,	    --pk ��ȭ ��� ����
MOVIE_NUM number(5) not null,	--fk ��ȭ ����
USER_ID	VARCHAR2(20) not null,	--fk �ۼ��� ���̵�
CONTENT	VARCHAR2(1000) not null, --	����
LIKE_CNT number(3) DEFAULT 0,	 --	���ƿ�
DIS_LIKE_CNT number(3) DEFAULT 0, --�Ⱦ��
IP	VARCHAR2(20) not null,		    --ip
RE_STEP	number(3), 		            --�� ����
RE_LEVEL number(3),			        --�� ����
REG_DATE date DEFAULT sysdate,		--�������
MODIFY_DATE	date DEFAULT sysdate,	--	��������
star_rating number(2,1),		--����
PRIMARY KEY(MR_NUM),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);

��ȭ ��� ���̺� ������  
create SEQUENCE MR_NUM_seq;

--���� �� ���� ���̺�(MV_CITY)	
create table MV_CITY(
CITY_CODE VARCHAR2(3) not null, 	-- pk �� ���� �ڵ�
CITY_NAME VARCHAR2(20) not null,	-- �� ���� �̸� ex) �����, ��õ��
PRIMARY KEY(CITY_CODE)
);

--��ȭ�� ���̺�(CINEMA)
create table CINEMA(
CINEMA_CODE	VARCHAR2(5) not null,	-- PK ��ȭ�� PK��
CITY_CODE VARCHAR2(3) not null,	    --FK �� ����
CINEMA_NAME VARCHAR2(20) not null,	-- ��ȭ�� �̸�
CINEMA_TEL VARCHAR2(15)	 ,           -- ����ó
PRIMARY KEY(CINEMA_CODE),
FOREIGN key(CITY_CODE) REFERENCES MV_CITY(CITY_CODE)
);				


--��(MV_TIME)
create table MV_TIME(
TIME_CODE VARCHAR2(5) not null,	    --PK	�� �ڵ�
CINEMA_CODE	VARCHAR2(5)	not null,	--FK	��ȭ�� �ڵ� (��ȭ�� ���̺� ����)
MOVIE_NUM number(5)	not null,	    --FK	��ȭ ���� (��ȭ ���� ���̺� ����)
TIME_DAY CHAR(10) not null,		--�� ��¥
TIME_TIME VARCHAR2(20) not null,		--�� �ð�
PRIMARY KEY(TIME_CODE),
FOREIGN key(CINEMA_CODE) REFERENCES CINEMA(CINEMA_CODE),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM)
);

--���� ����(MV_SALES)	
create table MV_SALES(
SAL_NUM	number(10) not null,	    --pk ���� ��ȣ 
TIME_CODE VARCHAR2(5) not null,	    --FK �� �ڵ� (�� ���̺� ����)
USER_ID	VARCHAR2(20) not null,	    --FK "�� ���̵�, ���� ���� �� ��� (0:������, 1:�Ϲ� 3:��� 4:vip)
TICKETS	number(10) not null,	    -- Ƽ�� �ż�
PRICE number(10) not null,		    -- ����
SALES_CHECK	VARCHAR2(5)	not null,   -- ���� ���� (0: �̰���, 1:����)
REG_DATE date DEFAULT sysdate,	    -- ���� ��¥
PRIMARY KEY(SAL_NUM),
FOREIGN key(TIME_CODE) REFERENCES MV_TIME(TIME_CODE),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);

--���Ź�ȣ ������
create SEQUENCE SALES_NUM
START WITH 5; --���ۼ���

--�¼� ���̺�����(MV_SEATS)		��ü �¼� ���̺�	
create table MV_SEATS(
SEATS_CODE VARCHAR2(5),		-- PK �¼� �ڵ�
SEATS_ROW NUMBER(10),		-- �¼� ��
SEATS_COL VARCHAR2(10),		-- �¼� ��
PRIMARY KEY(SEATS_CODE)
);

--���� �¼� ���̺�(MV_SALES_SEATS)	������ �¼� ���̺�
create table MV_SALES_SEATS(
SAL_NUM	number(10) not null,         --	Pk/FK	���Ź�ȣ
SEATS_CODE	VARCHAR2(5),		        --pk/fk	�����¼� �ڵ�
PRIMARY KEY(SAL_NUM,SEATS_CODE),
FOREIGN key(SAL_NUM) REFERENCES MV_SALES(SAL_NUM),
FOREIGN key(SEATS_CODE) REFERENCES MV_SEATS(SEATS_CODE)
);

--�������� �Խù�(MV_BOARD)
create table MV_BOARD(
BOARD_NUM number(5) not null,	    --pk �Խù� ����
USER_ID	VARCHAR2(20) not null,	    --fk �ۼ���
SUBJECT	VARCHAR2(100) not null,		--����
CONTENT	VARCHAR2(1000) not null,	--����
READ_CNT number(3) DEFAULT 0,		--��ȸ��
LIKE_CNT number(3) DEFAULT 0,		--���ƿ�(�ʿ����� �ǹ�)
IP VARCHAR2(20) not null,		    --ip
REG_DATE date DEFAULT sysdate,		--	�ۼ���
MODIFY_DATE	date DEFAULT sysdate,	--	������
PRIMARY KEY(BOARD_NUM),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);


--�Խù� ��ȣ ������
create SEQUENCE mv_bseq
START WITH 1; --���ۼ���


--�Խù� ����(MV_BOARD_FILE)				
create table MV_BOARD_FILE(
Board_File_NUM number(5) not null,	    --pk	�Խù� ���� ����
Board_NUM number(5)	not null,	        --fk	�Խù� ����
Board_FILE_NAME VARCHAR2(50) not null,	--	�Խù� ���� �̸�
REG_DATE date DEFAULT sysdate,			--�ۼ���
PRIMARY KEY(Board_File_NUM),
FOREIGN key(Board_NUM) REFERENCES MV_BOARD(Board_NUM)
);


--�Խù� ���� ������
create SEQUENCE mv_fseq
START WITH 1; --���ۼ���


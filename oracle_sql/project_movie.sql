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

--�ױ�(MV_TAG)				
create table MV_TAG(
TAG_CODE VARCHAR2(5) not null,	--pk�ױ� �ڵ�
TAG_NAME VARCHAR2(50) not null,	--�ױ׸� �̸�
PRIMARY KEY(TAG_CODE)
);

--ȸ�� ���̺�(MV_USER)				
create table MV_USER(
USER_ID	VARCHAR2(20) not null,	--pk ȸ�� id
PASSWD CHAR(60) not null,		--��й�ȣ
USER_NAME VARCHAR2(20) not null,	--	ȸ�� �̸�
EMAIL VARCHAR2(30) not null,		--�̸���
TEL	VARCHAR2(5),			--��ȭ��ȣ
ZIP	VARCHAR2(100),			--�����ȣ
ADDR1 VARCHAR2(100),		--	�ּ�1
ADDR2 VARCHAR2(100),		--	�ּ�2
FILE_NAME VARCHAR2(100),	--	������ ���ϸ�
ADMIN char(1)not null,			    --���� �� ��� (0:������, 1:�Ϲ� 3:��� 4:vip)
EMAIL_AUTH char(1),		    --	�̸��� ���� ���� (0:������, 1: ����)
SIMPLE_JOIN char(1),		--	���� ���(����)(0:�Ϲݰ���, 1: ���̹� ������, 2:īī�� ������)
REG_DATE date DEFAULT sysdate,		--	�������
MODIFY_DATE	date DEFAULT sysdate,
PRIMARY KEY(USER_ID)
);

--ȸ���ױ�(MV_USER_TAG)				
create table MV_USER_TAG(
TAG_CODE VARCHAR2(5) not null,	--pk/fk	�ױ� �ڵ�
USER_ID	VARCHAR2(20) not null,	--pk/fk	ȸ�� id
PRIMARY KEY(TAG_CODE,USER_ID),
FOREIGN key(TAG_CODE) REFERENCES MV_TAG(TAG_CODE),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);

--���ƿ�&�Ⱦ��(state)	--����	
create table state(
gubun char(1) not null,	        --pk 0:��ȭ ���, 1:�Խñ�(����), 2:���
num	number(5) not null,	        --pk �Խñ� �Ǵ� ����� ��ȣ
USER_ID VARCHAR2(20) not null,	-- pk/fk ����� ���̵�
stategubun char(1) not null,	--	0:��ȸ, 1:���ƿ�, 2:�Ⱦ��
PRIMARY KEY(gubun,num,USER_ID),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);

--��ȭ ��Ʈ -------------------

--ī�װ�(MV_CATEGORIES)				
create table MV_CATEGORIES(
CATEGORIES_CODE VARCHAR2(5)	not null,	-- pk ī�װ� �ڵ�
CATEGORIES_NAME VARCHAR2(20) not null,	-- ī�װ� �̸�
PRIMARY KEY(CATEGORIES_CODE)
);

--��ȭ ����(MV_MOVIE_DATA)				
create table MV_MOVIE_DATA(
CATEGORIES_CODE VARCHAR2(5) not null,	--fk ī�װ� �ڵ�
MOVIE_NUM number(5)	not null,	        --pk ��ȭ ����
COUNTRY_NAME VARCHAR2(20) not null,		--���� ���� �̸�
MOVIE_NAME VARCHAR2(50) not null,		--��ȭ �̸�
DIRECTOR VARCHAR2(20) not null,		    --����
MOVIE_MEMO VARCHAR2(200),			    --�Ұ�
REG_DATE date DEFAULT sysdate,			--�������
MODIFY_DATE	date DEFAULT sysdate,		--��������(������ ������Ʈ)
PRIMARY KEY(MOVIE_NUM),
FOREIGN key(CATEGORIES_CODE) REFERENCES MV_CATEGORIES(CATEGORIES_CODE)
);

--��ȭ�ױ�(MV_MOVIE_TAG)		
create table MV_MOVIE_TAG(
TAG_CODE VARCHAR2(5) not null,	--pk/fk	�ױ� �ڵ�
MOVIE_NUM number(5) not null,	--pk/fk	��ȭ ����
PRIMARY KEY(TAG_CODE,MOVIE_NUM),
FOREIGN key(TAG_CODE) REFERENCES MV_TAG(TAG_CODE),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM)
);

--��ȭ ����(MV_MOVIE_FILE)				
create table MV_MOVIE_FILE(
MF_NUM number(5) not null,	        --pk ��ȭ ���� ����
MOVIE_NUM number(5) not null,	    --fk ��ȭ ����
MF_FILE_NAME VARCHAR2(50) not null,	--�Խù� ���� �̸�
REG_DATE date DEFAULT sysdate,		--�ۼ���
PRIMARY KEY(MF_NUM),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM)
);

--���(MV_ACTOR)				
create table MV_ACTOR(
ACTOR_NUM number(5) not null,	    --pk ��� ����
MOVIE_NUM number(5) not null,	    --fk ��ȭ ����
ACTOR_NAME VARCHAR2(100) not null,	-- ��� �̸�
REG_DATE date DEFAULT sysdate,		-- �����
PRIMARY KEY(ACTOR_NUM),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM)
);

--��ȭ ���(MV_MOVIE_REPLY)				
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
PRIMARY KEY(MR_NUM),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);

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
CINEMA_SEATS NUMBER(3) not null,	-- �¼�
CINEMA_TEL VARCHAR2(15)	 ,           -- ����ó
PRIMARY KEY(CINEMA_CODE),
FOREIGN key(CITY_CODE) REFERENCES MV_CITY(CITY_CODE)
);				

--��(MV_TIME)				
create table MV_TIME(
CINEMA_CODE	VARCHAR2(5)	not null,	-- PK/FK	��ȭ�� �ڵ�
MOVIE_NUM number(5)	not null,	    -- PK/FK	��ȭ ����
TIME_DAY VARCHAR2(10) not null,		-- PK �� ��¥
TIME_TIME VARCHAR2(5) not null,	    -- PK �� �ð�
PRIMARY KEY(CINEMA_CODE,MOVIE_NUM,TIME_DAY,TIME_TIME),
FOREIGN key(CINEMA_CODE) REFERENCES CINEMA(CINEMA_CODE),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM)
);

drop table MV_TIME;

--���� ����(MV_SALES)				
create table MV_SALES(
SAL_NUM number(10) not null,	    --pk���� ��ȣ
USER_ID VARCHAR2(20) not null,  	--FK�� ���̵�
MOVIE_NUM number(5) not null,	    --FK��ȭ ����
CINEMA_CODE	VARCHAR2(5) not null,	--FK��ȭ��
TICKETS	VARCHAR2(20) not null,		--Ƽ�� �ż�
SEATS number(10) not null,		    --�¼�
PRICE number(10) not null,		    --����
TIME_DATE date not null,		    --��¥
TIME VARCHAR2(20) not null,		    --�ð�
SALES_CHECK	VARCHAR2(5)	not null,	--���� ���� (0: �̰���, 1:����)
TIME_DAY VARCHAR2(10) not null,	    --FK �� ��¥
TIME_TIME VARCHAR2(5) not null,	    --FK �� �ð�
ADMIN char(1),		                --FK ���� �� ��� (0:������, 1:�Ϲ� 3:��� 4:vip)
PRIMARY KEY(SAL_NUM),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM),
FOREIGN key(CINEMA_CODE) REFERENCES CINEMA(CINEMA_CODE),

FOREIGN key(TIME_DAY) REFERENCES MV_TIME(TIME_DAY),
FOREIGN key(TIME_TIME) REFERENCES MV_TIME(TIME_TIME)
);

drop table MV_SALES;





--------�������� ��Ʈ--------
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

--�Խù� ����(MV_BOARD_FILE)				
create table MV_BOARD_FILE(
Board_File_NUM number(5) not null,	    --pk	�Խù� ���� ����
Board_NUM number(5)	not null,	        --fk	�Խù� ����
Board_FILE_NAME VARCHAR2(50) not null,	--	�Խù� ���� �̸�
REG_DATE date DEFAULT sysdate,			--�ۼ���
PRIMARY KEY(Board_File_NUM),
FOREIGN key(Board_NUM) REFERENCES MV_BOARD(Board_NUM)
);

--�Խù�(����) ���(MV_BOARD_REPLY)				
create table MV_BOARD_REPLY(
BOARD_REPLY_NUM	number(5) not null,	--pk	�Խù�(����) ��� ����
Board_NUM number(5) not null,	    --fk	�Խù�(����) ����
USER_ID	VARCHAR2(20) not null,	    --fk	�ۼ��� ���̵�
CONTENT	VARCHAR2(1000) not null,	--����
IP VARCHAR2(20) not null,		    --ip
RE_STEP	number(3),			        --�� ����
RE_LEVEL number(3),			        --�� ����
REG_DATE date DEFAULT sysdate,		--	�������
MODIFY_DATE date DEFAULT sysdate,	--	��������
PRIMARY KEY(BOARD_REPLY_NUM),
FOREIGN key(Board_NUM) REFERENCES MV_BOARD(Board_NUM),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);






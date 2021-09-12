--ȸ�� 3
drop table MV_state;
drop table MV_USER_TAG CASCADE CONSTRAINTS PURGE;
drop table MV_GENRE CASCADE CONSTRAINTS PURGE;    --��ȭ�帣 ���̺�
drop table MV_USER CASCADE CONSTRAINTS PURGE; 

--��ȭ ��Ʈ 8+1
drop table MV_SALES_SEATS CASCADE CONSTRAINTS PURGE;
drop table MV_SEATS CASCADE CONSTRAINTS PURGE;
drop table MV_SALES CASCADE CONSTRAINTS PURGE;
drop table MV_TIME CASCADE CONSTRAINTS PURGE;
drop table CINEMA CASCADE CONSTRAINTS PURGE;
drop table MV_CITY CASCADE CONSTRAINTS PURGE;
drop table MV_MOVIE_REPLY CASCADE CONSTRAINTS PURGE;
drop table MV_MOVIE_DATA CASCADE CONSTRAINTS PURGE;

--�������� ��Ʈ 3
drop table MV_BOARD_REPLY;
drop table MV_BOARD_FILE;
drop table MV_BOARD;
-------------------------------------------------
drop TABLE MV_USER CASCADE CONSTRAINTS;

select *from MV_TAG;
commit;
ROLLBACK;

--ȸ�� ���̺�(MV_USER)				
create table MV_USER(
USER_ID	VARCHAR2(20) not null,	--pk ȸ�� id
PASSWD CHAR(60) not null,		--��й�ȣ
USER_NAME VARCHAR2(20) not null,	--	ȸ�� �̸�
EMAIL VARCHAR2(30) not null,		--�̸���
TEL	VARCHAR2(15),			--��ȭ��ȣ
ZIP	VARCHAR2(5),			--�����ȣ
ADDR1 VARCHAR2(100),		--	�ּ�1
ADDR2 VARCHAR2(100),		--	�ּ�2
FILE_NAME VARCHAR2(100),	--	������ ���ϸ�
ADMIN char(1)DEFAULT 1 not null,			    --���� �� ��� (0:������, 1:�Ϲ� 3:��� 4:vip)
EMAIL_AUTH char(1) DEFAULT 0,		    --	�̸��� ���� ���� (0:������, 1: ����)
SIMPLE_JOIN char(1)DEFAULT 0,		--	���� ���(����)(0:�Ϲݰ���, 1: ���̹� ������, 2:īī�� ������)
REG_DATE date DEFAULT sysdate,		--	�������
PRIMARY KEY(USER_ID)
);

update MV_USER
set ADMIN = '0'
where user_id = 'sss'; 

insert into MV_USER(USER_ID, PASSWD, USER_NAME, EMAIL) 
values ('ddd','ddd','����','ddd@ddd.com');

--�帣(MV_GENRE)			
create table MV_GENRE(
GENRE_CODE VARCHAR2(5) not null,     --	pk	�±� �ڵ�
GENRE_NAME VARCHAR2(50) not null,	--	�±׸� �̸�
PRIMARY KEY(GENRE_CODE)
);
select * from MV_GENRE;

--�� �������� ��ȸ
select * 
    from MV_TIME MT
    join MV_SALES MS
      on MT.TIME_CODE = MS.TIME_CODE
    JOIN MV_MOVIE_DATA MMD
      ON MT.MOVIE_NUM = MMD.MOVIE_NUM
    JOIN MV_USER MU
      ON MS.USER_ID = MU.USER_ID
WHERE MS.USER_ID = 'ddd';


--ȸ���ױ�(MV_USER_TAG)				
create table MV_USER_TAG(
GENRE_CODE VARCHAR2(5) not null,	--pk/fk	�ױ� �ڵ�
USER_ID	VARCHAR2(20) not null,	    --pk/fk	ȸ�� id
PRIMARY KEY(GENRE_CODE,USER_ID),
FOREIGN key(GENRE_CODE) REFERENCES MV_GENRE(GENRE_CODE),
FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
);


----���ƿ�&�Ⱦ��(state)	--����	
--create table MV_state(
--gubun char(1) not null,	        --pk 0:��ȭ ���, 1:�Խñ�(����), 2:���
--num	number(5) not null,	        --pk �Խñ� �Ǵ� ����� ��ȣ
--USER_ID VARCHAR2(20) not null,	-- pk/fk ����� ���̵�
--stategubun char(1) not null,	--	0:��ȸ, 1:���ƿ�, 2:�Ⱦ��
--PRIMARY KEY(gubun,num,USER_ID),
--FOREIGN key(USER_ID) REFERENCES MV_USER(USER_ID)
--);

create table MV_state(
gubun char(1) not null,	        --pk 0:��ȭ ���, 1:�Խñ�(����), 2:���
num	number(5) not null,	        --pk �Խñ� �Ǵ� ����� ��ȣ
USER_ID VARCHAR2(20) not null,	-- pk/fk ����� ���̵�
stategubun char(1) not null,	--	0:��ȸ, 1:���ƿ�, 2:�Ⱦ��
PRIMARY KEY(gubun,num,USER_ID)
);


--��ȭ ��Ʈ -----------------------------------------------

-- �帣 ���̺� �μ�Ʈ (���̹�����)
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0001','���');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0002','��Ÿ��');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0003','����');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0004','����');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0005','�θǽ�');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0006','����');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0007','������');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0008','���͸�');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0009','��Ʈ');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0010','��ť���͸�');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0011','�ڹ̵�');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0012','����');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0013','�̽��͸�');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0014','����');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0015','�ִϸ��̼�');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0016','����');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0017','������');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0018','SF');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0019','�׼�');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0020','����');
commit;
ROLLBACK;

--��ȭ ����(MV_MOVIE_DATA)				
create table MV_MOVIE_DATA(
GENRE_CODE	VARCHAR2(5) not null,	--fk	��ȭ �帣 �ڵ� (�帣 ���̺� ����)
MOVIE_NUM number(5) not null,	    --pk	��ȭ ����
COUNTRY_NAME VARCHAR2(20) not null,	--	���� ���� �̸�
MOVIE_NAME VARCHAR2(50) not null,	--	��ȭ �̸�
DIRECTOR VARCHAR2(20) not null,		--����
MOVIE_MEMO VARCHAR2(200),			--�Ұ�
MOVIE_POSTER_LINK VARCHAR2(100),	--		��ȭ�� ��ǥ ������ ��ũ
ACTOR_NAME VARCHAR2(100) not null,	--	��� �̸�
REG_DATE date DEFAULT sysdate,		--	�������
MODIFY_DATE	date DEFAULT sysdate,	--		��������(������ ������Ʈ)
youtube_link varchar(20),
PRIMARY KEY(MOVIE_NUM),
FOREIGN key(GENRE_CODE) REFERENCES MV_GENRE(GENRE_CODE)
);
insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM, COUNTRY_NAME, MOVIE_NAME, DIRECTOR, 
MOVIE_MEMO, MOVIE_POSTER_LINK, ACTOR_NAME)
values('c0001',1, '�ѱ�', '���̿�', '����', '�Ұ�', '��ũ', '���1 | ���2 | ���3');

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

--*****************************************************************************************************
--���� �� ���� ���̺�(MV_CITY)	
create table MV_CITY(
CITY_CODE VARCHAR2(3) not null, 	-- pk �� ���� �ڵ�
CITY_NAME VARCHAR2(20) not null,	-- �� ���� �̸� ex) �����, ��õ��
PRIMARY KEY(CITY_CODE)
);

insert into MV_CITY(CITY_CODE,CITY_NAME)values('ct1','����');
insert into MV_CITY(CITY_CODE,CITY_NAME)values('ct2','��õ');
insert into MV_CITY(CITY_CODE,CITY_NAME)values('ct3','��õ');

select * from MV_CITY;

--*****************************************************************************************************
--��ȭ�� ���̺�(CINEMA)	
drop table CINEMA;
DELETE FROM CINEMA;

select * from CINEMA;
create table CINEMA(
CINEMA_CODE	VARCHAR2(5) not null,	-- PK ��ȭ�� PK��
CITY_CODE VARCHAR2(3) not null,	    --FK �� ����
CINEMA_NAME VARCHAR2(20) not null,	-- ��ȭ�� �̸�
CINEMA_TEL VARCHAR2(15)	 ,           -- ����ó
PRIMARY KEY(CINEMA_CODE),
FOREIGN key(CITY_CODE) REFERENCES MV_CITY(CITY_CODE)
);				
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn01','ct1','���� CCV',0211111111);
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn02','ct1','ȫ�� CCV',0222222222);
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn03','ct1','���� CCV',0233333333);
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn04','ct2','��õ�� CCV',0324444444);
            
--���� �� ��ȭ�� ����Ʈ
SELECT cine.*
FROM CINEMA cine join MV_CITY city on (cine.CITY_CODE = city.CITY_CODE)
WHERE cine.CITY_CODE  = 'ct1' ;

SELECT * FROM CINEMA
where CITY_CODE = 'ct1';

--*****************************************************************************************************
--��(MV_TIME)
DROP TABLE MV_TIME CASCADE CONSTRAINTS PURGE;

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
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti01','cn01',1,'2021-08-04','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti02','cn01',1,'2021-08-05','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti03','cn01',1,'2021-08-06','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti04','cn01',1,'2021-08-07','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti05','cn01',1,'2021-08-07','10:00~12:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti06','cn01',1,'2021-08-08','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti07','cn01',1,'2021-08-08','10:00~12:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti08','cn01',1,'2021-08-09','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti010','cn01',1,'2021-08-09','10:00~12:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti11','cn01',1,'2021-08-10','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti12','cn01',1,'2021-08-10','10:00~12:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti13','cn01',1,'2021-08-11','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti14','cn01',1,'2021-08-11','10:00~12:00');

select * from MV_TIME
WHERE MOVIE_NUM = '54';

commit;

SELECT TO_CHAR(sysdate,'YYYY-MM-DD') FROM DUAL;

--���� ��¥�� ���� �� ��¥ �̱�
select * from MV_TIME
where TIME_DAY = TO_CHAR(sysdate,'YYYY-MM-DD');

--���� ��¥���� ���� �Ⱓ ���� ���� �̱�
select * from MV_TIME
where TIME_DAY BETWEEN TO_CHAR(sysdate,'YYYY-MM-DD') 
AND TO_CHAR(sysdate+7,'YYYY-MM-DD')
AND ROWID IN (SELECT MAX(ROWID) FROM MV_TIME GROUP BY TIME_DAY)
AND MOVIE_NUM = 1
ORDER BY TIME_DAY;
--������ ��ȭ���� �� �ð� ����
SELECT TI.* 
FROM MV_TIME TI JOIN CINEMA CN ON (TI.CINEMA_CODE = CN.CINEMA_CODE)
WHERE TI.CINEMA_CODE  = 'cn01'
and TI.TIME_DAY = '2021-08-07'
and ti.MOVIE_NUM = 1;

--*****************************************************************************************************
--���� ����(MV_SALES)		
DROP TABLE MV_SALES CASCADE CONSTRAINTS PURGE;

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
insert into MV_SALES(SAL_NUM, TIME_CODE, USER_ID, TICKETS, PRICE, SALES_CHECK) 
values(1,'ti01', 'ddd', 1, 1000, 1);
insert into MV_SALES(SAL_NUM, TIME_CODE, USER_ID, TICKETS, PRICE, SALES_CHECK) 
values(2,'ti03', 'ddd', 1, 1000, 1);
insert into MV_SALES(SAL_NUM, TIME_CODE, USER_ID, TICKETS, PRICE, SALES_CHECK) 
values(3,'ti04', 'ddd', 1, 1000, 1);
insert into MV_SALES(SAL_NUM, TIME_CODE, USER_ID, TICKETS, PRICE, SALES_CHECK) 
values(4,'ti05', 'ddd', 1, 1000, 1);
insert into MV_SALES(SAL_NUM, TIME_CODE, USER_ID, TICKETS, PRICE, SALES_CHECK) 
values(SALES_NUM.NEXTVAL,'ti05', 'ddd', 1, 1000, 1);
--���Ź�ȣ ������
DROP SEQUENCE SALES_NUM;
create SEQUENCE SALES_NUM
START WITH 5; --���ۼ���
SELECT * FROM SALES_NUM.NEXTVAL;

SALES_NUM.NEXTVAL;
select SALES_NUM.nextval from dual;

select max(SAL_NUM) MAXSAL_NUM from MV_SALES;

SELECT * FROM MV_SALES;
--���� ���� Ȯ��
select MS.SAL_NUM,MS.USER_ID,MMD.MOVIE_NAME, MT.TIME_DAY, MT.TIME_TIME
    from MV_TIME MT
    JOIN MV_MOVIE_DATA MMD
      ON MT.MOVIE_NUM = MMD.MOVIE_NUM
    JOIN CINEMA CI
      ON MT.CINEMA_CODE = CI.CINEMA_CODE
WHERE MS.USER_ID = 'ddd';

--���� ���� ��ȸ
select * 
    from MV_TIME MT
    join MV_SALES MS
      on MT.TIME_CODE = MS.TIME_CODE
    JOIN MV_MOVIE_DATA MMD
      ON MT.MOVIE_NUM = MMD.MOVIE_NUM
    JOIN MV_USER MU
      ON MS.USER_ID = MU.USER_ID
    JOIN CINEMA CI
      ON MT.CINEMA_CODE = CI.CINEMA_CODE
WHERE MS.USER_ID = 'ddd';

--*****************************************************************************************************
--�¼� ���̺�����(MV_SEATS)		��ü �¼� ���̺�		
DROP TABLE MV_SEATS CASCADE CONSTRAINTS PURGE;

create table MV_SEATS(
SEATS_CODE VARCHAR2(5),		-- PK �¼� �ڵ�
SEATS_ROW NUMBER(10),		-- �¼� ��
SEATS_COL VARCHAR2(10),		-- �¼� ��
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

--���� �¼� ���̺�(MV_SALES_SEATS)	������ �¼� ���̺�		
DROP TABLE MV_SALES_SEATS CASCADE CONSTRAINTS PURGE;

create table MV_SALES_SEATS(
SAL_NUM	number(10) not null,         --	Pk/FK	���Ź�ȣ
SEATS_CODE	VARCHAR2(5),		        --pk/fk	�����¼� �ڵ�
PRIMARY KEY(SAL_NUM,SEATS_CODE),
FOREIGN key(SAL_NUM) REFERENCES MV_SALES(SAL_NUM),
FOREIGN key(SEATS_CODE) REFERENCES MV_SEATS(SEATS_CODE)
);
select * from MV_SALES_SEATS;
insert into MV_SALES_SEATS(SAL_NUM, SEATS_CODE) 
values (1, 'A-1');
insert into MV_SALES_SEATS(SAL_NUM, SEATS_CODE) 
values (2, 'A-1');
insert into MV_SALES_SEATS(SAL_NUM, SEATS_CODE) 
values (3, 'A-3');
insert into MV_SALES_SEATS(SAL_NUM, SEATS_CODE) 
values (4, 'B-1');

--��ü �� ���� �¼�
SELECT MS.*, NVL(MSS.TIME_CODE,0) TIME_CODE
    FROM MV_SEATS MS
    LEFT JOIN 
        (SELECT *
            FROM MV_SALES_SEATS MSS
            JOIN MV_SALES MS
              ON MSS.SAL_NUM = MS.SAL_NUM
              where MS.TIME_CODE = 'ti03') MSS
      ON MS.SEATS_CODE = MSS.SEATS_CODE;

--�� �ð��� ���� ������ �¼� Ȯ��#{time_code}
select * from 
MV_SALES sa join MV_SALES_SEATS se on (sa.SAL_NUM = se.SAL_NUM)
where TIME_CODE = 'ti01';

--not ��� �ȵǳ�....
SELECT *FROM MV_SEATS
WHERE not (SELECT SEATS_CODE FROM MV_SALES_SEATS where SAL_NUM = 1);

--*****************************************************************************************************

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
select * from MV_BOARD;

--�Խù� ��ȣ ������
DROP SEQUENCE mv_bseq;
create SEQUENCE mv_bseq
START WITH 1; --���ۼ���
SELECT * FROM mv_bseq.NEXTVAL;


--�Խù� ����(MV_BOARD_FILE)				
create table MV_BOARD_FILE(
Board_File_NUM number(5) not null,	    --pk	�Խù� ���� ����
Board_NUM number(5)	not null,	        --fk	�Խù� ����
Board_FILE_NAME VARCHAR2(50) not null,	--	�Խù� ���� �̸�
REG_DATE date DEFAULT sysdate,			--�ۼ���
PRIMARY KEY(Board_File_NUM),
FOREIGN key(Board_NUM) REFERENCES MV_BOARD(Board_NUM)
);
SELECT * FROM MV_BOARD_FILE;

--�Խù� ���� ������
DROP SEQUENCE mv_fseq;
create SEQUENCE mv_fseq
START WITH 1; --���ۼ���
SELECT * FROM SALES_NUM.NEXTVAL;


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




--��ȭ ����(MV_MOVIE_FILE)			--����	
create table MV_MOVIE_FILE(
MF_NUM number(5) not null,	        --pk ��ȭ ���� ����
MOVIE_NUM number(5) not null,	    --fk ��ȭ ����
MF_FILE_NAME VARCHAR2(50) not null,	--�Խù� ���� �̸�
REG_DATE date DEFAULT sysdate,		--�ۼ���
PRIMARY KEY(MF_NUM),
FOREIGN key(MOVIE_NUM) REFERENCES MV_MOVIE_DATA(MOVIE_NUM)
);


select * from(
select rownum rn, num.* from (
select mr.*, mm.MOVIE_NUM  from 
MV_MOVIE_REPLY mr inner JOIN MV_MOVIE_DATA mm on(mr.MOVIE_NUM = mm.MOVIE_NUM)
where mr.MOVIE_NUM = 42
order by MR_NUM desc
)num
)
where rn between 1 and 10;




--����Ŭ �͸� ���ν��� (�ݺ���) (�� �Ʒ��� ������ ������ ���� ����....)
begin
    for i in 1..100 loop
        INSERT INTO MV_BOARD MV_BOARD(BOARD_NUM,USER_ID,SUBJECT,CONTENT,ip)
        VALUES (mv_bseq.nextval,'sss','�׽�Ʈ','�׽�Ʈ','00.000.000');
    end loop;
end;



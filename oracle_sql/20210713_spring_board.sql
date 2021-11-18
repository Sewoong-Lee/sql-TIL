--�Խù� ����

ROLLBACK;
COMMIT;

SELECT * FROM PRODUCT_COMPONENT_VERSION;

DROP TABLE usermange cascade constraints;
DROP TABLE reply cascade constraints;
DROP TABLE boardfile cascade constraints;
DROP TABLE board cascade constraints;
DROP TABLE member cascade constraints;

----------------------------�ʿ� ���̺�---------------------
--ȸ�����̺�

CREATE TABLE member(
userid VARCHAR2(43) not null, --���� ���̵�
passwd CHAR(60) not null, -- ��ȣȭ�� ��й�ȣ
email VARCHAR2(30) UNIQUE not null, ---�̸���
zip VARCHAR2(5),  --�����ȣ
addr1 VARCHAR2(100),  --���θ��ּ�
addr2 VARCHAR2(100),  --���ּ�
filename VARCHAR2(100),  --�����ʻ�����
memo VARCHAR2(100), --�Ұ���
admin char(1) default '1', --0 : ����, 1: ����1, 2:����2
emailauth char(1) DEFAULT '0',  --0:������, 1: ����
simplejoin char(1) DEFAULT '0',  -- 0:�Ϲݰ���, 1: ���̹� ������, 2:īī�� ������
regdate date DEFAULT sysdate,  --�������
CONSTRAINT pk_member_userid PRIMARY KEY (userid)
);
-- ���̵� ������ ����
ALTER TABLE member MODIFY (userid VARCHAR2(20));

desc member;

update member
set emailauth = '1'
where userid = 'zzz'; 

--�Ϲ� ����
INSERT INTO member(userid, passwd, email, zip, addr1, addr2, filename, memo)
VALUES ('ddd','ddd','1','1','1','1','1','1');

--���̹� ���� ����
INSERT INTO member(userid, passwd, email, simplejoin)
VALUES ('ooo','naver','ggg@ggg.com','1');

select * from member;

select * from member
WHERE userid = 'ppp';

DELETE FROM member
WHERE userid = 'JiJIHV-pCdm9TlJiKysmiVxbB-xjMBaitFeA8d2KKVg';

--�Խù� ���̺�

CREATE TABLE board(
bnum number(5) not null,  --�Խù� ��ȣ
userid VARCHAR2(20) not null,  --�ۼ��� ���̵�
subject VARCHAR2(100) not null, --�Խù� ����
content VARCHAR2(1000) not null,  --����
readcnt number(3) DEFAULT 0, --��ȸ��
likecnt number(3) DEFAULT 0, --���ƿ�
dislikecnt number(3) DEFAULT 0, --�Ⱦ��
ip VARCHAR2(20) not null,  --�ۼ��� ip
regdate date DEFAULT sysdate,  --�������
modifydate date DEFAULT sysdate,  --��������
removeyn char(1) DEFAULT 'n',--���� ����(y:����, n:�����ȵ�)
PRIMARY KEY (bnum),
FOREIGN key (userid) REFERENCES member (userid)
);
--���� ���̺��� Į�� �߰�
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

--�Խù� ����ȸ
SELECT b.*, m.email
FROM board b join member m on (b.userid = m.userid)
WHERE bnum  = 5 ;

--��ȸ�� +1
update board
set readcnt = readcnt +1
where bnum = 5;

--���ƿ� +1
update board
set likecnt = likecnt +1
where bnum = 5;

select * from usermange;
-- ���ƿ� �����ſ� �ٲ�
update usermange
set likegubun ='1'
where gubun = '1'
and num = 2
and userid = 'ddd';

SELECT count(*) totcnt FROM board
WHERE content  like '%' || '1' || '%';

--����¡ó�� (10������ ��������)
SELECT b.* FROM
    (SELECT ROWNUM  rnum, b.* FROM
        (SELECT * FROM board
        WHERE subject  like '%' || '1' || '%'
        order by bnum desc) b ) b
where b.rnum BETWEEN 1 and 10;

--����¡ó�� (10������ ��������) + ��� ���� ��������
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

-- �̰� ���� ������ �������
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

--�Խù� ��ȸ(������ ������ ���� ��ȸ)
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


--�Խù� ������
DROP SEQUENCE bseq;
create SEQUENCE bseq
START WITH 1; --���ۼ���

bseq.NEXTVAL;


select bseq.nextval from dual;


--�Խù� ���� ���̺�
ROLLBACK;
COMMIT;
--�Խù��� �������̺�
create table boardfile(
fnum number(8) not null, 
bnum number(5) not null,
filename varchar2(50) not null,
regdate date default sysdate,
primary key(fnum),
FOREIGN KEY (BNUM) REFERENCES BOARD(BNUM)
);

SELECT * FROM boardfile;

--�Ѳ����� ����
DELETE FROM boardfile
WHERE fnum in (4, 5, 6);

DELETE FROM boardfile
WHERE fnum = 4;

SELECT * FROM boardfile
WHERE bnum  = 14 ;

insert into boardfile(fnum,bnum,filename) VALUES (fseq.nextval,1,'1');


--�Խù����� ������
DROP SEQUENCE fseq;

create SEQUENCE fseq
START WITH 1; --���ۼ���

SELECT * FROM boardfile;

-- ������ ����
-- �Ʒ��� �ؽ�Ʈ���� �ȴ� (����ũ����)
INSERT ALL 
INTO BOARDFILE (fnum, bnum, filename) values (1, 2, 'a' ) 
INTO BOARDFILE (fnum, bnum, filename) values (2, 2, 'b' ) 
SELECT * FROM DUAL;

--�������� ���ϸ� ����
INSERT into BOARDFILE(fnum, bnum, filename)
select fseq.nextval, f.* from (
select 2, 'a' from dual 
union all
select 2, 'b'  from dual) f ;

--��� ���̺�
create table reply(
rnum number(5) not null, --��� ��ȣ
bnum number(5) not null, --�Խù���ȣ
userid VARCHAR2(20) not null,  --�ۼ��� ���̵�
content VARCHAR2(1000) not null,  --����
likecnt number(3) DEFAULT 0, --���ƿ�
dislikecnt number(3) DEFAULT 0, --�Ⱦ��
ip VARCHAR2(20) not null,  --�ۼ��� ip
restep number(3) not null, --�� ����
relevel number(3) not null, --�� ����
regdate date DEFAULT sysdate,  --�������
modifydate date DEFAULT sysdate,  --��������
PRIMARY KEY (rnum),
FOREIGN key (bnum) REFERENCES board (bnum),
FOREIGN key (userid) REFERENCES member (userid)
);
DELETE FROM reply
WHERE rnum = 14;

update reply
set content = '��� ����'
where rnum = 14;

--����� ����Ʈ ��ȸ
select * from reply
where bnum = 2
ORDER by restep desc;

--����� restep +1
update reply
set restep = restep+1
where bnum = 2
and restep >= 2;


insert into reply(rnum, bnum, userid, content, likecnt, dislikecnt, ip, restep, relevel)
VALUES (rseq.nextval,'2','www','���',0,0,'11',0,0);

select * from reply;

DROP SEQUENCE rseq;

create SEQUENCE rseq
START WITH 1; --���ۼ���

--����� ����Ʈ + ����� ���ƿ� �Ⱦ�� ���� Ȯ��
select r.*, um.likegubun 
from reply r left join 
    (select * from usermange
    WHERE gubun = '2'
    and userid = 'ddd') um
on (r.rnum = um.num)
where bnum = 2
ORDER by restep;

------------------------------------------------------------------------------------------
--��ȸ��/���ƿ�/�Ⱦ�� ���� ���̺�
create table usermange(
gubun char(1), --1:�Խñ�, 2:���
num number(5),  --�Խñ� �Ǵ� ����� ��ȣ
userid VARCHAR2(20) not null, --���� ���̵�
likegubun char(1), --0:��ȸ, 1:���ƿ�, 2:�Ⱦ��
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



--����Ŭ �͸� ���ν��� (�ݺ���) (�� �Ʒ��� ������ ������ ���� ����....)
begin
    for i in 1..100 loop
        INSERT INTO board board(bnum,userid,subject,content,ip)
        VALUES (bseq.nextval,'ddd','1','1',1);
    end loop;
end;

--���ν��� : �Խù� ��ȸ�� +1 
CREATE OR REPLACE PROCEDURE P_UPDATE_READ_CNT(
    PGUBUN IN USERMANGE.GUBUN%TYPE,
    PNUM IN USERMANGE.NUM%TYPE,
    PUSERID IN USERMANGE.USERID%TYPE,
    Plikegubun IN USERMANGE.likegubun%TYPE
)
IS
    CNT NUMBER;
BEGIN
    --���� ��ȸ ���� select
    SELECT COUNT(*) INTO CNT FROM USERMANGE
    WHERE GUBUN = PGUBUN
    AND NUM = PNUM
    AND USERID = PUSERID;
    --���࿡ ���� ������ ���ٸ� �Խù� ��ȸ�� +1, �����Ŵ��� ���̺� insert
    IF CNT=0 THEN
   		UPDATE BOARD
		SET READCNT = READCNT +1
		WHERE BNUM = PNUM;
    
   		INSERT INTO USERMANGE (GUBUN, NUM, USERID, likegubun)
		VALUES (PGUBUN,PNUM, PUSERID, Plikegubun);

    END IF;
        
END;

EXEC P_UPDATE_READ_CNT('1', '2', 'java','0' );


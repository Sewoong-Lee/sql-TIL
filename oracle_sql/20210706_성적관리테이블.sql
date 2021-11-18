--�������� ������Ʈ ���̺� ����

ROLLBACK;
COMMIT;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
DROP TABLE subject cascade constraints;
--�л� ������
CREATE TABLE student(
sno VARCHAR2(10) PRIMARY KEY,
sname VARCHAR2(30) not null,
tel VARCHAR2(15) ,
zip VARCHAR2(6) ,
addr1 VARCHAR2(100) ,
addr2 VARCHAR2(100) ,
regdate date DEFAULT sysdate
);

SELECT *
FROM student 
WHERE sname  like '%' || '1' || '%';


SELECT * FROM student;

INSERT INTO student(sno,sname,tel,zip,addr1,addr2)
VALUES ('s01','2','2','2','2','2');

SELECT * FROM student
WHERE sno = 's01';

DELETE FROM student
WHERE sno = '1';

UPDATE student
set 
sname = '0',
tel =  '0',
zip =  '0',
addr1 =  '0',
addr2 =  '0'
WHERE sno = '1';

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
DROP TABLE teacher cascade constraints;
--���� ������
CREATE TABLE teacher(
tno VARCHAR2(10) PRIMARY KEY,
tname VARCHAR2(30) not null,
tel VARCHAR2(15) ,
zip VARCHAR2(6) ,
addr1 VARCHAR2(100) ,
addr2 VARCHAR2(100) ,
skill VARCHAR2(200) ,
regdate date DEFAULT sysdate
);

SELECT *
FROM teacher 
WHERE sname  like '%' || '1' || '%';


SELECT * FROM teacher;

INSERT INTO teacher(tno,tname,tel,zip,addr1,addr2,skill)
VALUES ('t01','1','1','1','1','1','1');

SELECT * FROM teacher
WHERE tno = '1';

DELETE FROM teacher
WHERE tno = '1';

UPDATE teacher
set 
tname = '0',
tel =  '0',
zip =  '0',
addr1 =  '0',
addr2 =  '0',
skill = '0'
WHERE tno = '1';

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
DROP TABLE subject cascade constraints;
--���� ������
CREATE TABLE subject(
jcode VARCHAR2(10) PRIMARY KEY,
jname VARCHAR2(30) not null,
jbook VARCHAR2(100) 
);

SELECT * FROM subject;

INSERT INTO subject(jcode,jname,jbook)
VALUES ('j04','����Ŭ','����ŬŬ�̴پƴ�');

SELECT * FROM subject
WHERE jcode = 'j01';

DELETE FROM subject
WHERE jcode = 'j01';

UPDATE subject
set 
jname = '�ڹ� ù����',
jbook =  '�ڹ��Դϴ�'
WHERE jcode = 'j01';

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
DROP TABLE course cascade constraints;
--���� ����
CREATE TABLE course(
ccode VARCHAR2(10) not null, --���� �ڵ�
cname VARCHAR2(50) not null, --������
tno VARCHAR2(10) not null, --�����ڵ�
startdate VARCHAR2(10) not null, --������
enddate VARCHAR2(10) not null, --����
complete VARCHAR2(50) , --�̼�����
cperson VARCHAR2(20) , --�����
maxcnt NUMBER(3), --�ο���
regdate date DEFAULT sysdate,
modifydate date DEFAULT sysdate, --��������
PRIMARY KEY (ccode),
FOREIGN KEY (tno) REFERENCES teacher(tno)
);

SELECT * FROM course;

INSERT INTO course(ccode,cname,tno,startdate,enddate,complete,cperson,maxcnt)
VALUES ('1','1','1','1','1','1','1',1);

--���� ��ȸ
SELECT c.*, t.tname, s.jname
FROM course c
inner join cousesubject cs on (c.ccode = cs.ccode)
inner join teacher t on (c.tno = t.tno)
inner join subject s on (cs.jcode = s.jcode)
WHERE c.ccode = '001';

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
DROP TABLE cousesubject cascade constraints;
--���� ����
CREATE TABLE cousesubject(
ccode VARCHAR2(10) not null,
jcode VARCHAR2(30) not null,
PRIMARY KEY (ccode,jcode),
FOREIGN KEY (ccode) REFERENCES course(ccode),
FOREIGN KEY (jcode) REFERENCES subject(jcode)
);
SELECT * FROM cousesubject;

--���� ���� ���� : ������ ���� ����
insert all
into cousesubject(ccode, jcode) VALUES ('1','1')
into cousesubject(ccode, jcode) VALUES ('1','1')
select * from dual;



-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
DROP TABLE request cascade constraints;
--���� ��û
CREATE TABLE request(
ccode VARCHAR2(10) not null,
sno VARCHAR2(50) not null,
regdate date DEFAULT sysdate,
PRIMARY KEY (ccode,sno),
FOREIGN KEY (ccode) REFERENCES course(ccode),
FOREIGN KEY (sno) REFERENCES student(sno)
);
SELECT * FROM request;

DELETE FROM request;

INSERT INTO request(ccode,sno)
VALUES ('001','s01');

--������û ��Ȳ ��ȸ
SELECT r.ccode, r.sno, s.SNAME, s.tel
from request r  inner join STUDENT s on (r.sno = s.sno)
WHERE r.ccode = '003';

--�л��� ������û�� ������ ���� ��ȸ
SELECT r.ccode, cs.jcode, j.jname, c.cname
from request r  join cousesubject cs on (r.ccode = cs.ccode)
join subject j on (cs.jcode = j.jcode)
join course c on (r.ccode = c.ccode)
WHERE r.sno = '123';


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
DROP TABLE grade cascade constraints;
--���� ���̺� (�� �л��� �������� ���¸� ������찡 �־� ccode �߰�)
CREATE TABLE grade(
ccode varchar2(10),
sno VARCHAR2(10) ,
jcode VARCHAR2(10) ,
score number(3) not null,
primary key(sno, ccode, jcode),
FOREIGN KEY (sno) REFERENCES student(sno),
FOREIGN KEY (jcode) REFERENCES subject(jcode)
);

SELECT * FROM grade;

--�л� ���� ����Ʈ
SELECT g.ccode, g.sno, s.SNAME, g.SCORE, c.CNAME
from grade g
join STUDENT s on (g.sno = s.sno)
join request r on (r.sno = g.sno)
join course c on (r.ccode = c.ccode)
WHERE g.ccode like '%' || '1' || '%';


--������ �ؼ�(���� �л� ���� ��ȸ)
SELECT g.sno, s.sname, g.jcode, j.jname, g.score
from grade g
join STUDENT s on (g.sno = s.sno)
join SUBJECT j on (g.jcode = j.jcode)
WHERE g.ccode = '001'
union all
select g.sno,'', '�հ�', '' jcode, sum(g.score) s
from grade g
WHERE g.ccode = '001'
GROUP by g.sno
union all
select g.sno, '', '���', '' jcode, avg(g.score) a
from grade g
WHERE g.ccode = '001'
GROUP by g.sno
order by sno, jcode;





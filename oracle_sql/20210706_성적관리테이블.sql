--성적관리 프로젝트 테이블 구성

ROLLBACK;
COMMIT;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
DROP TABLE subject cascade constraints;
--학생 마스터
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
--선생 마스터
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
--과목 마스터
CREATE TABLE subject(
jcode VARCHAR2(10) PRIMARY KEY,
jname VARCHAR2(30) not null,
jbook VARCHAR2(100) 
);

SELECT * FROM subject;

INSERT INTO subject(jcode,jname,jbook)
VALUES ('j04','오라클','오라클클이다아당');

SELECT * FROM subject
WHERE jcode = 'j01';

DELETE FROM subject
WHERE jcode = 'j01';

UPDATE subject
set 
jname = '자바 첫걸음',
jbook =  '자바입니다'
WHERE jcode = 'j01';

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
DROP TABLE course cascade constraints;
--과정 개설
CREATE TABLE course(
ccode VARCHAR2(10) not null, --과정 코드
cname VARCHAR2(50) not null, --과정명
tno VARCHAR2(10) not null, --선생코드
startdate VARCHAR2(10) not null, --시작일
enddate VARCHAR2(10) not null, --끝일
complete VARCHAR2(50) , --이수기준
cperson VARCHAR2(20) , --담당자
maxcnt NUMBER(3), --인원수
regdate date DEFAULT sysdate,
modifydate date DEFAULT sysdate, --수정일자
PRIMARY KEY (ccode),
FOREIGN KEY (tno) REFERENCES teacher(tno)
);

SELECT * FROM course;

INSERT INTO course(ccode,cname,tno,startdate,enddate,complete,cperson,maxcnt)
VALUES ('1','1','1','1','1','1','1',1);

--과정 조회
SELECT c.*, t.tname, s.jname
FROM course c
inner join cousesubject cs on (c.ccode = cs.ccode)
inner join teacher t on (c.tno = t.tno)
inner join subject s on (cs.jcode = s.jcode)
WHERE c.ccode = '001';

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
DROP TABLE cousesubject cascade constraints;
--과정 과목
CREATE TABLE cousesubject(
ccode VARCHAR2(10) not null,
jcode VARCHAR2(30) not null,
PRIMARY KEY (ccode,jcode),
FOREIGN KEY (ccode) REFERENCES course(ccode),
FOREIGN KEY (jcode) REFERENCES subject(jcode)
);
SELECT * FROM cousesubject;

--수강 과목 저장 : 여러건 동시 저장
insert all
into cousesubject(ccode, jcode) VALUES ('1','1')
into cousesubject(ccode, jcode) VALUES ('1','1')
select * from dual;



-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
DROP TABLE request cascade constraints;
--수강 신청
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

--수강신청 현황 조회
SELECT r.ccode, r.sno, s.SNAME, s.tel
from request r  inner join STUDENT s on (r.sno = s.sno)
WHERE r.ccode = '003';

--학생이 수강신청한 과정의 과목 조회
SELECT r.ccode, cs.jcode, j.jname, c.cname
from request r  join cousesubject cs on (r.ccode = cs.ccode)
join subject j on (cs.jcode = j.jcode)
join course c on (r.ccode = c.ccode)
WHERE r.sno = '123';


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
DROP TABLE grade cascade constraints;
--성적 테이블 (한 학생이 여러개의 강좌를 들을경우가 있어 ccode 추가)
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

--학생 점수 리스트
SELECT g.ccode, g.sno, s.SNAME, g.SCORE, c.CNAME
from grade g
join STUDENT s on (g.sno = s.sno)
join request r on (r.sno = g.sno)
join course c on (r.ccode = c.ccode)
WHERE g.ccode like '%' || '1' || '%';


--선생님 해석(과정 학생 점수 조회)
SELECT g.sno, s.sname, g.jcode, j.jname, g.score
from grade g
join STUDENT s on (g.sno = s.sno)
join SUBJECT j on (g.jcode = j.jcode)
WHERE g.ccode = '001'
union all
select g.sno,'', '합계', '' jcode, sum(g.score) s
from grade g
WHERE g.ccode = '001'
GROUP by g.sno
union all
select g.sno, '', '평균', '' jcode, avg(g.score) a
from grade g
WHERE g.ccode = '001'
GROUP by g.sno
order by sno, jcode;





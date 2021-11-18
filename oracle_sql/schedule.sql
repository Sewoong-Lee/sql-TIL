--수업시간(시간표)조회
--날짜, 교시, 과목, 내용,작성일자, 수강일자

DROP TABLE schedule;

CREATE TABLE schedule(
sdate char(10),
stime number(1),
subject VARCHAR2(30) not null,
content VARCHAR2(200),
regdate date DEFAULT sysdate,
modifydate date DEFAULT sysdate,
PRIMARY KEY (sdate,stime)
);

INSERT INTO schedule (sdate,stime,subject,content)  VALUES ('zz',00,'xx','cc');

SELECT * FROM  schedule;

SELECT * FROM  schedule WHERE sdate = 'zz' and stime = 0;

DELETE FROM schedule WHERE sdate = '2021-05-31' and stime = 7;

UPDATE schedule  SET subject = 'subject', content = 'ccccc' WHERE sdate = '2021-05-30' and stime = 3;


--decode(stime,1,subject) 만야에 stime이 1이면 subject의 내용을 출력해라
SELECT  sdate,
    nvl(max(decode(stime,1,subject)),' ') t1,
     nvl(max(decode(stime,2,subject)),' ') t2,
      nvl(max(decode(stime,3,subject)),' ') t3,
       nvl(max(decode(stime,4,subject)),' ') t4,
        nvl(max(decode(stime,5,subject)),' ') t5,
         nvl(max(decode(stime,6,subject)),' ') t6,
          nvl(max(decode(stime,7,subject)),' ') t7,
           nvl(max(decode(stime,8,subject)),' ') t8
FROM  schedule
group by sdate
order by sdate; 

SELECT  sdate,
    nvl(max(decode(stime,1,subject)),' ') t1,
     nvl(max(decode(stime,2,subject)),' ') t2,
      nvl(max(decode(stime,3,subject)),' ') t3,
       nvl(max(decode(stime,4,subject)),' ') t4,
        nvl(max(decode(stime,5,subject)),' ') t5,
         nvl(max(decode(stime,6,subject)),' ') t6,
          nvl(max(decode(stime,7,subject)),' ') t7,
           nvl(max(decode(stime,8,subject)),' ') t8
FROM  schedule
WHERE sdate BETWEEN '2021-06-01' and '2021-06-01'
group by sdate
order by sdate; 




ROLLBACK;
COMMIT;
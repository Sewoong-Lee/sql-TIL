ROLLBACK;
COMMIT;


DROP TABLE covid;

CREATE TABLE covid(
stateDt VARCHAR2(30) not null,
decideCnt NUMBER(30) not null,
clearCnt VARCHAR2(30) not null,
examCnt VARCHAR2(30) not null,
deathCnt VARCHAR2(30) not null,
careCnt VARCHAR2(30) not null,
resutlNegCnt VARCHAR2(30) not null,
accExamCnt VARCHAR2(30) not null,
accExamCompCnt VARCHAR2(30) not null,
accDefRate VARCHAR2(30) not null,
CONSTRAINT PK_stateDt PRIMARY KEY (stateDt)
);
SELECT * FROM covid
ORDER by stateDt desc;

DELETE FROM covid;

UPDATE covid
set 
decideCnt = 0,
clearCnt =  '00',
examCnt =  '0',
deathCnt =  '0',
careCnt =  '0',
resutlNegCnt =  '0',
accExamCnt =  '0',
accExamCompCnt =  '0',
accDefRate = '0'
WHERE stateDt = '20210623';

SELECT * FROM covid
WHERE stateDt = '20210623';

INSERT INTO covid (stateDt, decideCnt, clearCnt, examCnt, deathCnt,
                            careCnt, resutlNegCnt, accExamCnt, accExamCompCnt, accDefRate)  
VALUES ('20210000',1,1,1,1,1,1,1,1,1);


--lag전날 데이터를 읽어와서 비교
SELECT  lag(decideCnt) over(ORDER by stateDt desc) - c.decideCnt diffcnt , c.*
FROM covid c
WHERE c.stateDt BETWEEN '20210601' and '20210625'
ORDER by c.stateDt desc;
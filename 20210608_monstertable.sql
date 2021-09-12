--포켓몬 타입

DROP TABLE ptype2;

CREATE TABLE ptype2(
tcode char(3) PRIMARY key,
tname VARCHAR2(20) not null
);

SELECT * FROM ptype2;

--몬스터에서 tcode사용 여부
SELECT  COUNT(*) cnt
FROM MONSTER
WHERE tcode = 't01';

selecttypecount


SELECT * FROM ptype2
WHERE tcode = 't01';

INSERT INTO ptype2 (tcode,tname)  VALUES ('t02', '불');

UPDATE ptype2  SET tname = '불'
WHERE tcode = 't01';

DELETE FROM ptype2 WHERE tcode = 't01';

DROP TABLE monster;
--포켓몬 마스터
CREATE TABLE monster(
mcode char(3) PRIMARY key,
tcode char(3) REFERENCES ptype2(tcode),
mname VARCHAR2(50) not null
);

SELECT * FROM monster;
WHERE mcode = 'm01';

INSERT INTO monster (mcode,tcode,mname)  VALUES ('m02','t01', '꺼북');

UPDATE monster  SET mname = '라이코',
tcode = 't02'
WHERE mcode = 'm01';

DELETE FROM monster WHERE mcode = 'm01';

SELECT * FROM monster
		WHERE mcode  like '%' || '1' || '%'
		order by mcode;
        
SELECT m.mcode, m.mname, t.tcode, t.tname
FROM monster m inner join ptype2 t on (m.tcode = t.tcode)
WHERE mcode  like '%' || '1' || '%'
order by mcode;

--mcode tcode 상관없이 받을수 있게
select * from (
select m.mcode, p.TCODE, p.TNAME, m.MNAME
from ptype2 p INNER JOIN monster m ON (p.tcode = m.tcode)) 
where tcode like '%' || 1 || '%'
order by mcode;


ROLLBACK;
COMMIT;
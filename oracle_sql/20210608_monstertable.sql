--���ϸ� Ÿ��

DROP TABLE ptype2;

CREATE TABLE ptype2(
tcode char(3) PRIMARY key,
tname VARCHAR2(20) not null
);

SELECT * FROM ptype2;

--���Ϳ��� tcode��� ����
SELECT  COUNT(*) cnt
FROM MONSTER
WHERE tcode = 't01';

selecttypecount


SELECT * FROM ptype2
WHERE tcode = 't01';

INSERT INTO ptype2 (tcode,tname)  VALUES ('t02', '��');

UPDATE ptype2  SET tname = '��'
WHERE tcode = 't01';

DELETE FROM ptype2 WHERE tcode = 't01';

DROP TABLE monster;
--���ϸ� ������
CREATE TABLE monster(
mcode char(3) PRIMARY key,
tcode char(3) REFERENCES ptype2(tcode),
mname VARCHAR2(50) not null
);

SELECT * FROM monster;
WHERE mcode = 'm01';

INSERT INTO monster (mcode,tcode,mname)  VALUES ('m02','t01', '����');

UPDATE monster  SET mname = '������',
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

--mcode tcode ������� ������ �ְ�
select * from (
select m.mcode, p.TCODE, p.TNAME, m.MNAME
from ptype2 p INNER JOIN monster m ON (p.tcode = m.tcode)) 
where tcode like '%' || 1 || '%'
order by mcode;


ROLLBACK;
COMMIT;
--���ϸ� ���̺�

--Ÿ�� ���̺�
DROP TABLE PTYPE;

CREATE TABLE PTYPE(
TCODE CHAR(3),
TNAME VARCHAR2(50) NOT NULL,
CONSTRAINT PK_PTYPE_TCODE PRIMARY KEY (TCODE)
);

INSERT INTO PTYPE (TCODE,TNAME)  VALUES ('T01','��');
INSERT INTO PTYPE (TCODE,TNAME)  VALUES ('T02','��');
INSERT INTO PTYPE (TCODE,TNAME)  VALUES ('T03','��');
INSERT INTO PTYPE (TCODE,TNAME)  VALUES ('T04','����');



SELECT * FROM PTYPE;

--���ϸ� ���̺�
DROP TABLE MONE;

CREATE TABLE MONE(
MCODE CHAR(3),
TCODE CHAR(3) NOT NULL,
MNAME VARCHAR2(50) NOT NULL,
CONSTRAINT PK_MONE_MCODE PRIMARY KEY (MNAME),
CONSTRAINT FK_MONE_TCODE FOREIGN KEY (TCODE) REFERENCES PTYPE(TCODE)
);

INSERT INTO MONE (MCODE,TCODE, MNAME)  VALUES ('M01','T01','����Ÿ');
INSERT INTO MONE (MCODE,TCODE, MNAME)  VALUES ('M02','T01','���ڸ�');
INSERT INTO MONE (MCODE,TCODE, MNAME)  VALUES ('M03','T02','���α�');
INSERT INTO MONE (MCODE,TCODE, MNAME)  VALUES ('M04','T02','��ì��');
INSERT INTO MONE (MCODE,TCODE, MNAME)  VALUES ('M05','T03','�ս���');
INSERT INTO MONE (MCODE,TCODE, MNAME)  VALUES ('M06','T03','������');
INSERT INTO MONE (MCODE,TCODE, MNAME)  VALUES ('M07','T04','��ī��');
INSERT INTO MONE (MCODE,TCODE, MNAME)  VALUES ('M08','T04','������');

SELECT T.QTY, T.TRAID, T.TRAPW, M.MCODE, M.MNAME, T.REGDATE
FROM TRA T INNER JOIN MONE M ON (T.MCODE = M.MCODE)
WHERE TRAID = 'stpn';

SELECT MCODE, MNAME
FROM MONE;

UPDATE MONE
SET TCODE = T02
WHERE MCODE = 'M01' ;

UPDATE MONE
SET MNAME = '�׶�ī',
TCODE = 'T02'
WHERE MCODE = 'M01';


DELETE FROM MONE
WHERE MCODE = 'M01';

SELECT M.MCODE, M.TCODE ,M.MNAME, P.TNAME
FROM MONE M INNER JOIN PTYPE P ON (M.TCODE = P.TCODE)
WHERE MNAME = '����Ÿ';

SELECT * 
FROM MONE;

SELECT * 
FROM MONE M INNER JOIN PTYPE P ON (M.TCODE = P.TCODE);

--Ʈ���̳� ���̺�
DROP TABLE TRA;

CREATE TABLE TRA(
QTY NUMBER(2),
TRAID VARCHAR2(10) NOT NULL,
MCODE CHAR(3),
REGDATE DATE DEFAULT SYSDATE,
CONSTRAINT PK_TRA_QTY PRIMARY KEY (QTY),
CONSTRAINT FK_TRA_MCODE FOREIGN KEY (MCODE) REFERENCES MONE(MCODE)
);

INSERT INTO TRA (QTY,TRAID,MCODE)  VALUES (9,'stpn','M01');
INSERT INTO TRA (QTY,TRAID,MCODE)  VALUES (2,'stpn','M03');
INSERT INTO TRA (QTY,TRAID,MCODE)  VALUES (3,'stpn','M07');
INSERT INTO TRA (QTY,TRAID,MCODE)  VALUES (4,'qwe','M02');
INSERT INTO TRA (QTY,TRAID,MCODE)  VALUES (5,'qwe','M02');
INSERT INTO TRA (QTY,TRAID,MCODE)  VALUES (6,'qwe','M08');


UPDATE TRA
SET MCODE = 'M01'
WHERE QTY = 1;


SELECT * FROM TRA;

SELECT * FROM TRA
WHERE TRAID = 'stpn';

DELETE FROM TRA
WHERE QTY = 1;


SELECT T.QTY, T.TRAID, T.TRAPW, M.MCODE, M.MNAME, T.REGDATE
FROM TRA T INNER JOIN MONE M ON (T.MCODE = M.MCODE)
WHERE TRAID = 'stpn';

SELECT T.QTY, T.TRAID, T.TRAPW, M.MCODE, M.MNAME, T.REGDATE
FROM TRA T RIGHT JOIN MONE M ON (T.MCODE = M.MCODE)
WHERE MNAME = '���ڸ�';


COMMIT;









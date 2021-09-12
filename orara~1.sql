--�����μ� ����ȭ
--�÷� : BOOKCODE(å�ڵ�), BOOKNAME(å�̸�), GUBUN(�з��ڵ�), PUBCODE(���ǻ��ڵ�), PRICE(����), SALEPER(������), REGDATE(�������)

--ī�װ��� �ڵ�
DROP TABLE LCATE;

CREATE TABLE LCATE(
LCODE CHAR(3),
LNAME VARCHAR2(50) NOT NULL,
CONSTRAINT PK_LCATE_LCODE PRIMARY KEY (LCODE)
);

INSERT INTO LCATE (LCODE,LNAME)  VALUES ('C01','����');
INSERT INTO LCATE (LCODE,LNAME)  VALUES ('C02','����');
INSERT INTO LCATE (LCODE,LNAME)  VALUES ('C03','�м�');
INSERT INTO LCATE (LCODE,LNAME)  VALUES ('C04','����');

SELECT * FROM LCATE;

--�귣�� �ڵ�
DROP TABLE BRAND;

CREATE TABLE BRAND(
BCODE CHAR(3),
BNAME VARCHAR2(50) NOT NULL,
CONSTRAINT PK_BRAND_BCODE PRIMARY KEY (BCODE)
);

INSERT INTO BRAND (BCODE,BNAME)  VALUES ('B01','�����');
INSERT INTO BRAND (BCODE,BNAME)  VALUES ('B02','��޽�');
INSERT INTO BRAND (BCODE,BNAME)  VALUES ('B03','����ġ');
INSERT INTO BRAND (BCODE,BNAME)  VALUES ('B04','����');

SELECT * FROM BRAND;


--��ǰ �ڵ�
DROP TABLE PRODUCT;

CREATE TABLE PRODUCT(
PCODE CHAR(4),
PNAME VARCHAR2(50) NOT NULL,
LCODE CHAR(3) NOT NULL,
BCODE CHAR(3) NOT NULL,
PRICE NUMBER(10) DEFAULT 0 NOT NULL,
SALEPER NUMBER(5,2),
REGDATE DATE DEFAULT SYSDATE,
CONSTRAINT PK_PRODUCT_PCODE PRIMARY KEY (PCODE),
CONSTRAINT FK_PRODUCT_GCODE FOREIGN KEY (LCODE) REFERENCES LCATE(LCODE),
CONSTRAINT FK_PRODUCT_BCODE FOREIGN KEY (BCODE) REFERENCES BRAND(BCODE)
);

INSERT INTO PRODUCT (PCODE,PNAME,LCODE,BCODE,PRICE,SALEPER)  VALUES ('P001','������','C04','B04',15000,0.2);
INSERT INTO PRODUCT (PCODE,PNAME,LCODE,BCODE,PRICE,SALEPER)  VALUES ('P002','Űġ��','C03','B03',10000,0.1);
INSERT INTO PRODUCT (PCODE,PNAME,LCODE,BCODE,PRICE,SALEPER)  VALUES ('P003','��������Ʈ','C01','B01',8000,0.1);
INSERT INTO PRODUCT (PCODE,PNAME,LCODE,BCODE,PRICE)  VALUES ('P004','��긯������','C02','B02',14000);

SELECT * FROM PRODUCT;


--�Ǹ� ���̺�
DROP TABLE PSALES;

CREATE TABLE PSALES(
SEQ NUMBER(7),
SALEDATE CHAR(10) NOT NULL,
PCODE CHAR(4) NOT NULL,
QTY NUMBER(3),
AMOUNT NUMBER(10) NOT NULL,
REGDATE DATE DEFAULT SYSDATE,
CONSTRAINT PK_PSALES_SEQ PRIMARY KEY (SEQ),
CONSTRAINT FK_PSAELS_PCODE FOREIGN KEY (PCODE) REFERENCES PRODUCT(PCODE)
);

-- �ڵ����� SEQ ����
INSERT INTO BSALES (SEQ,SALEDATE,BOOKCODE,QTY,AMOUNT) VALUES ((SELECT NVL(MAX(SEQ) + 1,1) FROM BSALES),'2021-04-30','B001', 2, 28000);
INSERT INTO BSALES (SEQ,SALEDATE,BOOKCODE,QTY,AMOUNT) VALUES (2,'2021-04-30','B002',3, 21000);
--�������� �̿��� �ڵ����� SEQ ����
INSERT INTO PSALES (SEQ,SALEDATE,PCODE,QTY,AMOUNT) VALUES (S_SEQ.NEXTVAL,'2021-05-05','P003',1, 7200);
INSERT INTO PSALES (SEQ,SALEDATE,PCODE,QTY,AMOUNT) VALUES (S_SEQ.NEXTVAL,'2021-05-05','P001',2, 24000);
INSERT INTO PSALES (SEQ,SALEDATE,PCODE,QTY,AMOUNT) VALUES (S_SEQ.NEXTVAL,'2021-05-06','P001',1, 1200);
INSERT INTO PSALES (SEQ,SALEDATE,PCODE,QTY,AMOUNT) VALUES (S_SEQ.NEXTVAL,'2021-05-06','P003',3, 21600);
INSERT INTO PSALES (SEQ,SALEDATE,PCODE,QTY,AMOUNT) VALUES (S_SEQ.NEXTVAL,'2021-05-07','P002',2, 18000);
INSERT INTO PSALES (SEQ,SALEDATE,PCODE,QTY,AMOUNT) VALUES (S_SEQ.NEXTVAL,'2021-05-08','P004',1, 14000);
INSERT INTO PSALES (SEQ,SALEDATE,PCODE,QTY,AMOUNT) VALUES (S_SEQ.NEXTVAL,'2021-05-09','P002',4, 36000);

--��ü�ǸŸ���Ʈ
SELECT S.SALEDATE, S.SEQ, S.PCODE, P.PNAME, S.QTY, S.AMOUNT
FROM PSALES S INNER JOIN PRODUCT P ON (S.PCODE = P.PCODE);

--���� ū SEQ ��ȸ
SELECT NVL(MAX(SEQ) + 1,1) FROM BSALES;


--������ ����
DROP SEQUENCE P_SEQ;
CREATE SEQUENCE P_SEQ;
SELECT S_SEQ.NEXTVAL FROM DUAL;  --�ڵ� ��ȣ ����


SELECT * FROM PSALES;


--�Ⱓ���� ���� ��ȸ ����Ʈ
SELECT *
FROM PSALES
WHERE SALEDATE > '2021-05-05';

SELECT *
FROM BSALES S INNER JOIN BOOK2 B ON (S.BOOKCODE = B.BOOKCODE)
WHERE SALEDATE
BETWEEN '2021-04-28' AND '2021-04-30';



--å�ڵ��� ���� ��ȸ ����Ʈ
SELECT S.BOOKCODE, SUM(S.AMOUNT)
FROM BSALES S INNER JOIN BOOK2 B ON (S.BOOKCODE = B.BOOKCODE)
GROUP BY S.BOOKCODE;


--�Ʒ� �� �׷����
--���ں� ���� ��ȸ(���Ϸ� �׷����) ���� / 2�� ����
SELECT SALEDATE, SUM(AMOUNT)
FROM BSALES
GROUP BY SALEDATE;


-- å �ڵ庰 ���� ��ȸ ����
SELECT S.BOOKCODE, SUM(S.AMOUNT)
FROM BSALES S INNER JOIN BOOK2 B ON(S.BOOKCODE = B.BOOKCODE)
GROUP BY S.BOOKCODE;



--ǰ�� ���� �հ� ����  3�� ����
SELECT G.GNAME ,B.GCODE, SUM(S.AMOUNT) AMOUNT
FROM BSALES S INNER JOIN BOOK2 B ON(S.BOOKCODE = B.BOOKCODE)
INNER JOIN GUBUN G ON (B.GCODE = G.GCODE)
GROUP BY B.GCODE, G.GNAME;


SELECT G.GNAME ,B.GCODE, SUM(S.AMOUNT) AMOUNT
FROM BSALES S INNER JOIN BOOK2 B ON(S.BOOKCODE = B.BOOKCODE)
INNER JOIN GUBUN G ON (B.GCODE = G.GCODE)
GROUP BY B.GCODE, G.GNAME;

--���� ��� 2
SELECT*
FROM BSALES S, BOOK2 B, GUBUN G
WHERE S.BOOKCODE = B.BOOKCODE (+) 
AND B.GCODE = G.GCODE;


--���ǻ纰 ���� ��ȸ ����
SELECT P.PCODE, MAX(P.PNAME), SUM(S.AMOUNT)
FROM BSALES S LEFT JOIN BOOK2 B ON(S.BOOKCODE = B.BOOKCODE)
RIGHT JOIN PUB P ON (B.PCODE = P.PCODE)
GROUP BY P.PCODE;






COMMIT;
--DDL : ���̺��� ����� �����ϰ�, �����ϰ�, ������, ���̺��� Ʋ�� ����
-- ������ ���Ǿ� 
--���̺� �����

DROP TABLE ITEM;  --���̺��� ����, �����ؼ� �ٽ� ����� ��

--ITEMCODE CHAR(4) NOT NULL PRIMARY KEY   --PRIMARY KEY : PK : ����Ű, �ߺ� ����, NULL ����  --���� ���� �Ⱥ���
CREATE TABLE ITEM ( -- ���̺� ����
ITEMCODE CHAR(4) NOT NULL,    --�ִ� ���̰� 10����Ʈ�� VARCHAR2�� �������� 10�� 4�� �ᵵ 4�� ���� 
ITEMNAME VARCHAR2(50) NOT NULL ,  --CHAR�� �������� 10����Ʈ���� 4����Ʈ�� �ᵵ 6����Ʈ�� ����
PRICE NUMBER(10) NOT NULL,  --NOT NUL �ݵ�� �־�� �ϴ°�
BIGO VARCHAR2(100), -- ���
REGDATE DATE DEFAULT SYSDATE, --�������  /  DEFAULT : �ڵ� ���  --SYSDATE : ������ ��¥ ��������
PRIMARY KEY(ITEMCODE,ITEMNAME)  --PK  (2�� �̻��� �ʵ带 �ϳ��� PK�� ����)  ����Ű, �ߺ� ����, NULL ����
);

DESC ITEM;
SELECT * FROM ITEM;



--DML : ������ �߰�  (���� ���� ������ �Ͽ� ������ �޶�� ���� ����)
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8801', '��ī', 1500); 
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE,BIGO)VALUES('8802','�ս�',1200, '�սø�');
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE )VALUES('8803','�����',1400);
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8804','�Ŷ��',1000); 
--INSERT INTO ITEM (ITEMCODE)VALUES('8804');  --���� ����, ������



-- �� ���� �μ�Ʈ�� �ӽ� ������ �Ʒ��� Ŀ���� �ؾ� ���� �Ϸ�
--Ʈ����� : �۾��� �������
COMMIT;  --Ȯ�� (�� �۾��� ���Ͽ� �ܺο��� �ƹ��� ���� �۾������� ����)

ROLLBACK; --Ŀ�� �ϱ� ���� �۾��� �ѹ� ���� (�μ�Ʈ, ������Ʈ, ����Ʈ �۾���)

--!!����!! : Ʈ������� ���� �� �ٸ� Ʈ����� ������ ����


-- DML : ������ ����
UPDATE ITEM 
SET ITEMNAME = '��ī���ݶ�'
WHERE ITEMCODE = '8801';  --PK�� ��Ƽ� �ٲ���� (������ Ű)



--DML : ������ ���� 
DELETE FROM ITEM 
WHERE ITEMCODE = '8801'; -- PK�� ��Ƽ� ����




--������ ��ȸ : 
SELECT * FROM ITEM  --��ü ��ȸ
WHERE ITEMNAME LIKE '%���%';  --����̶�� Ű����� ���� (%�� �տ� ���� �ְ� �ڿ� �����ֵ� �̶�¶�)


--�ѰǸ� ��ȸ
SELECT * FROM ITEM
WHERE ITEMCODE = '8803';








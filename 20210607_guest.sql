--�Խ�Ʈ ��

DROP TABLE guestbook;
--TRUNCATE : DROP�� ��� ������ �ѹ��� �ȵ�
TRUNCATE TABLE guestbook;

CREATE TABLE guestbook(
SEQ NUMBER(5),
nicname VARCHAR2(30),
email VARCHAR2(30),
CONTENT VARCHAR2(100),
regdate date DEFAULT sysdate,
PRIMARY KEY (SEQ)
);

SELECT * FROM guestbook;

SELECT * FROM guestbook
where seq = 5;

SELECT * FROM guestbook
where nicname like '%' || '��' || '%'
or email like '%' || 'naver' || '%';

INSERT INTO guestbook (SEQ,nicname,email,CONTENT)  VALUES (11,'����','ja@naver.com','�ϳ���~~');
INSERT INTO guestbook (SEQ,nicname,email,CONTENT)  VALUES (guest_seq.NEXTVAL,'����','qq@naver.com','�ϳ���~~');

UPDATE guestbook  SET nicname = '����ȣ', 
email = 'cca@naver.com', content = '�׽�Ʈ2' WHERE SEQ = 1;

DELETE FROM guestbook WHERE seq = 21;


DROP SEQUENCE guest_seq;
CREATE SEQUENCE guest_seq;
--������ �߰� ���
--START WITH 3 --���ۼ���
--MINVALUE 1 --�ּҰ�
--MAXVALUE 5  --�ִ밪
--INCREMENT BY 1  --��������
--CYCLE --�ݺ�
--NOCACHE; --ĳ��

SELECT guest_seq.NEXTVAL FROM DUAL;  --�ڵ� ��ȣ ����

ROLLBACK;
COMMIT;

--����Ŭ �ݺ��� (�͸�)(����Ŭ ���ν���)
begin
    for i in 1..10 loop
        INSERT INTO guestbook (SEQ,nicname,email,CONTENT) 
        VALUES (guest_seq.NEXTVAL,'����','qq@naver.com','�ϳ���~~');
    end loop;
end;
--ȸ�� ���� ���̺�
--�̸���, ��й�ȣ, �г���, ��ȭ��ȣ,�ּ�,�������

DROP TABLE member;

CREATE TABLE member(
email VARCHAR2(30),
passwd VARCHAR2(20) not null,
nicname VARCHAR2(30) not null,
phone VARCHAR2(15),
addr VARCHAR2(100),
regdate date DEFAULT SYSDATE,
modifydate date DEFAULT SYSDATE,
PRIMARY KEY(email)
);

select * from member;

INSERT into member(email, passwd, nicname, phone, addr) 
values ('cc@naver.com','1111','����','010-1111-1111', '���Ͻ� ���ϱ� ���ϵ�');


SELECT * FROM  member WHERE email = 'zz@naver.com';

SELECT * FROM  member WHERE email like '%' || 'zz' || '%';

--���� �ּҰ� ���̸� ��� ��°� ����
SELECT nvl(phone, '000-0000-0000'), nvl(addr,'�ּ�') FROM  member;

DELETE FROM member WHERE email = 'zz@naver.com';



UPDATE member  SET passwd = '789', nicname = 'ccccc', 
phone = '111-1111-1111', addr = '456'
WHERE email = 'zz@naver.com';


ROLLBACK;
COMMIT;
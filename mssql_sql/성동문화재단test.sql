select * from mh_map_contents;


insert into mh_map_contents values 
('������ȭ���', '����� ������ ������� 11', 37.495655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '���� ȭ����', 'www.www.www',1 , '���ǽü�', '10000', '���̿�', 'unnamed1.jpg')

insert into mh_map_contents values 
('�����������', '����� ������ źź��� 11', 37.496655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '���� ȭ����', 'www.www.www',1 , '���ǽü�', '10000', '���̿�', 'unnamed2.jpg')

insert into mh_map_contents values 
('������Ƽ���', '����� ������ ��õ���� 11', 37.494655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '���� ȭ����', 'www.www.www',1 , '���ǽü�', '10000', '���̿�', 'unnamed3.jpg')

insert into mh_map_contents values 
('����11���', '����� ������ ��õ���� 11', 37.495655822816566, 126.99389838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '���� ȭ����', 'www.www.www',1 , '���ǽü�', '10000', '���̿�', 'unnamed4.jpg')

insert into mh_map_contents values 
('����22���', '����� ������ ��õ���� 11', 37.496655822816566, 126.99489838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '���� ȭ����', 'www.www.www',1 , '���ǽü�', '10000', '���̿�', 'unnamed5.jpg')

insert into mh_map_contents values 
('����33���', '����� ������ ��õ���� 11', 37.494655822816566, 126.99189838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '���� ȭ����', 'www.www.www',1 , '���ǽü�', '10000', '���̿�', 'unnamed5.jpg')

select * from mh_map_contents
where BRAND_NAME LIKE '%������ȭ���%'
OR ADDRESS LIKE '%����%'

UPDATE mh_map_contents
SET ADDRESS = '����� ������ ��õ���� 44'
WHERE M_IDX = 6


UPDATE mh_map_contents
SET LATITUDE = 37.495655822816566,
LONGITUDE = 126.99289838317954
WHERE M_IDX = 2

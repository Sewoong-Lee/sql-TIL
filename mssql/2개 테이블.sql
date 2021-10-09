select * from mh_map_contents
select * from mh_map_categories

select * from mh_map_contents
where LATITUDE >= 37.495
and LONGITUDE >= 126.992


select * from mh_map_categories


select * from mh_map_categories where index in (select max(C_IDX) from mh_map_categories group by C_IDX)

select DISTINCT * from mh_map_categories


insert into mh_map_categories values
('������ȭ��� � �ü�', '������ȭ���', '������ȭ���')

insert into mh_map_categories values
('������ȭ��� � �ü�', '������', '��������������'),
('������ȭ��� � �ü�', '������', '��ȣ������'),
('������ȭ��� � �ü�', '������', '��䵵����'),
('������ȭ��� � �ü�', '������', '������������'),
('������ȭ��� � �ü�', '������', '����������'),
('������ȭ��� � �ü�', '������', 'û�赵����'),
('������ȭ��� � �ü�', '������', '���ӵ�����')


CREATE FUNCTION [UTF8_Search1stText]
(
	@Value NVARCHAR(MAX)
)
RETURNS NVARCHAR(MAX)
AS 
BEGIN
	DECLARE @Rtn NVARCHAR(MAX)
	DECLARE @Temp NVARCHAR(2)
	DECLARE @SerchValue NVARCHAR(MAX)
	DECLARE @i INT
	DECLARE @n INT
	SET @Rtn = ''
	SET @i = 1
	SET @n = LEN(@Value)
	WHILE @i <= @n
	BEGIN
		SET @Temp = Substring(@Value, @i, 1)
		SET @SerchValue = (CASE @Temp 
							WHEN '��' THEN '[��-��]'
							WHEN '��' THEN '[��-��]'
							WHEN '��' THEN '[��-��]'
							WHEN '��' THEN '[��-�L]'
							WHEN '��' THEN '[��-��]'
							WHEN '��' THEN '[��-��]'
							WHEN '��' THEN '[��-�J]'
							WHEN '��' THEN '[��-��]'
							WHEN '��' THEN '[��-��]'
							WHEN '��' THEN '[��-��]'
							WHEN '��' THEN '[��-��]'
							WHEN '��' THEN '[��-��]'
							WHEN '��' THEN '[��-��]'
							WHEN '��' THEN '[¥-��]'
							WHEN '��' THEN '[��-��]'
							WHEN '��' THEN '[ī-�i]'
							WHEN '��' THEN '[Ÿ-�M]'
							WHEN '��' THEN '[��-��]'
							WHEN '��' THEN '[��-�R]'
							ELSE @Temp END)
		SET @Rtn = RTRIM(@Rtn) + @SerchValue
		SET @i = @i + 1
	END
	Return @Rtn
END

--�ʼ��˻� ���
select * from mh_map_categories where PATINDEX(dbo.UTF8_Search1stText('����') + '%' , S_CATEGORIES) > 0

--���� �˻���(�ʼ�)
select con.*, cat.* from
mh_map_contents AS con JOIN
(select * from mh_map_categories where PATINDEX(dbo.UTF8_Search1stText('����') + '%' , S_CATEGORIES) > 0) cat
ON con.C_IDX = cat.C_IDX

--�յڷ� �ǰ� ����
select con.*, cat.* from
mh_map_contents AS con JOIN
(select * from mh_map_categories where PATINDEX(dbo.UTF8_Search1stText('%����%') , S_CATEGORIES) > 0) cat
ON con.C_IDX = cat.C_IDX





select * from mh_map_contents;


insert into mh_map_contents values 
('������ȭ���', '����� ������ ������� 11', 37.495655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '���� ȭ����', 'www.www.www',1 , '���ǽü�', '10000', '�Ұ���', 'unnamed1.jpg')

insert into mh_map_contents values 
('�����������', '����� ������ źź��� 11', 37.496655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '���� ȭ����', 'www.www.www',1 , '���ǽü�', '10000', '�Ұ���', 'unnamed2.jpg')

insert into mh_map_contents values 
('������Ƽ���', '����� ������ ��õ���� 11', 37.494655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '���� ȭ����', 'www.www.www',1 , '���ǽü�', '10000', '�Ұ���', 'unnamed3.jpg')

insert into mh_map_contents values 
('����11���', '����� ������ ��õ���� 11', 37.495655822816566, 126.99389838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '���� ȭ����', 'www.www.www',1 , '���ǽü�', '10000', '�Ұ���', 'unnamed4.jpg')

insert into mh_map_contents values 
('����22���', '����� ������ ��õ���� 11', 37.496655822816566, 126.99489838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '���� ȭ����', 'www.www.www',1 , '���ǽü�', '10000', '�Ұ���', 'unnamed5.jpg')

insert into mh_map_contents values 
('����33���', '����� ������ ��õ���� 11', 37.494655822816566, 126.99189838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '���� ȭ����', 'www.www.www',1 , '���ǽü�', '10000', '�Ұ���', 'unnamed5.jpg')

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


UPDATE mh_map_contents
SET C_IDX = 6
WHERE M_IDX = 6

select * from mh_map_contents
select * from mh_map_categories

select * from mh_map_contents
where LATITUDE >= 37.495
and LONGITUDE >= 126.992


select * from mh_map_categories


select * from mh_map_categories where index in (select max(C_IDX) from mh_map_categories group by C_IDX)

select DISTINCT * from mh_map_categories


insert into mh_map_categories values
('성동문화재단 운영 시설', '성동문화재단', '성동문화재단')

insert into mh_map_categories values
('성동문화재단 운영 시설', '도서관', '성동구립도서관'),
('성동문화재단 운영 시설', '도서관', '금호도서관'),
('성동문화재단 운영 시설', '도서관', '용답도서관'),
('성동문화재단 운영 시설', '도서관', '무지개도서관'),
('성동문화재단 운영 시설', '도서관', '성수도서관'),
('성동문화재단 운영 시설', '도서관', '청계도서관'),
('성동문화재단 운영 시설', '도서관', '숲속도서관')


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
							WHEN 'ㄱ' THEN '[가-깋]'
							WHEN 'ㄲ' THEN '[까-낗]'
							WHEN 'ㄴ' THEN '[나-닣]'
							WHEN 'ㄷ' THEN '[다-딯]'
							WHEN 'ㄸ' THEN '[따-띻]'
							WHEN 'ㄹ' THEN '[라-맇]'
							WHEN 'ㅁ' THEN '[마-밓]'
							WHEN 'ㅂ' THEN '[바-빟]'
							WHEN 'ㅃ' THEN '[빠-삫]'
							WHEN 'ㅅ' THEN '[사-싷]'
							WHEN 'ㅆ' THEN '[싸-앃]'
							WHEN 'ㅇ' THEN '[아-잏]'
							WHEN 'ㅈ' THEN '[자-짛]'
							WHEN 'ㅉ' THEN '[짜-찧]'
							WHEN 'ㅊ' THEN '[차-칳]'
							WHEN 'ㅋ' THEN '[카-킿]'
							WHEN 'ㅌ' THEN '[타-팋]'
							WHEN 'ㅍ' THEN '[파-핗]'
							WHEN 'ㅎ' THEN '[하-힣]'
							ELSE @Temp END)
		SET @Rtn = RTRIM(@Rtn) + @SerchValue
		SET @i = @i + 1
	END
	Return @Rtn
END

--초성검색 사용
select * from mh_map_categories where PATINDEX(dbo.UTF8_Search1stText('ㅁㅈ') + '%' , S_CATEGORIES) > 0

--조인 검색문(초성)
select con.*, cat.* from
mh_map_contents AS con JOIN
(select * from mh_map_categories where PATINDEX(dbo.UTF8_Search1stText('ㅁㅈ') + '%' , S_CATEGORIES) > 0) cat
ON con.C_IDX = cat.C_IDX

--앞뒤로 되게 변경
select con.*, cat.* from
mh_map_contents AS con JOIN
(select * from mh_map_categories where PATINDEX(dbo.UTF8_Search1stText('%ㄷㅅ%') , S_CATEGORIES) > 0) cat
ON con.C_IDX = cat.C_IDX





select * from mh_map_contents;


insert into mh_map_contents values 
('성동문화재단', '서울시 강남구 강남대로 11', 37.495655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www',1 , '편의시설', '10000', '소개글', 'unnamed1.jpg')

insert into mh_map_contents values 
('성동복지재단', '서울시 강남구 탄탄대로 11', 37.496655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www',1 , '편의시설', '10000', '소개글', 'unnamed2.jpg')

insert into mh_map_contents values 
('성동파티재단', '서울시 강남구 부천구로 11', 37.494655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www',1 , '편의시설', '10000', '소개글', 'unnamed3.jpg')

insert into mh_map_contents values 
('성동11재단', '서울시 강남구 부천구로 11', 37.495655822816566, 126.99389838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www',1 , '편의시설', '10000', '소개글', 'unnamed4.jpg')

insert into mh_map_contents values 
('성동22재단', '서울시 강남구 부천구로 11', 37.496655822816566, 126.99489838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www',1 , '편의시설', '10000', '소개글', 'unnamed5.jpg')

insert into mh_map_contents values 
('성동33재단', '서울시 강남구 부천구로 11', 37.494655822816566, 126.99189838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www',1 , '편의시설', '10000', '소개글', 'unnamed5.jpg')

select * from mh_map_contents
where BRAND_NAME LIKE '%성동문화재단%'
OR ADDRESS LIKE '%서울%'

UPDATE mh_map_contents
SET ADDRESS = '서울시 강남구 부천구로 44'
WHERE M_IDX = 6


UPDATE mh_map_contents
SET LATITUDE = 37.495655822816566,
LONGITUDE = 126.99289838317954
WHERE M_IDX = 2


UPDATE mh_map_contents
SET C_IDX = 6
WHERE M_IDX = 6

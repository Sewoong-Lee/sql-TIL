select * from mh_map_contents
select * from mh_map_categories

select * from mh_map_contents
where LATITUDE >= 37.495
and LONGITUDE >= 126.992


select * from mh_map_categories


select * from mh_map_categories where index in (select max(C_IDX) from mh_map_categories group by C_IDX)

select DISTINCT * from mh_map_categories


insert into mh_map_categories values
('¼ºµ¿¹®È­Àç´Ü ¿î¿µ ½Ã¼³', '¼ºµ¿¹®È­Àç´Ü', '¼ºµ¿¹®È­Àç´Ü')

insert into mh_map_categories values
('¼ºµ¿¹®È­Àç´Ü ¿î¿µ ½Ã¼³', 'µµ¼­°ü', '¼ºµ¿±¸¸³µµ¼­°ü'),
('¼ºµ¿¹®È­Àç´Ü ¿î¿µ ½Ã¼³', 'µµ¼­°ü', '±ÝÈ£µµ¼­°ü'),
('¼ºµ¿¹®È­Àç´Ü ¿î¿µ ½Ã¼³', 'µµ¼­°ü', '¿ë´äµµ¼­°ü'),
('¼ºµ¿¹®È­Àç´Ü ¿î¿µ ½Ã¼³', 'µµ¼­°ü', '¹«Áö°³µµ¼­°ü'),
('¼ºµ¿¹®È­Àç´Ü ¿î¿µ ½Ã¼³', 'µµ¼­°ü', '¼º¼öµµ¼­°ü'),
('¼ºµ¿¹®È­Àç´Ü ¿î¿µ ½Ã¼³', 'µµ¼­°ü', 'Ã»°èµµ¼­°ü'),
('¼ºµ¿¹®È­Àç´Ü ¿î¿µ ½Ã¼³', 'µµ¼­°ü', '½£¼Óµµ¼­°ü')


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
							WHEN '¤¡' THEN '[°¡-ƒ‰]'
							WHEN '¤¢' THEN '[±î-…ù]'
							WHEN '¤¤' THEN '[³ª-ˆ¢]'
							WHEN '¤§' THEN '[´Ù-‹L]'
							WHEN '¤¨' THEN '[µû-ê]'
							WHEN '¤©' THEN '[¶ó-¡]'
							WHEN '¤±' THEN '[¸¶-“J]'
							WHEN '¤²' THEN '[¹Ù-•½]'
							WHEN '¤³' THEN '[ºü-˜ª]'
							WHEN '¤µ' THEN '[»ç-šï]'
							WHEN '¤¶' THEN '[½Î-Ï]'
							WHEN '¤·' THEN '[¾Æ-Ÿç]'
							WHEN '¤¸' THEN '[ÀÚ-£ ]'
							WHEN '¤¹' THEN '[Â¥-Âö]'
							WHEN '¤º' THEN '[Â÷-¯†]'
							WHEN '¤»' THEN '[Ä«-µi]'
							WHEN '¤¼' THEN '[Å¸-»M]'
							WHEN '¤½' THEN '[ÆÄ-À˜]'
							WHEN '¤¾' THEN '[ÇÏ-ÆR]'
							ELSE @Temp END)
		SET @Rtn = RTRIM(@Rtn) + @SerchValue
		SET @i = @i + 1
	END
	Return @Rtn
END

--ÃÊ¼º°Ë»ö »ç¿ë
select * from mh_map_categories where PATINDEX(dbo.UTF8_Search1stText('¤±¤¸') + '%' , S_CATEGORIES) > 0

--Á¶ÀÎ °Ë»ö¹®(ÃÊ¼º)
select con.*, cat.* from
mh_map_contents AS con JOIN
(select * from mh_map_categories where PATINDEX(dbo.UTF8_Search1stText('¤±¤¸') + '%' , S_CATEGORIES) > 0) cat
ON con.C_IDX = cat.C_IDX

--¾ÕµÚ·Î µÇ°Ô º¯°æ
select con.*, cat.* from
mh_map_contents AS con JOIN
(select * from mh_map_categories where PATINDEX(dbo.UTF8_Search1stText('%¤§¤µ%') , S_CATEGORIES) > 0) cat
ON con.C_IDX = cat.C_IDX





select * from mh_map_contents;


insert into mh_map_contents values 
('¼ºµ¿¹®È­Àç´Ü', '¼­¿ï½Ã °­³²±¸ °­³²´ë·Î 11', 37.495655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www',1 , 'ÆíÀÇ½Ã¼³', '10000', '¼Ò°³±Û', 'unnamed1.jpg')

insert into mh_map_contents values 
('¼ºµ¿º¹ÁöÀç´Ü', '¼­¿ï½Ã °­³²±¸ ÅºÅº´ë·Î 11', 37.496655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www',1 , 'ÆíÀÇ½Ã¼³', '10000', '¼Ò°³±Û', 'unnamed2.jpg')

insert into mh_map_contents values 
('¼ºµ¿ÆÄÆ¼Àç´Ü', '¼­¿ï½Ã °­³²±¸ ºÎÃµ±¸·Î 11', 37.494655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www',1 , 'ÆíÀÇ½Ã¼³', '10000', '¼Ò°³±Û', 'unnamed3.jpg')

insert into mh_map_contents values 
('¼ºµ¿11Àç´Ü', '¼­¿ï½Ã °­³²±¸ ºÎÃµ±¸·Î 11', 37.495655822816566, 126.99389838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www',1 , 'ÆíÀÇ½Ã¼³', '10000', '¼Ò°³±Û', 'unnamed4.jpg')

insert into mh_map_contents values 
('¼ºµ¿22Àç´Ü', '¼­¿ï½Ã °­³²±¸ ºÎÃµ±¸·Î 11', 37.496655822816566, 126.99489838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www',1 , 'ÆíÀÇ½Ã¼³', '10000', '¼Ò°³±Û', 'unnamed5.jpg')

insert into mh_map_contents values 
('¼ºµ¿33Àç´Ü', '¼­¿ï½Ã °­³²±¸ ºÎÃµ±¸·Î 11', 37.494655822816566, 126.99189838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www',1 , 'ÆíÀÇ½Ã¼³', '10000', '¼Ò°³±Û', 'unnamed5.jpg')

select * from mh_map_contents
where BRAND_NAME LIKE '%¼ºµ¿¹®È­Àç´Ü%'
OR ADDRESS LIKE '%¼­¿ï%'

UPDATE mh_map_contents
SET ADDRESS = '¼­¿ï½Ã °­³²±¸ ºÎÃµ±¸·Î 44'
WHERE M_IDX = 6


UPDATE mh_map_contents
SET LATITUDE = 37.495655822816566,
LONGITUDE = 126.99289838317954
WHERE M_IDX = 2


UPDATE mh_map_contents
SET C_IDX = 6
WHERE M_IDX = 6

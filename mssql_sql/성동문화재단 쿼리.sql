--delete from mh_map_service
--delete from mh_map_checked_service
--delete from mh_map_checked_service_new

--delete from mh_map_contents
--delete from mh_map_contents_new

--delete from mh_map_categories
--delete from mh_map_categories_joso

select * from mh_adminCngLog
select * from MH_MEM2_20200526


select * from mh_map_service
select * from mh_map_checked_service
select * from mh_map_checked_service_new

select * from mh_map_contents
select * from mh_map_contents_new

select * from mh_map_categories
select * from mh_map_categories_joso

select * from mh_map_contents
WHERE J_IDX = 1

select * from mh_map_service
where S_IDX NOT IN (4,5,16)
select * from mh_map_checked_service

select * from mh_map_categories
WHERE L_CATEGORIES = '¼­Á¡'

select * from mh_map_contents
where M_IDX = 298

SELECT * FROM mh_map_categories ORDER BY 
case L_CATEGORIES when L_CATEGORIES = 'Àç´Ü¿î¿µ½Ã¼³'

select * from mh_map_categories_joso
where JOSO_NAME = 'Çà´çÁ¦1µ¿'

select con.M_IDX, con.BRAND_NAME, con.ADDRESS,con.LATITUDE, con.LONGITUDE, con.TEL, con.ON_DAY_WEEK, con.ON_DAY_WEEKEND, con.OFF_DAY, con.PAGE_LINK,
		con.INTRO, con.FILEURLPATH, con.FILERENAME, con.C_IDX, cat.L_CATEGORIES,cat.M_CATEGORIES, joso.J_IDX, joso.JOSO_NAME
		from mh_map_contents con
		LEFT JOIN mh_map_categories cat
		ON con.C_IDX = cat.C_IDX
		LEFT JOIN mh_map_categories_joso joso
		ON con.J_IDX = joso.J_IDX
		where OPACTIY = 1
		and joso.J_IDX = 5
		and cat.L_CATEGORIES = 'º¹ÇÕ¹®È­°ø°£'
		order by cat.C_IDX


SELECT
	C_IDX,
	L_CATEGORIES,
	M_CATEGORIES,
	CASE 
		WHEN L_CATEGORIES = 'Àç´Ü¿î¿µ½Ã¼³' THEN 1
		ELSE 0 
	END AS is_top
FROM mh_map_categories
ORDER BY is_top DESC, L_CATEGORIES


select 
			con.M_IDX, con.BRAND_NAME, con.ADDRESS,con.LATITUDE, con.LONGITUDE, con.TEL, con.ON_DAY_WEEK, con.ON_DAY_WEEKEND, con.OFF_DAY, con.PAGE_LINK,
			con.INTRO, con.FILEURLPATH, con.FILERENAME, con.C_IDX, cat.L_CATEGORIES,cat.M_CATEGORIES,
			CASE 
				WHEN cat.M_CATEGORIES = '±âÅ¸' THEN 1
				ELSE 0 
			END AS is_dwon
		from
		mh_map_contents AS con 
		LEFT JOIN mh_map_categories AS cat
	    ON con.C_IDX = cat.C_IDX
	    LEFT JOIN mh_map_categories_joso joso
		ON con.J_IDX = joso.J_IDX
		where OPACTIY = 1
		and cat.L_CATEGORIES = 'Àü½ÃÀå'
		order by is_dwon, cat.M_CATEGORIES

SELECT * FROM mh_map_categories
WHERE L_CATEGORIES = 'Àü½ÃÀå'


SELECT * FROM 
mh_map_contents AS con 
LEFT JOIN mh_map_categories AS cat
ON con.C_IDX = cat.C_IDX
WHERE cat.L_CATEGORIES = 'Àü½ÃÀå'



















select * from mh_map_contents
where M_IDX = 298


--UPDATE mh_map_categories
--set 
--L_CATEGORIES = 'Àü½ÃÀå'
--WHERE L_CATEGORIES = 'Àü½Ã°ü';

select * from mh_map_contents
--delete from mh_map_contents
--where M_IDX = 323

select* from mh_map_contents

SELECT * FROM mh_map_categories

--UPDATE mh_map_contents
--set 
--OPACTIY = 1
--WHERE M_IDX = 321

select * from mh_map_checked_service
where M_IDX = 316;

select * from mh_map_contents
where TEL LIKE '%00%'
AND J_IDX = 1

select * from mh_map_contents
where BRAND_NAME = ''

--===============================Å×ÀÌºí ÄÃ·³ Áõ°¡°ª ÃÊ±âÈ­
--DBCC CHECKIDENT(mh_map_contents_new , reseed, 0);

--UPDATE mh_map_categories
--set 
--M_CATEGORIES = ''
--WHERE C_IDX = 66;

select con.*, cat.* from
		(select * from mh_map_contents where PATINDEX(dbo.Initial_SearchText('%%') , BRAND_NAME) > 0) AS con JOIN
		mh_map_categories AS cat
        ON con.C_IDX = cat.C_IDX
		JOIN mh_map_categories_joso joso
		ON con.J_IDX = joso.J_IDX
		where joso.JOSO_NAME = '¸¶Àåµ¿'
		and CON.BRAND_NAME = '¸¶Àå±¹¹ÎÃ¼À°¼¾ÅÍ'
		and cat.L_CATEGORIES = 'µµ¼­°ü'
		and cat.M_CATEGORIES = 'µµ¼­°ü'


<isNotEqual property="select_joso" compareValue="Áö¿ª ºÐ·ù">
			and joso.JOSO_NAME = #select_joso#
		</isNotEqual>
SELECT C_IDX, L_CATEGORIES, M_CATEGORIES, CASE WHEN L_CATEGORIES = 'Àç´Ü¿î¿µ½Ã¼³' THEN 1 ELSE 0 END AS is_top FROM mh_map_categories ORDER BY is_top DESC, L_CATEGORIES


--UPDATE mh_map_contents SET M_EMAIL = ISNULL(M_EMAIL,getdate())
--UPDATE mh_map_contents SET OFF_DAY = ISNULL(OFF_DAY, '')
--UPDATE mh_map_contents SET PAGE_LINK = ISNULL(PAGE_LINK, '')
--UPDATE mh_map_contents SET INTRO = ISNULL(INTRO, '')
UPDATE mh_map_contents SET M_EMAIL = ''
UPDATE mh_map_contents SET M_NAME2 = ''


DELETE FROM mh_map_contents
where M_IDX = 310

SELECT * FROM mh_map_contents
where BRAND_NAME = 'µî·ÏÁ¦¾È1'

SELECT @@SERVERNAME

select * from mh_map_contents_new
ORDER BY DATE DESC


------°Ë»ö Á¶È¸´Ù¾Æ¾Æ¾Æ¾Æ----------------------------------------------------------------------------------------------------------------------------------------------
select CON.M_IDX
		,CON.BRAND_NAME
		,CON.ADDRESS
		,CON.LATITUDE
		,CON.LONGITUDE
		,CON.TEL
		,CON.ON_DAY_WEEK
		,CON.ON_DAY_WEEKEND
		,CON.OFF_DAY
		,CON.PAGE_LINK
		,CON.FILEDNAME
		,CON.FILETYPE
		,CON.FILENAME
		,CON.FILEPATH
		,CON.FILEURLPATH
		,CON.FILESIZE
		,CON.FILERENAME
		,CON.C_IDX
		,CON.DATE
		,CON.M_EMAIL
		,CON.M_NAME2
		,CON.J_IDX
		,CON.OPACTIY
		--,ISNULL(CON.INTRO,'NULLÀÔ´Ï´Ù') AS STR_INTRO
	from mh_map_contents			con
	JOIN mh_map_categories			cat
	ON con.C_IDX = cat.C_IDX
	JOIN mh_map_categories_joso		joso
	ON con.J_IDX = joso.J_IDX
	JOIN mh_map_checked_service		ser
	ON con.M_IDX = ser.M_IDX
	AND ser.S_IDX IN (1)
WHERE con.BRAND_NAME LIKE '%%'
AND con.M_EMAIL LIKE '%%'
AND con.M_NAME2 LIKE '%%'
AND con.TEL LIKE '%%'
AND con.J_IDX = 7
AND con.C_IDX = 1
GROUP BY CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.LATITUDE, CON.LONGITUDE, CON.TEL, CON.ON_DAY_WEEK, CON.ON_DAY_WEEKEND, CON.OFF_DAY, CON.PAGE_LINK, CON.FILEDNAME, CON.FILETYPE, CON.FILENAME, CON.FILEPATH, CON.FILEURLPATH, CON.FILESIZE, CON.FILERENAME, CON.C_IDX, CON.DATE, CON.M_EMAIL, CON.M_NAME2, CON.J_IDX, CON.OPACTIY
ORDER BY CON.DATE

SELECT * FROM
    (
	SELECT ROW_NUMBER() OVER(ORDER BY N.M_IDX DESC) AS RNUM, N.* FROM
		(
		select con.* from
		mh_map_contents AS con JOIN
		mh_map_categories AS cat
		ON con.C_IDX = cat.C_IDX
		) N
    ) R
WHERE R.RNUM BETWEEN 1 AND 5

--ÆäÀÌÂ¡ Ã³¸® ºôµå¾÷
select *
    from mh_map_contents con
    JOIN mh_map_categories cat
      ON con.C_IDX = cat.C_IDX
    JOIN mh_map_checked_service cser
      ON cser.M_IDX = con.M_IDX
    JOIN mh_map_service ser
      ON ser.S_IDX = cser.S_IDX
ORDER BY con.BRAND_NAME

--ÆäÀÌÂ¡ Ã³¸® ºôµå¾÷2 (·Î¿ì³Ñ¹ö È°¿ë)
SELECT ROW_NUMBER() OVER(ORDER BY N.M_IDX DESC) AS RNUM, N.* FROM
    (
    select con.*
    from mh_map_contents con
        JOIN mh_map_categories cat
          ON con.C_IDX = cat.C_IDX
        JOIN mh_map_checked_service cser
          ON cser.M_IDX = con.M_IDX
        JOIN mh_map_service ser
          ON ser.S_IDX = cser.S_IDX
    ) N


--ÆäÀÌÂ¡ Ã³¸® ºôµå¾÷2 (·Î¿ì³Ñ¹ö È°¿ë2)
SELECT * FROM
    (
    SELECT ROW_NUMBER() OVER(ORDER BY N.DATE DESC) AS RNUM, N.* FROM
        (
			select CON.M_IDX
					,CON.BRAND_NAME
					,CON.ADDRESS
					,CON.LATITUDE
					,CON.LONGITUDE
					,CON.TEL
					,CON.ON_DAY_WEEK
					,CON.ON_DAY_WEEKEND
					,CON.OFF_DAY
					,CON.PAGE_LINK
					,CON.FILEDNAME
					,CON.FILETYPE
					,CON.FILENAME
					,CON.FILEPATH
					,CON.FILEURLPATH
					,CON.FILESIZE
					,CON.FILERENAME
					,CON.C_IDX
					,CON.DATE
					,CON.M_EMAIL
					,CON.M_NAME2
					,CON.J_IDX
					,CON.OPACTIY
					--,ISNULL(CON.INTRO,'NULLÀÔ´Ï´Ù') AS STR_INTRO
				from mh_map_contents			con
				JOIN mh_map_categories			cat
				ON con.C_IDX = cat.C_IDX
				JOIN mh_map_categories_joso		joso
				ON con.J_IDX = joso.J_IDX
				JOIN mh_map_checked_service		ser
				ON con.M_IDX = ser.M_IDX
				AND ser.S_IDX IN (13,4)
			WHERE con.BRAND_NAME LIKE '%%'
			AND con.M_EMAIL LIKE '%%'
			AND con.M_NAME2 LIKE '%%'
			AND con.TEL LIKE '%00%'
			AND con.J_IDX  = 1
			AND con.C_IDX LIKE '%%'
			GROUP BY CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.LATITUDE, CON.LONGITUDE, CON.TEL, CON.ON_DAY_WEEK, CON.ON_DAY_WEEKEND, CON.OFF_DAY, CON.PAGE_LINK, CON.FILEDNAME, CON.FILETYPE, CON.FILENAME, CON.FILEPATH, CON.FILEURLPATH, CON.FILESIZE, CON.FILERENAME, CON.C_IDX, CON.DATE, CON.M_EMAIL, CON.M_NAME2, CON.J_IDX, CON.OPACTIY
        ) N
    ) R
WHERE R.RNUM BETWEEN 1 AND 5


-- °Ë»ö °³½Ã¹° °³¼ö È®ÀÎ
SELECT count(*) FROM
(
	select CON.M_IDX
			,CON.BRAND_NAME
			,CON.ADDRESS
			,CON.LATITUDE
			,CON.LONGITUDE
			,CON.TEL
			,CON.ON_DAY_WEEK
			,CON.ON_DAY_WEEKEND
			,CON.OFF_DAY
			,CON.PAGE_LINK
			,CON.FILEDNAME
			,CON.FILETYPE
			,CON.FILENAME
			,CON.FILEPATH
			,CON.FILEURLPATH
			,CON.FILESIZE
			,CON.FILERENAME
			,CON.C_IDX
			,CON.DATE
			,CON.M_EMAIL
			,CON.M_NAME2
			,CON.J_IDX
			,CON.OPACTIY
			--,ISNULL(CON.INTRO,'NULLÀÔ´Ï´Ù') AS STR_INTRO
		from mh_map_contents			con
		JOIN mh_map_categories			cat
		ON con.C_IDX = cat.C_IDX
		JOIN mh_map_categories_joso		joso
		ON con.J_IDX = joso.J_IDX
		JOIN mh_map_checked_service		ser
		ON con.M_IDX = ser.M_IDX
		AND ser.S_IDX IN (13,4)
	WHERE con.BRAND_NAME LIKE '%%'
	AND con.M_EMAIL LIKE '%%'
	AND con.M_NAME2 LIKE '%%'
	AND con.TEL LIKE '%%'
	AND con.J_IDX LIKE '%%'
	AND con.C_IDX LIKE '%%'
	GROUP BY CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.LATITUDE, CON.LONGITUDE, CON.TEL, CON.ON_DAY_WEEK, CON.ON_DAY_WEEKEND, CON.OFF_DAY, CON.PAGE_LINK, CON.FILEDNAME, CON.FILETYPE, CON.FILENAME, CON.FILEPATH, CON.FILEURLPATH, CON.FILESIZE, CON.FILERENAME, CON.C_IDX, CON.DATE, CON.M_EMAIL, CON.M_NAME2, CON.J_IDX, CON.OPACTIY
) N




select count(*) from
		mh_map_contents AS con JOIN
		mh_map_categories AS cat
	    ON con.C_IDX = cat.C_IDX


--µî·Ï ¼öÁ¤ ¸®½ºÆ® Ä«¿îÆ®
SELECT count(*) 
FROM mh_map_contents_new

--µî·Ï ¼öÁ¤ ·Î¿ì³Ñ¹ö Ãâ·Â ¸®½ºÆ®
SELECT * FROM
    (
    SELECT ROW_NUMBER() OVER(ORDER BY N.DATE DESC) AS RNUM, N.* FROM
        (
			SELECT * FROM mh_map_contents_new
        ) N
    ) R
WHERE R.RNUM BETWEEN 1 AND 10


--´õº¸±â ¼¿·ºÆ®
select * from
		mh_map_contents AS con 
		JOIN mh_map_categories AS cat
		  ON con.C_IDX = cat.C_IDX
		LEFT JOIN mh_map_checked_service cser
		  ON con.M_IDX = cser.M_IDX
		LEFT JOIN mh_map_service ser
		  ON ser.S_IDX = cser.S_IDX
		where con.M_IDX = 11


SELECT *
			FROM mh_map_service ser
			JOIN mh_map_checked_service_new nser
			ON ser.S_IDX = nser.S_IDX
		WHERE nser.MN_IDX = 1

select * 
		from mh_map_contents_new ncon
		JOIN mh_map_categories cat
		ON ncon.C_IDX = cat.C_IDX
		JOIN mh_map_categories_joso joso
		ON ncon.J_IDX = joso.J_IDX
		JOIN mh_map_checked_service_new nser
		ON nser.MN_IDX = nser.MN_IDX
		JOIN mh_map_service ser
		ON ser.S_IDX = nser.S_IDX
WHERE ncon.MN_IDX = 1

--Å×ÀÌºí µ¥ÀÌÅÍ º¹»ç
--ÀÌ°Ç ÀüÃ¼ ´Ù ¶È°°¾Æ¾ßÇØ¼­ ¾È´ï
INSERT 
  INTO mh_map_contents
SELECT *
  FROM mh_map_contents_new
 WHERE MN_IDX = 3
 --ÀÌ°Å·Î ¾¸
INSERT INTO mh_map_contents (BRAND_NAME, ADDRESS, LATITUDE, LONGITUDE, TEL, ON_DAY_WEEK, ON_DAY_WEEKEND, OFF_DAY, PAGE_LINK, INTRO,
FILEDNAME, FILETYPE, FILENAME, FILEPATH, FILEURLPATH, FILESIZE, FILERENAME, C_IDX, DATE, M_EMAIL, M_NAME2,J_IDX)
SELECT BRAND_NAME, ADDRESS, LATITUDE, LONGITUDE, TEL, ON_DAY_WEEK, ON_DAY_WEEKEND, OFF_DAY, PAGE_LINK, INTRO,
FILEDNAME, FILETYPE, FILENAME, FILEPATH, FILEURLPATH, FILESIZE, FILERENAME, C_IDX, DATE, M_EMAIL, M_NAME2,J_IDX FROM mh_map_contents_new
WHERE MN_IDX = 1

select * from mh_map_contents_new

select * from mh_map_checked_service_new

select *
from mh_map_contents con
JOIN mh_map_categories cat
ON con.C_IDX = cat.C_IDX
JOIN mh_map_categories_joso joso
ON con.J_IDX = joso.J_IDX
JOIN mh_map_checked_service ser
ON con.M_IDX = ser.M_IDX
WHERE con.BRAND_NAME LIKE '%%'
AND con.M_EMAIL LIKE ''
AND con.M_NAME2 LIKE '%%'
AND con.TEL LIKE '%%'
AND con.J_IDX LIKE '%%'
AND con.C_IDX LIKE '%%'

UPDATE mh_map_contents
set 
BRAND_NAME = 'BRAND_NAME',
ADDRESS =  'ADDRESS',
LATITUDE = 111.111111,
LONGITUDE = 111.111111,
TEL = '111.111.1.111',
ON_DAY_WEEK = '00~00',
ON_DAY_WEEKEND = '00~00',
OFF_DAY = '¾øÀ½',
PAGE_LINK = '¾øÀ½',
INTRO = '¾øÀ½',
FILEDNAME = '¾øÀ½',
FILETYPE = '¾øÀ½',
FILENAME = '¾øÀ½',
FILEPATH = '¾øÀ½',
FILEURLPATH = '¾øÀ½',
FILESIZE = '¾øÀ½',
FILERENAME = '¾øÀ½',
C_IDX = 1,
J_IDX = 1
WHERE M_IDX = 2;


select * 
	from mh_map_contents con
	JOIN mh_map_categories cat
	ON con.C_IDX = cat.C_IDX
	JOIN mh_map_categories_joso joso
	ON con.J_IDX = joso.J_IDX
WHERE con.M_IDX = 6

SELECT *
		FROM mh_map_service ser
		JOIN mh_map_checked_service cser
		ON ser.S_IDX = cser.S_IDX
WHERE cser.M_IDX = 7


select * 
	from mh_map_contents_new ncon
	JOIN mh_map_categories cat
	ON ncon.C_IDX = cat.C_IDX
	JOIN mh_map_categories_joso joso
	ON ncon.J_IDX = joso.J_IDX
WHERE ncon.MN_IDX = 1

SELECT ser.S_IDX, nser.MN_IDX, ser.SERVICE_NAME
		FROM mh_map_service ser
		JOIN mh_map_checked_service_new nser
		ON ser.S_IDX = nser.S_IDX
WHERE nser.MN_IDX = 1

SELECT *
			FROM 
			mh_map_checked_service_new
		WHERE MN_IDX = 3

SELECT nser.S_IDX S_IDX, nser.MN_IDX MN_IDX, ser.SERVICE_NAME SERVICE_NAME
			FROM mh_map_service ser
			JOIN mh_map_checked_service_new nser
			ON ser.S_IDX = nser.S_IDX
		WHERE nser.MN_IDX = 3

SELECT * 
	FROM mh_map_service ser
	JOIN mh_map_checked_service_new nser
	ON ser.S_IDX = nser.S_IDX

SELECT * FROM mh_map_checked_service

select * from (select con.*
	from mh_map_contents con
	JOIN mh_map_categories cat
	ON con.C_IDX = cat.C_IDX
	JOIN mh_map_categories_joso joso
	ON con.J_IDX = joso.J_IDX
	JOIN mh_map_checked_service ser
	ON con.M_IDX = ser.M_IDX
WHERE con.M_EMAIL LIKE '%%'
AND con.M_NAME2 LIKE '%%'
AND con.TEL LIKE '%%'
AND con.J_IDX LIKE '%%'
AND con.C_IDX LIKE '%%'
AND ser.S_IDX IN (13,4)) cc
where m_idx in (select max(m_idx) from mh_map_contents group by m_idx)

select CON.*
	from mh_map_contents con
	JOIN mh_map_categories cat
	ON con.C_IDX = cat.C_IDX
	JOIN mh_map_categories_joso joso
	ON con.J_IDX = joso.J_IDX
	JOIN mh_map_checked_service ser
	ON con.M_IDX = ser.M_IDX
WHERE con.BRAND_NAME LIKE '%%'
AND con.M_EMAIL LIKE '%%'
AND con.M_NAME2 LIKE '%%'
AND con.TEL LIKE '%%'
AND con.J_IDX LIKE '%%'
AND con.C_IDX LIKE '%%'
AND ser.S_IDX IN (13,4)

-- ÀÌ°Å·Î °Ë»ö ¤¡¤¡¤¡¤¡¤¡¤¡¤¡¤¡¤¡¤¡---------------------------------------------------------------------------------------------------------------
select * 
	from (select con.*
		from mh_map_contents con
		JOIN mh_map_checked_service ser
		ON con.M_IDX = ser.M_IDX
		WHERE ser.S_IDX IN (4,13)) con
	JOIN mh_map_categories cat
	ON con.C_IDX = cat.C_IDX
	JOIN mh_map_categories_joso joso
	ON con.J_IDX = joso.J_IDX
WHERE con.BRAND_NAME LIKE '%%'
AND con.M_EMAIL LIKE '%%'
AND con.M_NAME2 LIKE '%%'
AND con.TEL LIKE '%%'
AND con.J_IDX LIKE '%%'
AND con.C_IDX LIKE '%%'



select * 
	from mh_map_contents con
	JOIN mh_map_categories cat
	ON con.C_IDX = cat.C_IDX
	JOIN mh_map_categories_joso joso
	ON con.J_IDX = joso.J_IDX
WHERE EXISTS (select * 
	from mh_map_contents con
	JOIN mh_map_checked_service ser
	ON con.M_IDX = ser.M_IDX
	WHERE ser.S_IDX IN (4,13))
AND con.BRAND_NAME LIKE '%%'
AND con.M_EMAIL LIKE '%%'
AND con.M_NAME2 LIKE '%%'
AND con.TEL LIKE '%%'
AND con.J_IDX LIKE '%%'
AND con.C_IDX LIKE '%%'


SELECT * FROM mh_map_checked_service
select * 
	from mh_map_contents con
	JOIN mh_map_checked_service ser
	ON con.M_IDX = ser.M_IDX
	WHERE ser.S_IDX IN (13,4)

select * from mh_map_contents
where m_idx in (select max(m_idx) from mh_map_contents group by m_idx)
select * 
	from mh_map_contents con
	JOIN mh_map_categories cat
	ON con.C_IDX = cat.C_IDX
	JOIN mh_map_categories_joso joso
	ON con.J_IDX = joso.J_IDX
	JOIN mh_map_checked_service ser
	ON con.M_IDX = ser.M_IDX
WHERE con.M_EMAIL LIKE '%%'
AND con.M_NAME2 LIKE '%%'
AND con.TEL LIKE '%%'
AND con.J_IDX LIKE '%%'
AND con.C_IDX LIKE '%%'
AND ser.S_IDX IN (13,4)


select * 
	from mh_map_contents con
	JOIN mh_map_categories cat
	ON con.C_IDX = cat.C_IDX
	JOIN mh_map_categories_joso joso
	ON con.J_IDX = joso.J_IDX
	JOIN mh_map_checked_service ser
	ON con.M_IDX = ser.M_IDX
WHERE con.M_EMAIL LIKE '%%'
AND con.M_NAME2 LIKE '%%'
AND con.TEL LIKE '%%'
AND con.J_IDX LIKE '%%'
AND con.C_IDX LIKE '%%'
AND ser.S_IDX IN (1,10)

select * 
	from mh_map_contents con
	JOIN mh_map_categories cat
	ON con.C_IDX = cat.C_IDX
	JOIN mh_map_categories_joso joso
	ON con.J_IDX = joso.J_IDX
	where joso.JOSO_NAME = 



select con.*, cat.* from
		(select * from mh_map_contents where PATINDEX(dbo.Initial_SearchText('%¤·%') , BRAND_NAME) > 0) AS con JOIN
		mh_map_categories AS cat
        ON con.C_IDX = cat.C_IDX
		JOIN mh_map_categories_joso joso
		ON con.J_IDX = joso.J_IDX
		where cat.L_CATEGORIES = ''

select con.*, cat.* from
		mh_map_contents AS con JOIN
		mh_map_categories AS cat
	    ON con.C_IDX = cat.C_IDX
		where L_CATEGORIES = ''
		and M_CATEGORIES = ''
		order by con.BRAND_NAME


insert into mh_map_contents values
('Å×½ºÆ® ºê·£µå¸í1', '¼­¿ï½Ã °­³²±¸ °­³²´ë·Î 11', 37.495655822816566, 126.99289838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www', 1 , 'ÆíÀÇ ½Ã¼³', 10000, '¼Ò°³±Û', 'testmapimg.jpg');

insert into mh_map_contents values
('Å×½ºÆ® Àç´Ü¸í2', '¼­¿ï½Ã °­³²±¸ °­³²´ë·Î 11', 37.496655822816566, 126.99289838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www', 1 , 'ÆíÀÇ ½Ã¼³', 10000, '¼Ò°³±Û', 'testmapimg.jpg');

insert into mh_map_contents values
('Å×½ºÆ® ºê·£µåÀç´Ü¸í3', '¼­¿ï½Ã °­³²±¸ °­³²´ë·Î 11', 37.494655822816566, 126.99289838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www', 0 , 'ÆíÀÇ ½Ã¼³', 10000, '¼Ò°³±Û', 'testmapimg.jpg');

insert into mh_map_contents values
('Å×½ºÆ® ¼ºµ¿Àç´Ü¸í4', '¼­¿ï½Ã °­³²±¸ °­³²´ë·Î 11', 37.495655822816566, 126.99389838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www', 0 , 'ÆíÀÇ ½Ã¼³', 10000, '¼Ò°³±Û', 'testmapimg.jpg');

insert into mh_map_contents values
('Å×½ºÆ® ¹ýÀÎ¸í5', '¼­¿ï½Ã °­³²±¸ °­³²´ë·Î 11', 37.496655822816566, 126.99489838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www', 1 , 'ÆíÀÇ ½Ã¼³', 10000, '¼Ò°³±Û', 'testmapimg.jpg');

insert into mh_map_contents values
('Å×½ºÆ® ¼ºµ¿ºê·£µå¸í6', '¼­¿ï½Ã °­³²±¸ °­³²´ë·Î 11', 37.494655822816566, 126.99189838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www', 1 , 'ÆíÀÇ ½Ã¼³', 10000, '¼Ò°³±Û', 'testmapimg.jpg');

--¼­ºñ½º ÀÎ¼­Æ®
insert into mh_map_service values
('ÁÖÂ÷'),
('´ë°ü'),
('Æ÷Àå'),
('¹è´Þ'),
('¿¹¾à'),
('¹«¼±ÀÎÅÍ³Ý'),
('¹Ý·Áµ¿¹° µ¿¹Ý'),
('À¯¾Æ½Ã¼³(³îÀÌ¹æ)'),
('³²/³à È­Àå½Ç ±¸ºÐ'),
('Áö¿ªÈ­Æó(Áö·ùÇü)'),
('Áö¿ªÈ­Æó(Ä«µåÇü)'),
('Áö¿ªÈ­Æó(¸ð¹ÙÀÏÇü)'),
('Á¦·ÎÆäÀÌ'),
('Àå¾ÖÀÎ ÆíÀÇ½Ã¼³');
insert into mh_map_service values
('±¹¹ÎÁö¿ø±Ý');
SELECT * FROM mh_map_service


insert into mh_map_categories_joso values
('¿Õ½Ê¸®Á¦2µ¿'),
('¿Õ½Ê¸®µµ¼±µ¿'),
('¸¶Àåµ¿'),
('»ç±Ùµ¿'),
('Çà´çÁ¦1µ¿'),
('Çà´çÁ¦2µ¿'),
('ÀÀºÀµ¿'),
('±ÝÈ£1°¡µ¿'),
('±ÝÈ£2,3°¡µ¿'),
('±ÝÈ£4°¡µ¿'),
('¿Á¼öµ¿'),
('¼º¼ö1°¡Á¦1µ¿'),
('¼º¼ö1°¡Á¦2µ¿'),
('¼º¼ö2°¡Á¦1µ¿'),
('¼º¼ö2°¡Á¦3µ¿'),
('¼ÛÁ¤µ¿'),
('¿ë´äµ¿');

select * from mh_map_categories_joso


insert into mh_map_categories values
('¼ºµ¿¹®È­Àç´Ü ¿î¿µ ½Ã¼³', '¼ºµ¿¹®È­Àç´Ü', '¼ºµ¿¹®È­Àç´Ü')


select * from mh_mem

select * from mh_map_categories

insert into mh_map_categories values
('Àü½Ã°ü', '±¹°ø¸³¹Ì¼ú°ü')

insert into mh_map_categories values
('Àç´Ü ¿î¿µ ½Ã¼³', 'µµ¼­°ü'),
('Àç´Ü ¿î¿µ ½Ã¼³', '°ø¿¬Àå'),
('Àç´Ü ¿î¿µ ½Ã¼³', 'Àü½Ã½Ç'),
('Àç´Ü ¿î¿µ ½Ã¼³', 'Ã»³â½Ã¼³'),
('Àç´Ü ¿î¿µ ½Ã¼³', '¾î¸°ÀÌÁý'),
('Àç´Ü ¿î¿µ ½Ã¼³', 'µ¹º½½Ã¼³'),
('Àç´Ü ¿î¿µ ½Ã¼³', '±âÅ¸'),
('µµ¼­°ü', '°ø°øµµ¼­°ü'),
('µµ¼­°ü', '¹Î°£µµ¼­°ü'),
('Àü½Ã°ü', '°ø°ø¹Ì¼ú°ü'),
('Àü½Ã°ü', '»ç¸³¹Ì¼ú°ü'),
('Àü½Ã°ü', '°¶·¯¸®'),
('Àü½Ã°ü', '±âÅ¸'),
('°ø¿¬Àå', '°ø°ø°ø¿¬Àå'),
('°ø¿¬Àå', '¹Î°£°ø¿¬Àå'),
('¹Ú¹°°ü', '°ø°ø¹Ú¹°°ü'),
('¹Ú¹°°ü', '¹Î°£¹Ú¹°°ü'),
('ÁÖ¹Î½Ã¼³', '¹®¿¹È¸°ü'),
('ÁÖ¹Î½Ã¼³', '±¸¹ÎÈ¸°ü'),
('ÁÖ¹Î½Ã¼³', 'Á¾ÇÕº¹ÁöÈ¸°ü'),
('ÁÖ¹Î½Ã¼³', '±¸¹Î´Ù¸ñÀûÃ¼À°½Ã¼³'),
('ÁÖ¹Î½Ã¼³', 'Ã»¼Ò³â ¼ö·Ã½Ã¼³'),
('ÁÖ¹Î½Ã¼³', 'Ã»³â½Ã¼³'),
('¹®È­Àç', '±¹°¡ÁöÁ¤¹®È­Àç'),
('¹®È­Àç', '½ÃµµÁöÁ¤¹®È­Àç'),
('¹®È­Àç', '¼­¿ï¹Ì·¡À¯»ê'),
('¹®È­Àç', 'µî·Ï¹®È­Àç'),
('Ã¥¹æ', 'µ¶¸³¼­Á¡'),
('Ã¥¹æ', 'ÇåÃ¥¹æ'),
('Ã¥¹æ', '¼­Á¡');
insert into mh_map_categories values
('¹®È­¿ø', NULL),
('¿µÈ­°ü', NULL),
('°ø¹æ', NULL),
('º¹ÇÕ¹®È­°ø°£', NULL);


insert into mh_map_categories(L_CATEGORIES, M_CATEGORIES) values
('¼ºµ¿¹®È­Àç´Ü ¿î¿µ ½Ã¼³', 'Å×½ºÆ®1'),
('¼ºµ¿¹®È­Àç´Ü ¿î¿µ ½Ã¼³', 'Å×½ºÆ®2')


CREATE FUNCTION [Initial_SearchText]
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

select con.*, cat.* from
mh_map_contents AS con JOIN
(select * from mh_map_categories where PATINDEX(dbo.Initial_SearchText('%%') , S_CATEGORIES) > 0) cat
ON con.C_IDX = cat.C_IDX



--Å×ÀÌºí º¹»ç
select * into mh_map_contents_new from mh_map_contents where 1=2
select * into mh_map_contents_modify from mh_map_contents where 1=2

--À¯´Ï¿ÂÀ¸·Î ºÒ·¯¿È
select * from mh_map_contents_new
union all
select * from mh_map_contents_modify 
order by DATE


SELECT ISNULL(MAX(MN_IDX), 0)+1 FROM mh_map_contents_new

SELECT MAX(MN_IDX) FROM mh_map_contents_new

select * from mh_map_checked_service_new

insert into mh_map_checked_service (M_IDX, S_IDX) values (1,1);

insert into mh_map_contents_modify
(BRAND_NAME, ADDRESS, LATITUDE, LONGITUDE, TEL, ON_DAY, OFF_DAY, PAGE_LINK, RENT_GUBUN, SCALE, PRICE, INTRO, IMAGES,
FILEDNAME, FILETYPE, FILENAME, FILEPATH, FILEURLPATH, FILESIZE, FILERENAME, C_IDX, DATE, M_EMAIL, M_NAME2) values
('Å×½ºÆ® ¼ºµ¿ºê·£µå¸í6', '¼­¿ï½Ã °­³²±¸ °­³²´ë·Î 11', 37.494655822816566, 126.99189838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www', 1 , 'ÆíÀÇ ½Ã¼³', 10000, '¼Ò°³±Û', 'testmapimg.jpg', 
null, null , null, null, null, null, null, null,
getdate(), null, null)

insert into mh_map_contents_new
(BRAND_NAME, ADDRESS, LATITUDE, LONGITUDE, TEL, ON_DAY, OFF_DAY, PAGE_LINK, RENT_GUBUN, SCALE, PRICE, INTRO, IMAGES,
FILEDNAME, FILETYPE, FILENAME, FILEPATH, FILEURLPATH, FILESIZE, FILERENAME, C_IDX, DATE, M_EMAIL, M_NAME2) values
('Å×½ºÆ® ¼ºµ¿ºê·£µå¸í6', '¼­¿ï½Ã °­³²±¸ °­³²´ë·Î 11', 37.494655822816566, 126.99189838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '¸ÅÁÖ È­¿äÀÏ', 'www.www.www', 1 , 'ÆíÀÇ ½Ã¼³', 10000, '¼Ò°³±Û', 'testmapimg.jpg');


select con.*, cat.* from
(select * from mh_map_contents where PATINDEX(dbo.Initial_SearchText('%%') , BRAND_NAME) > 0) AS con JOIN
mh_map_categories AS cat
ON con.C_IDX = cat.C_IDX
JOIN mh_map_categories_joso joso
ON con.J_IDX = joso.J_IDX
and con.LATITUDE BETWEEN 0 AND 100
and con.LONGITUDE BETWEEN 127 AND 128

select con.*, cat.* from
		(select * from mh_map_contents where PATINDEX(dbo.Initial_SearchText('%%') , BRAND_NAME) > 0) AS con JOIN
		mh_map_categories AS cat
        ON con.C_IDX = cat.C_IDX
		JOIN mh_map_categories_joso joso
		ON con.J_IDX = joso.J_IDX
		and joso.JOSO_NAME = '¿Õ½Ê¸®Á¦2µ¿'



select * from mh_admin_damo
select * from mh_adminCngLog

select * from mh_mem_20171110
select * from mh_mem_20200610
select * from mh_mem_damo
select * from MH_MEM2_20200526






select con.*, cat.* from
		mh_map_contents con JOIN
		mh_map_categories AS cat
        ON con.C_IDX = cat.C_IDX
		JOIN mh_map_categories_joso joso
		ON con.J_IDX = joso.J_IDX
		WHERE con.BRAND_NAME LIKE '%µµ¼­°ü%'



SELECT count(*) totcnt FROM
			(
	    	SELECT CON.M_IDX
				,CON.BRAND_NAME
				,CON.ADDRESS
				,CON.LATITUDE
				,CON.LONGITUDE
				,CON.TEL
				,CON.ON_DAY_WEEK
				,CON.ON_DAY_WEEKEND
				,CON.OFF_DAY
				,CON.PAGE_LINK
				,CON.FILEDNAME
				,CON.FILETYPE
				,CON.FILENAME
				,CON.FILEPATH
				,CON.FILEURLPATH
				,CON.FILESIZE
				,CON.FILERENAME
				,CON.C_IDX
				,CON.DATE
				,CON.M_EMAIL
				,CON.M_NAME2
				,CON.J_IDX
				,CON.OPACTIY
				
			from mh_map_contents			con
			JOIN mh_map_categories			cat
			ON con.C_IDX = cat.C_IDX
			JOIN mh_map_categories_joso		joso
			ON con.J_IDX = joso.J_IDX

			 		JOIN mh_map_checked_service		ser
					ON con.M_IDX = ser.M_IDX
			WHERE con.BRAND_NAME LIKE '%µµ¼­°ü%'
			AND con.M_EMAIL LIKE '%%'
			AND con.M_NAME2 LIKE '%%'
			AND con.TEL LIKE '%%'
			AND con.J_IDX LIKE '%%'
			AND con.C_IDX LIKE '%%'
			GROUP BY CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.LATITUDE, CON.LONGITUDE, CON.TEL, CON.ON_DAY_WEEK, CON.ON_DAY_WEEKEND, CON.OFF_DAY, CON.PAGE_LINK, CON.FILEDNAME, CON.FILETYPE, CON.FILENAME, CON.FILEPATH, CON.FILEURLPATH, CON.FILESIZE, CON.FILERENAME, CON.C_IDX, CON.DATE, CON.M_EMAIL, CON.M_NAME2, CON.J_IDX, CON.OPACTIY
			) N


--======================================================================================================
SELECT count(*) totcnt FROM
		(
	select CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.TEL, CON.PAGE_LINK,CON.DATE, CON.M_EMAIL, CON.M_NAME2
		from mh_map_contents con
		LEFT JOIN mh_map_categories cat
		ON con.C_IDX = cat.C_IDX
		LEFT JOIN mh_map_categories_joso joso
		ON con.J_IDX = joso.J_IDX
		LEFT JOIN mh_map_checked_service ser
		ON con.M_IDX = ser.M_IDX
	WHERE con.M_EMAIL LIKE '%%'
	AND con.M_NAME2 LIKE '%%'
	AND con.TEL LIKE '%%'
	AND joso.J_IDX = 1
	AND ser.S_IDX IN (1,2)
	GROUP BY CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.TEL, CON.PAGE_LINK,CON.DATE, CON.M_EMAIL, CON.M_NAME2
) N

SELECT * FROM mh_map_contents
WHERE J_IDX = 1

-- ¿©±â¼­
SELECT count(*) totcnt FROM
	(
	select CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.TEL, CON.PAGE_LINK,CON.DATE, CON.M_EMAIL, CON.M_NAME2
		from mh_map_contents con
		JOIN mh_map_categories cat
		ON con.C_IDX = cat.C_IDX
		JOIN mh_map_categories_joso joso
		ON con.J_IDX = joso.J_IDX
		JOIN mh_map_checked_service ser
		ON con.M_IDX = ser.M_IDX
	WHERE con.BRAND_NAME LIKE '%%'
	AND con.M_EMAIL LIKE '%%'
	AND con.M_NAME2 LIKE '%%'
	AND con.TEL LIKE '%%'
	AND con.J_IDX = 1
	--AND con.C_IDX = 
	--AND ser.S_IDX IN (1,2)
	GROUP BY CON.M_IDX,
	) N

-- ¿©±â±îÁö



SELECT count(*) totcnt FROM
		(
    select con.*
    from mh_map_contents con
        JOIN mh_map_categories cat
          ON con.C_IDX = cat.C_IDX
        JOIN mh_map_checked_service cser
          ON cser.M_IDX = con.M_IDX
        JOIN mh_map_service ser
          ON ser.S_IDX = cser.S_IDX
    ) N




SELECT * FROM
		(
		SELECT ROW_NUMBER() OVER(ORDER BY N.M_IDX DESC) AS RNUM, N.* FROM
			(
    	
	    	SELECT CON.M_IDX
				,CON.BRAND_NAME
				,CON.ADDRESS
				,CON.LATITUDE
				,CON.LONGITUDE
				,CON.TEL
				,CON.ON_DAY_WEEK
				,CON.ON_DAY_WEEKEND
				,CON.OFF_DAY
				,CON.PAGE_LINK
				,CON.FILEDNAME
				,CON.FILETYPE
				,CON.FILENAME
				,CON.FILEPATH
				,CON.FILEURLPATH
				,CON.FILESIZE
				,CON.FILERENAME
				,CON.C_IDX
				,CON.DATE
				,CON.M_EMAIL
				,CON.M_NAME2
				,CON.J_IDX
				,CON.OPACTIY
				from 
				(
					SELECT cont.*, ser.S_IDX,  count(ser.S_IDX) over(partition by cont.M_IDX)FROM
					mh_map_contents			cont
					JOIN mh_map_categories			cat
					ON cont.C_IDX = cat.C_IDX
					JOIN mh_map_categories_joso		joso
					ON cont.J_IDX = joso.J_IDX
					LEFT JOIN mh_map_checked_service ser
					ON cont.M_IDX = ser.M_IDX
					WHERE cont.BRAND_NAME LIKE '%%'
					AND cont.M_EMAIL LIKE '%%'
					AND cont.M_NAME2 LIKE '%%'
					AND cont.TEL LIKE '%%'
					AND ser.S_IDX IN (1,10)
				)CON
			GROUP BY CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.LATITUDE, CON.LONGITUDE, CON.TEL, CON.ON_DAY_WEEK, CON.ON_DAY_WEEKEND, CON.OFF_DAY, CON.PAGE_LINK, CON.FILEDNAME, CON.FILETYPE, CON.FILENAME, CON.FILEPATH, CON.FILEURLPATH, CON.FILESIZE, CON.FILERENAME, CON.C_IDX, CON.DATE, CON.M_EMAIL, CON.M_NAME2, CON.J_IDX, CON.OPACTIY
			) N
	    ) R
	WHERE R.RNUM BETWEEN 1 AND 10





SELECT * FROM
    (
	SELECT ROW_NUMBER() OVER(ORDER BY N.M_IDX DESC) AS RNUM, N.* FROM
		(
		select con.* from
		mh_map_contents AS con 
		LEFT JOIN mh_map_categories AS cat
		ON con.C_IDX = cat.C_IDX
		LEFT JOIN mh_map_categories_joso		joso
			ON con.J_IDX = joso.J_IDX
		) N
    ) R
WHERE R.RNUM BETWEEN 1 AND 5





 SELECT count(*) totcnt, N.* FROM
		(
		select CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.TEL, CON.PAGE_LINK,CON.DATE, CON.M_EMAIL, CON.M_NAME2
			(
			
			)
			from mh_map_contents con
			LEFT JOIN mh_map_categories cat
			ON con.C_IDX = cat.C_IDX
			LEFT JOIN mh_map_categories_joso joso
			ON con.J_IDX = joso.J_IDX
			LEFT JOIN mh_map_checked_service ser
			ON con.M_IDX = ser.M_IDX
		WHERE con.BRAND_NAME LIKE '%%'
		AND con.M_EMAIL LIKE '%%'
		AND con.M_NAME2 LIKE '%%'
		AND con.TEL LIKE '%%'
		GROUP BY CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.TEL, CON.PAGE_LINK,CON.DATE, CON.M_EMAIL, CON.M_NAME2
		)N



SELECT * FROM
		(
		SELECT ROW_NUMBER() OVER(ORDER BY N.M_IDX DESC) AS RNUM, N.* FROM
			(
    	
	    	SELECT CON.M_IDX
				,CON.BRAND_NAME
				,CON.ADDRESS
				,CON.LATITUDE
				,CON.LONGITUDE
				,CON.TEL
				,CON.ON_DAY_WEEK
				,CON.ON_DAY_WEEKEND
				,CON.OFF_DAY
				,CON.PAGE_LINK
				,CON.FILEDNAME
				,CON.FILETYPE
				,CON.FILENAME
				,CON.FILEPATH
				,CON.FILEURLPATH
				,CON.FILESIZE
				,CON.FILERENAME
				,CON.C_IDX
				,CON.DATE
				,CON.M_EMAIL
				,CON.M_NAME2
				,CON.J_IDX
				,CON.OPACTIY
				from 
					(
					SELECT cont.*, ser.S_IDX,  count(ser.S_IDX) over(partition by cont.M_IDX) CNTFROM
					mh_map_contents			        cont
					JOIN mh_map_categories			cat
					ON cont.C_IDX = cat.C_IDX
					JOIN mh_map_categories_joso		joso
					ON cont.J_IDX = joso.J_IDX
					LEFT JOIN mh_map_checked_service ser
					ON cont.M_IDX = ser.M_IDX
					WHERE cont.BRAND_NAME LIKE '%%'
					AND cont.M_EMAIL LIKE '%%'
					AND cont.M_NAME2 LIKE '%%'
					AND cont.TEL LIKE '%%'
					AND ser.S_IDX IN (1,10)
					)CON
			GROUP BY CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.LATITUDE, CON.LONGITUDE, CON.TEL, CON.ON_DAY_WEEK, CON.ON_DAY_WEEKEND, CON.OFF_DAY, CON.PAGE_LINK, CON.FILEDNAME, CON.FILETYPE, CON.FILENAME, CON.FILEPATH, CON.FILEURLPATH, CON.FILESIZE, CON.FILERENAME, CON.C_IDX, CON.DATE, CON.M_EMAIL, CON.M_NAME2, CON.J_IDX, CON.OPACTIY
			
			) N
	    ) R
	WHERE R.RNUM BETWEEN 1 AND 10



SELECT * FROM
		(
		SELECT ROW_NUMBER() OVER(ORDER BY N.M_IDX DESC) AS RNUM, N.* FROM
			(
    	
	    	SELECT CON.M_IDX
				,CON.BRAND_NAME
				,CON.ADDRESS
				,CON.LATITUDE
				,CON.LONGITUDE
				,CON.TEL
				,CON.ON_DAY_WEEK
				,CON.ON_DAY_WEEKEND
				,CON.OFF_DAY
				,CON.PAGE_LINK
				,CON.FILEDNAME
				,CON.FILETYPE
				,CON.FILENAME
				,CON.FILEPATH
				,CON.FILEURLPATH
				,CON.FILESIZE
				,CON.FILERENAME
				,CON.C_IDX
				,CON.DATE
				,CON.M_EMAIL
				,CON.M_NAME2
				,CON.J_IDX
				,CON.OPACTIY
				
			from 
			mh_map_contents			con
			LEFT JOIN mh_map_categories			cat
			ON con.C_IDX = cat.C_IDX
			LEFT JOIN mh_map_categories_joso		joso
			ON con.J_IDX = joso.J_IDX
		 	<isNotEmpty  property="s_idxslist">
			 		LEFT JOIN mh_map_checked_service		ser
					ON con.M_IDX = ser.M_IDX
			       <iterate prepend="AND ser.S_IDX IN" property="s_idxslist" open="(" close=")" conjunction=",">
			            #s_idxslist[]#
			       </iterate>
		    </isNotEmpty>
			
			WHERE con.BRAND_NAME LIKE '%'+#brand_name#+'%'
			AND con.M_EMAIL LIKE '%'+#user_id#+'%'
			AND con.M_NAME2 LIKE '%'+#user_name#+'%'
			AND con.TEL LIKE '%'+#user_tel#+'%'
			<isNotEqual property="j_idx" compareValue="">
				AND con.J_IDX = #j_idx#
			</isNotEqual>
			<isNotEqual property="c_idx" compareValue="">
				AND con.C_IDX = #c_idx#
			</isNotEqual>
			GROUP BY CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.LATITUDE, CON.LONGITUDE, CON.TEL, CON.ON_DAY_WEEK, CON.ON_DAY_WEEKEND, CON.OFF_DAY, CON.PAGE_LINK, CON.FILEDNAME, CON.FILETYPE, CON.FILENAME, CON.FILEPATH, CON.FILEURLPATH, CON.FILESIZE, CON.FILERENAME, CON.C_IDX, CON.DATE, CON.M_EMAIL, CON.M_NAME2, CON.J_IDX, CON.OPACTIY
			
			) N
	    ) R
	WHERE R.RNUM BETWEEN #startnum# AND #endnum#



SELECT * FROM
		(
		SELECT ROW_NUMBER() OVER(ORDER BY N.M_IDX DESC) AS RNUM, N.* FROM
			(
    	
	    	SELECT CON.M_IDX
				,CON.BRAND_NAME
				,CON.ADDRESS
				,CON.LATITUDE
				,CON.LONGITUDE
				,CON.TEL
				,CON.ON_DAY_WEEK
				,CON.ON_DAY_WEEKEND
				,CON.OFF_DAY
				,CON.PAGE_LINK
				,CON.FILEDNAME
				,CON.FILETYPE
				,CON.FILENAME
				,CON.FILEPATH
				,CON.FILEURLPATH
				,CON.FILESIZE
				,CON.FILERENAME
				,CON.C_IDX
				,CON.DATE
				,CON.M_EMAIL
				,CON.M_NAME2
				,CON.J_IDX
				,CON.OPACTIY
				from 
					(
					SELECT cont.*, ser.S_IDX FROM
					mh_map_contents			        cont
					JOIN mh_map_categories			cat
					ON cont.C_IDX = cat.C_IDX
					JOIN mh_map_categories_joso		joso
					ON cont.J_IDX = joso.J_IDX
					LEFT JOIN mh_map_checked_service ser
					ON cont.M_IDX = ser.M_IDX
					WHERE cont.BRAND_NAME LIKE '%%'
					AND cont.M_EMAIL LIKE '%%'
					AND cont.M_NAME2 LIKE '%%'
					AND cont.TEL LIKE '%%'
					AND ser.S_IDX IN (1,10,15)
					)CON
			GROUP BY CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.LATITUDE, CON.LONGITUDE, CON.TEL, CON.ON_DAY_WEEK, CON.ON_DAY_WEEKEND, CON.OFF_DAY, CON.PAGE_LINK, CON.FILEDNAME, CON.FILETYPE, CON.FILENAME, CON.FILEPATH, CON.FILEURLPATH, CON.FILESIZE, CON.FILERENAME, CON.C_IDX, CON.DATE, CON.M_EMAIL, CON.M_NAME2, CON.J_IDX, CON.OPACTIY
			
			) N
	    ) R
	WHERE R.RNUM BETWEEN 1 AND 10

	SELECT * FROM mh_map_checked_service
	WHERE S_IDX IN (2,10)
	AND S_IDX = 10




SELECT * FROM
		(
		SELECT ROW_NUMBER() OVER(ORDER BY N.M_IDX DESC) AS RNUM, N.* FROM
			(
    	
	    	SELECT CON.M_IDX
				,CON.BRAND_NAME
				,CON.ADDRESS
				,CON.LATITUDE
				,CON.LONGITUDE
				,CON.TEL
				,CON.ON_DAY_WEEK
				,CON.ON_DAY_WEEKEND
				,CON.OFF_DAY
				,CON.PAGE_LINK
				,CON.FILEDNAME
				,CON.FILETYPE
				,CON.FILENAME
				,CON.FILEPATH
				,CON.FILEURLPATH
				,CON.FILESIZE
				,CON.FILERENAME
				,CON.C_IDX
				,CON.DATE
				,CON.M_EMAIL
				,CON.M_NAME2
				,CON.J_IDX
				,CON.OPACTIY
				
			from mh_map_contents			con
			LEFT JOIN mh_map_categories			cat
			ON con.C_IDX = cat.C_IDX
			LEFT JOIN mh_map_categories_joso		joso
			ON con.J_IDX = joso.J_IDX
			LEFT JOIN mh_map_checked_service		ser
			ON con.M_IDX = ser.M_IDX
		
			WHERE con.BRAND_NAME LIKE '%%'
			AND con.M_EMAIL LIKE '%%'
			AND con.M_NAME2 LIKE '%%'
			AND con.TEL LIKE '%%'
			AND con.M_IDX in (
				select M_IDX
				from mh_map_checked_service
				where S_IDX in (1,2,4)
				group by M_IDX
				having count(*)=3
			)
			GROUP BY CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.LATITUDE, CON.LONGITUDE, CON.TEL, CON.ON_DAY_WEEK, CON.ON_DAY_WEEKEND, CON.OFF_DAY, CON.PAGE_LINK, CON.FILEDNAME, CON.FILETYPE, CON.FILENAME, CON.FILEPATH, CON.FILEURLPATH, CON.FILESIZE, CON.FILERENAME, CON.C_IDX, CON.DATE, CON.M_EMAIL, CON.M_NAME2, CON.J_IDX, CON.OPACTIY
			
			) N
	    ) R
	WHERE R.RNUM BETWEEN 1 AND 10

	SELECT * FROM mh_map_checked_service
	WHERE M_IDX = 191

	SELECT
    *
FROM contents cont 
LEFT JOIN 
service ser1 
ON (cont.M_IDX = ser1.M_IDX AND ser1.S_IDX = 1)
LEFT JOIN service ser2 ON (ser1.M_IDX = ser2.M_IDX AND ser2.S_IDX = 3)



			
		 SELECT count(*) totcnt FROM
		(
		select CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.TEL, CON.PAGE_LINK,CON.DATE, CON.M_EMAIL, CON.M_NAME2
			from mh_map_contents con
			LEFT JOIN mh_map_categories cat
			ON con.C_IDX = cat.C_IDX
			LEFT JOIN mh_map_categories_joso joso
			ON con.J_IDX = joso.J_IDX
			LEFT JOIN mh_map_checked_service ser
			ON con.M_IDX = ser.M_IDX
		WHERE con.BRAND_NAME LIKE '%%'
		AND con.M_EMAIL LIKE '%%'
		AND con.M_NAME2 LIKE '%%'
		AND con.TEL LIKE '%%'
		AND con.M_IDX in (
				select M_IDX
				from mh_map_checked_service
				where S_IDX in (1,2,4)
				group by M_IDX
				having count(*)=3
			)
		GROUP BY CON.M_IDX, CON.BRAND_NAME, CON.ADDRESS, CON.TEL, CON.PAGE_LINK,CON.DATE, CON.M_EMAIL, CON.M_NAME2
		)N

		select * from mh_map_contents con
		LEFT JOIN mh_map_checked_service ser
			ON con.M_IDX = ser.M_IDX
		where J_IDX = 1
		and C_IDX = 39

		select * from mh_map_contents_new


select * 
		from mh_map_contents con
		LEFT JOIN mh_map_categories cat
		ON con.C_IDX = cat.C_IDX
		LEFT JOIN mh_map_categories_joso joso
		ON con.J_IDX = joso.J_IDX
		where con.M_IDX = 297
		
		where joso.JOSO_NAME = 'Çà´çÁ¦1µ¿'
		and OPACTIY = 1
	    <isNotEmpty property="l_categories">
       		<isNotEqual property="l_categories" compareValue="´ëºÐ·ù">
				and L_CATEGORIES = #l_categories#


select * from mh_map_contents
insert into 
			mh_map_contents
				(
					BRAND_NAME, 
					ADDRESS, 
					LATITUDE, 
					LONGITUDE, 
					TEL, 
					ON_DAY_WEEK, 
					C_IDX
				) 
				values
				(
					'°Å¸¶µµ', 
					'¼­¿ï ¼ºµ¿±¸ ¿Õ½Ê¸®·Î 292-1 B1', 
					37.5604282919427, 
					127.036583470918,
					'010-5298-0114',
					'ÆòÀÏ 10:00 - 19:00',
					66
				)



select 
	con.M_IDX, con.BRAND_NAME, con.ADDRESS,con.LATITUDE, con.LONGITUDE, con.TEL, con.ON_DAY_WEEK, con.ON_DAY_WEEKEND, con.OFF_DAY, con.PAGE_LINK,
	con.INTRO, con.FILEURLPATH, con.FILERENAME, con.C_IDX, cat.L_CATEGORIES,cat.M_CATEGORIES 
from
mh_map_contents AS con 
LEFT JOIN mh_map_categories AS cat
ON con.C_IDX = cat.C_IDX
LEFT JOIN mh_map_categories_joso joso
ON con.J_IDX = joso.J_IDX
where OPACTIY = 1
and L_CATEGORIES = 'Àü½ÃÀå'
and joso.J_IDX = #select_joso#
order by cat.M_CATEGORIES


select  
	con.M_IDX, con.BRAND_NAME, con.ADDRESS,con.LATITUDE, con.LONGITUDE, con.TEL, con.ON_DAY_WEEK, con.ON_DAY_WEEKEND, con.OFF_DAY, con.PAGE_LINK,
	con.INTRO, con.FILEURLPATH, con.FILERENAME, con.C_IDX, cat.L_CATEGORIES,cat.M_CATEGORIES, joso.J_IDX, joso.JOSO_NAME
from mh_map_contents con
LEFT JOIN mh_map_categories cat
ON con.C_IDX = cat.C_IDX
LEFT JOIN mh_map_categories_joso joso
ON con.J_IDX = joso.J_IDX
where OPACTIY = 1
and joso.J_IDX = 5
order by cat.C_IDX, cat.
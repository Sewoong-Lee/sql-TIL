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
WHERE L_CATEGORIES = '서점'

select * from mh_map_contents
where M_IDX = 298

SELECT * FROM mh_map_categories ORDER BY 
case L_CATEGORIES when L_CATEGORIES = '재단운영시설'

select * from mh_map_categories_joso
where JOSO_NAME = '행당제1동'

select con.M_IDX, con.BRAND_NAME, con.ADDRESS,con.LATITUDE, con.LONGITUDE, con.TEL, con.ON_DAY_WEEK, con.ON_DAY_WEEKEND, con.OFF_DAY, con.PAGE_LINK,
		con.INTRO, con.FILEURLPATH, con.FILERENAME, con.C_IDX, cat.L_CATEGORIES,cat.M_CATEGORIES, joso.J_IDX, joso.JOSO_NAME
		from mh_map_contents con
		LEFT JOIN mh_map_categories cat
		ON con.C_IDX = cat.C_IDX
		LEFT JOIN mh_map_categories_joso joso
		ON con.J_IDX = joso.J_IDX
		where OPACTIY = 1
		and joso.J_IDX = 5
		and cat.L_CATEGORIES = '복합문화공간'
		order by cat.C_IDX


SELECT
	C_IDX,
	L_CATEGORIES,
	M_CATEGORIES,
	CASE 
		WHEN L_CATEGORIES = '재단운영시설' THEN 1
		ELSE 0 
	END AS is_top
FROM mh_map_categories
ORDER BY is_top DESC, L_CATEGORIES


select 
			con.M_IDX, con.BRAND_NAME, con.ADDRESS,con.LATITUDE, con.LONGITUDE, con.TEL, con.ON_DAY_WEEK, con.ON_DAY_WEEKEND, con.OFF_DAY, con.PAGE_LINK,
			con.INTRO, con.FILEURLPATH, con.FILERENAME, con.C_IDX, cat.L_CATEGORIES,cat.M_CATEGORIES,
			CASE 
				WHEN cat.M_CATEGORIES = '기타' THEN 1
				ELSE 0 
			END AS is_dwon
		from
		mh_map_contents AS con 
		LEFT JOIN mh_map_categories AS cat
	    ON con.C_IDX = cat.C_IDX
	    LEFT JOIN mh_map_categories_joso joso
		ON con.J_IDX = joso.J_IDX
		where OPACTIY = 1
		and cat.L_CATEGORIES = '전시장'
		order by is_dwon, cat.M_CATEGORIES

SELECT * FROM mh_map_categories
WHERE L_CATEGORIES = '전시장'


SELECT * FROM 
mh_map_contents AS con 
LEFT JOIN mh_map_categories AS cat
ON con.C_IDX = cat.C_IDX
WHERE cat.L_CATEGORIES = '전시장'



















select * from mh_map_contents
where M_IDX = 298


--UPDATE mh_map_categories
--set 
--L_CATEGORIES = '전시장'
--WHERE L_CATEGORIES = '전시관';

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

--===============================테이블 컬럼 증가값 초기화
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
		where joso.JOSO_NAME = '마장동'
		and CON.BRAND_NAME = '마장국민체육센터'
		and cat.L_CATEGORIES = '도서관'
		and cat.M_CATEGORIES = '도서관'


<isNotEqual property="select_joso" compareValue="지역 분류">
			and joso.JOSO_NAME = #select_joso#
		</isNotEqual>
SELECT C_IDX, L_CATEGORIES, M_CATEGORIES, CASE WHEN L_CATEGORIES = '재단운영시설' THEN 1 ELSE 0 END AS is_top FROM mh_map_categories ORDER BY is_top DESC, L_CATEGORIES


--UPDATE mh_map_contents SET M_EMAIL = ISNULL(M_EMAIL,getdate())
--UPDATE mh_map_contents SET OFF_DAY = ISNULL(OFF_DAY, '')
--UPDATE mh_map_contents SET PAGE_LINK = ISNULL(PAGE_LINK, '')
--UPDATE mh_map_contents SET INTRO = ISNULL(INTRO, '')
UPDATE mh_map_contents SET M_EMAIL = ''
UPDATE mh_map_contents SET M_NAME2 = ''


DELETE FROM mh_map_contents
where M_IDX = 310

SELECT * FROM mh_map_contents
where BRAND_NAME = '등록제안1'

SELECT @@SERVERNAME

select * from mh_map_contents_new
ORDER BY DATE DESC


------검색 조회다아아아아----------------------------------------------------------------------------------------------------------------------------------------------
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
		--,ISNULL(CON.INTRO,'NULL입니다') AS STR_INTRO
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

--페이징 처리 빌드업
select *
    from mh_map_contents con
    JOIN mh_map_categories cat
      ON con.C_IDX = cat.C_IDX
    JOIN mh_map_checked_service cser
      ON cser.M_IDX = con.M_IDX
    JOIN mh_map_service ser
      ON ser.S_IDX = cser.S_IDX
ORDER BY con.BRAND_NAME

--페이징 처리 빌드업2 (로우넘버 활용)
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


--페이징 처리 빌드업2 (로우넘버 활용2)
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
					--,ISNULL(CON.INTRO,'NULL입니다') AS STR_INTRO
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


-- 검색 개시물 개수 확인
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
			--,ISNULL(CON.INTRO,'NULL입니다') AS STR_INTRO
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


--등록 수정 리스트 카운트
SELECT count(*) 
FROM mh_map_contents_new

--등록 수정 로우넘버 출력 리스트
SELECT * FROM
    (
    SELECT ROW_NUMBER() OVER(ORDER BY N.DATE DESC) AS RNUM, N.* FROM
        (
			SELECT * FROM mh_map_contents_new
        ) N
    ) R
WHERE R.RNUM BETWEEN 1 AND 10


--더보기 셀렉트
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

--테이블 데이터 복사
--이건 전체 다 똑같아야해서 안댐
INSERT 
  INTO mh_map_contents
SELECT *
  FROM mh_map_contents_new
 WHERE MN_IDX = 3
 --이거로 씀
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
OFF_DAY = '없음',
PAGE_LINK = '없음',
INTRO = '없음',
FILEDNAME = '없음',
FILETYPE = '없음',
FILENAME = '없음',
FILEPATH = '없음',
FILEURLPATH = '없음',
FILESIZE = '없음',
FILERENAME = '없음',
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

-- 이거로 검색 ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ---------------------------------------------------------------------------------------------------------------
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
		(select * from mh_map_contents where PATINDEX(dbo.Initial_SearchText('%ㅇ%') , BRAND_NAME) > 0) AS con JOIN
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
('테스트 브랜드명1', '서울시 강남구 강남대로 11', 37.495655822816566, 126.99289838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www', 1 , '편의 시설', 10000, '소개글', 'testmapimg.jpg');

insert into mh_map_contents values
('테스트 재단명2', '서울시 강남구 강남대로 11', 37.496655822816566, 126.99289838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www', 1 , '편의 시설', 10000, '소개글', 'testmapimg.jpg');

insert into mh_map_contents values
('테스트 브랜드재단명3', '서울시 강남구 강남대로 11', 37.494655822816566, 126.99289838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www', 0 , '편의 시설', 10000, '소개글', 'testmapimg.jpg');

insert into mh_map_contents values
('테스트 성동재단명4', '서울시 강남구 강남대로 11', 37.495655822816566, 126.99389838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www', 0 , '편의 시설', 10000, '소개글', 'testmapimg.jpg');

insert into mh_map_contents values
('테스트 법인명5', '서울시 강남구 강남대로 11', 37.496655822816566, 126.99489838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www', 1 , '편의 시설', 10000, '소개글', 'testmapimg.jpg');

insert into mh_map_contents values
('테스트 성동브랜드명6', '서울시 강남구 강남대로 11', 37.494655822816566, 126.99189838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www', 1 , '편의 시설', 10000, '소개글', 'testmapimg.jpg');

--서비스 인서트
insert into mh_map_service values
('주차'),
('대관'),
('포장'),
('배달'),
('예약'),
('무선인터넷'),
('반려동물 동반'),
('유아시설(놀이방)'),
('남/녀 화장실 구분'),
('지역화폐(지류형)'),
('지역화폐(카드형)'),
('지역화폐(모바일형)'),
('제로페이'),
('장애인 편의시설');
insert into mh_map_service values
('국민지원금');
SELECT * FROM mh_map_service


insert into mh_map_categories_joso values
('왕십리제2동'),
('왕십리도선동'),
('마장동'),
('사근동'),
('행당제1동'),
('행당제2동'),
('응봉동'),
('금호1가동'),
('금호2,3가동'),
('금호4가동'),
('옥수동'),
('성수1가제1동'),
('성수1가제2동'),
('성수2가제1동'),
('성수2가제3동'),
('송정동'),
('용답동');

select * from mh_map_categories_joso


insert into mh_map_categories values
('성동문화재단 운영 시설', '성동문화재단', '성동문화재단')


select * from mh_mem

select * from mh_map_categories

insert into mh_map_categories values
('전시관', '국공립미술관')

insert into mh_map_categories values
('재단 운영 시설', '도서관'),
('재단 운영 시설', '공연장'),
('재단 운영 시설', '전시실'),
('재단 운영 시설', '청년시설'),
('재단 운영 시설', '어린이집'),
('재단 운영 시설', '돌봄시설'),
('재단 운영 시설', '기타'),
('도서관', '공공도서관'),
('도서관', '민간도서관'),
('전시관', '공공미술관'),
('전시관', '사립미술관'),
('전시관', '갤러리'),
('전시관', '기타'),
('공연장', '공공공연장'),
('공연장', '민간공연장'),
('박물관', '공공박물관'),
('박물관', '민간박물관'),
('주민시설', '문예회관'),
('주민시설', '구민회관'),
('주민시설', '종합복지회관'),
('주민시설', '구민다목적체육시설'),
('주민시설', '청소년 수련시설'),
('주민시설', '청년시설'),
('문화재', '국가지정문화재'),
('문화재', '시도지정문화재'),
('문화재', '서울미래유산'),
('문화재', '등록문화재'),
('책방', '독립서점'),
('책방', '헌책방'),
('책방', '서점');
insert into mh_map_categories values
('문화원', NULL),
('영화관', NULL),
('공방', NULL),
('복합문화공간', NULL);


insert into mh_map_categories(L_CATEGORIES, M_CATEGORIES) values
('성동문화재단 운영 시설', '테스트1'),
('성동문화재단 운영 시설', '테스트2')


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

select con.*, cat.* from
mh_map_contents AS con JOIN
(select * from mh_map_categories where PATINDEX(dbo.Initial_SearchText('%%') , S_CATEGORIES) > 0) cat
ON con.C_IDX = cat.C_IDX



--테이블 복사
select * into mh_map_contents_new from mh_map_contents where 1=2
select * into mh_map_contents_modify from mh_map_contents where 1=2

--유니온으로 불러옴
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
('테스트 성동브랜드명6', '서울시 강남구 강남대로 11', 37.494655822816566, 126.99189838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www', 1 , '편의 시설', 10000, '소개글', 'testmapimg.jpg', 
null, null , null, null, null, null, null, null,
getdate(), null, null)

insert into mh_map_contents_new
(BRAND_NAME, ADDRESS, LATITUDE, LONGITUDE, TEL, ON_DAY, OFF_DAY, PAGE_LINK, RENT_GUBUN, SCALE, PRICE, INTRO, IMAGES,
FILEDNAME, FILETYPE, FILENAME, FILEPATH, FILEURLPATH, FILESIZE, FILERENAME, C_IDX, DATE, M_EMAIL, M_NAME2) values
('테스트 성동브랜드명6', '서울시 강남구 강남대로 11', 37.494655822816566, 126.99189838317954, 
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www', 1 , '편의 시설', 10000, '소개글', 'testmapimg.jpg');


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
		and joso.JOSO_NAME = '왕십리제2동'



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
		WHERE con.BRAND_NAME LIKE '%도서관%'



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
			WHERE con.BRAND_NAME LIKE '%도서관%'
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

-- 여기서
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

-- 여기까지



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
		
		where joso.JOSO_NAME = '행당제1동'
		and OPACTIY = 1
	    <isNotEmpty property="l_categories">
       		<isNotEqual property="l_categories" compareValue="대분류">
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
					'거마도', 
					'서울 성동구 왕십리로 292-1 B1', 
					37.5604282919427, 
					127.036583470918,
					'010-5298-0114',
					'평일 10:00 - 19:00',
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
and L_CATEGORIES = '전시장'
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
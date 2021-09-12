ROLLBACK;
COMMIT;


DROP TABLE countrycovid;

SELECT * FROM countrycovid;

CREATE TABLE countrycovid(
sfty_notice_id VARCHAR2(20), --안전공지 ID
continent_cd VARCHAR2(10), --대륙코드
continent_eng_nm VARCHAR2(200), --영문 대륙코드
continent_nm VARCHAR2(100), --한국 대륙명
country_eng_nm VARCHAR2(200), --영문 국가명
country_iso_apl2 VARCHAR2(10), --ISO 2자리 코드
country_nm VARCHAR2(100), --한글 국가명
file_cnt NUMBER(10), -- 파일개수
file_download_url VARCHAR2(4000), -- 파일 다운로드 URL
file_path VARCHAR2(4000), --파일경로
html_origin_cn clob, --HTML원본 내용
title VARCHAR2(2000), --제목
txt_origin_cn clob, --원본 내용
wrt_dt VARCHAR2(10), --작성일
PRIMARY KEY (sfty_notice_id)
);

INSERT INTO countrycovid (sfty_notice_id, continent_cd, continent_eng_nm, continent_nm, country_eng_nm,
                            country_iso_apl2, country_nm, file_cnt, file_download_url, file_path,html_origin_cn,
                            title,txt_origin_cn, wrt_dt)
VALUES ('1','1','1','1','1','1','1',1,'1','1','1','1','zzzzz');



SELECT dbms_lob.substr(html_origin_cn, dbms_lob.getlength(html_origin_cn)) AS html_origin_cn
FROM countrycovid;

SELECT DBMS_LOB.SUBSTR(html_origin_cn, DBMS_LOB.GETLENGTH(html_origin_cn)) 
FROM countrycovid;

SELECT DBMS_LOB.SUBSTR(html_origin_cn, 2000, 1) as html_origin_cn1,
DBMS_LOB.SUBSTR(html_origin_cn, 3000, 30000) as html_origin_cn2
FROM countrycovid
WHERE sfty_notice_id = 'ATC0000000008588';

SELECT dbms_lob.substr(html_origin_cn, 2000) html_origin_cn 
FROM countrycovid
WHERE sfty_notice_id = 'ATC0000000008588';

INSERT INTO countrycovid (sfty_notice_id, continent_cd, continent_eng_nm, continent_nm, country_eng_nm,
                            country_iso_apl2, country_nm, file_cnt, file_download_url, file_path,html_origin_cn,
                            title,txt_origin_cn, wrt_dt)
VALUES ('1','1','1','1','1','1','1',1,'1','1','1','1','zzzzz');

SELECT sfty_notice_id, wrt_dt, continent_eng_nm, country_eng_nm, country_nm, title
FROM countrycovid 
WHERE country_nm  like '%' || '홍' || '%'
order by  wrt_dt DESC;


UPDATE countrycovid
set 
continent_cd = '1',
continent_eng_nm =  '0',
continent_nm =  '0',
country_eng_nm =  '0',
country_iso_apl2 =  '0',
country_nm =  '0',
file_cnt =  0,
file_download_url =  '0',
file_path = '0',
html_origin_cn =  '0',
title =  '0',
txt_origin_cn  =  '0',
wrt_dt =  '0'
WHERE sfty_notice_id = 'ATC0000000008456';

UPDATE countrycovid
set 

file_cnt =  1

WHERE sfty_notice_id = 'ATC0000000008588';

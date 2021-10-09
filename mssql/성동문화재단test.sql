select * from mh_map_contents;


insert into mh_map_contents values 
('성동문화재단', '서울시 강남구 강남대로 11', 37.495655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www',1 , '편의시설', '10000', '하이염', 'unnamed1.jpg')

insert into mh_map_contents values 
('성동복지재단', '서울시 강남구 탄탄대로 11', 37.496655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www',1 , '편의시설', '10000', '하이염', 'unnamed2.jpg')

insert into mh_map_contents values 
('성동파티재단', '서울시 강남구 부천구로 11', 37.494655822816566, 126.99289838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www',1 , '편의시설', '10000', '하이염', 'unnamed3.jpg')

insert into mh_map_contents values 
('성동11재단', '서울시 강남구 부천구로 11', 37.495655822816566, 126.99389838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www',1 , '편의시설', '10000', '하이염', 'unnamed4.jpg')

insert into mh_map_contents values 
('성동22재단', '서울시 강남구 부천구로 11', 37.496655822816566, 126.99489838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www',1 , '편의시설', '10000', '하이염', 'unnamed5.jpg')

insert into mh_map_contents values 
('성동33재단', '서울시 강남구 부천구로 11', 37.494655822816566, 126.99189838317954,
'010-000-0000', 'AM 10:00 ~ PM 10:00', '매주 화요일', 'www.www.www',1 , '편의시설', '10000', '하이염', 'unnamed5.jpg')

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

ROLLBACK;
COMMIT;


DROP TABLE foodjson;

SELECT * FROM foodjson;


CREATE TABLE foodjson(
ctprvnNm VARCHAR2(20), 
signguNm VARCHAR2(10), 
uptaenm VARCHAR2(10), 
mainMenu VARCHAR2(50), 
entrprsNm VARCHAR2(50), 
rdnmadr VARCHAR2(100),
telNo VARCHAR2(30), 
PRIMARY KEY (telNo)
);

INSERT INTO foodjson (ctprvnNm, signguNm, uptaenm, mainMenu, entrprsNm, rdnmadr, telNo)  
VALUES ('0','0','0','0','0','0','0');

SELECT * FROM foodjson
WHERE telNo = '0';


SELECT *
FROM foodjson 
WHERE mainMenu  like '%' || '°¨' || '%'
order by  entrprsNm
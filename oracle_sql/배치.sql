ROLLBACK;
COMMIT;


SELECT * FROM boardcnt
order by num desc;

CREATE TABLE boardcnt(
num number(5) PRIMARY KEY,
cnt number(10) not null,
regdate date DEFAULT sysdate
);

INSERT INTO boardcnt (num,cnt)  
VALUES (boardcnt_num.nextval,500);

DROP SEQUENCE boardcnt_num;
CREATE SEQUENCE boardcnt_num;
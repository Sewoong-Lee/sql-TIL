--½ºÇÁ¸µ ¸É¹ö

ROLLBACK;
COMMIT;

DROP TABLE member cascade constraints;

CREATE TABLE Springmember(
userid VARCHAR2(20) PRIMARY KEY,
passwd VARCHAR2(20) not null,
name VARCHAR2(3)
);

SELECT * FROM member;

INSERT INTO member(userid,passwd,name)
VALUES ('1','1','1');
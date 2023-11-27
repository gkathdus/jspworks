-- addrbook table 생성
CREATE TABLE addrbook(
    bnum        NUMBER PRIMARY KEY,
    username    VARCHAR2(20) NOT NULL,
    tel         VARCHAR2(20),
    email       VARCHAR2(30) UNIQUE,
    gender      VARCHAR2(6),
    regdate     TIMESTAMP DEFAULT SYSTIMESTAMP
);
CREATE SEQUENCE seq_bnum NOCACHE; -- 자동 순번

INSERT INTO addrbook(bnum, username, tel, email, gender)
VALUES (seq_bnum.NEXTVAL, '함소연', '010-1234-5678', 'W@naver.com', '여');

-- 이메일 중복 체크
INSERT INTO addrbook(bnum, username, tel, email, gender)
VALUES (seq_bnum.NEXTVAL, '서우창', '010-5678-1234', 'W@naver.com', '남');

COMMIT;

SELECT * FROM addrbook;

-- 이메일이 khit@kg.kr인 이메일 찾기
SELECT email FROM addrbook
WHERE email = 'wfwzzz@naver.com';

DELETE from addrbook WHERE bnum = 4;

DROP TABLE addrbook;
DROP SEQUENCE seq_bnum;
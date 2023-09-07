/*
BANK : ACCOUNT DateBase.
*/

CREATE TABLE ACCOUNT(
	id VARCHAR(100) PRIMARY KEY,
	NAME VARCHAR(100) NOT NULL,
	balance INT DEFAULT 0 CHECK (balance >= 0),
	grade VARCHAR(100)
);

##계좌생성
INSERT INTO ACCOUNT (id, NAME, balance, grade) VALUES ('10001', '홍길동', 100000, 'VIP');
INSERT INTO ACCOUNT (id, NAME, balance, grade) VALUES ('10002', '하길동', 100000, 'GOLD');

##입금
UPDATE ACCOUNT SET balance = balance + 10000 WHERE id = '10001';

##출금
UPDATE ACCOUNT SET balance = balance - 5000 WHERE id = '10001';

##계좌조회
SELECT * FROM ACCOUNT WHERE id = '10001';
SELECT * FROM ACCOUNT WHERE id = '10002';

##전체계좌조회
SELECT * FROM ACCOUNT;

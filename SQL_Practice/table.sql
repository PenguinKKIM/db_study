DROP TABLE article;
DROP TABLE utestdbser;


CREATE TABLE user (
	id VARCHAR(100),
	name VARCHAR(100) NOT NULL
);

CREATE TABLE article (
	num INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR (500),
	content VARCHAR (1000),
	writer VARCHAR(100)
);


## 테이블 밖에서 키 지정을 할 수도있다.
ALTER TABLE user  ADD CONSTRAINT USER_PK PRIMARY KEY(id);
ALTER TABLE article  ADD CONSTRAINT ARTICLE_USER_FK FOREIGN KEY (WRITER) REFERENCES user (id);

INSERT article VALUES (NULL, '제목', '내용', 'hong'); -- user 테이블에 hong 이 없어서 : 외래키 제약조건 위배
INSERT article VALUES (NULL, '제목', '내용', NULL); -- 단 null 값은 가능하다.

INSERT user VALUES ('hong', '홍길동');
INSERT INTO article VALUES (NULL, '제목', '내용','hong');

DELETE  FROM user WHERE id = 'hong'; -- hong 데이터를 article 테이블에서 참조하고있어서 삭제불가
UPDATE user SET id = 'kong' WHERE id = 'hong'; -- hong 데이터를 article 테이블에서 참조하고있어서 변경불가
UPDATE user SET NAME = '홍홍' WHERE id = 'hong'; -- 성공

## 외래키 제약 조건 삭제
ALTER TABLE article DROP CONSTRAINT ARTICLE_USER_FK;
-- 안들어갔던 데이터가 들어간다
INSERT INTO article VALUES(NULL, '송제목', '송내용','Song');

## 제약조건 다시 걸면 에러남

/*
ON DELETE CASCADE 잘쓰지않는다
-다 지워서 위험할수있음
**/

-- 제약 조건에 위배되는 데이터가 이미 들어가있음.(실패)
ALTER TABLE article  ADD CONSTRAINT ARTICLE_USER_FK FOREIGN KEY (WRITER) REFERENCES user (id) ON DELETE CASCADE;
-- 제약 조건에 위배되지않게 수정.
UPDATE  article SET writer = 'hong' WHERE writer<>'hong';
--다시 키 만들기 성공
ALTER TABLE article  ADD CONSTRAINT ARTICLE_USER_FK FOREIGN KEY (WRITER) REFERENCES user (id) ON DELETE CASCADE;
-- article 이 다 날아감 ㅎ
DELETE  FROM user WHERE id = 'hong';


/*
제약조건 약식
( 밑에 코드는 실행하지 않는다)
**/

CREATE TABLE user (
	id VARCHAR(100) PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE user (
	id VARCHAR(100),
	name VARCHAR(100) NOT NULL,
	-- PRIMARY 에 이미 null 이 포함되어있음
	PRIMARY KEY(id)
);


CREATE TABLE article (
	num INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR (500),
	content VARCHAR (1000),
	writer VARCHAR(100) NOT NULL REFERENCES user (id)
);

CREATE TABLE article (
	num INT AUTO_INCREMENT,
	title VARCHAR (500),
	content VARCHAR (1000),
	writer VARCHAR(100) REFERENCES user (id),
	PRIMARY KEY(num),
	FOREIGN KEY (writer) REFERENCES user (id)
);
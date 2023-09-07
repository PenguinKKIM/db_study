##  CONSTRAINT 제약조건 
-- not null , unique, primary key, forgain key, check

CREATE TABLE temp( 
	id INT PRIMARY KEY,  -- null값/ 중복을 허용하지 않는다.
	name VARCHAR(100) NOT NULL -- null값을 허용하지 않는다.
);

INSTR INTO temp VALUES (NULL, 'jang');
INSTR INTO temp VALUES (1, 'jang');
INSTR INTO temp VALUES (2, 'jang');
INSTR INTO temp VALUES (2, NULL);

CREATE TABLE temp2( 
	email VARCHAR(100) UNIQUE -- NULL은 허용한다. null은 중복허용
);

INSTR INTO temp2 VALUES (NULL);
INSTR INTO temp2 VALUES ('clfrck@naver.com');

## check 
CREATE TABLE temp3( 
	name VARCHAR(100) NOT NULL,
	age INT DEFAULT 1 CHECK (age > 0) -- 들어가는 값을 제어한다( 조던문?))
);

INSERT INTO temp3(NAME) VALUES ('peng');

CREATE TABLE user (
	id INT PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE article (
	num INT AUTO_INCREMENT PRIMARY KEY, -- AUTO_INCREMENT 자동 증감 : null을 넣어도됨
	title VARCHAR(50),
	content VARCHAR(1000),
	writer VARCHAR(20) -- 테이블 생성할때 제약조건 검
);

INSERT INTO article (title,content) VALUES ('제목','내용');
INSERT INTO article (title,content,writer) VALUES ('제목','내용', 'Hong');

INSERT INTO USER  VALUES ('홍길동', 'Hong');
INSERT INTO article (title,content,writer) VALUES ('제목','내용', 'Hong');

DELETE FROM user WHERE id = 'hong';

UPDATE user SET id = 'kong' WHERE id = 'hong';

UPDATE user SET name = '홍길동' WHERE id = 'hong'; -- 참조되는 컬럼이 아닌거는 변경가능
DELETE FROM user WHERE id = 'song'; -- 참조하고있는 애가없다 (애초에 대상이없음)


ALTER TABLE article ADD CONSTRAINT ARTICLE_USER_FK FOREIGN KEY(writer) REFERENCES user(id);
INSERT INTO article (title,content,writer) VALUES ('송제목','송내용', 'Song');
ALTER TABLE article DROP CONSTRAINT ARTICLE_USER_FK;

DELETE FROM article WHERE writer = 'song';
ALTER TABLE article 
ADD CONSTRAINT ARTICLE_USER_FK 
FOREIGN KEY(writer) REFERENCES user(id) 
ON DELETE CASCADED;

DELETE FROM user WHERE id = 'hong';

-- 순서가 중요한 언어 (위에서 아래로 순차적)
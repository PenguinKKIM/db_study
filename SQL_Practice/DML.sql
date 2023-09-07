/*
DML : insert, update, delete (데이터 삽입, 수정, 삭제)
*
*-- insert into table_name (column_name1, column_name2, ..) values (values1, values2...)
*/


## 입력값을 넣으면 순서는 상관없이쓸수있다
INSERT INTO user (id, NAME) VALUES ('hong','홍길동');
--밑에도 똑같이 들어감
INSERT INTO user (NAME, id) VALUES ('차길동','cha');

## 컬럼 목록을 생략할경우 컬럼 순서대로 값을 넣어야한다
INSERT INTO user VALUES('park','박길동');


/*
*article 데이터 삽입
* title1, content1
* title2
* content
	title3, content13, hong
	title4, hong
	content5, park
*/

SELECT * FROM article;
INSERT INTO article (title, content) VALUES ('title1','content1');
INSERT INTO article (title) VALUES ('title2');
INSERT INTO article (content) VALUES ('content');
INSERT INTO article (title, content, writer) VALUES ('title3','content3','hong');
INSERT INTO article (title, writer) VALUES ('title4','cha');
INSERT INTO article (content, writer) VALUES ('content5','park');


DROP TABLE emp;

SELECT * FROM emp;

INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, deptno) VALUES (9999,'hong', 'SALESMAN', 7369, CURDATE(), 1800, 40);


CREATE TABLE emp_sub (
	id INT,
	name VARCHAR (30)
);

## insert into select : select 결과물에 테이블 삽입 : 타입이 같고 데이터가 더 크면 안된다
INSERT INTO emp_sub (id, NAME) SELECT empno, ename FROM emp; -- 컬럼 명은 달라도된다


/**
update table_name set colum_name = value1, colum_name = value2, ....
*/

## emp 테이블에서 hong이 담당 업부가 clerk 로 변경, 담당매니저가 7782로 변경
UPDATE emp SET job = 'CLERK', mgr = 7782 WHERE ename='hong';

##emp 테이블에서 커미션이 없는 사람은 100을 준다.
UPDATE emp SET comm = 100 WHERE comm IS NULL OR 0;

##deptno 가 10인 부서만 comm를 급여의 10%를 더준다
UPDATE emp SET comm = comm+(sal*0.1) WHERE deptno  = 10;

## smith 와 같은 업무 하는 사람의 sal을 30% 인상한다
UPDATE emp SET sal = sal+(sal*0.3) WHERE (SEL); -- 서브절로 완성시키기

/**
delete from table_name  ....
*/

##emp 에서 이름이hong인사람 삭제
DELETE FROM emp WHERE ename = 'hong';

##emp 에서 부서 번호가 40 인 사람 삭제
DELETE FROM emp WHERE deptno = 40;

START TRANSACTION; -- 커밋할때 원상복구가 가능하게 
DELETE FROM emp_sub WHERE name = 'hong';

ROLLBACK; -- 다시 되돌아가기
COMMIT; -- 명령취소

SELECT * FROM emp_sub;




 ##DDD 
 -- creat, alter : 변경,  turncrate : 잘라내기, drop :삭제
  
 ##DNL
 -- insert, updtae, delete, merge : 병합
 
 ##DCL
 -- grant :권한주기, revoke:권한 뺏기 --안배움
 
 ##TCL
 -- commit : 확장, rollback : 되돌리기
 
 ##DQL
 -- SLELECT
 
 
CREATE DATABASE testdb;
DROP DATABASE testdb;

## 처음 생성시 일반적으로 만듬
CREATE TABLE Preson( 
	NAME VARCHAR(100) NOT NULL,
	age INT DEFAULT 0,  -- int 사이즈 안넣어도됨
	address VARCHAR(100),
	email VARCHAR(100) PRIMARY KEY, -- PRIMARY KEY(email) : PRIMARY - not null unique
	birthday DATE
);

## 테이블 지움
DROP TABLE Preson;

##emp table
drop table IF EXISTS emp;
CREATE TABLE EMP ( 
  EMPNO     int, 
  ENAME     VARCHAR(30), 
  JOB       VARCHAR(20), 
  MGR       int, 
  HIREDATE  DATE, 
  SAL       int,
  COMM      int, 
  DEPTNO    int) DEFAULT CHARSET=UTF8;

insert into emp values (7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
insert into emp values (7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
insert into emp values (7521,'WARD','SALESMAN',7698,'1982-02-22',1250,500,30);
insert into emp values (7566,'JONES','MANAGER',7839,'1981-04-02',2975,null,20);
insert into emp values (7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30);
insert into emp values (7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,null,30);
insert into emp values (7782,'CLARK','MANAGER',7839,'1981-06-09',2450,null,10);
insert into emp values (7788,'SCOTT','ANALYST',7566,'1987-04-17',3000,null,20);
insert into emp values (7839,'KING','PRESIDENT',null,'1981-11-17',5000,null,10);
insert into emp values (7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
insert into emp values (7876,'ADAMS','CLERK',7788,'1987-05-23',1100,null,20);
insert into emp values (7900,'JAMES','CLERK',7698,'1981-12-03',950,null,30);
insert into emp values (7902,'FORD','ANALYST',7566,'1981-12-03',3000,null,20);
insert into emp values (7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);


CREATE UNIQUE INDEX PK_EMP ON EMP (EMPNO) ;
ALTER TABLE EMP ADD  CONSTRAINT PK_EMP PRIMARY KEY (EMPNO);

CREATE TABLE sub_emp AStestdb
SELECT EMPNO, ENAME, JOB, HIREDATE, SAL FROM emp WHERE deptno=10;

CREATE TABLE emptestdbtestdb_t AS -- 테이블의 껍데기만 만드는것이다
SELECT * FROM emp WHERE 1=2; -- boolean 이 없어서 일부러 거짓을 만드는것

CREATE TABLE Presons( 
	id INT DEFAULT 0,  -- int 사이즈 안넣어도됨
	last_name VARCHAR(100),
	first_name VARCHAR(100),
	address VARCHAR(100), -- PRIMARY KEY(email) : PRIMARY - not null unique
	city VARCHAR(100)
);

ALTER TABLE Presons ADD email VARCHAR(255);

ALTER TABLE Presons MODIFY COLUMN presonscity VARCHAR(255);

##컬럼 지우기
ALTER TABLE Presons DROP COLUMN email;

ALTER TABLE sub_emp ADD deaptno int DEFAULT 10;

## rename COLUMN
ALTER TABLE sub_emp RENAME COLUMN deaptno to DECODE;

RENAME TABLE sub_emp to emp_10;

## 테이블 비우기
TRUNCATE TABLE emp_10;

##데이터 지우기
-- crud 

## 지우기
DELETE FROM emp;  -- 흔한일이 아니다(where 절로 보호해줘야함)

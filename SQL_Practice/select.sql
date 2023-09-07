-- selcet~~ form : 테이블의 데이터를 조회할때 사용(모든데이터가 나온다)

## 전체보기-- emp의 데이터 테이블의 출력(* : 전체를 의미)
SELECT * FROM emp; 

## 일부만 보기 -- 내가 조회하고자 하는 컬럼만 조회해준다
SELECT empno, ename FROM emp; 

SELECT * FROM dept; -- dept 테이블 전체보기
SELECT deptno, dname FROM dept; -- dept 테이블에서 deptno, dname 보기

SELECT studno, NAME, id, birthday, tel  FROM student ; -- 대소문자를 구별하지않는다.

##원하는 행을 고르기
-- WHERE  행에대한 조건문(조건에 만족하는 행만 조회)
SELECT * 
FROM emp 
WHERE deptno = 10; -- 줄별로쓰기도한다

SELECT empno, ename, deptno  FROM emp WHERE deptno=10;


-- 0번째라는 개념이 없어서 1번째로 시작한다
SELECT empno, job, ename, deptno  FROM emp WHERE deptno>10;  
-- emp테이블에서 deptno 가 10 이상인 empno, job, ename, deptno 사람들

 
SELECT studno, NAME, grade, birthday, tel  FROM student WHERE grade>=4;


-- where
-- and or
-- in
-- not

SELECT *  FROM student WHERE grade = 2 OR grade = 3;
SELECT *  FROM student WHERE grade >= 2 and grade <= 3; -- 비교연산자도 가능하다
SELECT *  FROM student WHERE grade IN(2,3);
SELECT *  FROM student WHERE NOT grade = 4; -- 4학년이 아닌학생
SELECT *  FROM student WHERE NOT grade IN(4); -- 4학년이 아닌학생


SELECT empno, ename, job FROM emp WHERE job ='CLERK' OR job='salesman';

-- alias : 컬럼명을 바꿔서 조회, alias 쓸때만 큰 따옴표를 쓴다 : 생략할수있지만 스페이스가들어가면 써줘야야한다
SELECT empno "사번", ename " 이 름", job "직 무" FROM emp WHERE job ='CLERK' OR job='salesman';
SELECT studno 학번, NAME 이름, grade 학년  FROM student WHERE grade = 4;


SELECT * FROM professor WHERE hpage = NULL; -- 아무것도 안나옴(조회가안됨)
SELECT * FROM professor WHERE hpage IS NULL; -- 컬럼 값을 비교할때 null은 is 로한다
SELECT * FROM professor WHERE hpage IS not NULL;


## 날짜도비교연산이 가능하다
SELECT * FROM emp WHERE hiredate >= '1985-01-01';
SELECT * FROM student WHERE birthday >= '1976-01-01' AND  birthday <= '1976-12-31';

SELECT * FROM emp WHERE deptno = 10 AND sal >200;

SELECT * FROM professor WHERE deptno = 101 AND POSITION = '정교수';

SELECT * FROM student WHERE deptno1 = 101 OR deptno2 = 101;

SELECT * FROM student WHERE(deptno1 = 101 OR deptno2 = 101) AND (grade = 1 OR grade = 2);

SELECT * FROM emp2 WHERE EMP_TYPE = '정규직' AND pay => 500;

##컴퓨터 정보학부에 소속된 교수의 직급과 이름소속학과 조회
SELECT NAME, POSITION FROM professer WHERE 

##조인형 교수를 담당교수로하는 학생의 학번 이름 학년 학과번호 교수번호 조회
SELECT studon, NAME, geade, deptno1, profno FROM student WHERE profner = 1001;

SELECT gno, point FROM gogak WHERE POINT >= 600001;


## between  A AND B
SELECT studno name FROM exam_01 WHERE total BETWEEN 80 AND 89;
SELECT * FROM student WHERE birthday BETWEEN '1976-01-01' AND  '1976-12-31'

## ORDER BY  정렬해주는것 , desc : 오름차순, asc : 내림차순
SELECT * FROM emp ORDER BY sal ASC; -- 내림차순
SELECT * FROM emp ORDER BY sal DESC; -- 오름차순

SELECT * FROM student WHERE grade = 4 ORDER BY NAME;
SELECT NAME, studno, birthday, deptno1 FROM student WHERE grade = 4 ORDER BY 3;

SELECT * FROM emp ORDER BY deptno, sal desc; -- 앞에것이 같을때 뒤에것을 기준으로한다.
SELECT * FROM student ORDER BY grade ASC, height DESC; -- 중복으로사용도 가능하다

## 중복행 제거 - DISTINCT
SELECT DISTINCT(grade) FROM student;

## LIKE - 컬럼에 문자열이 포함된것을 거를때
-- 이름의 성이 '서'인 학생조회
SELECT * FROM student WHERE NAME LIKE '%서%'; 
-- 주소거를때 많이쓴다

SELECT * FROM emp WHERE job LIKE 'MAN%'; -- man으로 시작하는것
SELECT * FROM emp WHERE job LIKE '%MAN'; -- man으로 끝나는것
SELECT * FROM emp WHERE eNAME LIKE '_L%'; -- 두번째 글자가 L 인 글자를 찾으라는것

SELECT studno, NAME, grade, jumin FROM student WHERE jumin LIKE '__09%';


## IFNULL -- null 인 값을 계산해야할 경우,IFNULL로 따로처리해줘야한다.IFNULL(널인지 비교할 값, 널 일시 대처할 값)
SELECT profno, NAME, pay + bonus FROM professor WHERE bonus IS NOT NULL; -- 두값을 더할수도있다
SELECT profno, NAME, pay + IFNULL(bonus,0) FROM professor;

SELECT empno, ename, sal, comm FROM emp WHERE sal > 1000 AND (comm IS NULL OR comm < 1000);
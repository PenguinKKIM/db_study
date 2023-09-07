/**
문자열 함수 -제일 많이쓰인다
*/

##concat - 문자열을 이을때 사용
SELECT CONCAT(ename, '(', job, ')') AS 'ename_job' FROM emp;
SELECT CONCAT(ename,' ''s sal is $ ', sal)FROM emp;

##fomat 1,000,000 -- 숫자형 데이터의 포멧지정
SELECT FORMAT(250200.1234, 2);
SELECT empno, ename, sal FROM emp;
-- 세자리 마다 콤마 를 붙여준다. 터미널에서 확인가능
SELECT empno, ename, FORMAT (sal,0) FROM emp; -- FORMAT 때문에 문자열로바뀐다

##insert - 문자열 내의 지정된 위치에 특정 특수문자 수 만큼 문자열을 변경한다.
SELECT INSERT('http://naver.com', 8, 5, 'kosta');
SELECT INSERT(jumin, 7, 7, '*******') 주민번호, grade 학년 FROM student;
SELECT gno 고객번호, INSERT(gname, 2, 1, '*') 고객이름FROM gogak;

##instr - 위치값, 문자열 내에서 특정 문자의 위치를 구한다(arr[i]생각하기).
SELECT INSTR('http://naver.com', 'n'); -- INSTR () 한칸띄고써도되는데 
SELECT INl,1  INSRudent;

##substr - 문자열 내에서 부분 문자열 추출
SELECT SUBSTR('http://naver.com', 8);-- SUBSTR () 한칸띄고쓰면 에러남 ㅡㅡ
SELECT SUBSTR(tel,1,4) FROM student ;
SELECT studno, NAME, jumin FROM student WHERE SUBSTR(jumin,3,2) = '09';


##length - 문자열의 길이(문자열의 바이트수 구하기 영문 : 1byte, 한글 : 3byte)
SELECT LENGTH(tel) FROM student;
SELECT p.email, INSTR(p.email, '@') FROM professor p;
SELECT email, LENGTH(SUBSTR(email, INSTR(email, '@')+1)) FROM professor; -- email을 @으로 나누고 길이를 구함
SELECT email,INSERT(email, INSTR(email, '@')+1, LENGTH(SUBSTR(email, INSTR(email, '@')+1)), 'kosta.com') FROM professor;

SELECT ename, LENGTH(ename) FROM emp;
SELECT NAME,  LENGTH(NAME) FROM student; -- 바이트수로 나타내준다 (한글은 3바이트)

##char_length : 문자열의 글자수구하기
SELECT ename, CHAR_LENGTH(ename) FROM emp;
SELECT NAME,  CHAR_LENGTH(NAME) FROM student; -- 바이트수로 나타내준다 (한글은 3바이트)

##substring
SELECT SUBSTRING('http://naver.com', 8,5);

##lower, lcase : 소문자로 변경
SELECT ename, LOWER(ename) FROM emp;
SELECT ename, LCASE(ename) FROM emp;

## upper, Ucase : 대문자로 변경
SELECT id, UPPER(id) FROM professor;
SELECT id, UCASE(id) FROM professor;

##trim : 앞뒤 공백제거
SELECT LENGTH('  test   '),LENGTH(TRIM('  test   '));
SELECT '  t e s t   ',LENGTH('  t e s t   '),LENGTH(TRIM('  t e s t   '));

##ltrim : 왼쪽 공백만제거
SELECT LENGTH('  test   '),LENGTH(LTRIM('  test   '));

##Rtrim :오른쪽 공백제거
SELECT LENGTH('  test   '),LENGTH(RTRIM('  test   '));

##LPAD : 왼쪽을 특정 문자열로 채워넣음
SELECT sal 월급, LPAD(ename, 20, '*') 이름 FROM emp;
SELECT LPAD(email, 20, '123456789') 이름 FROM professor;

##RPAD : 오른쪽을 특정 문자열로 채워넣음
SELECT sal 월급, RPAD(ename, 20, '*') 이름 FROM emp;


/*
날짜 함수
**/


##CURDATE() : 오늘 날짜를 가져온다
SELECT CURDATE(); -- 0000-00-00 식으로나온다
SELECT CURRENT_DATE();

-- 연산도가능하다 (m/s 인가?)
SELECT CURDATE() + 1;

-- ADDDATE : 날짜를 더한다
SELECT ADDDATE(CURDATE(), INTERVAL 1 DAY); -- interval 더하고 뺄수 (년,월,일)
SELECT ADDDATE(CURDATE(), 1); -- INTERVAL 을 생략하면 day 가 기본이다
SELECT ADDDATE(CURDATE(), INTERVAL +3 MONTH);
SELECT ADDDATE(CURDATE(), INTERVAL -1 YEAR);
-- DATE_ADD 로 써도된다
SELECT DATE_ADD(CURDATE(), INTERVAL -1 YEAR);

SELECT ename, hiredate,ADDDATE(hiredate, INTERVAL 10 YEAR) FROM emp;

##CURtime() : 현재시간을 나타낸다
SELECT CURTIME();
SELECT CURTIME(), ADDTIME (CURTIME(), '1:10:05');

##NOW() : 날짜와 시간이 같이뜬다
SELECT NOW();
SELECT NOW(), ADDTIME(NOW(), '2 1:10:05');

## datediff : 날자를뺀다
SELECT hiredate, DATEDIFF(CURDATE(), hiredate) FROM emp;
SELECT DATEDIFF(CURDATE(), '1989-01-24') 일; -- 12,642 ^ㅅ^; 9월5일 기준

##date_format : 날짜를 포멧팅해줌 *대소문자를 구분한다 -- 자바랑 쪼금 비슷
SELECT DATE_FORMAT('2017-06-05', "%M %b %c %D %Y"); -- 영어로 나오고 %b : 영어 달의 줄임말이 나온다
SELECT DATE_FORMAT('2017-06-05', "%m %d %y"); -- 숫자로나옴
SELECT DATE_FORMAT(NOW() , "%M %D %Y %H %I %S %W"); -- %H 대문자로하면 24시 기준시로나옴
SELECT DATE_FORMAT(NOW() , "%m %d %y %h %i %s %w"); -- 어느날짜든 할수있다 %h 소문자로하면 12시 기준(?)

-- 시간 %H : 24시 표기, %l : 12시표기
-- 초 %s, 분 % i.
## 프론트 일이라 백에서할거면 꼭 말해줘야함

## DATE_SUB : 날짜빼기
SELECT CURDATE(), DATE_SUB(CURDATE(), INTERVAL 10 DAY);
SELECT CURDATE(), DATE_ADD(CURDATE(), INTERVAL 10 DAY);

## DAY 날짜에서 열 추출
SELECT hiredate, DAY(hiredate) FROM emp;
SELECT hiredate, DAYOFMONTH(hiredate) FROM emp; -- 위아래 같은것을 출력한다

SELECT hiredate, YEAR(hiredate) FROM emp;
SELECT hiredate, MONTH(hiredate) FROM emp;

SELECT NOW(), HOUR(NOW());


## DAYNAME: 날짜에서 요일을 추출해 보여줌(영어 풀네임)
SELECT hiredate, DAYNAME(hiredate) FROM emp;

## DAYOFWEEK: 날짜에서 요일을 추출해 보여줌(요일숫자 일요일이 1)
SELECT DAYNAME(NOW()), DAYOFWEEK(CURDATE()); -- 오늘 요일과 숫자를 나타내준다

## EXTRACT : 
SELECT CURDATE(), EXTRACT(YEAR FROM CURDATE()) AS YEAR;
SELECT CURDATE(), EXTRACT(MONTH FROM CURDATE()) AS MONTH;
SELECT CURDATE(), EXTRACT(WEEK FROM CURDATE()) AS WEEK;
SELECT CURDATE(), EXTRACT(DAY FROM CURDATE()) AS DAY;
SELECT CURDATE(), EXTRACT(QUARTER FROM CURDATE()) AS QUARTER; -- 9월 5s일 3분기

SELECT NOW(), EXTRACT(YEAR_MONTH FROM NOW()) AS 'YEAR_MONTH';
SELECT NOW(), EXTRACT(DAY FROM NOW()) AS NOW;

## TIME_TO_SEC 시간을 초로 변환
SELECT CURTIME(), TIME_TO_SEC(CURDATE());

##TIMEDIFF
SELECT CURTIME(), TIMEDIFF(CURDATE(), '08:09:01');
SELECT TIME_TO_SEC(TIMEDIFF(CURDATE(), '08:09:01'));

/*
숫자함수
**/

## count : 조건에 만족하는 레코드
SELECT COUNT(ename) FROM emp;
SELECT COUNT(comm) FROM emp; -- 컬럼명이 매개변수로 사용시 null 인 레코드는 예외

SELECT COUNT(*) FROM emp WHERE deptno = 10;

## sum : 더함
SELECT SUM(sal) FROM emp;
SELECT SUM(sal) FROM emp WHERE deptno = 10;

## avg : 평균을 내줌
SELECT SUM(sal), AVG(sal) FROM emp;
SELECT SUM(comm), (SUM(comm)/COUNT(*)), AVG(IFNULL(comm,0))  FROM emp; -- null 

SELECT profno, NAME, pay 월급여, IFNULL(bonus, 0) 보너스, pay *12 + IFNULL(bonus, 0) '보너스 + 연봉' FROM professor;

##min
SELECT MIN(sal) FROM emp;

##max
SELECT MAX(sal) FROM emp;

##group by 
SELECT deptno, ename, COUNT(*), SUM(sal) FROM emp GROUP BY deptno; -- 자스같다
SELECT deptno, job, COUNT(*), SUM(sal) FROM emp GROUP BY deptno, job;

SELECT deptno1, COUNT(*) FROM student GROUP BY deptno1;
SELECT grade, FORMAT (AVG(height),1)FROM student GROUP BY grade;

SELECT deptno "사 번", MAX(sal) "가장 높은 월급" FROM emp GROUP BY deptno;

## GROUP BY 에 대한 조건은 HAVING 을쓴다
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno HAVING AVG(sal) >= 2000;

##
SELECT deptno1, grade, COUNT(*), AVG(weight), MAX(weight), MIN(weight) FROM student
GROUP BY grade, deptno1  
HAVING AVG(weight) > 50;
ORDER BY grade, deptno1;
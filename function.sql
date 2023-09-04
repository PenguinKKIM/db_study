/**
문자열 함수 -제일 많이쓰인다
*/

##concat - 문자열을 이을때 사용
SELECT CONCAT(ename, '(', job, ')') AS 'ename_job' FROM emp;
SELECT CONCAT(ename,' ''s sal is $ ', sal)FROM emp;

##fomat 1,000,000 -- 숫자형 데이터의 포멧지정
SELECT FORMAT(250200.1234, 2);
SELECT empno, ename, sal FROM emp;
--세자리 마다 콤마 를 붙여준다. 터미널에서 확인가능
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
SELECT email, INSTR(email, '@') FROM professor;
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

##NOW() : 날짜와 시간이 같이뜬다
SELECT NOW(); 

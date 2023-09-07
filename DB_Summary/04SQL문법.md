------

## SQL 의 문법

------



### SELECT / FROM

```sql
SELECT (보여질 열) FROM (가져 올 테이블)
```

emp 테이블에 모든 열을 보게할려면

```sql
SELECT * FROM emp; -- 세미콜론 으로 닫아줘야한다.
```



##### 일부만 보기 : 내가 조회하고자 하는 컬럼만 조회해준다.

```sql
SELECT empno, ename FROM emp; -- emp 테이블에 empno, ename열을 출력한다.
```



##### 원하는 행을 고르기 : where 조건문을 from 뒤에 붙여준다.

```sql
## emp테이블에서 deptno 가 10 이상인 empno, job, ename, deptno 사람들을 출력한다
SELECT empno, job, ename, deptno  FROM emp WHERE deptno>10;
```



##### null을 비교할때 : = 을 쓰지않고 is 를쓴다.

```sql
## professor 테이블에서 hpage 가 NULL 인 조건을 찾는다.
SELECT * FROM professor WHERE hpage = NULL; -- 아무것도 안나옴(조회가안됨)
SELECT * FROM professor WHERE hpage IS NULL; -- 컬럼 값을 비교할때 null은 is 로한다
```



##### BETWEEN ( A ) AND (B) : A와 B의 사잇값을 구해준다

- 작은수를 A에 넣어야한다

```sql
## student 테이블에서 birthday 이'1976-01-01'와 '1976-12-31' 의 사람을 출력해준다.
SELECT * FROM student WHERE birthday BETWEEN '1976-01-01' AND '1976-12-31';
```



##### ORDER BY  정렬 : desc -오름차순, asc - 내림차순

```sql
## emp테이블에 모두를 sal 가 낮은순/ 높은순으로 정렬해준다.
SELECT * FROM emp ORDER BY sal ASC; -- 내림차순
SELECT * FROM emp ORDER BY sal DESC; -- 오름차순

##student 테이블에 grade 가 낮은 순으로 정렬하고, 중복이면 height 가 높은 순으로 정렬해준다.
SELECT * FROM student ORDER BY grade ASC, height DESC; -- 동시에 두개를 같이쓸수있다
```

##### GROUP BY :  그룹으로 묶어준다.

```sql
#emp 테이블에 

SELECT e.NAME, e.POSITION, e.pay
FROM emp2 e
WHERE e.PAY IN (SELECT MAX(pay) FROM emp2 GROUP BY POSITION) 
```



##### DISTINCT : 중복되는 것을 빼준다.

```sql
## student 테이블에 grade 가 중복인것을 빼준다.
SELECT DISTINCT(grade) FROM student;
```



##### LIKE 와 % - 컬럼에 문자열이 포함된것을 찾아준다.

```sql
##student 테이블의 NAME 에 앞글자가 '서' 인 데이터를 찾는다
SELECT * FROM student WHERE NAME LIKE '서%'; -- 뒤에 % 붙으면 앞글자
##emp 테이블의 job 에 뒷글자가 'MAN' 인 데이터를 찾는다.
SELECT * FROM emp WHERE job LIKE '%MAN'; -- 앞에 % 붙으면 뒷글자

##언더 하이픈으로 공백을 나타낼수도 있다
##emp 테이블의 eNAME 에 두번째 글자가 L 인 데이터를 찾는다.
SELECT * FROM emp WHERE eNAME LIKE '_L%';
```



##### IFNULL : null 인 값을 계산해야할 경우,IFNULL로 따로처리해줘야한다.

```sql
##IFNULL(널인지 비교할 값, 널 일시 대처할 값)
## null과 다른값과 더해지면 null이 되므로 따로 처리를 해줘야 한다
SELECT profno, NAME, pay + bonus FROM professor WHERE bonus IS NOT NULL; 
-- bonus가 null pay에 값이 있어도 이면 다 null 로 출력되는 문제 
SELECT profno, NAME, pay + IFNULL (bonus,0) FROM professor; -- null 인 값은 0으로 바뀌게된다 (다른 수도 됨)
```



##### IFNULL : null 인 값을 계산해야할 경우,IFNULL로 따로처리해줘야한다.

```sql
##IFNULL(널인지 비교할 값, 널 일시 대처할 값)
## null과 다른값과 더해지면 null이 되므로 따로 처리를 해줘야 한다
SELECT profno, NAME, pay + bonus FROM professor WHERE bonus IS NOT NULL; 
-- bonus가 null pay에 값이 있어도 이면 다 null 로 출력되는 문제 
SELECT profno, NAME, pay + IFNULL (bonus,0) FROM professor; -- null 인 값은 0으로 바뀌게된다 (다른 수도 됨)
```



### 문자열 함수

- 가장 많이 쓰이게될 함수 중 하나이다.

##### CONCAT :  문자열을 이을때 사용

```sql
## emp 테이블의 ename 와 job을 ()에 넣에서 ename_job 이란 열 이름으로 출력해라
SELECT CONCAT(ename, '(', job, ')') AS 'ename_job' FROM emp;
```



##### fomat 1,000,000  : 숫자형 데이터의 포멧지정

```sql
##250200.1234 의 수를 소수점 두자리 까지만 표현한다.
SELECT FORMAT(250200.1234, 2);
SELECT empno, ename, FORMAT (sal,0) FROM emp; -- FORMAT 때문에 문자열로바뀐다
-- 세자리 마다 콤마 를 붙여준다. 터미널에서 확인가능. 
```



##### INSERT : 문자열 내의 지정된 위치에 특정 특수문자 수 만큼 문자열을 변경한다.

```sql
## http://naver.com 의 8번째 자리에서 5번째 자리까지 kosta로 바꿔준다.
SELECT INSERT('http://naver.com', 8, 5, 'kosta');
## student 테이블에의 jumin 주민번호를 7번째 자리부터 7번째 자리 후까지 '*******' 로 바꾸어준다.
SELECT INSERT(jumin, 7, 7, '*******') 주민번호, grade 학년 FROM student;
```



##### INSTR : 위치값, 문자열 내에서 특정 문자의 위치를 구한다(arr[i]생각하기).

```sql
##  http://naver.com 에서'n'의 위치를 출력한다.
SELECT INSTR('http://naver.com', 'n');
```



##### LENGTH : 문자열의 길이(문자열의 바이트수 구하기 영문 : 1byte, 한글 : 3byte)

```sql
SELECT LENGTH(tel) FROM student;
SELECT email, INSTR(email, '@') FROM professor;
SELECT email, LENGTH(SUBSTR(email, INSTR(email, '@')+1)) FROM professor; -- email을 @으로 나누고 길이를 구함
SELECT email,INSERT(email, INSTR(email, '@')+1, LENGTH(SUBSTR(email, INSTR(email, '@')+1)), 'kosta.com') FROM professor;
-- 여러가지 섞어 쓸 수 있다.
```



##### CURDATE(), CURRENT_DATE() : 오늘 날짜를 가져온다

```sql
SELECT CURDATE(); -- 0000-00-00 식으로나온다
SELECT CURRENT_DATE(); -- 위와 같은 함수

## 연산도가능하다 (m/s 인가?)
SELECT CURDATE() + 1;
```



##### ADDDATE(), DATE_ADD() : 날짜를 더한다

```sql
## interval 더하고 뺄수 (년,월,일)
SELECT ADDDATE(CURDATE(), INTERVAL 1 DAY);
SELECT ADDDATE(CURDATE(), 1); -- INTERVAL 을 생략하면 day 가 기본이다
SELECT ADDDATE(CURDATE(), INTERVAL +3 MONTH);
SELECT ADDDATE(CURDATE(), INTERVAL -1 YEAR);

##DATE_ADD 로 써도된다.
SELECT DATE_ADD(CURDATE(), INTERVAL -1 YEAR);

## emp 테이블의 hiredate 에 10년을 더해서 ename과 hiredate를 출력한다.
SELECT ename, hiredate,ADDDATE(hiredate, INTERVAL 10 YEAR) FROM emp;
```



##### CURtime() : 현재시간을 나타낸다

```sql
SELECT CURTIME();
```



##### NOW() : 날짜와 시간이 같이뜬다

```sql
SELECT NOW();
```



##### ORDER BY

- 열을 정렬해주는 명령어이다

- SELECT 절 제일 마지막에 온다

  ```sql
  ### student 테이블에 ,exam_01 테이블을 studno 가 같은 조건으로 조인하고, 3번째 열을 내림차순(DESC)해준다.
  SELECT s.studno, s.name, e1.total
  FROM student s JOIN exam_01 e1 ON s.studno = e1.studno
  ORDER BY 3 DESC;
  ```

- 열의 이름으로도 쓸수있다

  ```sql
  ### student 테이블에 ,exam_01 테이블을 studno 가 같은 조건으로 조인하고, name 열을 오름차순(ASC) 해준다.
  SELECT s.studno, s.name, e1.total
  FROM student s JOIN exam_01 e1 ON s.studno = e1.studno
  ORDER BY name ASC;
  ```

  

##### GROUP BY

- 테이블의 데이터를 그룹화 하기 위해 쓴다.

  ```sql
  ##emp 테이블에 deptno, job 을 그룹으로 묶고, 사번과 직업, 묶인 그룹 의 수, 월급을 모두 더 해서 출력한다
  
  SELECT deptno, job, COUNT(*), SUM(sal) 
  FROM emp 
  GROUP BY deptno, job;
  ```

  

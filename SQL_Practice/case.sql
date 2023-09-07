## case
SELECT empno, ename, deptno,
		CASE 
			when deptno=10 then 'ACCOUNTINT'
			when deptno=20 then 'RESEARCH'
			when deptno=30 then 'SALES'
			when deptno=40 then 'OPERATIONS'
		END AS dname
FROM emp;

SELECT empno, ename, deptno,
		CASE deptno = 10 
		          then 'ACCOUNTINT'
			when 20 then 'RESEARCH'
			when 30 then 'SALES'
			when 40 then 'OPERATIONS'
		END AS dname
FROM emp;


SELECT NAME, jumin, 
		CASE 
			when SUBSTR(jumin,7,1) = 1 OR SUBSTR(jumin,7,1) = 3 then 'MAN'
			when SUBSTR(jumin,7,1) = 2 OR SUBSTR(jumin,7,1) = 4 then 'WOMAN'
		END AS jumin
FROM student;

SELECT NAME, jumin, 
		CASE SUBSTR(jumin,7,1) -- 비교대상이 되는건 하나만 써도된다 
			when 1 then 'MAN'
			when 2 then 'WOMAN'
			when 3 then 'MAN'
			when 4 then 'WOMAN'
		END 성별
FROM student;



SELECT NAME, tel,
		CASE SUBSTR(tel,1,INSTR(tel, ')'-1)); 
			when '02' then '서울'
			when '031' then '경기도'
			when '051' then '부산'
			when '052' then '울산'
			when '055' then '경남'
		END  지역
FROM student
WHERE deptno1 = 101;

SELECT NAME,birthday,MONTH(birthday),
		CASE 
		 	when MONTH(birthday) BETWEEN 1 AND  3 then '1/4분기'
			when MONTH(birthday) BETWEEN 4 AND  6 then '2/4분기'
			when MONTH(birthday) BETWEEN 7 AND  9 then '3/4분기'
			ELSE '4/4분기'
		END  '분기'
FROM student;

SELECT deptno, name, 
		CASE 
		 	when deptno = 101 then 'Computer'
				ELSE ' '
		END  '학과명'
FROM professor;



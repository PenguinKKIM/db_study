
##메인 쿼리 안에 where 조건절 안에 들어간다
-- 서브 쿼리는 괄호로 묶여야한다
-- SELECT 컬럼리스트
-- FROM
-- WHERE 조건절(SELECT 컬럼 리스트 FROM 테이블 WHERE 조건절)


-- 연산자는 단일 서브 쿼리 연산자여야한다
-- =, ><, !=, >...등
## 
SELECT ename, comm
FROM emp
WHERE comm < (SELECT comm FROM emp WHERE ename = 'WARD'); -- 단일행 서브쿼리

SELECT e1.ename, e1.COMM
FROM emp e1, emp e2
WHERE e2.ename = 'WARD' AND e1.COMM < e2.COMM;

SELECT s.name, d.dname
FROM student s JOIN department d ON s.deptno1 = d.deptno
WHERE deptno1 = (SELECT deptno1 FROM student WHERE NAME = '서진수');

SELECT p.name, p.hiredate, d.dname
FROM professor p JOIN department d ON p.deptno = d.deptno
WHERE p.hiredate > (SELECT hiredate FROM professor WHERE NAME = '박원범');


SELECT s.name, d.dname
FROM student s JOIN department d ON s.deptno1 = d.deptno
WHERE deptno1 = (SELECT deptno1 FROM student WHERE NAME = '서진수');

SELECT NAME, weight
FROM student 
WHERE weight > (SELECT AVG(weight)
									FROM student s 
									JOIN department d ON s.deptno1 = d.deptno 
									WHERE d.dname = '전자공학과' );

##자체 조인을 대신해서 쓰는건지..?							
SELECT gg.gname, gg.point
FROM gogak gg
WHERE  gg.point >= (SELECT g.g_start FROM gift g	WHERE g.gname = '노트북');


SELECT e.*
FROM emp e
WHERE e.DEPTNO = (SELECT d.DEPTNO FROM dept d WHERE d.LOC = 'NEW YORK');
						
SELECT s.*
FROM student s
WHERE s.profno = (SELECT p.profno FROM professor p WHERE p.name= '박원범');

SELECT g.gname "받을수있는 선물"
FROM gift g
WHERE  g.g_start <= (SELECT gg.point FROM gogak gg	WHERE gg.gname = '안광훈');

-- 사번 이름 직급 부서명
SELECT e.EMPNO, e.ENAME, d.DNAME
FROM emp e JOIN dept d ON e.DEPTNO = d.DEPTNO
WHERE e.DEPTNO != (SELECT d.DEPTNO FROM dept d WHERE d.DNAME = 'SALES');

SELECT s.studno, s.name, e1.total
FROM student s JOIN exam_01 e1 ON s.studno = e1.studno  -- USING (studno)
WHERE e1.total < (SELECT h.min_point FROM hakjum h WHERE h.grade = 'B0')
ORDER BY 'TOTAL';

SELECT s.studno, s.name, e1.total
FROM student s JOIN exam_01 e1 ON USING(studno) -- USING (studno)
WHERE e1.total BETWEEN (SELECT h.min_point FROM hakjum h WHERE h.grade = 'A0') 
										AND (SELECT h.max_point FROM hakjum h WHERE h.grade = 'A0');

/**
- in
- exists - 서브쿼리에 결과가 하나라도있으면 트루
- >any(<any)  : 왼쪽 (오른쪽) 하나'만'이라도 크면 됨 / 작으면됨.
- >all(<all)  : 왼쪽 (오른쪽)가장 크기만 해도됨
*/

SELECT e.NAME, e.EMPNO, e.POSITION, d.DNAME
FROM emp2 e JOIN dept2 d ON  e.DEPTNO = d.DCODE
WHERE e.DEPTNO IN (SELECT d.DCODE FROM dept2 d  WHERE d.AREA = '포항본사' );

SELECT e.NAME, e.POSITION, e.PAY
FROM emp2 e
WHERE  e.PAY >ANY (SELECT e.PAY FROM emp2 e  WHERE e.POSITION ='과장');

-- 학년별 키가 가장큰 학생의 이름과 학년조회
-- 다중 컬럼비교
SELECT s.name, s.grade, s.height
FROM student s 
WHERE (s.grade,s.height) IN (SELECT grade,MAX(s.height) FROM student s  GROUP BY grade );

SELECT s.name, s.grade, s.weight
FROM student s 
WHERE s.weight <ALL (SELECT MIN(s.weight) FROM student s WHERE s.grade = 2);

SELECT e.EMPNO, e.NAME, e.PAY, d.DNAME
FROM emp2 e JOIN dept2 d ON e.DEPTNO = d.DCODE
WHERE e.PAY < (SELECT AVG(PAY) FROM emp2  WHERE DEPTNO = e.DEPTNO);

SELECT e.EMPNO, e.NAME, e.PAY, d.DNAME
FROM emp2 e JOIN dept2 d ON e.DEPTNO = d.DCODE
WHERE e.PAY >ANY (SELECT AVG(PAY) FROM emp2  GROUP BY DEPTNO);

SELECT p.profno, p.name, p.hiredate, d.dname
FROM professor p JOIN department d ON p.deptno = d.deptno
WHERE (p.deptno, p.hiredate) IN (SELECT DEPTNO, MIN(hiredate) FROM professor GROUP BY DEPTNO);

SELECT e.NAME, e.POSITION, e.pay
FROM emp2 e
WHERE e.PAY IN (SELECT MAX(pay) FROM emp2 GROUP BY POSITION) 

SELECT s.name, s.studno, d.dname, 
FROM student s JOIN exam_01 e USING(studno) 
JOIN department d ON d.deptno= s.deptno1;
WHERE s.studno > (SELECT AVG(total) FROM student s JOIN exam_01 e USING(studno));

SELECT e.EMPNO, e.NAME
FROM emp2 e 
WHERE (e.POSITION IS NOT NULL AND TRIM ((e.POSITION)<>,'')) > (SELECT AVG(pay) FROM emp2 WHERE  POSITION = e.POSITION);

SELECT DISTINCT s.profno, s.name
FROM student s JOIN professor p USING (profno)
WHERE profno IS NOT NULL;

SELECT p.profno, p.name
FROM professor p 
WHERE EXISTS (SELECT * FROM student WHERE profno = p.profno);

SELECT p.profno, p.name
FROM professor p 
WHERE EXISTS (SELECT * FROM student WHERE profno = p.profno);

INSERT INTO dept VALUES (50, 'MARKETING', 'HONGKONG');
SELECT d.DEPTNO, d.DNAME
FROM dept d
WHERE NOT EXISTS (SELECT * FROM emp WHERE deptno = d.DEPTNO);

## LIMIT
SELECT * FROM emp LIMIT 0, 5; -- 첫번째(0)부터 5개
SELECT * FROM emp ORDER BY ename DESC LIMIT 0, 5; -- 표준 sql 에는 없는 문법이다
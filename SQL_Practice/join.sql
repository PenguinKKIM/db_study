##JOIN -- 두개이상의 테이블을 합치는것


## 테이블생성
DROP TABLE test1;
CREATE TABLE test1 (
A VARCHAR(10),
B VARCHAR(20));

DROP TABLE test2;
CREATE TABLE test2 (
A VARCHAR(10),
C VARCHAR(20),
D VARCHAR(20));

INSERT INTO test1 VALUES ('a1', 'b1');
INSERT INTO test1 VALUES ('a1', 'b1');

INSERT INTO test2 VALUES ('a1', 'c3', 'b3');
INSERT INTO test2 VALUES ('a1', 'c4', 'b4');
INSERT INTO test2 VALUES ('a1', 'c5', 'b5');


 -- 어느 테이블에 컬럼을 줄지 알리아스로 붙임(JOIN이 아니어도할수있다)
SELECT t1.*, t2.* FROM test1 t1, test2 t2 WHERE t1.A = 'a1'; -- 굽한만큼 생긴다

## 마리아DB JOIN: where 을 쓸려면 and 로쓴다 (이너조인)
SELECT e.EMPNO,e.EMPNO, d.DNAME FROM emp e, dept d WHERE e.DEPTNO = d.DEPTNO;

## 표준 sql JOIN
SELECT e.EMPNO,e.EMPNO, d.DNAME FROM emp e JOIN dept d ON e.DEPTNO = d.DEPTNO WHERE e.DEPTNO =10;
-- 어딜가나 통하는 문법이다 : where 를 뒤에 붙여쓸수도있다


SELECT s.name, s.id, d.deptno FROM student s , department d  WHERE s.deptno1 = d.deptno;

SELECT s.name, s.profno, p.profno FROM student s LEFT JOIN professor p  on s.profno = p.profno;

SELECT s.name, s.profno, p.profno FROM student s RIGHT JOIN professor p  ON s.profno = p.profno;

SELECT s.name, s.studno, s.deptno1, d.dname, p.name 
FROM student s JOIN department d ON s.deptno1 = d.deptno
LEFT JOIN professor p ON s.profno = p.profno;

SELECT s.studno, s.name, e1.total
FROM student s , exam_01 e1 WHERE s.studno = e1.studno;

SELECT s.studno, s.name, e1.total
FROM student s JOIN exam_01 e1 ON s.studno = e1.studno
ORDER BY name ASC;

SELECT s.studno, s.name, e1.total, hj.grade
FROM student s JOIN exam_01 e1 ON s.studno = e1.studno
JOIN hakjum hj ON e1.total BETWEEN hj.min_point AND hj.max_point;

SELECT s.studno, s.name, e1.total, hj.grade
FROM student s , exam_01 e1, hakjum hj WHERE s.studno = e1.studno 
AND e1.total BETWEEN hj.min_point AND hj.max_point
ORDER BY hj.grade DESC;


##gogak 의 테이블에 gift 테이블의 포인트로 살수있는 경품의 이름을 포인트가 많은 순으로 정렬해라
SELECT gg.*, gi.gname
FROM gogak gg JOIN gift gi ON gg.point > gi.g_start
ORDER BY  gi.g_end DESC;

SELECT *, (SELECT gi.gname FROM gift gi WHERE gg.point > gi.g_start)
FROM gogak gg;

SELECT gg.*, gi.gname
FROM gogak gg JOIN gift gi ON gg.`point` BETWEEN gi.g_start AND gi.g_end
ORDER BY gg.`point` DESC;

SELECT e2.NAME, e2.PAY, pg.s_pay, pg.e_pay
FROM emp2 e2, p_grade pg WHERE pg.position = e2.POSITION;

SELECT e2.NAME, e2.PAY, pg.s_pay, pg.e_pay
FROM emp2 e2 JOIN p_grade pg ON pg.position = e2.POSITION;

SELECT e2.NAME, e2.position, YEAR(CURDATE()) - YEAR(e2.BIRTHDAY) 나이, pg.`position`
FROM emp2 e2, p_grade pg 
WHERE YEAR(CURDATE()) - YEAR(e2.BIRTHDAY) BETWEEN pg.s_age AND pg.e_age
ORDER BY 3 DESC;

SELECT gg.gname, gg.point, gi.gname
FROM gogak gg, gift gi 
WHERE gi.gname ='노트북'AND gg.point >= gi.g_start; -- 한행씩 비교한다

SELECT d2.*, pd.DNAME
FROM dept2 d2, dept2 pd
WHERE d2.PDEPT = pd.DCODE; -- 한행씩 비교한다

-- 표준 join만쓸수있움

##담당 매니저 사번과 이름
SELECT e.EMPNO, e.ENAME, e.MGR, m.EMPNO, m.ENAME
FROM emp e, emp m
WHERE  e.MGR = m.EMPNO;

SELECT s1.studno, s1.name, d1.dname, d2.deptno
FROM student s1 JOIN department d1 ON s1.deptno1 = d1.deptno
LEFT JOIN department d2 ON s1.deptno2 = d2.deptno;


SELECT s.name, s.studno, d.part,
FROM student s JOIN  department d ON s.deptno1 = d.deptno
LEFT JOIN department d2 ON d.deptno = d2.deptno AND d2.dname = '컴퓨터정보공학부'

SELECT d1.*, d2.*
FROM student s JOIN department d1 ON s.deptno1 = d1.deptno
JOIN department d2
ON d1.part = d2.deptno
WHERE d2.dname = '컴퓨터정보공학부';

SELECT student.*, d1.*
FROM student s JOIN department d1 ON s.deptno1 = d1.build
LEFT JOIN department d2 ON s.deptno1  = d1.deptno
WHERE d2.build = '전자제어관';


SELECT e1.EMPNO, e1.ENAME, e1.HIREDATE, COUNT(e2.HIREDATE)
FROM emp e1 LEFT JOIN emp e2 ON e1.HIREDATE > e2.HIREDATE
GROUP BY e1.EMPNO, e1.ENAME
ORDER BY 4;

SELECT p1.profno,  p1.name, p1.hiredate, COUNT(p2.hiredate) 먼저입사한사람
FROM professor p1 LEFT JOIN  professor p2 ON p1.hiredate > p2.hiredate
GROUP BY p1.profno, p1.name
ORDER BY 4;

SELECT e.`*`, d.DNAME
FROM emp e JOIN dept d ON e.DEPTNO = d.DEPTNO;

SELECT e.`*`, d.DNAME
FROM emp e JOIN dept d USING(DEPTNO); -- 이름이 같을때 사용

SELECT e.*, d.DNAME
FROM emp e NATURAL JOIN dept d;

SELECT s.*, p.name
FROM student S FULL OUTER JOIN professor p USING (profno); -- 안됨(오라클에서만 됨)kosta
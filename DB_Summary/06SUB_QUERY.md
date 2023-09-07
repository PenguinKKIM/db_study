------

# Sub Query

------

 

#### **하나의 쿼리에서 SELECT 문 안에 또 다른 SELECT 문이 있을 때, 안에 포함된 SELECT 문**



##### 서브쿼리의 종류

- **SELECT 절에 들어가는 Sub Query.**

  - 하나의 **열**(**컬럼**)처럼 사용된다.

  ``` sql
  SELECT gg.*, gi.gname
  FROM gogak gg JOIN gift gi ON gg.point > gi.g_start;
  ```

  ``` sql
  SELECT *, (SELECT gi.gname FROM gift gi WHERE gg.point > gi.g_start)
  FROM gogak gg;
  ```

  - 다른 테이블의 열만 떼가지고 오는것.

    > SELECT  절에 Sub Query 가 길어지면 많이 느려져서 잘 사용하지 않는다 (있는거만 알자)



- **FROM 절에 쓰이는 Sub Quary**

  - 하나의 **테이블**(표) 처럼 쓰인다

  ``` sql
  SELECT *
  FROM (SELECT point, SUM(point) FROM gogak GROUP BY Point);
  ```

  >  이 역시도 잘 안쓰니 알아만 두자



-  **WHERE 절에 쓰이는 Sub Quary**

  ```sql
  ## emp 테이블에 이름이 WARD 라는 사람의 커미션 보다 적은 커미션을 가진 사람의 이름과 커미션을 출력한다
  SELECT ename, comm
  FROM emp
  WHERE comm < (SELECT comm FROM emp WHERE ename = 'WARD');
  ```

  - 가장 일반적으로 쓰이는 형태이다.

  - 연산식으로 많이 쓴다

  - ***단일 연산, 다중 연산 가능***

    - 단일 연산 

      |  =   |        >  / >=         |          < / <=          | <>,` `^=, ` `!= |
      | :--: | :--------------------: | :----------------------: | :-------------: |
      | 같다 | 크다/이상(크거나 같다) | 작다 / 이하(작거나 같다) |   같지 않다.    |



- **다중 쿼리**

  - **IN 연산자** : 메인쿼리와 서브쿼리의 조건중 하나라도 맞는것이 있으면 출력한다

  ```sql
  ## emp2 와 dept2 에 포항 본사에 있는 사원의 이름과 사번, 직급, 부서명을 출력한다
  SELECT e.NAME, e.EMPNO, e.POSITION, d.DNAME
  FROM emp2 e JOIN dept2 d ON  e.DEPTNO = d.DCODE
  WHERE e.DEPTNO IN (SELECT d.DCODE FROM dept2 d  WHERE d.AREA = '포항본사' );
  ```

  - **ANY 연산자** : **>any(*<any*)**  : 왼쪽 (*오른쪽*) 하나'만'이라도 크면 됨.

  ```sql
  ## emp2 테이블에 DEPTNO 의 평균 값보다 페이가 큰 사원의 사번, 이름, 페이, 부서명을 출력한다
  SELECT e.EMPNO, e.NAME, e.PAY, d.DNAME
  FROM emp2 e JOIN dept2 d ON e.DEPTNO = d.DCODE
  WHERE e.PAY >ANY (SELECT AVG(PAY) FROM emp2  GROUP BY DEPTNO);

- - **ALL 연산자** : **>all (<all)**   왼쪽 (오른쪽)가장 크기만 해도됨.

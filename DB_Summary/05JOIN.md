------

## JOIN

------



- 두개의 테이블을 곱한만큼 생긴다.
  - 데이터가 많은 테이블을 조인 할수록 엄청 많아진다.
  
    > 많은 양의 데이터가있는 테이블을 합칠수록 데이터양이 엄청 많아지므로 느려질수있음에 주의.



##### 표준SQL 문법 & 일반 SQL 문법

- 표준 SQL

  ``` sql
  SELECT e.EMPNO,e.EMPNO, d.DNAME FROM emp e INNER JOIN dept d ON e.DEPTNO = d.DEPTNO WHERE e.DEPTNO =10;
  ```

  - 어느 SQL 에서 나 다 쓸 수 있다.

  - **INNER  JOIN** 과 **ON** 이 함께쓰여야 한다. 

    - **ON ** 뒤에는 **두 테이블이 결합하는 조건을 나타낸다**.
    - INNER 는 생략가능하다.

  - 특정 문법에서는 표준 문법이 강제되기도 한다

  - ON 대신에 WHERE 절을 쓸수있다.

    

- 일반 **SQL의**  **JOIN**

  ```sql
  SELECT e.EMPNO,e.EMPNO, d.DNAME FROM emp e, dept d WHERE e.DEPTNO = d.DEPTNO;
  ```

  - 마리아 DB 등에서 사용할수있다.

  - JOIN 과 ON 을 생략할수 있다.

  - 몇 문법에서는 사용 할수 없다.

    

##### **외부조인 : LEFT OUTER, RIGHT OUTER ** JOIN 

- 한 테이블을 기준으로 합친다.

- 한쪽에 정보가 없어도 NULL 로 출력한다.

- 외부 조인의 종류

  LEFT OUTER  JOIN :  왼쪽문의 테이블은 모두 출력되어야한다
  
  ```sql
  SELECT *
  FROM A LEFT JOIN B
  ON (조인될 조건)
  ```
  
  RIGHT OUTER JOIN :  오른쪽의 테이블은 모두 출력되어야한다
  
  ```sql
  SELECT *
  FROM A RIGHT JOIN B
  ON (조인될 조건)
  ```
  
  
  
  ``` sql
  ##student 테이블에 department을 전공번호가 같은 것만 출력한 결과물에  professor 테이블에 student 교수 번호가 같은 조건이면 합쳐서 출력해주는것
  SELECT s.name, s.studno, s.deptno1, d.dname, p.name 
  FROM student s JOIN department d ON s.deptno1 = d.deptno
  LEFT OUTER JOIN professor p ON s.profno = p.profno;
  ```
  
  - 두 테이블이 일치 하지 않는 값을 가지고 있더라고 **null** 로 변환해 출력해준다.

##### 자체조인

- 자신의 테이블을 조인시킨다. - 회사 조직도 처럼 생겼다.

- 데이터 두개 이상의 열로 존재해야 조인가능

  ```spl
  SELECT (A의 별칭1).열의 이름, (A의 별칭2).열의 이름
  FROM A "A의 별칭1" JOIN ON A "A의 별칭2"
  ON 조인의 조건
  ```

  

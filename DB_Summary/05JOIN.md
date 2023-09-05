------

## JOIN

------



- 두개의 테이블을 곱한만큼 생긴다.
  - 데이터가 많은 테이블을 조인 할수록 엄청 많아진다.
  
    > 많은 양의 데이터가있는 테이블을 합칠수록 데이터양이 엄청 많아지므로 느려질수있음에 주의.



##### 표준SQL 문법 & 일반 SQL 문법

- 표준 SQL

  ``` sql
  SELECT e.EMPNO,e.EMPNO, d.DNAME FROM emp e JOIN dept d ON e.DEPTNO = d.DEPTNO WHERE e.DEPTNO =10;
  ```

  - 어느 SQL 에서 나 다 쓸 수 있다.

  - **JOIN** 과 **ON** 이 함께쓰여야 한다. 

    - **ON ** 뒤에는 **두 테이블이 결합하는 조건을 나타낸다**.

  - 특정 문법에서는 표준 문법이 강제되기도 한다

  - ON 대신에 WHERE 절을 쓸수있다.

    

- 일반 **SQL의** **JOIN**

  ```sql
  SELECT e.EMPNO,e.EMPNO, d.DNAME FROM emp e, dept d WHERE e.DEPTNO = d.DEPTNO;
  ```

  - 마리아 DB 등에서 사용할수있다.

  - JOIN 과 ON 을 생략할수 있다.

  - 몇 문법에서는 사용 할수 없다.

    

##### **LEFT OUTER, RIGHT OUTER** JOIN 

- 한 테이블을 기준으로 합친다.

  ``` sql
  ##student 테이블에 department을 전공번호가 같은 것만 출력한 결과물에  professor 테이블에 student 교수 번호가 같은 조건이면 합쳐서 출력해주는것
  SELECT s.name, s.studno, s.deptno1, d.dname, p.name 
  FROM student s JOIN department d ON s.deptno1 = d.deptno
  LEFT OUTER JOIN professor p ON s.profno = p.profno;
  ```

  - 두 테이블이 일치 하지 않는 값을 가지고 있더라고 **null** 로 변환해 출력해준다.


------

## SQL

------

#### 관계형 DBMS 의 대표적인 것

- **표준 SQL과 일반 SQL** 

  - 표준  SQL은 모든 DB를 다 따른다.

    >  공무원 시험 같은 곳에서 쓰인다



### SQL의 기본적인 규칙

- 대화형 언어 이다 
  - 명령어를 하나하나 단독으로 실행한다. (터미널 생각하면 쉬울듯)

- 분산형 클라이언트 이다.
- SQL에도 종류가 많다
  - 내가 쓰는 프로그램에 맞게쓰는것도 중요하다.

- 테이블을 설계하고 수정하기는 거의없다.

- 데이터를 조회하는 것을 제일 많이한다.



#### SQL 언어 사용법

- **대/소문자를 구분하지 않는다.**

  ```sql
  select *  from STUDENT where GRADE in(2,3);
  SELECT *  FROM student WHERE grade IN(2,3); -- 위와 아래의 실행결과는 같다.
  ```

  > *이 밑부터는 대문자로 통일*

- **연산자가 있으나, 자바에서 쓰던거랑 조금 다르다.**

  ``` sql
  SELECT *  FROM student WHERE grade = 2 OR grade = 3; --  ==로 쓰지않고 =  로만 쓴다.
  SELECT *  FROM student WHERE grade >= 2 and grade <= 3; -- 비교연산자도 가능하다
  SELECT *  FROM student WHERE grade IN(2,3);
  SELECT *  FROM student WHERE NOT grade = 4; -- 4학년이 아닌학생
  SELECT *  FROM student WHERE grade != 4; -- 영어 not대신에 != 로도 쓸수있다. 
  SELECT *  FROM student WHERE NOT grade IN(4); -- 4학년이 아닌학생
  ```

  

- **배열형태로 보이지만 0번째가 아닌, 1번째부터 시작한다.**

- **날짜연산도 가능하다**

- **문자열을 쓸때는 작은 따옴표 ' ' 를 쓴다. 숫자는 그냥쓴다.**

  ``` sql
  SELECT * FROM emp WHERE enum = 100 AND job ='CLERK' OR job='salesman' -- 작은 따옴표 안에 들어가있는 문자
  ```

  - *ALIAS 썼을때 **스페이스를 써야하면 큰따옴표**를 쓴다.*

  ``` sql
  SELECT empno "사번", ename " 이 름", job "직 무" FROM emp;
  ```
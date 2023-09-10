------

# 제약조건 (Constraint)

------



#### 제약조건이란?

- 데이터의 무결성을 지키기위해 제한하는 조건
  - PRIMARY KEY - 기본키
  - FOREIGN KEY - 외래키
  - UNIQUE - 고유 키
  - CHECK - 체크
  - DEFAULT - 기본값
  - NOT NULL - 값을 꼭 입력해야만함



#### PRIMARY KEY  제약 조건

- 중복이 될수 없고, NULL 값이 될수가 없다.
  - 학번, 아이디, 사번과 같이 **고유한 번호**를 의미하는 열에 붙여진다.

- 각 테이블 마다 PRIMARY KEY는 하나만 가질수있다.



**같은 줄에 PRIMARY KEY  지정하는 방법**

``` sql
CREATE TABLE Person (
	person_id VARCHAR(10) NOT NULL PRIMARY KEY, -- 중복되지 말아야할 ID 에 PRIMARY 를 붙여주었다
	person_name VARCHAR(10) NOT NULL
);
```



**테이블 제일 마지막에 지정해주는 방법**

```sql
CREATE TABLE Person (
	person_id VARCHAR(10) NOT NULL,
	person_name VARCHAR(10) NOT NULL,
    PRIMARY KEY (person_id) -- 괄호 하고 안에 이름 넣어주면된다
);
```



**ALTER TABLE 에서 설정하는 법**

```sql
## person 테이블에 기본키 person_id 로 제약 조건을 겁니다.
ALTER TABLE person ADD CONSTRAINT PRIMARY KEY (person_id);
```



**기본키에 이름 지정하는 방법**

``` sql
CREATE TABLE Person (
	person_id VARCHAR(10) NOT NULL PRIMARY KEY, 
	person_name VARCHAR(10) NOT NULL
    CONSTRAINT PRIMARY KEY Person_id_PK (person_id); -- Person_id_PK 가 이름이 된다
);
```



#### FORIGN KEY  제약 조건

- 두 테이블의 사이를 연결해줌 - 다른테이블의 기본키와 꼭 연결된다.

```sql
CREATE TABLE Person (
	person_id VARCHAR(10) NOT NULL PRIMARY KEY, -- person의 기본키
	person_name VARCHAR(10) NOT NULL
);

CREATE TABLE buy (
    number INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ## buy table 의 person_id 는 person 테이블의 person_id를 참고하는 외래키 이다
	person_id VARCHAR(10) NOT NULL FORIGN KEY REFERANCES Person (person_id)
)
```

- 기본키 외래키 관계가 설정되면 열이 변경되거나 삭제가 불가능하다.



#### UNIQUE  제약 조건

- 큰 개념은 PRIMARY KEY 와 비슷하지만 NULL 값이 허용된다.
- 한 테이블에 여러개 설정이 가능하다
  - 이메일 주소 같은곳에 많이쓴다.

``` sql
CREATE TABLE Person (
	person_id VARCHAR(10) NOT NULL PRIMARY KEY, 
	person_name VARCHAR(10) NOT NULL,
    person_email CHAR(30) NULL UNIQUE -- 비워져 있을수 있지만 중복 될 수 는 없다
);
```





#### CHECK 제약 조건

- 입력되는 데이터에 제한을 거는 제약 조건
  - 입력해야하는 값이 정해져있는경우 - 나이를 1 부터 시작하게한다거나, 국번 입력에 제한을 건다거나.

```sql
CREATE TABLE Person (
	person_id VARCHAR(10) NOT NULL PRIMARY KEY, 
	person_name VARCHAR(10) NOT NULL,
    person_email CHAR(30) NULL UNIQUE,
    person_phone VARCHAR(15) CHECK IN ('010')
);
```

- CHECK 의 조건에서 벗어나는 값이 들어오면 에러가 생긴다.



**ALTER TABLE 로 설정하는 방법**

```sql
ALTER TABLE person ADD CONSTRAINT CHECK IN ('010');
```



#### DEFAULT 제약 조건 

- 값을 입력하지 않았을때 DEFAULT 로 설정한 값을 기본으로 입력하는 것.

```ㄴ비
CREATE TABLE Person (
	person_id VARCHAR(10) NOT NULL PRIMARY KEY, 
	person_name VARCHAR(10) NOT NULL,
    person_email CHAR(30) NULL UNIQUE,
    person_phone VARCHAR(15) CHECK IN ('010'),
    person_nation DEFAULT 'Korea' -- 기본값으로 Korea 가 입력된다
);
```



**ALTER TABLE 에서 설정하는 방법** 

``` sql
ALTER TABLE person ALTER COLUMN person_nation SET DEFAULT 'Korea';
```





> NULL != 0  && ' (공백) ';
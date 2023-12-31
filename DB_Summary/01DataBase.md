------

## 데이터베이스

------

#### DataBase

- **DataBase 의 정의**
  
  - 데이터의 집합 - 데이터를 여러곳에서 동일하게 관리하게 한다.
  
- **여러명이 동시 접근 가능, 사용자와 응용프로그램 공유가 가능하다.**

  > *MariaDB 는 데이터의 저장공간을 의미하기도한다.*

- **운영체제에 의존적이다.** 
  
  - 같은 데이터 베이스라도 컴퓨터 사양에따라 작동하기도하고, 고장나기도한다.
  
- **갈수록 무거워진다.**
  
  - 부팅할때 보통 같이 틀어짐으로, 사용하지않을 경우에는 수동으로 바꿔주는것이 좋다.



#### **데이터 베이스의 기초적인 용어**

- **데이터베이스 모델링** :  테이블 구조를 미리 설계하는 개념

  - 테이블 구조의 결정단계.
  - **세상에 사용되는 사물이나 작업을  DBMS 의 데이터 베이스 개체로 옮기는 과정**

- **데이터** : 하나의 단편적인 정보

- **테이블** : 데이터 입력을위한 표

- **데이터 베이스** : 테이블이 저장되는 장소

- **DBMS** :  데이터 베이스 관리시스템

- **열 (COLUM, 컬럼) **: 데이터관리 시스템 또는  

  

- **프로젝트 진행단계** 
  - **프로젝트 : 대규모 소프트웨어(프로그램)을 작성하기 위한 전체 과정.**
    - **프로젝트 계획** : 만들어질 *프로그램에 대한 구체적인 계획*
    - **업무분석** : 만들어질 *프로그램의 성향과 기능을 파악*한다.
    - **시스템 설계** : 컴퓨터에 적용시키기위해 *알맞은 형태로 다듬는것*
    - **프로그램 구현** : 앞서 구현한 것들을 *코딩을 통해 구현하는 단계*
    - **테스트** : 코딩된 프로그램에 *오류가 없는지 테스트 하는단계*
    - **유지보수** : 프로그램을 운영 하면서 *문제점과 필요한 점을 보수해나가는것* 



#### Sever & Client

| Server                                                      | Client                                          |
| :---------------------------------------------------------- | :---------------------------------------------- |
| **용량이 커야한다**                                         | **서버에 서비스 요청을 한다.**                  |
| - 운영체제도 서버급으로 실행해야 함으로 달라야한다              | - 클릭했을시 보여질 페이지, 로그인 요청 등등...    |
| - 여러사람이 (다수의 사용자가) 접속해야함으로.                 |                                                 |
| **Client  의 응답을 항상 받아야함으로 늘 켜져 있어야한다.** |                                                 |

> 블루투스도 서버의 역할을 하는거나 마찬가지이다.



### DataBase 의 특징

-  **오류가 없어야 한다.**
  - 여러가지 제약조건을 걸어서 최대한 데이터를 안전하게 지켜야한다.

- **DBMS 로 자체 복원/백업이 가능하다.**
  - 쿼리로 백업
  - 엑셀로 백업
  - SQL로 백업

- **DB와 응용 프로그램은 독립적인 관계여야한다. (데이터의 독립성)**
  - DB가 변해도 응용프로그램에게는 변화가 없어야한다.

- **보안성이 있다 .**
  - 데이터 접근은 제어할수있다.(아무나 못건들임)

- **중복의 최소화.**

- **객체처럼 테이블 간 의 관계를 짤 수 있다.**

  - 한곳에 만드는것도 중요하지만 적절히 나누어 운영해야 느림을 방지할수있다

    > *너무 많이 나누어도 효율이 떨어지니 연습을 많이해야한다.*

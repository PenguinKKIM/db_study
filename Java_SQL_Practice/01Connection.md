#### Connection

##### 자바와 데이터 베이스를 연결해주는 객체

- 마리아 DB 파일을 작업할 자바 프로젝트에 넣는다
  - 마리아 DB 파일을 경로로 찾아 들어가도 되지만, 작업의 편리함을 위해 옮겨준다

- 마리아 DB를 물려준다
  - Build Path > configure Build Path > Library > ClassPath > Add JARs > Maria DB 선택 

```java
public static Connection getConnection() {
		// Connection
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/testdb", "root", "1234");
			System.out.println("DB Connection!!"); //DB 연결시 콘솔에 나올 메세지 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
```

- **Class.forName("org.mariadb.jdbc.Driver");** 
  - Class.forName 은  JDBC 을 작동시키기 위한 클래스와 메소드 이다 
  - 여기서 org.mariadb.jdbc.Driver 는 마리아 DB 의 드라이버 이름이며,  JDBC  에 물려 있는  API 를 작동시켜준다.

- **conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/testdb", "root", "1234");**
  - DriverManager.getConnection 는 JDBC 를 통하여 자바와 데이터 베이스를 네트워스 상 연결해주는 메소드.
  - jdbc:mariadb://localhost:3306/testdb 
    - jdbc:mariadb - 프로토콜
    - localhost:3306 : 서버주소
    - testdb : 접속할 DB 이름
  - root, 1234
    - root : DB 서버에 접속할 ID (여기서는 마스터 ID).
    - 1234 :  DB 서버에 접속할 ID 의 비밀번호.



##### 여기저기서 가져다가 쓸 코드라 편의성을 위해 아래와 같이 만든다.

- 텍스트 파일을 하나 만들어 이름을 알기쉽게 아래와 같이 작성한다

```java
driver=org.mariadb.jdbc.Driver //db 드라이버 이름
url=jdbc:mariadb://localhost:3306/testdb //서버주소와 접속하는 DB
user=root //DB 에 접속할 ID
password=1234 //DB 에 접속할 ID의 비밀번호
```

- 아무데나 작성하고 뽑아와도 되지만, 보통 데이터 베이스를 관리하는 파일 상단에 위 텍스트 파일을 이용해 Connection 코드를 작성한다.

```java
##FileInputStream 을 import 해야한다.

public static Connection getConnection() {
		Connection conn = null;
		try {
			Properties db = new Properties();
			db.load(new FileInputStream("db.properties"));
			Class.forName(db.getProperty("driver"));
			conn = DriverManager.getConnection(db.getProperty("url"), db.getProperty("user"),
					db.getProperty("password"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
```

- Properties db = new Properties();  //Properties  를 db 에 저장함
  - Properties 클래스는 윈도우파일 INI  처럼 기본으로 시작하는 프로그램 클래스이다.

- 나머지 밑 코드들은 위에 코드와 내용이 같다.

##### 이렇게 작성하면 DB 의 ID 나 포트가 변경될때 수정하기 용의하다


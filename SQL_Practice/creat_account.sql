/*
ROOT ACCOUNT : 루트 계정
- 마스터 계정
- 다른계정을 만들수있다.
 - 마스터 계정이 만들어주는것  
	CREATE user 계정명 IDENTIFIED BY '비밀번호';
**/

## 계정 관리 : root 계정 이 아니면 계정을 관리 할수없다
-- 유저 생성(계정 생성)
CREATE user kosta IDENTIFIED BY '1234';

-- 유저의 비밀번호를 바꾸게해줌 
ALTER user kosta IDENTIFIED BY '1234';

-- 유저삭제
DROP user kosta;

##권한주기

-- 특정 권한 부여 (SELECT, INSERT, UPDATE에 대한 권한 부여)
GRANT SELECT, INSERT, UPDATE ON testdb.* To kosta;

-- 특정 데이터 베이스의 모든권한주기
GRANT ALL PRIVILEGES ON testdb.* To kosta;

-- 모든데이터 베이스의 권한주기
GRANT ALL PRIVILEGES ON *.* To kosta;

-- 계정에게 주어진 모든 권한 상태를 보여줌
-- 계정을 ?????
-- grant usage on  - 해당 계정에 사용권한이 없다는 말
SHOW GRANTS FOR 'kosta';


## 권한삭제
-- 특정 권한에대한 삭제 (UPDATE에 대한 권한 삭제)
REVOKE UPDATE ON testdb.* FROM 'kosta';

-- testdb에 대한 모든  권한 삭제
REVOKE ALL PRIVILEGES ON testdb.* FROM 'kosta';

-- 모든 데이터 베이스에 대한 모든 권한 삭제
-- 실행은 되는데 GRANTS 에 보여지질 않음(업데이트가 안되는 ...?)
REVOKE ALL PRIVILEGES ON *.* FROM 'kosta';


/*
kosta 계정에서 확인하기
**/

DELETE FROM account WHERE id = '10001';

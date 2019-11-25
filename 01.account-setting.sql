alter user hr account unlock;

alter user hr identified by "9922";

-- 주석
-- 기존 사용자 계정 삭제
-- DROP USER madang CASCADE;

-- 신규 사용자 계정 만들기
CREATE USER madang IDENTIFIED BY "9922";

-- 권한 부여 (연결, 자원 사용)
GRANT CONNECT, RESOURCE TO madang;

-- 계정 활성화
ALTER USER madang ACCOUNT UNLOCK;
-- ALTER USER madang ACCOUNT LOCK; -- 비활성화
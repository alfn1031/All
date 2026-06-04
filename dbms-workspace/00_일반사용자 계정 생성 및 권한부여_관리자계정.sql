-- 한 줄 주석
/*
 * 여러 줄 주석 
 */
-- 일반 사용자 계정(수업시간에 사용할 각자의 계정)을 하나 만듦
CREATE USER C##MS IDENTIFIED BY ms;
-- 접속권한, 데이터를 다룰 수 있는 권한 부여
GRANT CONNECT, RESOURCE TO C##MS;
-- 테이블 스페이스 사용 권한
GRANT UNLIMITED TABLESPACE TO C##MS;
---------------------------------------------------------
CREATE USER C##HW IDENTIFIED BY HW;
GRANT CONNECT, RESOURCE TO C##HW;
GRANT UNLIMITED TABLESPACE TO C##HW;


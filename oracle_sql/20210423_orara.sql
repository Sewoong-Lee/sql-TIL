--SQL
--DML : 데이터 조작어
-- 문자열 왼쪽정렬, 숫자 오른쪽 정렬
--조회
SELECT COUNTRY_NAME, COUNTRY_ID  
FROM COUNTRIES
WHERE COUNTRY_ID = 'CA';

SELECT * FROM JOBS
WHERE MIN_SALARY <= 5000
OR MAX_SALARY > 20000
ORDER BY MAX_SALARY ;  --오름차순

--실습) EMPLOYEES테이블의 사원 ID와 이름과 년봉 조회
-- 년봉이 10000이상인 사원만
-- 년봉의 내림차순으로 정렬

SELECT employee_id, FIRST_NAME , SALARY
FROM EMPLIYEES  
WHERE SALARY > 10000  --연봉 만 이상  --조건
ORDER BY SALARY DESC; --내림차순 정렬


-- EMPLOYEES테이블의 잡 아이디가 PROG인 사원들 조회
SELECT * FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';  -- =같다면


-- EMPLOYEES 테이블의 EMPLOYEE_ID의 200 이상인 사원
-- EMPLOYEE_ID의 오름차순으로 정렬
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID > 200
ORDER BY EMPLOYEE_ID;  --오름차순

--해석
SELECT * 
FROM EMPLOYEES
WHERE EMPLOYEE_ID >= 200
ORDER BY EMPLOYEE_ID;  --오름차순


-- EMPLOYEES 테이블의 EMPLOYEE_ID,  HIRE_DATE 조회
-- 셀랙트를 쓸때 FROM은 필수
-- TO_CHAR()함수를 이용하여 날짜 포맷 변경 (문자열로 들어옴)
-- 2005년 1월 1일 이후 입사,  SALARY가 8000 이하 인 사원

SELECT EMPLOYEE_ID, TO_CHAR(HIRE_DATE,'YYYY-MM-DD') 
FROM EMPLOYEES
WHERE HIRE_DATE > '2005-01-01'  --문자열로 입력해도 알아서 불러옴
AND SALARY <= 8000 ; --WHERE 조건문 이후 그리고(AND)로 연속 조건문


-- EMPLOYEES 데이블의 EMPLOYEE_ID, MANAGER_ID 조회
-- MANAGER_ID가 147번 인 사원
SELECT EMPLOYEE_ID, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID = 147;


--테이블 구조 확인
DESC EMPLOYEES; 


-- EMPLOYEES 데이블의 MANAGER_ID  147번인 사원의 수
-- COUNT(*) : 집계 함수, 건수   (행의 수가 몇개인지 알려줌)
SELECT COUNT(*) AS CNT  -- CNT라는 필드명을 만들어줌
FROM EMPLOYEES
WHERE MANAGER_ID = 147;


-- EMPLOYEES 데이블의 SALARY가 10000 이상 이거나 5000 이하인 사원의 수
SELECT COUNT(*) SAL  -- SAL라는 필드명을 만들어줌 / AS 생략 가능
FROM EMPLOYEES
WHERE SALARY >= 10000
OR SALARY <= 5000;


-- EMPLOYEES 데이블의 JOB_ID가 IT_PROG인 SALARY의 합계, 사원의 수, 평균, 월급이 가장 큰 월급, 가장 작은 월급
-- SUM : 집계함수 : 합계, AVG (평균) , MAX(최대값), MIN(최소값)
--평균 구하는 2가지 방법 : SUM(SALARY) / COUNT(*) , AVG (SALARY)
SELECT SUM(SALARY) , COUNT(*) , SUM(SALARY) / COUNT(*) , AVG (SALARY) , MAX(salary), MIN(salary)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';


--실습) DEPARTMENTS 테이블의 행의 개수
SELECT COUNT(*)
FROM DEPARTMENTS;

--실습) JOBS 테이블의 MIN_SLARY가 5000 미만인 수
SELECT COUNT(*)
FROM JOBS
WHERE MIN_SALARY <5000;

--실습) EMPLOYEES 테이블의 HIRE_DATE 가 '20050101' 이후이고 SALARY가 10000 이상 20000이하인 사원의 수
SELECT COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE < '20050101'
AND SALARY BETWEEN 10000 AND 20000;  --BETWEEN 사이값


-- EMPLOYEES 테이블에서 EMPLOYEE_ID, JOB_ID 조회 이후
-- JOB_ID 가 'IT_PROG'인 사원의 수
--그룹을 지음 으로서 카운트와 함께 사용
SELECT JOB_ID, COUNT(*) CNT
FROM EMPLOYEES
WHERE JOB_ID LIKE 'S%'  -- 라이크 조건문 (S로 시작하는)
GROUP BY JOB_ID  --그룹을 만들어야만 카운트 앞에 넣을 수 있다.
HAVING COUNT(*) >= 5  -- 그룹바이의 결과에 대한 조건문  (여기는 CNT 안됨)
ORDER BY CNT;



--데이터 읽는 순서
SELECT JOB_ID, COUNT(*) CNT  --4, 이름 변경 6번
FROM EMPLOYEES  --1번
WHERE JOB_ID LIKE 'S%' --2번
GROUP BY JOB_ID  --3번
HAVING COUNT(*) >= 5  --5번
ORDER BY CNT;  --7번























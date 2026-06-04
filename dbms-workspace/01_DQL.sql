/*
	< SELECT > 
	데이터를 조회하거나 검색 할 때 사용하는 명령어
	
	SELECT 
		   조회하고자 하는 컬럼
		 , 조회하고자 하는 컬럼
	  FROM
		   테이블명;
	
	- ResultSet : SELECT문을 통해 조회된 데이터 결과물
				  조회된 행드르이 집합

*/

-- ANIMAL 테이블에서 모든 컬럼을 전부 다 조회 new String("abc")
SELECT * FROM ANIMAL; -- 성능에 영향을 끼치므로 사용하지 말 것

-- 필요한 컬럼만 명시해서 조회
SELECT 	
		ANIMAL_NAME
	  , WEIGHT_KG	
  FROM 	
		ANIMAL;

SELECT animal_name, weight_kg FROM animal;

-- 실습문제

-- 1. SPECIES테이블에서 SPECIES_ID, SPECIED_NAME 컬럼을 조회

-- 2. ZONE테이블에서 KEEP_NAME, HIRE_DATE 컬럼을 조회

-- 3. KEEPER 테이블에서 KEEP_NAME, HIRE_DATE 컬럼을 조회

-- 4. ANIMAL 테이블에서 ANIMAL_NAME, GENDER 컬럼을 조회

-- 5. ANIMAL 테이블에서 BIRTH_DATE, ANIMAL_NAME, ZONE_ID 컬럼을 조회


SELECT 
		SPECIES_ID
	  , SPECIES_NAME
  FROM 
		SPECIES;

SELECT 
		KEEP_NAME
   	  , HIRE_DATE
  FROM
		ZONE;

SELECT 
		KEEPER_NAME
	  , HIRE_DATE
  FROM
		KEEPER;

SELECT
		ANIMAL_NAME
	  , GENDER
  FROM
		ANIMAL;
		
SELECT 
		BIRTH_DATE
		, ANIMAL_NAME
		, ZONE_ID
  FROM 
		ANIMAL;
		
---------------------------------------------------------

/*
 * < 컬럼에서 조회된 값을 가지고 산술연산 >
 * SELECT절에 산술연산을 기술해서 결과를 조회할 수 있다
 * 
 */

-- ANIMAL 테이블로부터 동물이름, 체중을 조회

SELECT
	ANIMAL_NAME
  , WEIGHT_KG
	-- GRAM단위도 조회하고싶은대?
  , WEIGHT_KG * 1000	
FROM
	ANIMAL;

-- 현재시점의 날자값 : SYSDATE
SELECT
	ANIMAL_NAME 
  , ARRIVAL_DATE
  , SYSDATE - ARRIVAL_DATE
FROM
	ANIMAL;
--> 산술연산 과정에서 NULL값이 존재할 경우 산술연산 결과도 NULL
------------------------------------------------------
/*
 * < 컬럼명에 별칭 달기 >
 * 
 * 컬럼명 AS 별칭, 컬럼명 AS "별칭", 컬럼명 "별칭", 컬럼명 별칭
 *
 */
	 
SELECT
	ANIMAL_NAME AS 동물이름
  , WEIGHT_KG "체중 (kg)"
  , WEIGHT_KG * 1000 "체중(g)"
FROM
	ANIMAL;
-- 별칭에 특수문자 또는 공백이 포함될 경우 반드시 "" 로 묶어주어야 함
-------------------------------------------------------
/*
 * < 리터럴 > 
 * 
 * || 연산자
 */
SELECT
	ANIMAL_NAME
  , WEIGHT_KG || 'kg' 단위
  , 'kg'
FROM
	ANIMAl;
--------------------------------------------------------
/*
 * < DISTINCT > 
 * 조회하려고하는 컬럼 앞에 작성해서 중복된 값을 한번만 조회
 * 
 * SELECT에 DISTINCT구문은 한개 사용하는것을 권장
 * 
 */


SELECT
	DISTINCT SPECIES_ID
FROM
	ANIMAL;
-------------------------------------------------------
/*
 * < WHERE 절 >
 * 
 * SELECT절에서 조회를 할 떄 조건을 제시하는 문법
 * 조건에 만족하는 행만 조회 할 수 있음
 * 
 * SELECT
 * 		컬럼명
 * 	FROM
 * 		테이블명
 * WHERE
 * 		조건식;
 * 
 * < 비교연산자 >
 * 동등비교 : =, !=
 * 대소비교 : <. >, <=, >=
 */

-- ANIMAL 테이블에서 100KG이상인 동물들의 이름을 조회
SELECT
	ANIMAL_NAME
  , WEIGHT_KG	
FROM
	ANIMAL
WHERE
	WEIGHT_KG >= 100;

-- ANUMAL 테이블에서 성별이 'F'인 동물들의 이름, 성별 조회
SELECT
	ANIMAL_NAME ,
	GENDER
FROM
	ANIMAL
WHERE 
	GENDER = 'F';

-- ANIMAL 테이블 구역코드 'Z1'이 아닌 동물들의 이름, 구역코드 조회
SELECT
	ANIMAL_NAME,
	ZONE_ID
FROM
	ANIMAL
WHERE
	-- ZONE_ID != 'Z1';
	ZONE_ID <> 'Z1';

-- 실행순서
-- 1. SELECT, 2. FROM, 3. WHERE
-- FROM -> WHERE -> SELECT 순으로 수행

-- 1. ANIMAL 테이블에서 체중이 50KG 이상인 동물들의 이름, 체중 조회

-- 2. ANIMAL 테이블에서 구역코드가 'Z2'인 동물들의 이름, 체중 조회

-- 3. ANIMAL 테이블에서 수컷(GENDER = 'M')인 동물들의 이름, 성별, 체중 조회

SELECT
	ANIMAL_NAME,
	ANIMAL_KG
FROM 
	ANIMAL
WHERE 
	WEIGHT_KG >= 50;

-------

SELECT
	ANIMAL_NAME,
	ANIMAL_KG
FROM
	ANIMAL
WHERE 
	ZONE_ID <> 'Z2';

-------

SELECT
	ANIMAL_NAME,
	GENDER,
	ANIMAL_KG
FROM
	ANIMAL
WHERE
	GENDER = 'M';
------------------------------------------------
/*
 * < 논리 연산자 >
 * AND(이면서, 그리고) / OR(이거나, 또는)
 */
-- 구역코드가 'Z1'이면서 체중이 50KG이상인 동물들의 이름, 구역코드, 체중 조회
SELECT
	ANIMAL_NAME,
	ZONE_ID,
	WEIGHT_KG
FROM
	ANIMAL
WHERE
	ZONE_ID = 'Z'
AND 
	WEIGHT_KG >= 50;

-- 구역코드가 'Z4'이거나 체중이 10KG이하인 동물들의 이름, 구역코드, 체중 조회
SELECT 	
	ANIMAL_NAME
  , ZONE_ID
  , WEIGHT_KG
 FROM
 	ANIMAL
 WHERE 
 	ZONE_ID = 'Z4'
 	OR 
 	WEIGHT_KG <= 10;

-- 체중이 100KG 이상이고 500KG이하인 동물들의 이름, 체중 조회
SELECT
	ANIMAL_NAME,
	WEIGHT_KG
FROM
	ANIMAL
WHERE 	
	WEIGHT_KG >= 100
AND 	
	WEIGHT_KG <= 500;
---------------------------------------------------
/*
 * < BETWEEN AND >
 * 몇 이상, 몇 이하인 범위에 대해 조건을 제시할 때 사용
 */
SELECT
	ANIMAL_NAME,
	WEIGHT_KG
FROM
	ANIMAL
WHERE 	
	WEIGHT_KG BETWEEN 100 AND 500;

-- 체중이 100KG 미만이거나 500KG 초과하는 동물
SELECT
	ANIMAL_NAME,
	WEIGHT_KG
FROM
	ANIMAL
WHERE 	
	WEIGHT_KG NOT BETWEEN 100 AND 500;

--------

SELECT
	ANIMAL_NAME,
	ARRIVAL_DATE
FROM
	ANIMAL
WHERE
	ARRIVAL_DATE BETWEEN '18/01/01' AND '22/12/31';

----------------------------------------------------
/*
 * < LIKE '특정패턴' >
 * 컬럼의 값이 지정한 특정 패턴에 만족할 경우 조회
 * 
 * '%' : 0글자 이상
 * LIKE '푸%' : '푸'로 시작하는 데이터
 * LIKE '%바%' : '바'RK VHGKAEHLSMS EPDLXJ
 * LIKE '%이' : '이'로 끝나는 데이터
 * 
 * '_' : 딱 1글자
 * LIKE '_리' : 앞에 한글자 + '리'인 데이터
 */

SELECT
	ANIMAL_NAME
FROM
	ANIMAL
WHERE 
	ANIMAL_NAME LIKE '%바오';

-- 이름이 두글자인 동물들의 이름
SELECT
	ANIMAL_NAME
FROM
	ANIMAL
WHERE
	ANIMAL_NAME LIKE '_리';

/*
 * List<ANIMAL> animals = new ArrayList();
 */
SELECT * FROM ANIMAL;
/*
 * public class Animal {
 * 		private String animalId;
 * 		private String animalName;
 * 		private String speciesId;
 * ....
 */
-------------------------------------------------------
/*
 * < IS NULL > 
 * 
 * 컬럼값이 NULL / NULL이 아닐때 비교할 떄 사용
 */
-- 담당 사육사가 배정되지 않은 동물
SELECT
	ANIMAL_NAME,
	KEEPER_ID
FROM
	ANIMAL;
WHERE
	-- KEEPER_ID = IS NULL;
	KEEPER_ID IS NOT NULL;
---------------------------------------------------------
/*
 * < IN >
 * 비교대상 컬럼값중 일치하는 값이 있는지
 */
-- ANIMAL 테이블에서 구역코드가(ZONE_ID) Z1이거나 Z2이거나 Z5인 동물들의 이름, 구역코드
SELECT
	ANIMAL_NAME,
	ZONE_ID
FROM
	ANIMAL
WHERE
	ZONE_ID IN ('Z1', 'Z2', 'Z5');
/*
	ZONE_ID = 'Z1'
OR 
	ZONE_ID = 'Z2'
OR 
	ZONE_ID = 'Z5';
*/
-------------------------------------------------------
/*
 * 연산자 우선순위
 * 1. ()
 * 2. 산술연산자
 * 3. 연결연산자
 * 4. 비교연산자
 * 5. IS NULL, LIKE, IN
 * 6. BETWEEN AND
 * 7. NOT
 * 8. AND
 * 9. OR
 * 
 */
----------------------------------------------------------
/*
 * < ORDER BY 절 > 
 * 정렬 용도로 사용하는 구문
 * 
 * ORDER BY [컬럼명/별칭/컬럼순번] [ASC/DESC] [NULLS FIRST/NULL LAST]
 * 
 * @@ 무조건 ORDER BY를 사용하지 않으면 정렬이 안 된 상태 @@
 */
-- SELECT * FROM ZONE;
-- 체중을 오름차순으로 정렬
SELECT
	ANIMAL_NAME
	, WEIGHT_KG
FROM
	ANIMAL
ORDER 
   BY
--    WEIGHT_KG;
	  WEIGHT_KG _KG SESC;

SELECT 
		ANIMAL_NAME
	  , ARRIVAL_DATE
  FROM
		ANIMAL
 ORDER
 	BY 
 		ARRIVAL_DATE DESC NULLS LAST;

-------

SELECT 
		ANIMAL_NAME
	  , ZONE_ID
	  , WEIGHT_KG "체중"
  FROM
  		ANIMAL
  ORDER 
  	 BY 
  	 	"체중";
--------

SELECT -- 3
		ANIMAL_NAME
	  , WEIGHT_KG "체중"
  FROM -- 1
  		ANIMAL
 WHERE -- 2
		"체중" > 100; -- WHERE절이 SELECT보다 먼저 수행되기때문에 사용 불가!

-- SELECT문의 가장 마지막에 작성 + 실행 순서도 가장 마지막










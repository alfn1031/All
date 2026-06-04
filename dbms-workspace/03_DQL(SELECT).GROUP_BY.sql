-- ============ < GROUP BY > ============

-- 종별로 동물들이 몇마리씩 있는지 조회하고 싶다.
SELECT
		ANIMAL_NAME
	  , SPECIES_ID
  FROM 
  		ANIMAL;

SELECT * FROM SPECIES;

SELECT 	
		COUNT(*)
  FROM	
 		ANIMAL
 WHERE
		SPECIES_ID = 'S01';
-- S01 == 3마리
-- S02 == 3마리
-- S03 == 3마리

SELECT 
		SPECIES_ID
	  , COUNT(*) 
  FROM
  		ANIMAL
 GROUP
	BY 
		SPECIES_ID;

-- 성별 동물 수
SELECT 
		GENDER
	  , COUNT(*)
  FROM
  		ANIMAL
 GROUP
	BY
		GENDER;

-- 종별 최대 체중, 최서 체중
SELECT 
		SPECIES_ID
	  , MAX(WEIGHT_KG)
	  , MIN(WEIGHT_KG)
  FROM
		ANIMAL
 GROUP 
 	BY
 		SPECIES_ID;

-- 구역별(ZONE_ID) 동물 수, 평균체중 조회
SELECT 
		ZONE_ID
	  , COUNT(*)
	  , AVG(WEIGHT_KG)
  FROM
  		ANIMAL
  GROUP 
     BY 
     	ZONE_ID;

------------

SELECT 
		ZONE_ID
	  , GENDER
	  , COUNT(*)
  FROM 
  		ANIMAL
  GROUP 
  	 BY
  		ZONE_ID
  	  , GENDER DESC;
----------------------------------------------
/*
 * HAVING 절
 * 그룹에 대한 조건을 제시할 때 사용하는 문법
 * WHERE절은 그룹함수를 사용할 수 없음 -> HAVING
 */
-- 종별 동물 수가 4마리 이상인 종만 조회
SELECT 
		SPECIES_ID
	  , COUNT(*)
  FROM
  		ANIMAL
-- WHERE
	--	COUNT(*) >= 4
 	--	GENDER = 'M'
 GROUP
 	BY
 		SPECIES_ID
HAVING
		COUNT(*) >= 4
 ORDER
 		SPECIES_ID;

-- 평균 체중이 100KG이상인 구역만 조회
SELECT 
		ZONE_ID
	  , AVG(WEIGHT) "평균체중"
  FROM
		ANIMAL
 GROUP
 	BY 
 		ZONE_ID;

/*
 * SELECT 컬럼, 연산식, 함수, 리터럴
 * 	FROM 테이블명
 * 	WHERE 조건식
 * GROUP
 * 	  BY 그룹기준컬럼
 * HAVING 그룹에대한 조건식
 * 
 */
 























/*
 * < @@ Join @@ >
 * 두개 이상의 테이블을 연결하여 하나의 결과로 조회하는 것
 * 연결고리가 되는 컬럼을 통해 관계를 맺어줌
 * 
 * - 오라클 전용 문법 / ANSI(표준)문법이 있음
 */

-- 동물의 이름, 종 이름 조회
-- ANIMAL -> ANIMAL_NAME
-- SPECIES -> SPECIES_NAME

SELECT ANIMAL_NAME, SPECIES_ID FROM ANIMAL;
SELECT SPECIES_ID, SPECIES_NAME FROM SPECIES;

--> 오라클 전용 구문
SELECT
		ANIMAL_NAME
	--  , A.SPECIES_ID
	--  , S.SPECIES_ID
	  , S.SPECIES_NAME
  FROM 
  		ANIMAL A
  	  , SPECIES S
 WHERE 
 		A.SPECIES_ID = S.SPECIES_ID;

--> ANSI 구문
SELECT 
		ANIMAL_NAME
	  , SPECIES_NAME
  FROM
  		ANIMAL
  JOIN
  		SPECIES USING(SPECIES_ID);

-- EQIALJOIN(등가 조인) / INNER JOIN(내부 조인)
-- 연결되는 컬럼의 값이 일치하는 행동만 조인해서 조회(일치하지않은 행은 결과에서 제외)

-- CARTESIAN PRODUCT(카르테시안곱) -> 테이블끼리의 모든 행을 곱한 결과
-- 지구상에서 일어나선 안됨!!!

SELECT * FROM ZONE WHERE ZONE_ID = 'FF';   -- ZONE_ID, ZONE_NAME
SELECT * FROM ANIMAL; -- ZONE_ID, ANIMAL_NAME
-- 동물 이름, 구역명 조회

-- ANSI -> 연결고리 컬럼명이 다르다고 가정
SELECT
		ANIMAL_NAME
	  , ZONE_NAME
  FROM
  		ANIMAL A
  JOIN
  		ZONE Z ON(A.ZONE_ID = Z.ZONE_ID);

-- 동물이름, 종 이름, 구역명 조회
-- SPECIES_ID -> ANIMAL, SPECIES
-- ZONE_ID -> ANIMAL, ZONE

SELECT 
		ANIMAL_NAME
	  , SPECIES_NAME
	  , ZONE_NAME
  FROM
 		ANIMAL
  JOIN
   		SPECIES USING(SPECIES_ID)
  JOIN
  		ZONE USING(ZONE_ID);
 
------

SELECT ANIMAL_NAME, SPECIES_NAME
  FROM ANIMAL NATURAL JOIN SPECIES;

-- 동물이름, 종 이름, 구역명, 담당사육사 이름(KEEPER)
SELECT * FROM KEEPER K R;

SELECT 
		ANIMAL_NAME
	  , SPECIES_NAME
	  , ZONE_ID
	  , KEEPER_NAME
  FROM
  		ANIMAL 
  JOIN	  
  		SPECIES USING(SPECIES_ID)
  JOIN
  		ZONE USING(ZONE_ID)
  JOIN 
  		KEEPER USING(KEEPER_ID);
-- ANIMAL 테이블에서 KEEPER_ID컬럼의 값이 NULL인 경우 조회 안됨
-- INNER JOIN으므로

------------------ < 외부 조인(OUTER JOIN) > ------------------

/*
 * 조인 조건에 만족하지 않는 행도 포함시켜 조회
 * LEFT OUTER JOIN : 왼쪽 테이블의 모든 행 조회
 * RIGHT OUTER JOIN : 오른쪽 테이블~~~
 * FULL OUTER JOIN : 양쪽 테이블~~~
 */

-- LEFT JOIN : ANIMAL_NAME, KEEPER_NAME 조회
SELECT 
		ANIMAL_NAME
	  , KEEPER_NAME
  FROM
  		ANIMAL LEFT OUTER JOIN KEEPER USING(KEEPER_ID);

---> 오라클 전용 구문
SELECT 
		ANIMAL_NAME
	  , KEEPER_NAME
  FROM
	    ANIMAL A
	  , KEEPER K
 WHERE 
		A.KEEPER_ID(+) = K.KEEPER_ID;
--------------

SELECT * FROM KEEPER;

-- RIGHT JOIN
SELECT 
		ANIMAL_NAME
	  , KEEPER_NAME
  FROM
  		ANIMAL A
 RIGHT 
 OUTER
  JOIN
  		KEEPER K ON (A.KEEPER_ID = K.KEEPER_ID);

-- FULL OUTER JOIN
SELECT
		ANIMAL_NAME
	  , KEEPER_NAME
  FROM
  		ANIMAL
  FULL
 --OUTER(생략)
  JOIN
  	 	KEEPER USING(KEEPER_ID);

------------------------------------------------------
-- NON EQUAL JOIN(비등가 조인)
-- (=) <- 이 아닌 범위 비교
-- 예) 체중 WEIGHT_KG BETWEEN MIN_WEIGHT AND MAX WEIGHT
-- SELF JOIN(WKCP WHDLS)
-- 테이블이 자기 자신과 조인해서 ResultSet을 만드는 경우

SELECT * FROM KEEPER;
------------------------------------------------------
-- 35마리의 동물 전체 정보 조회
-- 동물의 이름, 종이름, 분류, 구역명, 실내외여부, 사육사명
--									(사육사가 배정되지 않은 경우 미배정이라 출력)
-- 정렬은 ANIMAL_ID 오름차순으로 정렬하시오

SELECT * FROM ANIMAL;
SELECT * FROM SPECIES;
SELECT * FROM ZONE;
SELECT * FROM KEEPER;

SELECT
		ANIMAL_NAME
	  , SPECIES_NAME
	  , SPECIES_CLASS
	  , ZONE_NAME
	  , ZONE_TYPE
	  , NVL(KEEPER_NAME, '미배정')
  FROM
  		ANIMAL 
  JOIN 
  		SPECIES USING(SPECIES_ID)
  JOIN
  		ZONE USING(ZONE_ID)
  LEFT
  JOIN	KEEPER USING(KEEPER_ID)
 ORDER 
 	BY 
		ANIMAL_ID;





















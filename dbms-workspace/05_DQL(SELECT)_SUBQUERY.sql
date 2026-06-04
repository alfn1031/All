/*
 * < SUBQUERY >
 * 
 * 하나의 SQL문 안에 포함된 또다른 SQL문
 * 메인 쿼리문의 보조용도
 * 
 * 실행순서
 * 서브쿼리 실행 -> 메인쿼리
 */
--- < 단일행 서브쿼리 > ---
-- 서브쿼리의 실행 결과가 1행 1열인 경우 -> 일반 비교연산자를 사용

-- 푸바오와 같은 구역에 사는 동물들의 이름 조회
SELECT ZONE_ID FROM  ANIMAL WHERE ANIMAL_NAME = '푸바오';
UPDATE ANIMAL SET ZONE_ID = 'Z1' WHERE ANIMAL_NAME = '푸바오';
SELECT	
		ANIMAL_NAME
	  , ZONE_ID
  FROM 
  		ANIMAL
 WHERE 
 		ZONE_ID = (SELECT
 							ZONE_ID
 					 FROM
 					 		ANIMAL
 					WHERE
 							ANIMAL_NAME = '푸바오');

-- 전체 동물의 평균체중보다 가벼운 동물 이름 조회
SELECT
		AVG(WEIGHT_KG) 
  FROM
  		ANIMAL;

-------
SELECT
		ANIMAL_NAME
	  , WEIGHT_KG
  FROM
  		ANIMAL
 WHERE
 		WEIGHT_KG < (SELECT
 							AVG(WEIGHT_KG)
 					   FROM
 					   		ANIMAL);

-- 가장 옛날에 태어난 동물의 이름 조회
SELECT MIN(ARRIVAL_DATE) FROM ANIMAL;

SELECT 
		ANIMAL_NAME
  FROM
  		ANIMAL
 WHERE
 		ARRIVAL_DATE = (SELECT
 								MIN(ARRIVAL_DATE
 						  FROM
 						  		ANIMAL;)
---- 이름이 강철원인 사육사가 담당하는 동물 이름 조회
SELECT 
		ANIMAL_NAME
  FROM
  		ANIMAL
  JOIN
  		KEEPER USING(KEEPER_ID)
 WHERE
 		KEEPER_NAME = '강철원';

------
SELECT
		ANIMAL_NAME
  FROM
  		ANIMAL
 WHERE
 		KEEPER_ID = (SELECT 
 							KEEPER_ID
 					   FROM 
 					   		KEEPER
 					  WHERE
 					  		KEEPER_NAME = '강철원');
----------------------------------------------------
-- < 다중행 서브쿼리 > 
-- 서브쿼리 수행 결과가 여러 행인경우
-- IN, ANY, ALL 사용

/*
 * IN : 서브쿼리 수행결과중 하나라도 일치하면 조회
 * > ANY : 서브쿼리 결과중 하나라도 크면(= 최소값보다 크면)
 * < ANY : 서브쿼리 결과중 하나라도 작으면(= 최소값보다 작으면)
 * > ALL : 서브쿼리 결과 모두보다 크면(=최대값보다 크면)
 * < ALL : 서브쿼리 결과 모두보다 작으면(=최대값보다 작으면)
 */

-- ANIMAL테이블에서 종별로 최대 체중을 가진 동물 조회
SELECT
		ANIMAL_NAME
	  , WEIGHT_KG
  FROM
  		ANIMAL
 WHERE
 		WEIGHT_KG IN (SELECT
		                      MAX(WEIGHT_KG)
	 					FROM
		 					  ANIMAL
						GROUP
						   BY
						   	  SPECIES_ID);

-- 조류관(Z4)에 있는 동물의 체중보다 가벼운 동물이 있으면 조회
SELECT
		ANIMAL_NAME
  FROM 
  		ANIMAL
 WHERE 		
 		WEIGHT_KG < ANY(SELECT
 							   WEIGHT_KG
 						  FROM
 						  	   ANIMAL
 						 WHERE
 						 	   ZONE_ID = 'Z4') ;
    
------------------------------------------------
--- < 다중열 서브쿼리 >

SELECT
		ANIMAL_NAME
	  , SPECIES_ID
	  , WEIGHT_KG
  FROM
  		ANIMAL
 WHERE
 		(SPECIES_ID, WEIGHT_KG) IN (SELECT
											SPECIES_ID
										  , MAX(WEIGHT_KG)
									  FROM 
									  		ANIMAL
									 GROUP
									 	BY
									 		SPECIES_ID);
									
--------------------------------------------------------
-- < 인라인 뷰 > 
-- FROM 절에 서브쿼리를 작성 -> 테이블 대신 ResultSet을 사용하는 것

-- 체중 TOP5 동물 조회

SELECT
		ANIMAL_NAME
	  , WEIGHT_KG
	  , ROWNUM
  FROM 
  		ANIMAL
 WHERE
 		ROWNUM <= 5;
  		
 ORDER
 	BY
 		WEIGHT_KG DESC
-- FETCH FIRST 5 ROWS ONLY;
-- OFFSET 5 ROWS
-- FETCH NEXT 5 ROWS ONLY;
-- FETCH FIRST N ROWS ONLY : 상위 N개만 조회
SELECT
		ANIMAL_NAME
	  , WEIGHT_KG
  FROM
  		(SELECT
  				ANIMAL_NAME
  			  , WEIGHT_KG
  		  FROM
  		  		ANIMAL
  		 ORDER
  		 	BY
  		 		WEIGHT_KG DESC)
 WHERE
 		ROWNUM <= 5;
 
---------------------------------------------

 -- 담당 동물이 있는 사육사들의 이름 조회
 
 SELECT
 		KEEPER_NAME
   FROM
   		KEEPER K
  WHERE
  		EXISTS (
  		 SELECT 1 FROM ANIMAL WHERE KEEPER_ID = K.KEEPER_ID);
-- 상관 서브쿼리
-----------------------------------------
-- SELECT 절에 서브쿼리 사용 -> 스칼라 서브쿼리

 -- 동물의 이름, 종명, 구역명
 SELECT ANIMAL_NAME, SPECIES_NAME, ZONE_NAME
   FROM ANIMAL JOIN SPECIES USING(SPECIES_ID) JOIN ZONE USING(ZONE_ID);
 
 SELECT
 		ANIMAL_NAME
 	  , (SELECT SPECIES_NAME FROM SPECIES
 	  	  WHERE A.SPECIES_ID = SPECIES_ID)
 	  , (SELECT ZONE_NAME FROM 
		  WHERE A.ZONE_ID = ZONE_ID)
	  , (SELECT COUNT(*) FROM ANIMAL)
  FROM
  		ANIMAL A;


















 						




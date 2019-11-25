-- 1. 모든 도서 정보 조회
SELECT bookid, bookname, publisher, price
FROM BOOK;

SELECT * -- * : 모든 컬럼
FROM BOOK;

--2. 모든 도서의 이름과 가격 정보 조회
SELECT bookname, price
FROM BOOK;

--3. 도서 테이블이 등록된 모든 출판사 조회
SELECT publisher
FROM BOOK;

-- DISTINCT : 중복 항목을 제외하고 조회
SELECT DISTINCT publisher
FROM BOOK;

-- 4. 가격이 20,000원 이하인 도서 조회
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE price <= 20000; -- WHERE : JAVA의 IF

-- 4-1. 가격이 10,000원 이상 20,000원 이하인 도서 조회
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE price >= 10000 AND price <= 20000;

-- 4-2. 가격이 10,000원 이상 20,000원 이하인 도서 조회
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE price BETWEEN 10000 AND 20000;

-- 5-1. 굿스포츠 또는 대한미디어 출판사에서 출간한 도서
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

-- 5-2. 굿스포츠 또는 대한미디어 출판사에서 출간한 도서
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE publisher IN ('굿스포츠', '대한미디어');

-- 5-3. 굿스포츠 또는 대한미디어 이외의 출판사에서 출간한 도서
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE publisher NOT IN ('굿스포츠', '대한미디어');

-- 6-1. 제목이 '축구의 역사'인 도서를 출간한 출판사를 검색하시오 (완전일치)
SELECT publisher
FROM BOOK
WHERE bookname = '축구의 역사';

-- 6-2. 도서이름에 '축구'가 포함된 도서를 출간한 출판사를 검색하시오. (부분일치)
--      % : 0개의 이상의 문자와 대응하는 와일드카드
SELECT bookname, publisher
FROM BOOK
WHERE bookname LIKE '%축구%'; -- LIKE와 %는 일반적으로 같이 사용

-- 6-3. 도서이름이 '축구'로 시작하는 도서를 출간한 출판사를 검색하시오. (부분일치)
SELECT bookname, publisher
FROM BOOK
WHERE bookname LIKE '축구%'; -- LIKE와 %는 일반적으로 같이 사용

-- 6-4. 도서이름의 두번째 문자가 '구'인 도서를 출간한 출판사를 검색하시오. (부분일치)
--      _ : 1개의 문자와 대응하는 와일드카드
SELECT bookname, publisher
FROM BOOK
WHERE bookname LIKE '_구%'; -- LIKE와 %는 일반적으로 같이 사용

-- 7-1. 도서이름에 '축구'가 포함되고 가격이 20000원 이상인 도서 조회.
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE bookname LIKE '%축구%' AND price >= 20000;

-------------------------------------------------------------

-- 8-1. 도서 정보를 도서이름으로 정렬해서 조회하세요
SELECT bookid, bookname, publisher, price
FROM BOOK
ORDER BY 2; -- 컬럼의 순서 번호

-- 8-2. 도서 정보를 도서이름으로 정렬해서 조회하세요
SELECT bookid, bookname, publisher, price
FROM BOOK
ORDER BY bookname;

-- 8-3. 도서 정보를 도서이름으로 정렬해서 조회하세요
SELECT bookid, bookname, publisher, price
FROM BOOK
-- ORDER BY bookname ASC; -- 오름차순 (기본)
ORDER BY bookname DESC; -- 내림차순

-- 8-4. 도서 정보를 도서가격과 도서이름으로 정렬해서 조회하세요
SELECT bookid, bookname, publisher, price
FROM BOOK
ORDER BY price DESC, bookname ASC;

-- 9-1. 도서의 총 판매액
SELECT SUM(SALEPRICE), 
       SUM(SALEPRICE) AS TOTAL_1, -- AS: 결과집합의 컬럼이름을 변경
       SUM(SALEPRICE) TOTAL_2 -- AS는 생략 가능
FROM ORDERS;

-- 9-2. 김연아 고객의 총 구매액
SELECT * FROM CUSTOMER; -- 김연아 고객의 ID = 2 확인

SELECT SUM(SALEPRICE) TOTAL
FROM ORDERS
WHERE CUSTID = 2;

-- 9-3. 판매액의 합계, 평균, 최대, 최소값 조회
SELECT SUM(SALEPRICE), AVG(SALEPRICE), MAX(SALEPRICE), MIN(SALEPRICE)
FROM ORDERS;

-- 9-4. 도서 총 판매량 조회
SELECT COUNT(*)
FROM ORDERS;

-- 10-1. 고객별 구매수량, 구매액 조회
SELECT custid 고객아이디, 
       -- bookid 도서번호, -- group by에 명시된 컬럼만 조회 가능  
       COUNT(saleprice) 구매수량, 
       SUM(saleprice) 구매액
FROM ORDERS
GROUP BY custid
ORDER BY 구매액 DESC;

-- 10-2. 구매액이 30000이상인 고객의 고객별 구매수량, 구매액 조회
SELECT custid 고객아이디, 
       -- bookid 도서번호, -- group by에 명시된 컬럼만 조회 가능  
       COUNT(saleprice) 구매수량, 
       SUM(saleprice) 구매액
FROM ORDERS
-- WHERE SUM(saleprice) >= 30000
GROUP BY custid
HAVING SUM(saleprice) >= 30000 -- HAVING : group by의 조건절
ORDER BY 구매액 DESC;









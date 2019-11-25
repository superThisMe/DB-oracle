-- 도서번호가 1인 도서의 이름
SELECT bookname
FROM BOOK
WHERE bookid = 1;

-- 가격이 20,000원 이상인 도서의 이름
SELECT bookname
FROM BOOK
WHERE price >= 20000;

-- 박지성 고객의 총 구매액
SELECT CUSTID
FROM customer
WHERE name = '박지성';

SELECT * 
FROM ORDERS
WHERE CUSTID = 1;

-- 박지성 고객이 구매한 도서의 수
SELECT COUNT(*)
FROM ORDERS
WHERE CUSTID = 1;

-- 마당서점 도서의 총 개수
SELECT COUNT(*)
FROM BOOK;

-- 마당서점에 도서를 출고하는 출판사의 총 개수
SELECT publisher
FROM BOOK;

SELECT COUNT(DISTINCT publisher) -- 중복을 제거한 개수
FROM BOOK;

-- 모든 고객의 이름, 주소
SELECT name, address
FROM CUSTOMER;

-- 2014년 7월 4일~7월 7일 사이에 주문받은 도서의 주문번호
SELECT *
FROM ORDERS
WHERE orderdate BETWEEN '2014-07-04' AND '2014-07-07';

-- 2014년 7월 4일~7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호
-- NOT BETWEEN : BETWEEN을 제외한 데이터 조회
SELECT *
FROM ORDERS
-- WHERE orderdate NOT BETWEEN '2014-07-04' AND '2014-07-07';
WHERE orderdate < '2014-07-04' OR ORDERDATE > '2014-07-07';

-- 성이 '김' 씨인 고객의 이름과 주소
SELECT NAME, ADDRESS
FROM CUSTOMER
WHERE NAME LIKE '김%';

-- 성이 '김' 씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
SELECT NAME, ADDRESS
FROM CUSTOMER
WHERE NAME LIKE '김%아';









-- SUBQUERY

-- 1-1. 가장 비싼 도서의 이름 조회
SELECT MAX(PRICE)
FROM BOOK;

SELECT *
FROM BOOK
WHERE PRICE = 35000;

-- 1-2. 가장 비싼 도서의 이름 조회
SELECT *
FROM BOOK
WHERE PRICE = ( SELECT MAX(PRICE)
                FROM BOOK );
                
-- 2-1. 도서를 구매한 적이 있는 고객의 이름 조회
SELECT DISTINCT CUSTID
FROM ORDERS;

SELECT *
FROM CUSTOMER
WHERE CUSTID IN (1, 2, 3, 4);

-- 2-2. 도서를 구매한 적이 있는 고객의 이름 조회
SELECT *
FROM CUSTOMER
WHERE CUSTID IN ( SELECT DISTINCT CUSTID
                  FROM ORDERS );
                  
-- 2-3. 도서를 구매한 적이 있는 고객의 이름 조회
SELECT DISTINCT C.*
FROM CUSTOMER C
INNER JOIN ORDERS O
ON C.CUSTID = O.CUSTID;

-- 3-1. 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
SELECT *
FROM BOOK
WHERE PUBLISHER = '대한미디어'; -- 이 조회 결과 : 3, 4

SELECT *
FROM ORDERS
WHERE BOOKID IN (3, 4); -- 이 조회 결과 : 1

SELECT *
FROM CUSTOMER
WHERE CUSTID IN (1);

-- 3-2. 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
SELECT *
FROM CUSTOMER
WHERE CUSTID IN ( SELECT CUSTID
                  FROM ORDERS
                  WHERE BOOKID IN ( SELECT BOOKID
                                    FROM BOOK
                                    WHERE PUBLISHER = '대한미디어' ) );

-- 3-3. 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
SELECT DISTINCT C.*
FROM CUSTOMER C
INNER JOIN ORDERS O
ON C.CUSTID = O.CUSTID
INNER JOIN BOOK B
ON O.BOOKID = B.BOOKID
WHERE B.PUBLISHER = '대한미디어';
                
-- 4-1. 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오
SELECT PUBLISHER, AVG(PRICE)
FROM BOOK
GROUP BY PUBLISHER;

SELECT *
FROM BOOK
-- WHERE PUBLISHER = '나무수' AND PRICE >= 13000;
-- WHERE PUBLISHER = '이상미디어' AND PRICE >= 16500;                
WHERE PUBLISHER = '대한미디어' AND PRICE >= 28500;                

-- 4-2. 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오
SELECT *
FROM BOOK B1
WHERE PRICE >= ( SELECT AVG(PRICE)
                 FROM BOOK B2
                 WHERE B2.PUBLISHER = B1.PUBLISHER );
                 
---------------------------------------------

-- 5-1. 도서를 주문하지 않은 고객의 이름 조회
SELECT * FROM CUSTOMER

-- 5-2. 도서를 주문하지 않은 고객의 이름 조회
SELECT * FROM CUSTOMER
WHERE CUSTID NOT IN ( SELECT CUSTID FROM ORDERS );

-- 6-1. 주문이 있는 고객의 이름과 주소 조회
SELECT * FROM CUSTOMER C
WHERE EXISTS ( SELECT * FROM ORDERS O WHERE C.CUSTID = O.CUSTID );
                
                
                
                
                
                
                
                
                
                
                
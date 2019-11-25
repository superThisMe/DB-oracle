-- SUBQUERY

-- 1-1. ���� ��� ������ �̸� ��ȸ
SELECT MAX(PRICE)
FROM BOOK;

SELECT *
FROM BOOK
WHERE PRICE = 35000;

-- 1-2. ���� ��� ������ �̸� ��ȸ
SELECT *
FROM BOOK
WHERE PRICE = ( SELECT MAX(PRICE)
                FROM BOOK );
                
-- 2-1. ������ ������ ���� �ִ� ���� �̸� ��ȸ
SELECT DISTINCT CUSTID
FROM ORDERS;

SELECT *
FROM CUSTOMER
WHERE CUSTID IN (1, 2, 3, 4);

-- 2-2. ������ ������ ���� �ִ� ���� �̸� ��ȸ
SELECT *
FROM CUSTOMER
WHERE CUSTID IN ( SELECT DISTINCT CUSTID
                  FROM ORDERS );
                  
-- 2-3. ������ ������ ���� �ִ� ���� �̸� ��ȸ
SELECT DISTINCT C.*
FROM CUSTOMER C
INNER JOIN ORDERS O
ON C.CUSTID = O.CUSTID;

-- 3-1. ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�.
SELECT *
FROM BOOK
WHERE PUBLISHER = '���ѹ̵��'; -- �� ��ȸ ��� : 3, 4

SELECT *
FROM ORDERS
WHERE BOOKID IN (3, 4); -- �� ��ȸ ��� : 1

SELECT *
FROM CUSTOMER
WHERE CUSTID IN (1);

-- 3-2. ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�.
SELECT *
FROM CUSTOMER
WHERE CUSTID IN ( SELECT CUSTID
                  FROM ORDERS
                  WHERE BOOKID IN ( SELECT BOOKID
                                    FROM BOOK
                                    WHERE PUBLISHER = '���ѹ̵��' ) );

-- 3-3. ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�.
SELECT DISTINCT C.*
FROM CUSTOMER C
INNER JOIN ORDERS O
ON C.CUSTID = O.CUSTID
INNER JOIN BOOK B
ON O.BOOKID = B.BOOKID
WHERE B.PUBLISHER = '���ѹ̵��';
                
-- 4-1. ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�
SELECT PUBLISHER, AVG(PRICE)
FROM BOOK
GROUP BY PUBLISHER;

SELECT *
FROM BOOK
-- WHERE PUBLISHER = '������' AND PRICE >= 13000;
-- WHERE PUBLISHER = '�̻�̵��' AND PRICE >= 16500;                
WHERE PUBLISHER = '���ѹ̵��' AND PRICE >= 28500;                

-- 4-2. ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�
SELECT *
FROM BOOK B1
WHERE PRICE >= ( SELECT AVG(PRICE)
                 FROM BOOK B2
                 WHERE B2.PUBLISHER = B1.PUBLISHER );
                 
---------------------------------------------

-- 5-1. ������ �ֹ����� ���� ���� �̸� ��ȸ
SELECT * FROM CUSTOMER

-- 5-2. ������ �ֹ����� ���� ���� �̸� ��ȸ
SELECT * FROM CUSTOMER
WHERE CUSTID NOT IN ( SELECT CUSTID FROM ORDERS );

-- 6-1. �ֹ��� �ִ� ���� �̸��� �ּ� ��ȸ
SELECT * FROM CUSTOMER C
WHERE EXISTS ( SELECT * FROM ORDERS O WHERE C.CUSTID = O.CUSTID );
                
                
                
                
                
                
                
                
                
                
                
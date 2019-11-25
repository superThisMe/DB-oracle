-- ���� ����� ��Ű���� ���Ե� ���̺� ��� ��ȸ
SELECT TABLE_NAME FROM USER_TABLES;

-- ���̺� ���� ��ȸ
DESC BOOK;

-- ���� ���̺��� ��ȸ�ϸ� �����ִ� �����͸� �� �� �����ϴ�.
SELECT * 
FROM ORDERS;

-- 1-1. �� ���� ���̺� �ִ� �����͸� �����ؼ� ��ȸ
SELECT *
FROM CUSTOMER, ORDERS;

-- 1-2. �� ���� ���̺� �ִ� �����͸� �����ؼ� ��ȸ
SELECT *
FROM CUSTOMER
CROSS JOIN ORDERS;

-- 2-1. ���� ���� �ֹ� ������ ��ȸ
SELECT CUSTOMER.CUSTID, NAME, PHONE, ORDERID, BOOKID, SALEPRICE, ORDERDATE
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID -- ���� �ִ� �÷����� ���� ����
ORDER BY CUSTOMER.CUSTID;

-- 2-2. ���� ���� �ֹ� ������ ��ȸ
SELECT C.CUSTID, C.NAME, C.PHONE, O.ORDERID, O.BOOKID, O.SALEPRICE, O.ORDERDATE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID -- ���� �ִ� �÷����� ���� ����
ORDER BY C.CUSTID;

-- 2-3. ���� ���� �ֹ� ������ ��ȸ
SELECT C.CUSTID, C.NAME, C.PHONE, O.ORDERID, O.BOOKID, O.SALEPRICE, O.ORDERDATE
FROM CUSTOMER C
INNER JOIN ORDERS O
ON C.CUSTID = O.CUSTID -- JOIN ������ ON ���� �ۼ�
ORDER BY C.CUSTID;

-- 3-1. ���� �̸��� ���� �ֹ��� ���� �̸� �� �ǸŰ��� ��ȸ
SELECT C.NAME, O.BOOKID, O.SALEPRICE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
ORDER BY C.CUSTID;

-- 3-2. ���� �̸��� ���� �ֹ��� ���� �̸� �� �ǸŰ��� ��ȸ
SELECT C.NAME, O.BOOKID, O.SALEPRICE
FROM CUSTOMER C
INNER JOIN ORDERS O
ON C.CUSTID = O.CUSTID
ORDER BY C.CUSTID;

-- 4-1. ���� �̸��� �� �ֹ��� ��ȸ
SELECT C.NAME, SUM(O.SALEPRICE)
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
ORDER BY C.NAME;

-- 4-2. ���� �̸��� �� �ֹ��� ��ȸ
SELECT C.NAME, SUM(O.SALEPRICE)
FROM CUSTOMER C
INNER JOIN ORDERS O
ON C.CUSTID = O.CUSTID
GROUP BY C.NAME
ORDER BY C.NAME;

-- 5-1. ���� �̸��� ���� �ֹ��� ������ �̸�, ���� ����, �ع� �ݾ� ��ȸ.
SELECT C.NAME, B.BOOKNAME, B.PRICE, O.SALEPRICE
FROM CUSTOMER C, BOOK B, ORDERS O
WHERE C.CUSTID = O.CUSTID AND B.BOOKID = O.BOOKID
ORDER BY C.NAME;

-- 5-2. ���� �̸��� ���� �ֹ��� ������ �̸�, ���� ����, �ع� �ݾ� ��ȸ.
SELECT C.NAME, B.BOOKNAME, B.PRICE, O.SALEPRICE
FROM CUSTOMER C
INNER JOIN ORDERS O
ON C.CUSTID = O.CUSTID
INNER JOIN BOOK B 
ON B.BOOKID = O.BOOKID
ORDER BY C.NAME;

-- 5-3. ������ 20000�� ������ ������ ���̸�, �����̸�, ��������, �ع��ݾ� ��ȸ.
SELECT C.NAME, B.BOOKNAME, B.PRICE, O.SALEPRICE
FROM CUSTOMER C, BOOK B, ORDERS O
WHERE B.PRICE = 20000
      AND C.CUSTID = O.CUSTID 
      AND B.BOOKID = O.BOOKID
ORDER BY C.NAME;

-- 5-4. ������ 20000�� ������ ������ ���̸�, �����̸�, ��������, �ع��ݾ� ��ȸ.
SELECT C.NAME, B.BOOKNAME, B.PRICE, O.SALEPRICE
FROM CUSTOMER C
INNER JOIN ORDERS O
ON C.CUSTID = O.CUSTID
INNER JOIN BOOK B 
ON B.BOOKID = O.BOOKID
WHERE B.PRICE = 20000
ORDER BY C.NAME;

-- 6-1. ���� �ֹ� �Ѿ� ��ȸ (���̸�, �ֹ��Ѿ�)
--      NVL(ǥ����, null ��ü��) : ǥ������ null�̸� null ��ü �� ���
SELECT C.NAME, NVL(SUM(O.SALEPRICE), 0) �ֹ��Ѿ�
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID(+)
GROUP BY C.NAME
ORDER BY �ֹ��Ѿ� DESC;

-- 6-2. ���� �ֹ� �Ѿ� ��ȸ (���̸�, �ֹ��Ѿ�)
--      NVL(ǥ����, null ��ü��) : ǥ������ null�̸� null ��ü �� ���
SELECT C.NAME, NVL(SUM(O.SALEPRICE), 0) �ֹ��Ѿ�
FROM CUSTOMER C
LEFT OUTER JOIN ORDERS O
ON C.CUSTID = O.CUSTID
GROUP BY C.NAME
ORDER BY �ֹ��Ѿ� DESC;








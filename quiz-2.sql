-- ������ȣ�� 1�� ������ �̸�
SELECT bookname
FROM BOOK
WHERE bookid = 1;

-- ������ 20,000�� �̻��� ������ �̸�
SELECT bookname
FROM BOOK
WHERE price >= 20000;

-- ������ ���� �� ���ž�
SELECT CUSTID
FROM customer
WHERE name = '������';

SELECT * 
FROM ORDERS
WHERE CUSTID = 1;

-- ������ ���� ������ ������ ��
SELECT COUNT(*)
FROM ORDERS
WHERE CUSTID = 1;

-- ���缭�� ������ �� ����
SELECT COUNT(*)
FROM BOOK;

-- ���缭���� ������ ����ϴ� ���ǻ��� �� ����
SELECT publisher
FROM BOOK;

SELECT COUNT(DISTINCT publisher) -- �ߺ��� ������ ����
FROM BOOK;

-- ��� ���� �̸�, �ּ�
SELECT name, address
FROM CUSTOMER;

-- 2014�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
SELECT *
FROM ORDERS
WHERE orderdate BETWEEN '2014-07-04' AND '2014-07-07';

-- 2014�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
-- NOT BETWEEN : BETWEEN�� ������ ������ ��ȸ
SELECT *
FROM ORDERS
-- WHERE orderdate NOT BETWEEN '2014-07-04' AND '2014-07-07';
WHERE orderdate < '2014-07-04' OR ORDERDATE > '2014-07-07';

-- ���� '��' ���� ���� �̸��� �ּ�
SELECT NAME, ADDRESS
FROM CUSTOMER
WHERE NAME LIKE '��%';

-- ���� '��' ���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
SELECT NAME, ADDRESS
FROM CUSTOMER
WHERE NAME LIKE '��%��';









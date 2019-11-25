-- 1. ��� ���� ���� ��ȸ
SELECT bookid, bookname, publisher, price
FROM BOOK;

SELECT * -- * : ��� �÷�
FROM BOOK;

--2. ��� ������ �̸��� ���� ���� ��ȸ
SELECT bookname, price
FROM BOOK;

--3. ���� ���̺��� ��ϵ� ��� ���ǻ� ��ȸ
SELECT publisher
FROM BOOK;

-- DISTINCT : �ߺ� �׸��� �����ϰ� ��ȸ
SELECT DISTINCT publisher
FROM BOOK;

-- 4. ������ 20,000�� ������ ���� ��ȸ
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE price <= 20000; -- WHERE : JAVA�� IF

-- 4-1. ������ 10,000�� �̻� 20,000�� ������ ���� ��ȸ
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE price >= 10000 AND price <= 20000;

-- 4-2. ������ 10,000�� �̻� 20,000�� ������ ���� ��ȸ
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE price BETWEEN 10000 AND 20000;

-- 5-1. �½����� �Ǵ� ���ѹ̵�� ���ǻ翡�� �Ⱓ�� ����
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE publisher = '�½�����' OR publisher = '���ѹ̵��';

-- 5-2. �½����� �Ǵ� ���ѹ̵�� ���ǻ翡�� �Ⱓ�� ����
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE publisher IN ('�½�����', '���ѹ̵��');

-- 5-3. �½����� �Ǵ� ���ѹ̵�� �̿��� ���ǻ翡�� �Ⱓ�� ����
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE publisher NOT IN ('�½�����', '���ѹ̵��');

-- 6-1. ������ '�౸�� ����'�� ������ �Ⱓ�� ���ǻ縦 �˻��Ͻÿ� (������ġ)
SELECT publisher
FROM BOOK
WHERE bookname = '�౸�� ����';

-- 6-2. �����̸��� '�౸'�� ���Ե� ������ �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�. (�κ���ġ)
--      % : 0���� �̻��� ���ڿ� �����ϴ� ���ϵ�ī��
SELECT bookname, publisher
FROM BOOK
WHERE bookname LIKE '%�౸%'; -- LIKE�� %�� �Ϲ������� ���� ���

-- 6-3. �����̸��� '�౸'�� �����ϴ� ������ �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�. (�κ���ġ)
SELECT bookname, publisher
FROM BOOK
WHERE bookname LIKE '�౸%'; -- LIKE�� %�� �Ϲ������� ���� ���

-- 6-4. �����̸��� �ι�° ���ڰ� '��'�� ������ �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�. (�κ���ġ)
--      _ : 1���� ���ڿ� �����ϴ� ���ϵ�ī��
SELECT bookname, publisher
FROM BOOK
WHERE bookname LIKE '_��%'; -- LIKE�� %�� �Ϲ������� ���� ���

-- 7-1. �����̸��� '�౸'�� ���Եǰ� ������ 20000�� �̻��� ���� ��ȸ.
SELECT bookid, bookname, publisher, price
FROM BOOK
WHERE bookname LIKE '%�౸%' AND price >= 20000;

-------------------------------------------------------------

-- 8-1. ���� ������ �����̸����� �����ؼ� ��ȸ�ϼ���
SELECT bookid, bookname, publisher, price
FROM BOOK
ORDER BY 2; -- �÷��� ���� ��ȣ

-- 8-2. ���� ������ �����̸����� �����ؼ� ��ȸ�ϼ���
SELECT bookid, bookname, publisher, price
FROM BOOK
ORDER BY bookname;

-- 8-3. ���� ������ �����̸����� �����ؼ� ��ȸ�ϼ���
SELECT bookid, bookname, publisher, price
FROM BOOK
-- ORDER BY bookname ASC; -- �������� (�⺻)
ORDER BY bookname DESC; -- ��������

-- 8-4. ���� ������ �������ݰ� �����̸����� �����ؼ� ��ȸ�ϼ���
SELECT bookid, bookname, publisher, price
FROM BOOK
ORDER BY price DESC, bookname ASC;

-- 9-1. ������ �� �Ǹž�
SELECT SUM(SALEPRICE), 
       SUM(SALEPRICE) AS TOTAL_1, -- AS: ��������� �÷��̸��� ����
       SUM(SALEPRICE) TOTAL_2 -- AS�� ���� ����
FROM ORDERS;

-- 9-2. �迬�� ���� �� ���ž�
SELECT * FROM CUSTOMER; -- �迬�� ���� ID = 2 Ȯ��

SELECT SUM(SALEPRICE) TOTAL
FROM ORDERS
WHERE CUSTID = 2;

-- 9-3. �Ǹž��� �հ�, ���, �ִ�, �ּҰ� ��ȸ
SELECT SUM(SALEPRICE), AVG(SALEPRICE), MAX(SALEPRICE), MIN(SALEPRICE)
FROM ORDERS;

-- 9-4. ���� �� �Ǹŷ� ��ȸ
SELECT COUNT(*)
FROM ORDERS;

-- 10-1. ���� ���ż���, ���ž� ��ȸ
SELECT custid �����̵�, 
       -- bookid ������ȣ, -- group by�� ��õ� �÷��� ��ȸ ����  
       COUNT(saleprice) ���ż���, 
       SUM(saleprice) ���ž�
FROM ORDERS
GROUP BY custid
ORDER BY ���ž� DESC;

-- 10-2. ���ž��� 30000�̻��� ���� ���� ���ż���, ���ž� ��ȸ
SELECT custid �����̵�, 
       -- bookid ������ȣ, -- group by�� ��õ� �÷��� ��ȸ ����  
       COUNT(saleprice) ���ż���, 
       SUM(saleprice) ���ž�
FROM ORDERS
-- WHERE SUM(saleprice) >= 30000
GROUP BY custid
HAVING SUM(saleprice) >= 30000 -- HAVING : group by�� ������
ORDER BY ���ž� DESC;









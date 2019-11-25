-- 8. INSERT, UPDATE, DELETE

-- INSERT ������ �׽�Ʈ �ϱ� ���� SEQUENCE ��ü �����
CREATE SEQUENCE NEWBOOK_SEQ; -- NEWBOOK ���̺��� PK �÷��� ���� SEQ

-- NewBook ���̺� ���ο� ���� �������� ���С��� �����Ͻÿ�. 
-- ������ ������ �Ѽ����м������� �Ⱓ������ ������ 90,000���̴�.
DESC NEWBOOK;

INSERT INTO NEWBOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES (NEWBOOK_SEQ.NEXTVAL, '������ ����', '�Ѽ����м���', 90000);

SELECT * FROM NEWBOOK;

-- INSERT ���� : ��� �÷��� �����͸� �����ϴ� ��� �÷��̸� ���� ����
INSERT INTO NEWBOOK
VALUES (NEWBOOK_SEQ.NEXTVAL, '������ ���� 2', '�Ѽ����м���', 90000);

SELECT * FROM NEWBOOK;

-- INSERT ���� : �Ϻ� �÷��� ���ؼ��� ������ ���� ����
INSERT INTO NEWBOOK (BOOKID, BOOKNAME, PUBLISHER)
VALUES (NEWBOOK_SEQ.NEXTVAL, '������ ���� 3', '�Ѽ����м���');

SELECT * FROM NEWBOOK;

-- INSERT ���� : NOT NULL �÷��� �����͸� �ݵ�� �����ؾ� �մϴ�.
INSERT INTO NEWBOOK (BOOKID, BOOKNAME, PRICE)
VALUES (NEWBOOK_SEQ.NEXTVAL, '������ ���� 4', 90000);

SELECT * FROM NEWBOOK;

-- ���Ե��� ���(Imported_book)�� NewBook ���̺� ��� �����Ͻÿ�.
-- (IMPORTED_BOOK ���̺��� ��ũ��Ʈ BOOK ���̺�� �̹� ������� ����)
-- (������ ����)
SELECT * FROM IMPORTED_BOOK;

INSERT INTO NEWBOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
FROM IMPORTED_BOOK;

SELECT * FROM NEWBOOK;

-- INSERT ���� : ���� ���� ���� �� ���� INSERT
INSERT ALL
INTO NEWBOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES (35, '��zip', '�ռ�â���ǻ�', 50000)
INTO NEWBOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES (36, '�ܹ���', '��������ǻ�', 30000)
SELECT * FROM DUAL;

------------------------------------------------------------------------------------------------------------
-- Customer ���̺��� ����ȣ�� 5�� ���� �ּҸ� �����ѹα� �λꡯ���� �����Ͻÿ�.
SELECT *
FROM CUSTOMER
WHERE CUSTID = 5;

UPDATE CUSTOMER
SET ADDRESS = '���ѹα� �λ�'
WHERE CUSTID = 5;

ROLLBACK; -- ������ COMMIT �Ǵ� ROLLBACK ���� ����� ��� �۾��� ����ϴ� ���
COMMIT; -- ������ COMMIT �Ǵ� ROLLBACK ���� ����� ��� �۾��� Ȯ���ϴ� ���

-- Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.
UPDATE CUSTOMER
SET ADDRESS = (SELECT ADDRESS FROM CUSTOMER WHERE NAME = '�迬��')
WHERE NAME = '�ڼ���';

COMMIT;

-- ������ ���� �ּҸ� ���� ����, ��ȭ��ȣ�� 010-9546-1277�� ����
UPDATE
    CUSTOMER
SET 
    ADDRESS = '���� ����',
    PHONE = '010-9546-1277'
WHERE
    NAME LIKE '������';
    
COMMIT;

-- Customer ���̺��� ����ȣ�� 5�� ���� �����Ͻÿ�.
DELETE
FROM
    CUSTOMER
WHERE
    CUSTID = 5;
    
SELECT * FROM CUSTOMER;

ROLLBACK;

-- ��� �� ������ ����
DELETE FROM CUSTOMER; -- �����ϴ� �����Ͱ� �ֱ� ������ ���� �Ұ�










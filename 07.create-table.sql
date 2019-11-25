-- ���̺� ����� 1
CREATE TABLE NEWBOOK 
(
    -- �÷��̸� �ڷ���
    BOOKID NUMBER,
    BOOKNAME VARCHAR2(100),
    PUBLISHER VARCHAR2(100),
    PRICE NUMBER
);

DROP TABLE NEWBOOK; -- ���̺� ����

-- ���̺� ����� 2
CREATE TABLE NEWBOOK 
(
    -- �÷��̸� �ڷ��� NULL���
    BOOKID      NUMBER          NOT NULL,
    BOOKNAME    VARCHAR2(100)   NOT NULL,
    PUBLISHER   VARCHAR2(100)   NOT NULL,
    PRICE       NUMBER          NULL
);

DROP TABLE NEWBOOK;

-- ���̺� ����� 3
CREATE TABLE NEWBOOK 
(
    -- �÷��̸� �ڷ��� NULL��� �⺻��
    BOOKID      NUMBER          NOT NULL,
    BOOKNAME    VARCHAR2(100)   NOT NULL,
    PUBLISHER   VARCHAR2(100)   NOT NULL,
    PRICE       NUMBER                      DEFAULT (0)
);
DROP TABLE NEWBOOK;

-- ���̺� ����� 4
CREATE TABLE NEWBOOK 
(
    -- �÷��̸� �ڷ��� NULL��� �⺻�� �⺻Ű����
    BOOKID      NUMBER          NOT NULL    PRIMARY KEY,
    BOOKNAME    VARCHAR2(100)   NOT NULL,
    PUBLISHER   VARCHAR2(100)   NOT NULL,
    PRICE       NUMBER                      DEFAULT (0)
);
DROP TABLE NEWBOOK;

-- ���̺� ����� 5
CREATE TABLE NEWBOOK 
(
    -- �÷��̸� �ڷ��� NULL��� �⺻�� �⺻Ű����
    BOOKID      NUMBER          NOT NULL,
    BOOKNAME    VARCHAR2(100)   NOT NULL,
    PUBLISHER   VARCHAR2(100)   NOT NULL,
    PRICE       NUMBER                      DEFAULT (0),
    PRIMARY KEY (BOOKID)
);
DROP TABLE NEWBOOK;

-- ���̺� ����� 6
CREATE TABLE NEWBOOK 
(
    -- �÷��̸� �ڷ��� NULL��� �⺻�� CHECK����
    BOOKID      NUMBER          NOT NULL,
    BOOKNAME    VARCHAR2(100)   NOT NULL,
    PUBLISHER   VARCHAR2(100)   NOT NULL,
    PRICE       NUMBER                      DEFAULT (0) CHECK(PRICE >= 0),
    PRIMARY KEY (BOOKID)
);
DROP TABLE NEWBOOK;

-- 7. ���̺� �����
CREATE TABLE NEWCUSTOMER
(
    CUSTID NUMBER NOT NULL,
    NAME VARCHAR2 (40 CHAR) NOT NULL,
    ADDRESS VARCHAR2 (40 CHAR) NOT NULL,
    PHONE VARCHAR2 (30 BYTE) NOT NULL,
    PRIMARY KEY (CUSTID)
);

-- 8. ���̺� �����
SELECT SYSDATE FROM DUAL; -- DUAL : �ӽ� ���̺�

CREATE TABLE NEWORDERS
(
    ORDERID NUMBER NOT NULL,
    CUSTID NUMBER NOT NULL,
    BOOKID NUMBER NOT NULL,
    SALEPRICE NUMBER DEFAULT 0,
    ORDERDATE DATE DEFAULT SYSDATE, -- ����ð��� �⺻ ������ ����
    PRIMARY KEY (ORDERID),
    FOREIGN KEY (CUSTID) REFERENCES NEWCUSTOMER(CUSTID),
    FOREIGN KEY (BOOKID) REFERENCES NEWBOOK(BOOKID)
);

-- �ڵ� ���� ���� �����ϴ� ��ü �����
CREATE SEQUENCE ORDER_SEQUENCE;

SELECT ORDER_SEQUENCE.NEXTVAL FROM DUAL; -- ���� ������ȣ
SELECT ORDER_SEQUENCE.CURRVAL FROM DUAL; -- ���������� ���� ������ȣ

-- ���̺� ���� ���� �׽�Ʈ�� ���� ���̺� �����
CREATE TABLE NEWBOOK2 
(
    BOOKID      NUMBER,
    BOOKNAME    VARCHAR2(100),
    PUBLISHER   VARCHAR2(100),
    PRICE       NUMBER
);

-- ���̺� ���� 1
ALTER TABLE NEWBOOK2
ADD ISBN VARCHAR2(13) NOT NULL;

-- ���̺� ���� 2
ALTER TABLE NEWBOOK2
MODIFY ISBN NUMBER;

-- ���̺� ���� 3
ALTER TABLE NEWBOOK2
DROP COLUMN ISBN;

-- ���̺� ���� 4
ALTER TABLE NEWBOOK2
MODIFY BOOKID NUMBER NOT NULL;

-- ���̺� ���� 5
ALTER TABLE NEWBOOK2
-- ADD PRIMARY KEY (BOOKID);
ADD CONSTRAINT PK_BOOKID PRIMARY KEY (BOOKID);

-- ���̺� ���� 6
ALTER TABLE NEWBOOK2
DROP PRIMARY KEY;

-- ���̺� ������ ���� ���̺� �����
CREATE TABLE NEWBOOK_DETAIL
(
    DETAILID NUMBER NOT NULL PRIMARY KEY,
    BOOKID NUMBER NOT NULL -- NEWBOOK ���̺��� �����ϴ� �÷� (FOREIGN KEY)
);

-- ���̺� ���� 7
ALTER TABLE NEWBOOK_DETAIL
ADD CONSTRAINT FK_NEWBOOK_DETAIL 
    FOREIGN KEY (BOOKID) REFERENCES NEWBOOK (BOOKID);
    
-- ���̺� ���� 1
DROP TABLE NEWBOOK; -- �����ϴ� ���̺��� �־ ���� ����

-- ���̺� ���� 2
DROP TABLE NEWBOOK_DETAIL;










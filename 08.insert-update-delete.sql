-- 8. INSERT, UPDATE, DELETE

-- INSERT 구문을 테스트 하기 위해 SEQUENCE 객체 만들기
CREATE SEQUENCE NEWBOOK_SEQ; -- NEWBOOK 테이블의 PK 컬럼을 위한 SEQ

-- NewBook 테이블에 새로운 도서 ‘스포츠 의학’을 삽입하시오. 
-- 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,000원이다.
DESC NEWBOOK;

INSERT INTO NEWBOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES (NEWBOOK_SEQ.NEXTVAL, '스포츠 의학', '한솔의학서적', 90000);

SELECT * FROM NEWBOOK;

-- INSERT 연습 : 모든 컬럼의 데이터를 삽입하는 경우 컬럼이름 생략 가능
INSERT INTO NEWBOOK
VALUES (NEWBOOK_SEQ.NEXTVAL, '스포츠 의학 2', '한솔의학서적', 90000);

SELECT * FROM NEWBOOK;

-- INSERT 연습 : 일부 컬럼에 대해서만 데이터 삽입 가능
INSERT INTO NEWBOOK (BOOKID, BOOKNAME, PUBLISHER)
VALUES (NEWBOOK_SEQ.NEXTVAL, '스포츠 의학 3', '한솔의학서적');

SELECT * FROM NEWBOOK;

-- INSERT 연습 : NOT NULL 컬럼의 데이터를 반드시 지정해야 합니다.
INSERT INTO NEWBOOK (BOOKID, BOOKNAME, PRICE)
VALUES (NEWBOOK_SEQ.NEXTVAL, '스포츠 의학 4', 90000);

SELECT * FROM NEWBOOK;

-- 수입도서 목록(Imported_book)을 NewBook 테이블에 모두 삽입하시오.
-- (IMPORTED_BOOK 테이블은 스크립트 BOOK 테이블과 이미 만들어져 있음)
-- (데이터 복사)
SELECT * FROM IMPORTED_BOOK;

INSERT INTO NEWBOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
FROM IMPORTED_BOOK;

SELECT * FROM NEWBOOK;

-- INSERT 연습 : 여러 개의 값을 한 번에 INSERT
INSERT ALL
INTO NEWBOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES (35, '술zip', '손석창출판사', 50000)
INTO NEWBOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES (36, '햄버거', '송재욱출판사', 30000)
SELECT * FROM DUAL;

------------------------------------------------------------------------------------------------------------
-- Customer 테이블에서 고객번호가 5인 고객의 주소를 ‘대한민국 부산’으로 변경하시오.
SELECT *
FROM CUSTOMER
WHERE CUSTID = 5;

UPDATE CUSTOMER
SET ADDRESS = '대한민국 부산'
WHERE CUSTID = 5;

ROLLBACK; -- 마지막 COMMIT 또는 ROLLBACK 이후 실행된 모든 작업을 취소하는 명령
COMMIT; -- 마지막 COMMIT 또는 ROLLBACK 이후 실행된 모든 작업을 확정하는 명령

-- Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.
UPDATE CUSTOMER
SET ADDRESS = (SELECT ADDRESS FROM CUSTOMER WHERE NAME = '김연아')
WHERE NAME = '박세리';

COMMIT;

-- 박지성 고객의 주소를 영국 런던, 전화번호를 010-9546-1277로 변경
UPDATE
    CUSTOMER
SET 
    ADDRESS = '영국 런던',
    PHONE = '010-9546-1277'
WHERE
    NAME LIKE '박지성';
    
COMMIT;

-- Customer 테이블에서 고객번호가 5인 고객을 삭제하시오.
DELETE
FROM
    CUSTOMER
WHERE
    CUSTID = 5;
    
SELECT * FROM CUSTOMER;

ROLLBACK;

-- 모든 고객 데이터 삭제
DELETE FROM CUSTOMER; -- 참조하는 데이터가 있기 때문에 삭제 불가










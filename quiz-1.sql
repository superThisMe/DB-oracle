-- �޿��� 15000�̻��� ���� ��ȸ

SELECT *
FROM EMPLOYEES
WHERE SALARY >= 15000;

-- �Ի�⵵�� 2005���� ���� ��ȸ
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '2005-01-01' AND '2005-12-31';

-- �μ��̸��� IT�� ���� ��ȸ
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60; -- DEPARTMENT ���̺��� ��ȸ�ϸ� IT = 60

-- ��ȭ��ȣ�� 590���� �����ϴ� ���� ��ȸ
SELECT *
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '590%';

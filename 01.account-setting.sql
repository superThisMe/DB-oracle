alter user hr account unlock;

alter user hr identified by "9922";

-- �ּ�
-- ���� ����� ���� ����
-- DROP USER madang CASCADE;

-- �ű� ����� ���� �����
CREATE USER madang IDENTIFIED BY "9922";

-- ���� �ο� (����, �ڿ� ���)
GRANT CONNECT, RESOURCE TO madang;

-- ���� Ȱ��ȭ
ALTER USER madang ACCOUNT UNLOCK;
-- ALTER USER madang ACCOUNT LOCK; -- ��Ȱ��ȭ
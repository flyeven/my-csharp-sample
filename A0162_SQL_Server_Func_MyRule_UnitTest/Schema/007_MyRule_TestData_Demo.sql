TRUNCATE TABLE mr_demo_data
GO


-- ����ʾ���ݣ�  ͨ�� ��  ���� �� ��֯������ ����������ϵĴ���.
-- ���ڲ���  Ȩ����ϵ��
-- һ���û��� ��Щ�����ܹ���������Щ���ݲ��ܿ�����


-- ���� ��Щ���� ֻ���� ��Щ���� �ɶ�д�� ��չ��Ȩ��
-- �� mr_dept_user ���е�  permission_data  ���ж���.


INSERT INTO mr_demo_data(
    city_id,
    dept_id,
    demo_info
)
SELECT  11,     1,      'ȫ�� �ܹ�˾ ����'   UNION ALL
SELECT  11,     2,      'ȫ�� ���� ����'   UNION ALL
SELECT  11,     3,      'ȫ�� ���²� ����'   UNION ALL
SELECT  11,     4,      'ȫ�� ������ ����'   UNION ALL
SELECT  11,     5,      'ȫ�� ���в� ����'   UNION ALL
SELECT  11,     6,      'ȫ�� �г��� ����'   UNION ALL
SELECT  11,     7,      'ȫ�� Ӳ���� ����'   UNION ALL
SELECT  11,     8,      'ȫ�� ����� ����'   UNION ALL
SELECT  11,     9,      'ȫ�� ������ ����'   UNION ALL
SELECT  12,     1,      '���� �ܹ�˾ ����'   UNION ALL
SELECT  12,     2,      '���� ���� ����'   UNION ALL
SELECT  12,     3,      '���� ���²� ����'   UNION ALL
SELECT  12,     4,      '���� ������ ����'   UNION ALL
SELECT  12,     5,      '���� ���в� ����'   UNION ALL
SELECT  12,     6,      '���� �г��� ����'   UNION ALL
SELECT  12,     7,      '���� Ӳ���� ����'   UNION ALL
SELECT  12,     8,      '���� ����� ����'   UNION ALL
SELECT  12,     9,      '���� ������ ����'   UNION ALL
SELECT  13,     1,      '�Ϻ� �ܹ�˾ ����'   UNION ALL
SELECT  13,     2,      '�Ϻ� ���� ����'   UNION ALL
SELECT  13,     3,      '�Ϻ� ���²� ����'   UNION ALL
SELECT  13,     4,      '�Ϻ� ������ ����'   UNION ALL
SELECT  13,     5,      '�Ϻ� ���в� ����'   UNION ALL
SELECT  13,     6,      '�Ϻ� �г��� ����'   UNION ALL
SELECT  13,     7,      '�Ϻ� Ӳ���� ����'   UNION ALL
SELECT  13,     8,      '�Ϻ� ����� ����'   UNION ALL
SELECT  13,     9,      '�Ϻ� ������ ����'   UNION ALL
SELECT  14,     1,      '���� �ܹ�˾ ����'   UNION ALL
SELECT  14,     2,      '���� ���� ����'   UNION ALL
SELECT  14,     3,      '���� ���²� ����'   UNION ALL
SELECT  14,     4,      '���� ������ ����'   UNION ALL
SELECT  14,     5,      '���� ���в� ����'   UNION ALL
SELECT  14,     6,      '���� �г��� ����'   UNION ALL
SELECT  14,     7,      '���� Ӳ���� ����'   UNION ALL
SELECT  14,     8,      '���� ����� ����'   UNION ALL
SELECT  14,     9,      '���� ������ ����'   UNION ALL
SELECT  15,     1,      '���� �ܹ�˾ ����'   UNION ALL
SELECT  15,     2,      '���� ���� ����'   UNION ALL
SELECT  15,     3,      '���� ���²� ����'   UNION ALL
SELECT  15,     4,      '���� ������ ����'   UNION ALL
SELECT  15,     5,      '���� ���в� ����'   UNION ALL
SELECT  15,     6,      '���� �г��� ����'   UNION ALL
SELECT  15,     7,      '���� Ӳ���� ����'   UNION ALL
SELECT  15,     8,      '���� ����� ����'   UNION ALL
SELECT  15,     9,      '���� ������ ����'   UNION ALL
SELECT  16,     1,      '�㽭ʡ �ܹ�˾ ����'   UNION ALL
SELECT  16,     2,      '�㽭ʡ ���� ����'   UNION ALL
SELECT  16,     3,      '�㽭ʡ ���²� ����'   UNION ALL
SELECT  16,     4,      '�㽭ʡ ������ ����'   UNION ALL
SELECT  16,     5,      '�㽭ʡ ���в� ����'   UNION ALL
SELECT  16,     6,      '�㽭ʡ �г��� ����'   UNION ALL
SELECT  16,     7,      '�㽭ʡ Ӳ���� ����'   UNION ALL
SELECT  16,     8,      '�㽭ʡ ����� ����'   UNION ALL
SELECT  16,     9,      '�㽭ʡ ������ ����'   UNION ALL
SELECT  17,     1,      '���� �ܹ�˾ ����'   UNION ALL
SELECT  17,     2,      '���� ���� ����'   UNION ALL
SELECT  17,     3,      '���� ���²� ����'   UNION ALL
SELECT  17,     4,      '���� ������ ����'   UNION ALL
SELECT  17,     5,      '���� ���в� ����'   UNION ALL
SELECT  17,     6,      '���� �г��� ����'   UNION ALL
SELECT  17,     7,      '���� Ӳ���� ����'   UNION ALL
SELECT  17,     8,      '���� ����� ����'   UNION ALL
SELECT  17,     9,      '���� ������ ����'   UNION ALL            
SELECT  18,     1,      '���� �ܹ�˾ ����'   UNION ALL
SELECT  18,     2,      '���� ���� ����'   UNION ALL
SELECT  18,     3,      '���� ���²� ����'   UNION ALL
SELECT  18,     4,      '���� ������ ����'   UNION ALL
SELECT  18,     5,      '���� ���в� ����'   UNION ALL
SELECT  18,     6,      '���� �г��� ����'   UNION ALL
SELECT  18,     7,      '���� Ӳ���� ����'   UNION ALL
SELECT  18,     8,      '���� ����� ����'   UNION ALL
SELECT  18,     9,      '���� ������ ����'   UNION ALL
SELECT  19,     1,      '���� �ܹ�˾ ����'   UNION ALL
SELECT  19,     2,      '���� ���� ����'   UNION ALL
SELECT  19,     3,      '���� ���²� ����'   UNION ALL
SELECT  19,     4,      '���� ������ ����'   UNION ALL
SELECT  19,     5,      '���� ���в� ����'   UNION ALL
SELECT  19,     6,      '���� �г��� ����'   UNION ALL
SELECT  19,     7,      '���� Ӳ���� ����'   UNION ALL
SELECT  19,     8,      '���� ����� ����'   UNION ALL
SELECT  19,     9,      '���� ������ ����'
GO


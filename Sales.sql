--- 1
/*
�������� �� ����
*/
--- 2
SELECT distinct CAST(���� as date) AS ���� 
FROM �������
--- 3
SELECT distinct ���������� 
FROM ������� 
/*
�� ��������� ���������� ��������������� �� ��������,
�� ����� ������������ ���:
ORDER BY ���������� asc
*/
--- 4
SELECT distinct �����
FROM �������
WHERE ���� >= 100
--- 5
SELECT distinct ����������
FROM �������
WHERE ���� >= DATEADD(week, -1, GETDATE()) AND ���� <= GETDATE()  
--- 6
SELECT ����, ����, ����������, �����, �����, ����, �����*���� AS ��������� 
FROM �������
--- 7 
SELECT ����, ����, ����������, �����, �����, ����
FROM �������
WHERE (MONTH(����) = 1 AND YEAR(����) = YEAR(GETDATE()) AND ���������� = 'A%') OR (����� > 5 AND ���� < 10)
ORDER BY ���� asc, ���� desc
--- 8
SELECT distinct top 5 with ties ����������
FROM �������
WHERE MONTH(����) = 9 AND YEAR(����) = YEAR(GETDATE()) - 1
ORDER BY ���������� asc
--- 9
DECLARE @param as nvarchar(50)
SET @param = '�������'
SELECT distinct ���������� 
FROM �������
WHERE ����� = @param
--- 10
SELECT top 1 with ties ����
FROM �������
ORDER BY �����*���� desc
---- 11
SELECT ����, SUM(����*�����) as ���������
FROM �������
GROUP BY ����
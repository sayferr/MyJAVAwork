-- ����ӧ֧��� �ӧ�� �٧ѧ�ڧ�� �ڧ� ��ѧҧݧڧ�� books, �ԧէ� ��ڧ�ѧ� (Pressrun) �ҧ�ݧ��� 1000.
--SELECT *
--FROM books
--WHERE Pressrun > 1000

-- ����ܧѧ٧ѧ�� ���ݧ�ܧ� �ߧѧ٧ӧѧߧڧ� �ܧߧڧ� (Name) �� �ܧ�ݧڧ�֧��ӧ� ����ѧߧڧ� (Pages).
--SELECT [Name], Pages
--FROM books 

-- ���ѧۧ�� �ܧߧڧԧ�, �� �ܧ������ ��֧ߧ� �ާ֧ߧ��� 200.
--SELECT *
--FROM books
--WHERE Price < 200 

-- ���ѧۧ�� �ܧߧڧԧ�, �� �ܧ������ Pages = 0 �ڧݧ� Price = 0. 
--SELECT *
--FROM books
--WHERE Pages = 0 OR Price = 0 

-- ���ѧۧ�� �ܧߧڧԧ�, �ԧէ� Pressrun �ҧ�ݧ��� 500 �� ��֧ߧ� �ާ֧ߧ��� 300.
--SELECT *
--FROM books 
--WHERE Pressrun > 500 AND Price < 300

-- ��������ڧ��ӧѧ�� �ܧߧڧԧ� ��� �ӧ�٧�ѧ��ѧߧڧ� �ܧ�ݧڧ�֧��ӧ� ����ѧߧڧ�.
--SELECT *
--FROM books
--ORDER BY Pages ASC

-- ����ӧ֧��� 10 ��ѧާ�� �է֧�קӧ�� �ܧߧڧ�
--SELECT TOP (10)*
--FROM books
--ORDER BY Price ASC

-- ����ܧѧ٧ѧ�� �ӧ�֧� �ڧ٧էѧ�֧ݧ֧� (Izd), �ߧѧ٧ӧѧߧڧ� �ܧ������ �ߧѧ�ڧߧѧ���� �ߧ� �ҧ�ܧӧ� 'A'.
--SELECT *
--FROM books
--WHERE Izd LIKE 'A%'

-- ����է��ڧ�ѧ�� �ܧ�ݧڧ�֧��ӧ� �ܧߧڧ�, �ԧէ� �ܧ�ݧڧ�֧��ӧ� ����ѧߧڧ� �ҧ�ݧ��� 150.
--SELECT *
--FROM books
--WHERE Pages > 150

-- ����ӧ֧��� �ܧߧڧԧ�, �� �ߧѧ٧ӧѧߧڧ� �ܧ������ �֧��� ��ڧާӧ�� '1'
--SELECT *
--FROM books
--WHERE [Name] LIKE '%1%'

-- ��������ڧ��ӧѧ�� �ܧߧڧԧ� ��� �ӧ�٧�ѧ��ѧߧڧ� ����ڧ٧ӧ֧է֧ߧڧ� Price * Pages
--SELECT [Name], Price * Pages AS '��ҧ�ѧ�'
--FROM books 
--ORDER BY '��ҧ�ѧ�' ASC  

-- ���ѧۧ�� ���֧էߧ�� ��֧ߧ� �ܧߧڧ�, �ԧէ� Pressrun �ҧ�ݧ��� 1000.
--SELECT AVG(Price)
--FROM books 
--WHERE Pressrun > 1000   --���֧� WHERE ,�ҧ�է֧� = 27,5881

-- ���ѧۧ�� �ާڧߧڧާѧݧ�ߧ�� �� �ާѧܧ�ڧާѧݧ�ߧ�� �٧ߧѧ�֧ߧڧ� �� �ܧ�ݧ�ߧܧ� Pages
--SELECT MAX(Pages) 'Max value', MIN(Pages) 'Min value'
--FROM books

-- ����ܧѧ٧ѧ�� �ܧߧڧԧ�, �� �ܧ������ Pages �ާ֧اէ� 50 �� 250
--SELECT *
--FROm books
--WHERE Pages > 50 AND Pages < 250
--ORDER BY Pages ASC 

-- ����ӧ֧��� �ܧߧڧԧ�, �� �ܧ������ �էѧ�� ���ҧݧڧܧѧ�ڧ� ���ѧ��� 01.01.2015.
--SELECT *
--FROM books
--WHERE [Date] < '2015.01.01'

-- ������ڧ�ѧ�� �ܧ�ݧڧ�֧��ӧ� �ܧߧڧ� �էݧ� �ܧѧاէ�ԧ� �ڧ٧էѧ�֧ݧ�, �ԧէ� Pages > 200.
--SELECT Izd, COUNT(*) AS '��ҧ�ѧ�'
--FROM books 
--WHERE Pages > 200
--GROUP BY Izd

-- ���ѧۧ�� �ڧ٧էѧ�֧ݧ���ӧ�, �� �ܧ������ ���֧էߧ�� ��֧ߧ� �ܧߧڧ� �ާ֧ߧ��� 300
--SELECT Izd, AVG(Price) AS '���֧էߧ�� ��֧ߧ� �ܧߧڧ�'
--FROM books 
--GROUP BY Izd
--HAVING AVG(Price) < 300

-- ���ѧۧ�� �ܧߧڧԧ� �� �ާڧߧڧާѧݧ�ߧ�� �٧ߧѧ�֧ߧڧ֧� Price * Pages.
--SELECT TOP(1) *
--FROM books
--ORDER BY Price * Pages ASC

-- ���ѧۧ�� �ߧѧ٧ӧѧߧڧ� ��ѧާ�� ���ѧ��� �ܧߧڧԧ� ��� �էѧ�� (Date).
--SELECT MIN(Date) AS '��ѧާѧ� ���ѧ�ѧ� �ܧߧڧԧ� ��� �էѧ��'
--FROM books 

--SELECT TOP(1) *
--FROM books 
--WHERE [Date] IS NOT NULL
--ORDER BY [Date] ASC


-- ���ѧۧ�� �ڧ٧էѧ�֧ݧ� �� �ߧѧڧҧ�ݧ��ڧ� ���ާާѧ�ߧ�� ��ڧ�ѧا�� (Pressrun).
--SELECT MAX(Pressrun) AS '���٧էѧ�֧ݧ� �� �ߧѧڧҧ�ݧ��ڧ� ���ާާѧ�ߧ�� ��ڧ�ѧا�� Pressrun'
--FROM books         --�������������� 1

--SELECT TOP(1) *
--FROM books
--WHERE Pressrun IS NOT NULL
--ORDER BY Pressrun DESC      
--���ѧ�֧� �էӧ�� �ڧ٧էѧ�֧ݧ֧� �� ��ѧާ�� �ҧ�ݧ��ڧ� Pressrun, ������ާ� �ӧ�ӧ֧� �էӧ� ��ѧާ�� �ҧ�ݧ��ڧ� Pressrun   --�������������� 2

-- ����ҧѧӧڧ�� �ߧ�ӧ�� �ܧߧڧԧ� �� �ߧѧ٧ӧѧߧڧ֧� 'Learning SQL', ��֧ߧ�� 450, �ڧ٧էѧ�֧ݧ���ӧ�� 'EduBooks' �� 320 ����ѧߧڧ�ѧާ�.
--INSERT INTO books(Name, Price, Izd, Pages)
--VALUES ('Learning SQL', 450, 'EduBooks', 320)

-- ����ҧѧӧڧ�� 3 �ܧߧڧԧ�, �� �ܧ������ ��֧ߧ� = 999, �ߧ� �� �ӧ�֧� ��ѧ٧ߧ�� �ڧ٧էѧ�֧ݧ�.
--INSERT INTO books (Name, Price, Izd, Pages)
--VALUES ('Learning MySQL', 999, 'EduBooks', 320),
--       ('Learning PostgreSQL', 999, 'BooksPro', 320),
--	   ('Learning MicrosoftSQL', 999, 'BooksPro', 320)

-- ���էѧݧڧ�� �ӧ�� �ܧߧڧԧ�, �� �ܧ������ �ߧѧ٧ӧѧߧڧ� �ߧѧ�ڧߧѧ֧��� �� 'Test'.
--DELETE FROM books 
--WHERE [Name] LIKE 'Test%'

-- ���ӧ֧ݧڧ�ڧ�� ��֧ߧ� �ߧ� 15% �էݧ� �ӧ�֧� �ܧߧڧ�, �� �ܧ������ Price < 300.
--UPDATE books
--SET Price = Price * 1.15
--WHERE Price < 300

-- ���֧�֧ڧާ֧ߧ�ӧѧ�� �ӧ�� �ܧߧڧԧ� �� �ߧѧ٧ӧѧߧڧ֧� 'Old Title' �ߧ� 'Modern SQL Guide'
--UPDATE books
--SET [Name] = 'Modern SQL Guide'
--WHERE [Name] = 'Old Title'
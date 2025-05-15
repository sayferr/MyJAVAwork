--1. ����ӧ֧��� �ߧѧ٧ӧѧߧڧ� �ӧ�֧� �ܧߧڧ� �� �ڧާ֧ߧ� �ڧ� �ѧӧ�����, �������ڧ��ӧѧߧߧ�� ��� �ڧާ֧ߧ� �ѧӧ���� (��� �ӧ�٧�ѧ��ѧߧڧ�).
--SELECT Books.Name, Authors.FirstName, Authors.lastName
--FROM Books
--JOIN Authors ON Books.Id_Author = Authors.id
--ORDER BY Authors.FirstName ASC

--2. ����ӧ֧��� �ӧ�֧� ����է֧ߧ���, �� �ܧ������ �֧�� �ߧ֧� ��ڧ�ѧ�֧ݧ��ܧڧ� �ҧڧݧ֧��� (S_Cards).
--SELECT Students.Id, Students.FirstName, Students.LastName, S_Cards.Id_Student, S_Cards.DateIn
--FROM Students
--LEFT JOIN S_Cards ON Students.Id = S_Cards.Id_Student
--WHERE S_Cards.Id_Student IS NULL

--3. ������ڧ�ѧ��, ��ܧ�ݧ�ܧ� �ܧߧڧ� �ڧ٧էѧק� �ܧѧاէ�� �ڧ٧էѧ�֧ݧ���ӧ� (Press) �� �������ڧ��ӧѧ�� ��� ��ҧ�ӧѧߧڧ�.
--SELECT Press.Name, COUNT(Books.id) AS 'number of books'
--FROM Press
--JOIN Books ON Press.Id = Books.Id_Press
--GROUP BY Press.Name
--ORDER BY 'number of books' DESC 

--4. ����ӧ֧��� �ڧާ֧ߧ� �� ��ѧާڧݧڧ� �ӧ�֧� ���֧��էѧӧѧ�֧ݧ֧�, �ܧ������ �ߧ֧� ���֧է� ����է֧ߧ���.
--SELECT Teachers.FirstName, Teachers.LastName FROM Teachers
--EXCEPT
--SELECT Students.FirstName, Students.LastName FROM Students

--5. ����ܧѧ٧ѧ�� ���ڧ��� �ӧ�֧� ��ѧܧ�ݧ��֧���, �էѧا� �֧�ݧ� �ߧ� �ߧڧ� �ߧ֧� �ߧ� ��էߧ�ԧ� ����է֧ߧ��.
--SELECT Faculties.Name, Students.FirstName, Students.LastName
--FROM Faculties
--LEFT JOIN Students ON Faculties.id = Students.Id_Group

--6. ����ӧ֧��� ���ڧ��� �ӧ�֧� �ܧߧڧ�, ��֧ާ� �ܧ������ �ߧѧ�ڧߧѧ���� �ߧ� A �ڧݧ� B.
--SELECT *
--FROM Themes
--WHERE [Name] LIKE '��%' OR [Name] LIKE '��%'   -- or like ���ݧ�ӧڧ� ����ڧ� �� �����ܧڧ� �ҧ�ܧӧѧާ� '��' �� '��'

--7. ���ѧۧ�� �ӧ�֧� ����է֧ߧ��� �� ��ѧާڧݧڧ֧� �էݧڧߧߧ֧� 8 ��ڧާӧ�ݧ��.
--SELECT *
--FROM Students
--WHERE LEN(LastName) > 8   --��ڧ�ѧ�� or like ���ݧ�ӧڧ� �ߧ� ����֧�

--8. ����ܧѧ٧ѧ�� �ܧ�ݧڧ�֧��ӧ� ����է֧ߧ��� �� �ܧѧاէ�� �ԧ�����.
--SELECT Students.Id_Group, COUNT(*) AS 'number of students'
--FROM Students
--GROUP BY Students.Id_Group

--9. ����ӧ֧��� ���� 5 �ѧӧ����� ��� �ܧ�ݧڧ�֧��ӧ� �ܧߧڧ�, �ܧ������ ��ߧ� �ߧѧ�ڧ�ѧݧ�.
SELECT TOP(5) Authors.FirstName, Authors.LastName, COUNT(Books.Id) 'number books'
FROM Authors
JOIN Books ON Authors.Id = Books.Id_Author
GROUP BY Authors.FirstName, Authors.LastName
ORDER BY 'number books' DESC 

--10. ���ҧߧ�ӧڧ�� ��ѧާڧݧڧ� �ӧ�֧� ����է֧ߧ��� �� �ڧާ֧ߧ֧� "Ali " �ߧ� "Aliev".
--UPDATE Students
--SET LastName = 'Aliev'
--WHERE LastName = 'Ali'


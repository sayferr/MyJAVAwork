--1. §£§í§Ó§Ö§ã§ä§Ú §ß§Ñ§Ù§Ó§Ñ§ß§Ú§ñ §Ó§ã§Ö§ç §Ü§ß§Ú§Ô §Ú §Ú§Þ§Ö§ß§Ñ §Ú§ç §Ñ§Ó§ä§à§â§à§Ó, §à§ä§ã§à§â§ä§Ú§â§à§Ó§Ñ§ß§ß§í§ç §á§à §Ú§Þ§Ö§ß§Ú §Ñ§Ó§ä§à§â§Ñ (§á§à §Ó§à§Ù§â§Ñ§ã§ä§Ñ§ß§Ú§ð).
--SELECT Books.Name, Authors.FirstName, Authors.lastName
--FROM Books
--JOIN Authors ON Books.Id_Author = Authors.id
--ORDER BY Authors.FirstName ASC

--2. §£§í§Ó§Ö§ã§ä§Ú §Ó§ã§Ö§ç §ã§ä§å§Õ§Ö§ß§ä§à§Ó, §å §Ü§à§ä§à§â§í§ç §Ö§ë§× §ß§Ö§ä §é§Ú§ä§Ñ§ä§Ö§Ý§î§ã§Ü§Ú§ç §Ò§Ú§Ý§Ö§ä§à§Ó (S_Cards).
--SELECT Students.Id, Students.FirstName, Students.LastName, S_Cards.Id_Student, S_Cards.DateIn
--FROM Students
--LEFT JOIN S_Cards ON Students.Id = S_Cards.Id_Student
--WHERE S_Cards.Id_Student IS NULL

--3. §±§à§ã§é§Ú§ä§Ñ§ä§î, §ã§Ü§à§Ý§î§Ü§à §Ü§ß§Ú§Ô §Ú§Ù§Õ§Ñ§×§ä §Ü§Ñ§Ø§Õ§à§Ö §Ú§Ù§Õ§Ñ§ä§Ö§Ý§î§ã§ä§Ó§à (Press) §Ú §à§ä§ã§à§â§ä§Ú§â§à§Ó§Ñ§ä§î §á§à §å§Ò§í§Ó§Ñ§ß§Ú§ð.
--SELECT Press.Name, COUNT(Books.id) AS 'number of books'
--FROM Press
--JOIN Books ON Press.Id = Books.Id_Press
--GROUP BY Press.Name
--ORDER BY 'number of books' DESC 

--4. §£§í§Ó§Ö§ã§ä§Ú §Ú§Þ§Ö§ß§Ñ §Ú §æ§Ñ§Þ§Ú§Ý§Ú§Ú §Ó§ã§Ö§ç §á§â§Ö§á§à§Õ§Ñ§Ó§Ñ§ä§Ö§Ý§Ö§Û, §Ü§à§ä§à§â§í§ç §ß§Ö§ä §ã§â§Ö§Õ§Ú §ã§ä§å§Õ§Ö§ß§ä§à§Ó.
--SELECT Teachers.FirstName, Teachers.LastName FROM Teachers
--EXCEPT
--SELECT Students.FirstName, Students.LastName FROM Students

--5. §±§à§Ü§Ñ§Ù§Ñ§ä§î §ã§á§Ú§ã§à§Ü §Ó§ã§Ö§ç §æ§Ñ§Ü§å§Ý§î§ä§Ö§ä§à§Ó, §Õ§Ñ§Ø§Ö §Ö§ã§Ý§Ú §ß§Ñ §ß§Ú§ç §ß§Ö§ä §ß§Ú §à§Õ§ß§à§Ô§à §ã§ä§å§Õ§Ö§ß§ä§Ñ.
--SELECT Faculties.Name, Students.FirstName, Students.LastName
--FROM Faculties
--LEFT JOIN Students ON Faculties.id = Students.Id_Group

--6. §£§í§Ó§Ö§ã§ä§Ú §ã§á§Ú§ã§à§Ü §Ó§ã§Ö§ç §Ü§ß§Ú§Ô, §ä§Ö§Þ§í §Ü§à§ä§à§â§í§ç §ß§Ñ§é§Ú§ß§Ñ§ð§ä§ã§ñ §ß§Ñ A §Ú§Ý§Ú B.
--SELECT *
--FROM Themes
--WHERE [Name] LIKE '§¡%' OR [Name] LIKE '§£%'   -- or like §å§ã§Ý§à§Ó§Ú§Ö §ã§ä§à§Ú§ä §ã §â§å§ã§ã§Ü§Ú§Þ §Ò§å§Ü§Ó§Ñ§Þ§Ú '§¡' §Ú '§£'

--7. §¯§Ñ§Û§ä§Ú §Ó§ã§Ö§ç §ã§ä§å§Õ§Ö§ß§ä§à§Ó §ã §æ§Ñ§Þ§Ú§Ý§Ú§Ö§Û §Õ§Ý§Ú§ß§ß§Ö§Ö 8 §ã§Ú§Þ§Ó§à§Ý§à§Ó.
--SELECT *
--FROM Students
--WHERE LEN(LastName) > 8   --§á§Ú§ã§Ñ§ä§î or like §å§ã§Ý§à§Ó§Ú§Ö §ß§Ö §ç§à§ä§Ö§Ý

--8. §±§à§Ü§Ñ§Ù§Ñ§ä§î §Ü§à§Ý§Ú§é§Ö§ã§ä§Ó§à §ã§ä§å§Õ§Ö§ß§ä§à§Ó §Ó §Ü§Ñ§Ø§Õ§à§Û §Ô§â§å§á§á§Ö.
--SELECT Students.Id_Group, COUNT(*) AS 'number of students'
--FROM Students
--GROUP BY Students.Id_Group

--9. §£§í§Ó§Ö§ã§ä§Ú §ä§à§á 5 §Ñ§Ó§ä§à§â§à§Ó §á§à §Ü§à§Ý§Ú§é§Ö§ã§ä§Ó§å §Ü§ß§Ú§Ô, §Ü§à§ä§à§â§í§Ö §à§ß§Ú §ß§Ñ§á§Ú§ã§Ñ§Ý§Ú.
SELECT TOP(5) Authors.FirstName, Authors.LastName, COUNT(Books.Id) 'number books'
FROM Authors
JOIN Books ON Authors.Id = Books.Id_Author
GROUP BY Authors.FirstName, Authors.LastName
ORDER BY 'number books' DESC 

--10. §°§Ò§ß§à§Ó§Ú§ä§î §æ§Ñ§Þ§Ú§Ý§Ú§ð §Ó§ã§Ö§ç §ã§ä§å§Õ§Ö§ß§ä§à§Ó §ã §Ú§Þ§Ö§ß§Ö§Þ "Ali " §ß§Ñ "Aliev".
--UPDATE Students
--SET LastName = 'Aliev'
--WHERE LastName = 'Ali'


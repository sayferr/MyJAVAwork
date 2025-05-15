-- §£§í§Ó§Ö§ã§ä§Ú §Ó§ã§Ö §Ù§Ñ§á§Ú§ã§Ú §Ú§Ù §ä§Ñ§Ò§Ý§Ú§è§í books, §Ô§Õ§Ö §ä§Ú§â§Ñ§Ø (Pressrun) §Ò§à§Ý§î§ê§Ö 1000.
--SELECT *
--FROM books
--WHERE Pressrun > 1000

-- §±§à§Ü§Ñ§Ù§Ñ§ä§î §ä§à§Ý§î§Ü§à §ß§Ñ§Ù§Ó§Ñ§ß§Ú§ñ §Ü§ß§Ú§Ô (Name) §Ú §Ü§à§Ý§Ú§é§Ö§ã§ä§Ó§à §ã§ä§â§Ñ§ß§Ú§è (Pages).
--SELECT [Name], Pages
--FROM books 

-- §¯§Ñ§Û§ä§Ú §Ü§ß§Ú§Ô§Ú, §å §Ü§à§ä§à§â§í§ç §è§Ö§ß§Ñ §Þ§Ö§ß§î§ê§Ö 200.
--SELECT *
--FROM books
--WHERE Price < 200 

-- §¯§Ñ§Û§ä§Ú §Ü§ß§Ú§Ô§Ú, §å §Ü§à§ä§à§â§í§ç Pages = 0 §Ú§Ý§Ú Price = 0. 
--SELECT *
--FROM books
--WHERE Pages = 0 OR Price = 0 

-- §¯§Ñ§Û§ä§Ú §Ü§ß§Ú§Ô§Ú, §Ô§Õ§Ö Pressrun §Ò§à§Ý§î§ê§Ö 500 §Ú §è§Ö§ß§Ñ §Þ§Ö§ß§î§ê§Ö 300.
--SELECT *
--FROM books 
--WHERE Pressrun > 500 AND Price < 300

-- §°§ä§ã§à§â§ä§Ú§â§à§Ó§Ñ§ä§î §Ü§ß§Ú§Ô§Ú §á§à §Ó§à§Ù§â§Ñ§ã§ä§Ñ§ß§Ú§ð §Ü§à§Ý§Ú§é§Ö§ã§ä§Ó§Ñ §ã§ä§â§Ñ§ß§Ú§è.
--SELECT *
--FROM books
--ORDER BY Pages ASC

-- §£§í§Ó§Ö§ã§ä§Ú 10 §ã§Ñ§Þ§í§ç §Õ§Ö§ê§×§Ó§í§ç §Ü§ß§Ú§Ô
--SELECT TOP (10)*
--FROM books
--ORDER BY Price ASC

-- §±§à§Ü§Ñ§Ù§Ñ§ä§î §Ó§ã§Ö§ç §Ú§Ù§Õ§Ñ§ä§Ö§Ý§Ö§Û (Izd), §ß§Ñ§Ù§Ó§Ñ§ß§Ú§ñ §Ü§à§ä§à§â§í§ç §ß§Ñ§é§Ú§ß§Ñ§ð§ä§ã§ñ §ß§Ñ §Ò§å§Ü§Ó§å 'A'.
--SELECT *
--FROM books
--WHERE Izd LIKE 'A%'

-- §±§à§Õ§ã§é§Ú§ä§Ñ§ä§î §Ü§à§Ý§Ú§é§Ö§ã§ä§Ó§à §Ü§ß§Ú§Ô, §Ô§Õ§Ö §Ü§à§Ý§Ú§é§Ö§ã§ä§Ó§à §ã§ä§â§Ñ§ß§Ú§è §Ò§à§Ý§î§ê§Ö 150.
--SELECT *
--FROM books
--WHERE Pages > 150

-- §£§í§Ó§Ö§ã§ä§Ú §Ü§ß§Ú§Ô§Ú, §Ó §ß§Ñ§Ù§Ó§Ñ§ß§Ú§Ú §Ü§à§ä§à§â§í§ç §Ö§ã§ä§î §ã§Ú§Þ§Ó§à§Ý '1'
--SELECT *
--FROM books
--WHERE [Name] LIKE '%1%'

-- §°§ä§ã§à§â§ä§Ú§â§à§Ó§Ñ§ä§î §Ü§ß§Ú§Ô§Ú §á§à §Ó§à§Ù§â§Ñ§ã§ä§Ñ§ß§Ú§ð §á§â§à§Ú§Ù§Ó§Ö§Õ§Ö§ß§Ú§ñ Price * Pages
--SELECT [Name], Price * Pages AS '§à§Ò§ë§Ñ§Ô'
--FROM books 
--ORDER BY '§à§Ò§ë§Ñ§Ô' ASC  

-- §¯§Ñ§Û§ä§Ú §ã§â§Ö§Õ§ß§ð§ð §è§Ö§ß§å §Ü§ß§Ú§Ô, §Ô§Õ§Ö Pressrun §Ò§à§Ý§î§ê§Ö 1000.
--SELECT AVG(Price)
--FROM books 
--WHERE Pressrun > 1000   --§¢§Ö§Ù WHERE ,§Ò§å§Õ§Ö§ä = 27,5881

-- §¯§Ñ§Û§ä§Ú §Þ§Ú§ß§Ú§Þ§Ñ§Ý§î§ß§à§Ö §Ú §Þ§Ñ§Ü§ã§Ú§Þ§Ñ§Ý§î§ß§à§Ö §Ù§ß§Ñ§é§Ö§ß§Ú§Ö §Ó §Ü§à§Ý§à§ß§Ü§Ö Pages
--SELECT MAX(Pages) 'Max value', MIN(Pages) 'Min value'
--FROM books

-- §±§à§Ü§Ñ§Ù§Ñ§ä§î §Ü§ß§Ú§Ô§Ú, §å §Ü§à§ä§à§â§í§ç Pages §Þ§Ö§Ø§Õ§å 50 §Ú 250
--SELECT *
--FROm books
--WHERE Pages > 50 AND Pages < 250
--ORDER BY Pages ASC 

-- §£§í§Ó§Ö§ã§ä§Ú §Ü§ß§Ú§Ô§Ú, §å §Ü§à§ä§à§â§í§ç §Õ§Ñ§ä§Ñ §á§å§Ò§Ý§Ú§Ü§Ñ§è§Ú§Ú §ã§ä§Ñ§â§ê§Ö 01.01.2015.
--SELECT *
--FROM books
--WHERE [Date] < '2015.01.01'

-- §±§à§ã§é§Ú§ä§Ñ§ä§î §Ü§à§Ý§Ú§é§Ö§ã§ä§Ó§à §Ü§ß§Ú§Ô §Õ§Ý§ñ §Ü§Ñ§Ø§Õ§à§Ô§à §Ú§Ù§Õ§Ñ§ä§Ö§Ý§ñ, §Ô§Õ§Ö Pages > 200.
--SELECT Izd, COUNT(*) AS '§à§Ò§ë§Ñ§Ô'
--FROM books 
--WHERE Pages > 200
--GROUP BY Izd

-- §¯§Ñ§Û§ä§Ú §Ú§Ù§Õ§Ñ§ä§Ö§Ý§î§ã§ä§Ó§Ñ, §å §Ü§à§ä§à§â§í§ç §ã§â§Ö§Õ§ß§ñ§ñ §è§Ö§ß§Ñ §Ü§ß§Ú§Ô §Þ§Ö§ß§î§ê§Ö 300
--SELECT Izd, AVG(Price) AS '§ã§â§Ö§Õ§ß§ñ§ñ §è§Ö§ß§Ñ §Ü§ß§Ú§Ô'
--FROM books 
--GROUP BY Izd
--HAVING AVG(Price) < 300

-- §¯§Ñ§Û§ä§Ú §Ü§ß§Ú§Ô§å §ã §Þ§Ú§ß§Ú§Þ§Ñ§Ý§î§ß§í§Þ §Ù§ß§Ñ§é§Ö§ß§Ú§Ö§Þ Price * Pages.
--SELECT TOP(1) *
--FROM books
--ORDER BY Price * Pages ASC

-- §¯§Ñ§Û§ä§Ú §ß§Ñ§Ù§Ó§Ñ§ß§Ú§Ö §ã§Ñ§Þ§à§Û §ã§ä§Ñ§â§à§Û §Ü§ß§Ú§Ô§Ú §á§à §Õ§Ñ§ä§Ö (Date).
--SELECT MIN(Date) AS '§ã§Ñ§Þ§Ñ§ñ §ã§ä§Ñ§â§Ñ§ñ §Ü§ß§Ú§Ô§Ñ §á§à §Õ§Ñ§ä§Ö'
--FROM books 

--SELECT TOP(1) *
--FROM books 
--WHERE [Date] IS NOT NULL
--ORDER BY [Date] ASC


-- §¯§Ñ§Û§ä§Ú §Ú§Ù§Õ§Ñ§ä§Ö§Ý§ñ §ã §ß§Ñ§Ú§Ò§à§Ý§î§ê§Ú§Þ §ã§å§Þ§Þ§Ñ§â§ß§í§Þ §ä§Ú§â§Ñ§Ø§à§Þ (Pressrun).
--SELECT MAX(Pressrun) AS '§ª§Ù§Õ§Ñ§ä§Ö§Ý§î §ã §ß§Ñ§Ú§Ò§à§Ý§î§ê§Ú§Þ §ã§å§Þ§Þ§Ñ§â§ß§í§Þ §ä§Ú§â§Ñ§Ø§à§Þ Pressrun'
--FROM books         --§£§¡§²§ª§¡§¯§´ 1

--SELECT TOP(1) *
--FROM books
--WHERE Pressrun IS NOT NULL
--ORDER BY Pressrun DESC      
--§¯§Ñ§ê§Ö§Ý §Õ§Ó§å§ç §Ú§Ù§Õ§Ñ§ä§Ö§Ý§Ö§Û §ã §ã§Ñ§Þ§í§Þ §Ò§à§Ý§î§ê§Ú§Þ Pressrun, §á§à§ï§ä§à§Þ§å §Ó§í§Ó§Ö§Ý §Õ§Ó§Ñ §ã§Ñ§Þ§í§ç §Ò§à§Ý§î§ê§Ú§ç Pressrun   --§£§¡§²§ª§¡§¯§´ 2

-- §¥§à§Ò§Ñ§Ó§Ú§ä§î §ß§à§Ó§å§ð §Ü§ß§Ú§Ô§å §ã §ß§Ñ§Ù§Ó§Ñ§ß§Ú§Ö§Þ 'Learning SQL', §è§Ö§ß§à§Û 450, §Ú§Ù§Õ§Ñ§ä§Ö§Ý§î§ã§ä§Ó§à§Þ 'EduBooks' §Ú 320 §ã§ä§â§Ñ§ß§Ú§è§Ñ§Þ§Ú.
--INSERT INTO books(Name, Price, Izd, Pages)
--VALUES ('Learning SQL', 450, 'EduBooks', 320)

-- §¥§à§Ò§Ñ§Ó§Ú§ä§î 3 §Ü§ß§Ú§Ô§Ú, §Ó §Ü§à§ä§à§â§í§ç §è§Ö§ß§Ñ = 999, §ß§à §å §Ó§ã§Ö§ç §â§Ñ§Ù§ß§í§Ö §Ú§Ù§Õ§Ñ§ä§Ö§Ý§Ú.
--INSERT INTO books (Name, Price, Izd, Pages)
--VALUES ('Learning MySQL', 999, 'EduBooks', 320),
--       ('Learning PostgreSQL', 999, 'BooksPro', 320),
--	   ('Learning MicrosoftSQL', 999, 'BooksPro', 320)

-- §µ§Õ§Ñ§Ý§Ú§ä§î §Ó§ã§Ö §Ü§ß§Ú§Ô§Ú, §å §Ü§à§ä§à§â§í§ç §ß§Ñ§Ù§Ó§Ñ§ß§Ú§Ö §ß§Ñ§é§Ú§ß§Ñ§Ö§ä§ã§ñ §ã 'Test'.
--DELETE FROM books 
--WHERE [Name] LIKE 'Test%'

-- §µ§Ó§Ö§Ý§Ú§é§Ú§ä§î §è§Ö§ß§å §ß§Ñ 15% §Õ§Ý§ñ §Ó§ã§Ö§ç §Ü§ß§Ú§Ô, §å §Ü§à§ä§à§â§í§ç Price < 300.
--UPDATE books
--SET Price = Price * 1.15
--WHERE Price < 300

-- §±§Ö§â§Ö§Ú§Þ§Ö§ß§à§Ó§Ñ§ä§î §Ó§ã§Ö §Ü§ß§Ú§Ô§Ú §ã §ß§Ñ§Ù§Ó§Ñ§ß§Ú§Ö§Þ 'Old Title' §ß§Ñ 'Modern SQL Guide'
--UPDATE books
--SET [Name] = 'Modern SQL Guide'
--WHERE [Name] = 'Old Title'
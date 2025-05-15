--1. Выведи все книги, у которых цена больше 200
--SELECT 
--*
--FROM books
--WHERE Price > 200

--2. Выведи книги, у которых количество страниц от 300 до 600 включительно.
--SELECT 
--*
--FROM books
--WHERE Price >= 300 AND Price <= 600

--3. Показать книги, изданные издательством 'DiaSoft'.
--SELECT
--*
--FROM books 
--WHERE Izd IN ('DiaSoft')   

--4. Показать книги, у которых Date не указана
--SELECT
--*
--FROM books
--WHERE Date IS NULL

--5. Вывести все уникальные издательства (Izd) из таблицы.
--SELECT DISTINCT Izd 
--FROM books

--6. Выбери книги, у которых цена — 10, 50, 100 или 150.
--SELECT 
--*
--FROM books
--WHERE Price IN (10, 50, 100, 150)

--7. Показать книги, где название начинается с "SQL".
--SELECT *
--FROM books
--WHERE [Name] LIKE 'SQL%'

--8. Вывести книги, у которых Pressrun равен 1.
--SELECT 
--*
--FROM books
--WHERE Pressrun = 1

--9. Показать книги, у которых название содержит Fə
--SELECT *
--FROM books
--WHERE [Name] LIKE '%F%'

--10. Вывести книги, у которых цена не равна 100.
--SELECT 
--*
--FROM books
--WHERE Price != 100

--11. Показать 3% самых дешёвых книг, у которых страниц больше 300, и цена не входит в (100, 200, 300).
--SELECT TOP (3) PERCENT 
--*
--FROM books
--WHERE Pages > 300 AND Price NOT IN (100, 200, 300)
--ORDER BY Price ASC

--12. Показать книги, где Price > 150, Izd не "DiaSoft", и дата указана (Date IS NOT NULL).
--SELECT 
--*
--FROM books 
--WHERE Price > 150 AND
--Izd NOT IN ('DiaSoft') AND 
--[Date] IS NOT NULL

--13. Вывести книги, где название состоит из 3 букв, первая — "Д", третья — "К".
--SELECT *
--FROM books
--WHERE Izd LIKE 'Д_к'

--14. Сгруппировать книги по New (0 и 1), и показать статус: old или new
--SELECT [Name],

--CASE
--WHEN New = 0 THEN 'Old'
--WHEN New = 1 THEN 'New'
--END as 'Status'
--, Price, Pressrun 

--FROM books


--15. Вывести название книги, цену и текстовую "оценку стоимости" через IIF, по таким правилам:
--     > 300 → "очень дорогая"
--     > 200 → "дорогая"
--     > 100 → "не очень дорогая" 
--     <= 100 → "дешёвая"
--     NULL → "нет информации"

--SELECT [Name], 
--   IIF(Price > 300, 'Очень дорогая',
--   IIF(Price > 200, 'дорогая',
--   IIF(Price > 100, 'не очень дорогая',
--   IIF(Price <= 100, 'дешевая', 'нет информации')))) as 'расходы'
--   , Price, Pressrun 
--FROM books 
--ORDER BY Price DESC 

--16. **Выведи книги, у которых:  
--     Pages > 500 
--    и это одна самая дорогая книга по этому условию**
--SELECT *  
--FROM books
-- WHERE Pages > 500
-- ORDER BY Price DESC

-- SELECT TOP (1) *  
--FROM books
-- WHERE Pages > 500
-- ORDER BY Price DESC

--17. **Составь запрос, который покажет: Name, Price, Pressrun, статус тиража (IIF(Pressrun = 1) → "1 экз.", IS NULL → "нет данных", иначе — "в наличии")**
--SELECT
-- [Name],
-- Price,
-- Pressrun,
-- IIF(Pressrun = 1, '1 экз.',
--    IIF(Pressrun IS NULL, 'нет данных', 'в наличии')) AS 'status'
--FROM books

--18. **Показать книги, у которых: Izd содержит одну букву из набора [а-яa-z], как 2-й символ, и название не начинается с "A"**
--SELECT *
--FROM books
--WHERE Izd LIKE '_[A-ZА-Яа-яa-z]%'
--      AND [Name] NOT LIKE 'А%'

--19. Вывести все книги, отсортированные по убыванию стоимости всего тиража (Price * Pressrun).
--SELECT
--*, Price * Pressrun 'Стоимость всего тиража'
--FROM books
--ORDER BY Price * Pressrun DESC

--20. Вывести книги, где цена NULL или <= 100, но Pressrun больше 3000.
--SELECT 
--*
--FROM books
--WHERE Price = NULL OR Price <= 100 AND Pressrun > 3000
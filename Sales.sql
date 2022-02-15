--- 1
/*
Вопросов не было
*/
--- 2
SELECT distinct CAST(Дата as date) AS Дата 
FROM Продажи
--- 3
SELECT distinct Покупатель 
FROM Продажи 
/*
По умолчанию Покупатели упорядочиваются по алфавиту,
но можно использовать еще:
ORDER BY Покупатель asc
*/
--- 4
SELECT distinct Товар
FROM Продажи
WHERE Цена >= 100
--- 5
SELECT distinct Покупатель
FROM Продажи
WHERE Дата >= DATEADD(week, -1, GETDATE()) AND Дата <= GETDATE()  
--- 6
SELECT нДок, Дата, Покупатель, Товар, Колво, Цена, Колво*Цена AS Стоимость 
FROM Продажи
--- 7 
SELECT нДок, Дата, Покупатель, Товар, Колво, Цена
FROM Продажи
WHERE (MONTH(Дата) = 1 AND YEAR(Дата) = YEAR(GETDATE()) AND Покупатель = 'A%') OR (Колво > 5 AND Цена < 10)
ORDER BY Дата asc, Цена desc
--- 8
SELECT distinct top 5 with ties Покупатель
FROM Продажи
WHERE MONTH(Дата) = 9 AND YEAR(Дата) = YEAR(GETDATE()) - 1
ORDER BY Покупатель asc
--- 9
DECLARE @param as nvarchar(50)
SET @param = 'Телефон'
SELECT distinct Покупатель 
FROM Продажи
WHERE Товар = @param
--- 10
SELECT top 1 with ties нДок
FROM Продажи
ORDER BY Колво*Цена desc
---- 11
SELECT нДок, SUM(Цена*Колво) as Стоимость
FROM Продажи
GROUP BY нДок
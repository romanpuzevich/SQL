--- 1
SELECT COUNT(PassengerId) as Number_of_passengers, 
	   SUM(Survived) as Number_of_survived,
	   SUM(Survived)*1.0/COUNT(PassengerId) as Proportion_of_survived
FROM Titanic

--- 2
SELECT Pclass as Class, COUNT(PassengerId) as Number_of_passengers, 
	   SUM(Survived) as Number_of_survived,
	   SUM(Survived)*1.0/COUNT(PassengerId) as Proportion_of_survived
FROM Titanic
GROUP BY Pclass
ORDER BY Pclass 

--- 3
SELECT Pclass as Class, Sex, COUNT(PassengerId) as Number_of_passengers, 
	   SUM(Survived) as Number_of_survived,
	   SUM(Survived)*1.0/COUNT(PassengerId) as Proportion_of_survived
FROM Titanic
GROUP BY Pclass, Sex
ORDER BY Pclass 

--- 4
SELECT Embarked as Port_of_departure, COUNT(PassengerId) as Number_of_passengers, 
	   SUM(Survived) as Number_of_survived,
	   SUM(Survived)*1.0/COUNT(PassengerId) as Proportion_of_survived
FROM Titanic
GROUP BY Embarked
/* тут, видимо, что-то с данными, поэтому выводит NULL */

--- 5 
SELECT top 1 Embarked
FROM Titanic
GROUP BY Embarked
ORDER BY COUNT(PassengerId) desc

--- 6
SELECT T1.Pclass as Class, T1.Sex as Sex, AVG(T1.Age) as Average_age, AVG(T2.Age) as Average_survived_age
FROM Titanic as T1 INNER JOIN Titanic as T2 ON T1.Pclass = T2.Pclass AND T1.Sex = T2.Sex
WHERE T2.Survived = 1
GROUP BY T1.Pclass, T1.Sex

--- 7
SELECT top 10 *
FROM Titanic 
ORDER BY Fare desc
/* Стоимость билета указана не на человека, а на семью */

--- 8
SELECT distinct T1.Ticket
FROM Titanic as T1 INNER JOIN Titanic as T2 on T1.Ticket = T2.Ticket
WHERE T1.Fare != T2.Fare

SELECT distinct T1.Ticket
FROM Titanic as T1 INNER JOIN Titanic as T2 on T1.Ticket = T2.Ticket
WHERE T1.Embarked != T2.Embarked

--- 9
SELECT Ticket, Pclass, Fare, Embarked, COUNT(*) as  Number_of_passengers, 
	   SUM(Survived) as Number_of_survived
FROM Titanic
GROUP BY Ticket, Pclass, Fare, Embarked

--- 10
SELECT Ticket
FROM Titanic
GROUP BY Ticket
HAVING COUNT(PassengerId) > 1 AND COUNT(PassengerId) = SUM(Survived)

--- 11
/* Использую формулу Байеса, поскльку женское имя и выживание связанные события
   P(A|B) = P(B|A)*P(A)/P(B); B - имя, А - выживание*/

SELECT (SELECT COUNT(PassengerId) FROM Titanic WHERE Survived = 1 AND Name like '%Elizabeth%')*1.0/(SELECT COUNT(PassengerId) FROM Titanic WHERE Name like '%Elizabeth%')
		as Chance_if_name_is_Elizabeth

SELECT (SELECT COUNT(PassengerId) FROM Titanic WHERE Survived = 1 AND Name like '%Mary%')*1.0/(SELECT COUNT(PassengerId) FROM Titanic WHERE Name like '%Mary%')
		as Chance_if_name_is_Mary

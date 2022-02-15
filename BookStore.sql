--- 1
declare @volume float
set @volume = 100

select Good, Volume*QtyInStock as Total_volume
from Goods
where Volume*QtyInStock > @volume

--- 2
select City
from Customers
group by City
having COUNT(Cust_id) < 5

--- 3
declare @cust_id int
set @cust_id = 4

select Docs.Data as Data, Docs.DocNum as Docs_num, (select Good from Goods where Goods.Good_id = Docs_data.Good_id) as Good, Docs_data.Price as Price
from Docs inner join Docs_data on Docs.DocNum = Docs_data.DocNum
where Docs.Cust_ID = @cust_id

--- 4
select distinct (select Good from Goods where Goods.Good_id = Docs_data.Good_id) as Goods
from Docs inner join Docs_data on Docs.DocNum = Docs_data.DocNum
where Docs.Data between '20211001' and '20211031'

--- 5
declare @good int
set @good = 5

select distinct City
from Customers inner join (Docs inner join Docs_data on Docs.DocNum = Docs_data.DocNum) on Customers.Cust_id = Docs.Cust_ID
where Docs_data.Good_id = @good

--- 6
select top 1 Customer
from (Customers inner join Docs on Customers.Cust_id = Docs.Cust_ID) 
	  inner join Docs_data on Docs_data.DocNum = Docs.DocNum
where Docs.Data between '20211001' and '20211031'
order by Docs_data.Price desc

--- 7
select SUM(Docs_data.Price*Docs_data.Qty)
from Docs inner join Docs_data on Docs.DocNum = Docs_data.DocNum
where Docs.Data between '20211001' and '20211031'
group by Docs_data.Good_id

--- 8 
select top 1 with ties Customers.City
from (Docs inner join Customers on Docs.Cust_ID = Customers.Cust_id) inner join Docs_data on Docs.DocNum = Docs_data.DocNum
group by Customers.City
order by SUM(Docs_data.Price*Docs_data.Qty) desc 

--- 9
select Customers.Customer, (select Good from Goods as G1 where G1.Good_id = Goods.Good_id) as Good, COUNT(Goods.Good_id) as Total_count, SUM(Docs_data.Price*Docs_data.Qty) as Total_prise,
	   SUM(Goods.Mass) as Total_mass, SUM(Goods.Volume) as Total_volume
from ((Customers inner join Docs on Customers.Cust_id = Docs.Cust_ID)
	 inner join Docs_data on Docs.DocNum = Docs_data.DocNum)
	 inner join Goods on Docs_data.Good_id = Goods.Good_id
group by Customers.Customer, Goods.Good_id

--- 10
select Docs.DocNum, Docs.Data, Docs.Cust_id, Docs.Total
from Docs inner join Docs_data on Docs.DocNum = Docs_data.DocNum 
where (select SUM(Price*Qty)
	   from Docs_data
	   where Docs_data.DocNum = Docs.DocNum
	   group by Docs_data.DocNum, Docs_data.Good_ID ) != Docs.Total





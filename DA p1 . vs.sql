"how many years ?"
SELECT DISTINCT substr("order date", 7, 4) as year
from orders
where length(substr("order date", 7, 4))= 4
order by year 

"profit by year "
SELECT 
	DISTINCT substr("Order Date", 7, 4) as year  , 
	round(sum(Profit), 2) as profit
from orders 
where length(substr("Order Date", 7, 4)) = 4 
group by year
order by year

"profit of cat and sub_cat by year"
SELECT 
	substr("Order Date", 7, 4) as year  , "category" , "sub-category",
	round(sum(Profit), 2) as profit 
from orders 
where length(substr("Order Date", 7, 4)) = 4 
group by year, Category ,"sub-category"
order by year


" sales and profit by year "
SELECT 
	substr("Order Date", 7, 4) as year  , 
	round(sum(sales), 2) as sales ,round(sum(profit), 2) as profit
from orders 
where length(substr("Order Date", 7, 4)) = 4 
group by year
order by year

"sals by country, city , state over years "
SELECT 
	substr("Order Date", 7, 4) as year  , "COUNTRY" , "CITY" , "State",	
	round(sum(sales), 2) as sales 
from orders 
where length(substr("Order Date", 7, 4)) = 4 
group by year,country, city, state
order by year

"sales by region ans shipmode"
Select
	Region , "ship mode",
	count(*) as total_orders ,
	round(sum(sales), 2) as sales, round(sum(profit ),2) as profit 
from orders 
group by region ,"ship mode"
order by region

"top 10 customers for sales and orders "
SELECT 
    "Customer Name",
    ROUND(COUNT("ORDER ID"), 2) AS Total_ORDERS , ROUND(SUM(Sales),2) AS SALES 
from orders
group by "Customer Name"
ORDER BY Total_ORDERS DESC
lImit 10
#Query 1
select a.CustomerName, a.Gender, d.SalesPersonName, d.City
from dim_customer as a join fact_productsales as b 
on a.CustomerID=b.CustomerID join dim_date as c on
b.SalesDateKey=c.DateKey join dim_salesperson as d
on b.SalesPersonID = d.SalesPersonID
where c.YEAR = "2015" and c.MONTH = "9" 
and b.SalesPrice > 20 and b.Quantity > 8
group by b.ProductID
;

#Query 2
select a.StoreName , a.City , c.ProductName 
from dim_store as a join fact_productsales as b on 
a.StoreID = b.StoreID join dim_product as c on
b.ProductID = c.ProductKey join dim_date as d on
b.SalesDateKey = d.DateKey
where d.MONTH = "3" and d.YEAR= "2017"
and a.City="Boulder" and b.ProductCost < 50
;

#Query 3
select a.SalesPersonID , a.SalesPersonName , (sum(b.ProductCost) * sum(c.ProductSalesPrice)) as total_Revenue 
from dim_salesperson as a join fact_productsales as b on
a.SalesPersonID = b.SalesPersonID join dim_product as c on
b.ProductID = c.ProductKey join dim_date as d on
b.SalesDateKey = d.DateKey
where d.YEAR = "2017"
order by total_Revenue desc
limit 2
;

#Query 4
select a.CustomerName , sum(b.SalesPrice * b.Quantity) as Lowest_Total_Revenue
from dim_customer as a join fact_productsales as b on
a.CustomerID = b.CustomerID join dim_date as c on
b.SalesDateKey = c.DateKey
where c.Year = "2017"
group by a.CustomerName
order by Lowest_Total_Revenue asc
limit 1
;




#Query 5
select a.StoreName , sum(b.SalesPrice) as total_sales_Price
from dim_store as a join fact_productsales as b on
a.StoreID = b.StoreID join dim_date as c on
b.SalesDateKey = c.DateKey
where c.YEAR >= "2010" and c.YEAR <= "2017"
group by a.StoreName
order by a.StoreName asc
;

#Query 6
select a.StoreName, c.ProductName , (b.SalesPrice * b.Quantity) - (b.ProductCost * b.Quantity)  as profit
from dim_store as a join fact_productsales as b on
a.StoreID = b.StoreID join dim_product as c on
c.ProductKey = b.ProductID join dim_date as d on
b.SalesDateKey = d.DateKey
where c.ProductName="Jasmine Rice 5kg" and d.YEAR="2010"
;

#Query 7
select a.StoreName,c.QUARTER,c.YEAR , (b.SalesPrice * b.Quantity) as Total_Revenue
from dim_store as a join fact_productsales as b on
a.StoreID = b.StoreID join dim_date as c on
c.DateKey = b.SalesDateKey
where c.YEAR="2016" and a.StoreName="ValueMart Boulder"
group by c.QUARTER
order by c.QUARTER
;
#Query 8
select a.CustomerName , sum(b.SalesPrice) as Total_sales_price
from dim_customer as a join fact_productsales as b on
a.CustomerID = b.CustomerID
where a.CustomerName="Melinda Gates" or a.CustomerName="Harrison Ford"
group by a.CustomerName
;

#Query 9
select a.StoreName,b.SalesPrice,d.CustomerName
from dim_store as a join fact_productsales as b on
a.StoreID=b.StoreID join dim_date as c on
b.SalesDateKey = c.DateKey join dim_customer as d on
b.customerId = d.customerId
where c.DAYOFMONTH="12" and c.MONTH="3" and c.YEAR="2017"
;
#Query 10
select a.SalesPersonName,sum(b.SalesPrice*b.Quantity) as Highest_Revenue
from dim_salesperson as a join fact_productsales as b on
a.SalesPersonID=b.SalesPersonID
group by a.SalesPersonName
order by Highest_Revenue desc
limit 1
;

#Query 11
select a.ProductName, (b.SalesPrice * b.Quantity) - (b.ProductCost * b.Quantity)  as profit
from dim_product as a join fact_productsales as b on
a.ProductKey = b.ProductID
group by ProductName
order by profit desc
limit 1
;

#Query 12
select a.YEAR,a.MONTH, sum(b.SalesPrice * b.Quantity) as Revenue
from dim_date as a join fact_productsales as b on
a.DateKey = b.SalesDateKey
where (a.MONTH='1' or a.MONTH='2' or a.MONTH='3') and a.YEAR="2017"
group by a.MONTH
;
#Query 13
select a.ProductName , round(AVG(b.ProductCost),2) as Average_Product_cost , round(AVG(b.SalesPrice),2) as Average_sales_price
from dim_product as a join fact_productsales as b on
a.ProductKey = b.ProductID join dim_date as c on
b.SalesDateKey = c.DateKey
where c.YEAR = "2017"
group by a.ProductName
;
#Query 14
select a.CustomerName, round(avg(b.SalesPrice),2) as average_sales_price , round(avg(b.Quantity),2) as average_Quantity
from dim_customer as a join fact_productsales as b on
a.CustomerID = b.CustomerID
where a.CustomerName="Melinda Gates"
group by a.CustomerName
;

#Query 15
select a.City , Max(b.SalesPrice) as Maximum_sales_price , Min(b.SalesPrice) as Minimum_sales_price
from dim_store as a join fact_productsales as b on
a.StoreID = b.StoreID
where a.City = "Boulder"
group by a.City
;

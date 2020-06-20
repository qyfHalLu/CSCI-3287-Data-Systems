/* query 1 */
SELECT CompanyName,Country FROM hw_3_sql_northwinds.hwsuppliers
where Country ='Japan' or Country='Germany';
/* query 2 */
SELECT ProductName,QuantityPerUnit,UnitPrice FROM hw_3_sql_northwinds.hwproducts
where UnitPrice>4 and UnitPrice <7;

/* query 3 */
SELECT CompanyName,ContactTitle,City FROM hw_3_sql_northwinds.hwcustomers
 where (Country='USA' and City='Portland') or (Country='Canada' and City='Vancouver');
 
 /* query 4 */
 SELECT ContactName,ContactTitle FROM hw_3_sql_northwinds.hwsuppliers
where SupplierID>4 and SupplierID<9 order by ContactName desc;
 /* query 5 */
SELECT ProductName,UnitPrice FROM hw_3_sql_northwinds.hwproducts
where UnitPrice= (select min(UnitPrice) from hwproducts  );
 /* query 6 */
SELECT ShipCountry,count(*) as 'NUmber of Orders' FROM hw_3_sql_northwinds.hworders
where ShipCountry <>'USA' and ShippedDate between '2015-05-04 00:00:00' and '2015-05-05 00:00:00'
group by  ShipCountry;
 /* query 7 */
SELECT FirstName,LastName , DATE_FORMAT( HireDate , '%d/%m/%Y') as 'Hire Date' FROM hw_3_sql_northwinds.hwemployees
where Country <>'USA' and hiredate < '2015-03-17';
 /* query 8 */
SELECT ProductName,UnitsInStock*UnitPrice as 'Inventory Value' FROM hw_3_sql_northwinds.hwproducts
where UnitsInStock>3000 and UnitsInStock<4000;

 /* query 9 */
SELECT ProductName,UnitsInStock,ReorderLevel FROM hw_3_sql_northwinds.hwproducts
where ProductName like 'S%' and UnitsInStock>0 and UnitsInStock    <= reorderLevel;

 /* query 10 */
SELECT ProductName,UnitPrice FROM hw_3_sql_northwinds.hwproducts
where QuantityPerUnit like '%box%' and Discontinued=1;
 
 /* query 11 */
SELECT ProductName,UnitsInStock*UnitPrice as 'Inventory Value' FROM hw_3_sql_northwinds.hwproducts p
inner join hwsuppliers s on s.SupplierID= p.SupplierID
where QuantityPerUnit like '%box%'  and s.Country='Japan';

 /* query 12 */
SELECT Country,count(*) as 'customerCount' FROM hw_3_sql_northwinds.hwcustomers
group by Country
having count(*)>8;

 /* query 13 */
SELECT ShipCountry, ShipCity,count(ShipCountry) FROM hw_3_sql_northwinds.hworders
where ShipCountry in ('Austria' , 'Argentina')
group by ShipCountry;


 /* query 14 */
SELECT  s.CompanyName,p.ProductName FROM hw_3_sql_northwinds.hwsuppliers s
inner join hwproducts p on s.SupplierID= p.SupplierID
 where s.Country='Spain';
 
  /* query 15 */
 SELECT   avg( UnitPrice) FROM hw_3_sql_northwinds.hwproducts 
where ProductName like '%T';

  /* query 16 */
SELECT   e.FirstName +' '+ e.LastName as 'FullName',e.Title,count(o.OrderID)  FROM hw_3_sql_northwinds.hworders o
inner join hwemployees e on o.EmployeeID= e.EmployeeID 
group by e.FirstName +' '+ e.LastName  ,e.Title
having count(o.OrderID)>120;

  /* query 17 */
SELECT  c.CompanyName,c.Country,count(o.OrderID) FROM hw_3_sql_northwinds.hwcustomers c
left outer join hworders o on c.CustomerID= o.CustomerID
group by c.CompanyName,c.Country
having count(o.OrderID) =0;

  /* query 18 */
SELECT  c.CategoryName,p.ProductName,p.UnitsInStock FROM hw_3_sql_northwinds.hwproducts p
inner join hwcategories c on p.CategoryID= c.CategoryID
where p.UnitsInStock=0;

  /* query 19 */
SELECT  p.ProductName,p.QuantityPerUnit  FROM hw_3_sql_northwinds.hwproducts p
inner join hwsuppliers s on p.SupplierID= s.SupplierID
where (QuantityPerUnit like '%pkg%'or QuantityPerUnit like '%pkgs%' or QuantityPerUnit like '%jars%') 
and s.Country='Japan';
  /* query 20 */
SELECT  c.CompanyName,o.ShipName, cast(sum( (od.Quantity * od.UnitPrice)-od.Discount) as decimal(18,2)) FROM hw_3_sql_northwinds.hwcustomers c
inner join hworders o on c.CustomerID = o.CustomerID
inner join hworderdetails od on o.OrderID =od.OrderID
where c.Country='Mexico'
group by c.CompanyName,o.ShipName;
  /* query 21 */
SELECT    p.ProductName,s.CompanyName  ,s.Region   FROM hw_3_sql_northwinds.hwproducts p
inner join hwsuppliers s on p.SupplierID = s.SupplierID
where p.ProductName like 'L%' and Region<>'';
  /* query 22 */
SELECT   ShipCountry,ShipName,DATE_FORMAT( ShippedDate , "%M %Y") as 'ShippedDate' FROM  hworders
where CustomerID not in (select CustomerID from hwcustomers) and ShipCity='Versailles';
 
  /* query 23 */
SET @row_number = 0;
SELECT    p.ProductName ,UnitsInStock,(@row_number:=@row_number + 1) AS 'RANK'   FROM hw_3_sql_northwinds.hwproducts p 
where p.ProductName like 'F%'
order by    UnitsInStock  desc;
 
   /* query 24 */
 SET @row_number = 0;
SELECT    p.ProductName ,UnitPrice,(@row_number:=@row_number + 1) AS 'RANK'   FROM hw_3_sql_northwinds.hwproducts p 
where p.ProductID  <6
order by    UnitPrice ;

   /* query 25 */
 SELECT FirstName,LastName,DATE_FORMAT( birthdate , '%m/%d/%Y') as 'Date Of Birth', @row_number :=
 CASE WHEN @Country=Country THEN @row_number+1 ELSE 1 END AS 'row_number',@Country:=Country as 'Country'
 FROM   hwemployees ,(SELECT @row_number:=0,@Country:='') AS t
 where BirthDate>'1984-01-01'
 ORDER BY Country,BirthDate;
 
 
 
 
 
 
 
 
 
 
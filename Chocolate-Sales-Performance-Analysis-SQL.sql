
--------------Chocolate-Sales-Performance-Analysis--------------

/*Sales Data*/
Select * from chocolateDaTa

------Data Cleaning Process-------

/*Null Values*/
Select * from chocolateDaTa
where Sales_Person is null or Country is null or Product is null 
or Amount is null or Boxes_Shipped is null

/*Duplicate Rows*/
Select Sales_Person,Country,[Product],[Date],Amount,Boxes_Shipped,
COUNT(*) as 'Duplicate_Count'
from chocolateDaTa 
Group By Sales_Person,Country,[Product],[Date],Amount,Boxes_Shipped
Having COUNT(*)>1
 
/* Negative or Unrealistic Values*/
Select * from chocolateDaTa where Amount<0 or Boxes_Shipped<0

/*Remove Extra Space*/
update chocolateDaTa
set Country= LTRIM(Rtrim([Country]))


----------------Calculations And Analysis--------------------

/*Total Revenue*/
Select SUM([Amount]) as 'Total Revenue'
from chocolateDaTa

/*Total Boxes Shipped*/
select SUM([boxes_Shipped]) as 'Total Boxes Shipped' from chocolateDaTa

/*Average Order Value*/
select AVG([Amount]) as 'Average Order Value' from chocolateDaTa

/*Revenue Per Box*/
Select SUM([Amount])/SUM([Boxes_Shipped]) FROM chocolateDaTa

/*Country Wise Performance*/
Select [Country],
SUM([Amount]) as 'Total Revenue',
SUM([Boxes_Shipped]) as 'Total Boxes Shipped'
from chocolateDaTa
group by Country

/*Top 3 Profitable Country*/
select top 3 [Country],
SUM([Amount]) as 'Total Revenue'
from chocolateDaTa
group by [country]
order by 'Total Revenue' desc

/*Top 3 Less Profitable Country*/
select top 3 [Country],
SUM([Amount]) as 'Total Revenue'
from chocolateDaTa
group by [country]
order by 'Total Revenue' asc

/*Product Wise Performance*/
Select [Product],
SUM([Amount]) as 'Total Revenue',
Sum([Boxes_Shipped]) as 'Total Boxes Shipped'
from chocolateDaTa
Group by Product

/*Top 5 Best Product*/
select top 5 [PRODUCT],
SUM([boxes_shipped]) as 'Quantity'
from chocolateDaTa
group by [Product]
order by Quantity desc

/*Top 5 Worst Product*/
Select top 5 [Product],
SUM([boxes_Shipped]) as 'Quantity'
from chocolateDaTa
group by [Product]
order by [Quantity] asc

/* Best Revenue generator Person*/
Select Top 1 [Sales_Person],
sum([Amount]) as  'Highest Sales'
from chocolateDaTa
Group by [Sales_Person]
order by [Highest Sales] desc

/* Lowest Revenue Generator Person*/
Select Top 1 [Sales_Person],
sum([Amount]) as  'Lowest Sale'
from chocolateDaTa
Group by [Sales_Person]
order by [Lowest Sale] asc

/*Most Boxes Shipped Person*/
Select top 1 [Sales_Person],
SUM([Boxes_Shipped]) as 'Boxes Shipped'
from chocolateDaTa
Group by [Sales_Person]
Order by [Boxes Shipped]desc

/*Less Boxes Shipped Person*/
Select Top 1 [Sales_Person],
sum([Boxes_Shipped]) as 'Total Boxes Shipped'
from chocolateDaTa
group by Sales_Person
order by [Total Boxes Shipped]asc

/*Monthly Revenue*/
select YEAR([Date])as 'Year',month([Date])as 'Month',
SUM([amount]) as 'Monthly Revenue'
from chocolateDaTa
group by YEAR([Date]),MONTH([Date])
Order by [Year],[MONTH]

/*Peak Revenue Month*/
select top 1 YEAR([Date])as 'Year',month([Date])as 'Month',
SUM([amount]) as 'Monthly Revenue'
from chocolateDaTa
group by YEAR([Date]),MONTH([Date])
Order by [Monthly Revenue] desc

/*Lowest Revenue Month*/
select top 1 YEAR([Date])as 'Year',month([Date])as 'Month',
SUM([amount]) as 'Monthly Revenue'
from chocolateDaTa
group by YEAR([Date]),MONTH([Date])
Order by [Monthly Revenue] asc




/**
An insurance company maintains records of sales made by its employees. 
Each employee is assigned to a state. States are grouped under regions. The following tables contain the data:
**/

TABLE regions
  id INTEGER PRIMARY KEY
  name VARCHAR(50) NOT NULL

TABLE states
  id INTEGER PRIMARY KEY
  name VARCHAR(50) NOT NULL
  regionId INTEGER NOT NULL REFERENCES regions(id)

TABLE employees
  id INTEGER PRIMARY KEY
  name VARCHAR(50) NOT NULL
  stateId INTEGER NOT NULL REFERENCES states(id)

TABLE sales
  id INTEGER PRIMARY KEY
  amount INTEGER NOT NULL
  employeeId INTEGER NOT NULL REFERENCES employees(id)  
  
/**
Management requires a comparative region sales analysis report.

Write a query that returns:

The region name.
Average sales per employee for the region (Average sales = Total sales made for the region / Number of employees in the region).
The difference between the average sales of the region with the highest average sales, 
and the average sales per employee for the region (average sales to be calculated as explained above).
Employees can have multiple sales. A region with no sales should be also returned. 
Use 0 for average sales per employee for such a region when calculating the 2nd and the 3rd column.
**/

with SalesAvg as (
  select Region.name as rgn, 
    CASE WHEN SUM(IFNULL(SL.amount,0)) = 0 THEN 0                    /*region with no sales returning 0*/
    ELSE  SUM(IFNULL(SL.amount,0)) / COUNT(DISTINCT Empl.id) END as average             
/*distinct employee count gives the correct value for number of employees in ther region.*/
  from regions Region
    left join states States on Region.id = States.regionId
    left join employees Empl on States.id = Empl.stateId
    left join sales SL on Empl.id = SL.employeeId
  group by Region.Id, Region.name
) 
select 
  rgn, 
  average,
  (select max(average) from SalesAvg)- average as difference        /*highest average sales -region average*/
from SalesAvg
group by rgn

/**

rgn        average    difference    
--------------------------------
East       1200       2800          
Midwest    0          4000          
North      2500       1500          
South      4000       0            
West       2400       1600          
**/

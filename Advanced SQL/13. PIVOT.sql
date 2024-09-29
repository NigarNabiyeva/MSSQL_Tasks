/* Exercise 1:
Using PIVOT, write a query against the HumanResources.Employee table
that summarizes the average amount of vacation time for Sales Representatives, Buyers, and Janitors.
*/

SELECT
	*
FROM
(
	SELECT	
		[JobTitle],
		[VacationHours]
	FROM [AdventureWorks2019].[HumanResources].[Employee] 
) A
PIVOT 
(
	AVG([VacationHours])
	FOR [JobTitle] IN ([Sales Representative], [Buyer], [Janitor])
) B;
			

/* Exercise 2:
Modify your query from Exercise 1 such that the results are broken out by Gender. 
Alias the Gender field as "Employee Gender" in your output.
*/

SELECT
	*
FROM
(
	SELECT	
		[JobTitle],
		[VacationHours],
		[Gender] AS 'Employee Gender'
	FROM [AdventureWorks2019].[HumanResources].[Employee] 
) A
PIVOT 
(
	AVG([VacationHours])
	FOR [JobTitle] IN ([Sales Representative], [Buyer], [Janitor])
) B;
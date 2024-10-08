/* Exercise 1:
Create a query that displays all rows and the following columns from the AdventureWorks2019.HumanResources.Employee table:
BusinessEntityID
JobTitle
VacationHours
Also include a derived column called "MaxVacationHours" that returns the maximum amount of vacation hours for any one employee, in any given row.
*/

SELECT
	[BusinessEntityID],
	[JobTitle],
	[VacationHours],
	(SELECT MAX([VacationHours]) FROM [AdventureWorks2019].[HumanResources].[Employee]) AS MaxVacationHours
FROM
	[AdventureWorks2019].[HumanResources].[Employee];


/* Exercise 2:
Add a new derived field to your query from Exercise 1, which returns the percent an individual employees' vacation hours are, 
of the maximum vacation hours for any employee. For example, the record for the employee 
with the most vacation hours should have a value of 1.00, or 100%, in this column.
Hints:
You can repurpose your logic from "MaxVacationHours" for the denominator.
Make sure you multiply at least one side of your equation by 1.0, to ensure the output will be a decimal.
*/

SELECT
	[BusinessEntityID],
	[JobTitle],
	[VacationHours],
	(SELECT MAX([VacationHours]) FROM [AdventureWorks2019].[HumanResources].[Employee]) AS MaxVacationHours,
	([VacationHours] * 1.0) / (SELECT MAX([VacationHours]) FROM [AdventureWorks2019].[HumanResources].[Employee]) AS PercentOfMaxVacationHours
FROM
	[AdventureWorks2019].[HumanResources].[Employee];


/* Exercise 3:
Refine your output with a criterion in the WHERE clause that filters out any employees whose vacation hours 
are less than 80% of the maximum amount of vacation hours for any one employee. 
In other words, return only employees who have at least 80% as much vacation time as the employee with the most vacation time.
Hint: The query should return 60 rows.
*/

SELECT
	[BusinessEntityID],
	[JobTitle],
	[VacationHours],
	(SELECT MAX([VacationHours]) FROM [AdventureWorks2019].[HumanResources].[Employee]) AS MaxVacationHours,
	([VacationHours] * 1.0) / (SELECT MAX([VacationHours]) FROM [AdventureWorks2019].[HumanResources].[Employee]) AS PercentOfMaxVacationHours
FROM
	[AdventureWorks2019].[HumanResources].[Employee]
WHERE ([VacationHours] * 1.0) / (SELECT MAX([VacationHours]) FROM [AdventureWorks2019].[HumanResources].[Employee]) >= 0.8;
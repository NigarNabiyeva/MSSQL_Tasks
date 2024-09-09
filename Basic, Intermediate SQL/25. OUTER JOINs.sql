/*
1. Write a query that combines the "BusinessEntityID", "SalesQuota", and "SalesYTD" columns 
from the "Sales.SalesPerson" table, with the "Name" column from the "Sales.SalesTerritory" table. 
Alias the "Name" column as "TerritoryName". Make sure to include all rows from the "Sales.SalesPerson" table regardless of 
whether a match is found in the "Sales.SalesTerritory" table. 
*/

SELECT 
	A.[BusinessEntityID],
	A.[SalesQuota],
	A.[SalesYTD],
	B.[Name] AS 'TerritoryName'
FROM [AdventureWorks2019].[Sales].[SalesPerson] A
LEFT JOIN [AdventureWorks2019].[Sales].[SalesTerritory] B
	ON A.[TerritoryID] = B.[TerritoryID];


/*
2. Modify your query from Exercise 1 to only include rows where the YTD sales are less than $2,000,000.
*/

SELECT 
	A.[BusinessEntityID],
	A.[SalesQuota],
	A.[SalesYTD],
	B.[Name] AS 'TerritoryName'
FROM [AdventureWorks2019].[Sales].[SalesPerson] A
LEFT JOIN [AdventureWorks2019].[Sales].[SalesTerritory] B
	ON A.[TerritoryID] = B.[TerritoryID];
WHERE A.[SalesYTD] < 2000000;
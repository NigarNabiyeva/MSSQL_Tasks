/*
Create a query that - for each distinct “SalesOrderID” in the Sales.SalesOrderDetail table - 
provides the sum of “LineTotal” (from the Sales.SalesOrderDetail table) and a comma-separated list of all the product
names (which you can find in the “Name” field of the Production.Product table) associated with that
sales order ID.
Additionally, you should filter the output of your query such that only rows where the sum of line totals
is greater than 5000.
*/

SELECT
	A.[SalesOrderID],
	SUM(A.[LineTotal]) AS 'Sum of LineTotal',
	STRING_AGG(B.[Name], ',') AS 'Product Name'
FROM [AdventureWorks2019].[Sales].[SalesOrderDetail] A
JOIN [AdventureWorks2019].[Production].[Product] B
	ON A.[ProductID] = B.[ProductID]
GROUP BY A.[SalesOrderID]
HAVING SUM(A.[LineTotal]) > 5000;
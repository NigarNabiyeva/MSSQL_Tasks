/*
1. Write a query against the Sales.SalesPerson table that includes the following fields:
• BusinessEntityID
• SalesQuota
This field should be formatted as currency (specifying culture/locale is optional).
• Bonus
This field should be formatted as currency (specifying culture/locale is optional).
• CommissionPct
This field should be formatted as a percentage.
Your query output should include all records from the SalesPerson table – no need for a WHERE clause in this exercise.
*/

SELECT
	[BusinessEntityID],
	[SalesQuota] = FORMAT([SalesQuota], 'c'),
	[Bonus] = FORMAT([Bonus], 'c'),
	[CommissionPct] = FORMAT([CommissionPct], 'p')
FROM [AdventureWorks2019].[Sales].[SalesPerson];


/*
2. Write a query against the Purchasing.PurchaseOrderHeader table that includes the following fields:
• OrderYearMonth
This field should be a reformatted version of the “OrderDate” field, in which the date values are converted to strings consisting of the 4 digit year, a hyphen, and the 2 digit month. For example, the date “2013-04-20” would be converted to the string “2012-04”.
• TaxAmt
This field should be formatted as currency (specifying culture/locale is optional).
• Freight
This field should be formatted as currency (specifying culture/locale is optional).
• TotalDue
This field should be formatted as currency (specifying culture/locale is optional).
Your query output should only include records from the PurchaseOrderHeader table where the order date was in 2013.
*/

SELECT 
	[OrderYearMonth] = FORMAT([OrderDate], 'yyyy - mm'),
	[TaxAmt] = FORMAT([TaxAmt], 'c'),
	[Freight] = FORMAT([Freight], 'c'),
	[TotalDue] = FORMAT([TotalDue], 'c')
FROM [AdventureWorks2019].[Purchasing].[PurchaseOrderHeader]
WHERE YEAR([OrderDate]) = 2013;
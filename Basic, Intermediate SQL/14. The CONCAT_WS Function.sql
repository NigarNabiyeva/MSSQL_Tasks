/*
1. Write a query that uses the CONCAT_WS function to combine address components from the Person.Address table into a complete address string.
The resulting column in your query output should be aliased “FullAddress”.
The address string should incorporate the following fields:
•	AddressLine1
•	AddressLine2
•	City
•	PostalCode
All components should be separated by spaces. Here’s an example of how a row of your query output should look:
"4977 Candlestick Dr. Portland 97205"
*/

SELECT
	[AddressLine1],
	[AddressLine2],
	[City],
	[PostalCode],
	CONCAT_WS(' ', [AddressLine1], [AddressLine2], [City], [PostalCode]) AS FullAddress
FROM [AdventureWorks2019].[Person].[Address];


/*
2. Write a query against the Production.Product table that concatenates product name and list price together in a single field (called “ProductPrice”), separated by a colon and a space.
The query results should only include products whose list price exceeds $1,000.
Here’s an example of how a row of your query output should look:
"Touring-1000 Blue, 54: $2384.07"
HINT: Think about how you could modify the “separator” you pass to CONCAT_WS, to add a dollar sign before the list price as depicted in the example above.
*/

SELECT
	[Name],
	[ListPrice],
	CONCAT_WS(': $', [Name], [ListPrice]) AS ProductPrice
FROM [AdventureWorks2019].[Production].[Product]
WHERE [ListPrice] > 1000;

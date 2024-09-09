/*
1. Select the following columns (all rows) from the "Sales.CreditCard" table:
 - CardNumber
 - Last Four Digits - a derived column with just the last four digits of the credit card number
*/

SELECT
	[CardNumber],
	RIGHT([CardNumber], 4) AS 'Last Four Digits'
FROM [AdventureWorks2019].[Sales].[CreditCard];


/*
2. Select the following columns (all rows) from the "Production.ProductReview" table:
 - ReviewerName
 - Comments
 - Cleaned Comments - a derived column in which all commas from the "Comments" field have been replaced with empty strings
*/

SELECT
	[ReviewerName],
	[Comments],
	REPLACE ([Comments], ',', ' ') AS 'Cleaned Comments'
FROM [AdventureWorks2019].[Production].[ProductReview];


/*
3. Select the "FirstName" and "LastName" columns from the "Person.Person" table. 
Only include rows where the length of the last name is greater than or equal to 10 characters.
*/

SELECT 
	[FirstName],
	[LastName]
FROM [AdventureWorks2019].[Person].[Person]
WHERE LEN ([LastName]) >= 10;


/*
4. Sort the output of Exercise 3 by the length of the last name in descending order. 
HINT - you can re-use the expression in your WHERE clause in your ORDER BY, even though it isn't included in the SELECT list!
*/

SELECT 
	[FirstName],
	[LastName]
FROM [AdventureWorks2019].[Person].[Person]
WHERE LEN ([LastName]) >= 10
ORDER BY LEN ([LastName]) DESC;
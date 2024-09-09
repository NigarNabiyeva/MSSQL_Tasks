/*
1. Calculate yesterday's date dynamically via GETDATE. 
Convert the value to a DATE datatype, such that it has no timestamp component.
*/

SELECT CAST(GETDATE()-1 AS DATE);


/*
2. Calculate the number of days between the current date and the end of the current year via DATEDIFF. 
Use the CAST function to create the end-of-year date.
*/

SELECT DATEDIFF(DAY, GETDATE(), CAST('2024-12-31' AS DATE));


/*
3. Select all rows from the "Person.Person" table where the middle name is not NULL, AND either the title is not NULL OR the suffix is not NULL. Include the following columns:
 - Title
 - FirstName
 - MiddleName
 - LastName
 - Suffix
 - PersonID: a derived column created by combining the person type, a hyphen(-), and the business entity ID, in that order.
HINT - you will need to convert the business entity ID to a VARCHAR 
in order for the concatenation to work. You do not necessarily need to specify the length - 
simply specifying VARCHAR (as opposed to, say, VARCHAR(100)) will work fine.
*/

SELECT
	[Title],
	[FirstName],
	[MiddleName],
	[LastName],
	[Suffix],
	PersonType + '-' + CAST([BusinessEntityID] AS VARCHAR) AS PersonID
FROM [AdventureWorks2019].[Person].[Person]
WHERE [MiddleName] IS NOT NULL AND ([Title] IS NOT NULL OR [Suffix] IS NOT NULL);
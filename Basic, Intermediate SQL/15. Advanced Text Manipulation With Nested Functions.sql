/*
1. Select the "FirstName" and "LastName" columns from the "Person.Person" table (all rows). 
Now add a derived column called "Nickname", which is created by combining
the first character of the the first name, a hyphen (-), 
and the first three characters of the last name.
*/

SELECT
	[FirstName],
	[LastName],
	LEFT([FirstName],1) + '-' + LEFT([LastName], 3) AS Nickname
FROM [AdventureWorks2019].[Person].[Person];


/*
2. Select the following columns (all rows) from the "Production.ProductReview" table:
 - ReviewerName
 - Comments
 - Cleaned Comments - a derived column in which all commas AND periods from the "Comments" field have been replaced with empty strings. 
HINT - you will have to nest multiple REPLACE functions.
*/

SELECT
	[ReviewerName],
	[Comments],
	REPLACE(REPLACE([Comments], ',', ' '), '.', ' ') AS 'Cleaned Comments'
FROM [AdventureWorks2019].[Production].[ProductReview];


/*
3. Select the "FirstName" column from the "Person.Person" table (all rows). 
Now add the following derived columns:
FirstNameUpper, which features the first name entirely capitalized
FirstNameLower, which consists of the first name transformed entirely to lowercase.
*/

SELECT
	[FirstName],
	UPPER([FirstName]) AS FirstNameUpper,
	LOWER([FirstName]) AS FirstNameLower
FROM [AdventureWorks2019].[Person].[Person];
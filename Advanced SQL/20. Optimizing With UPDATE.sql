/* Making use of temp tables and UPDATE statements, re-write an optimized version of the query in the 
"Optimizing With UPDATE - Exercise Starter Code.sql" file, which you'll find in the resources for this section.
*/

SELECT 
	A.BusinessEntityID,
	A.Title,
	A.FirstName,
	A.MiddleName,
	A.LastName,
	B.PhoneNumber,
	C.Name AS PhoneNumberType,
	D.EmailAddress
FROM AdventureWorks2019.Person.Person A
	LEFT JOIN AdventureWorks2019.Person.PersonPhone B
		ON A.BusinessEntityID = B.BusinessEntityID
	LEFT JOIN AdventureWorks2019.Person.PhoneNumberType C
		ON B.PhoneNumberTypeID = C.PhoneNumberTypeID
	LEFT JOIN AdventureWorks2019.Person.EmailAddress D
		ON A.BusinessEntityID = D.BusinessEntityID



CREATE TABLE #PersonContactInfo
(
	BusinessEntityID INT,
	Title VARCHAR(8),
	FirstName VARCHAR(50),
	MiddleName VARCHAR(50),
	LastName VARCHAR(50),
	PhoneNumber VARCHAR(25),
	PhoneNumberTypeID VARCHAR(25),
	PhoneNumberType VARCHAR(25),
	EmailAddress VARCHAR(50)
)

INSERT INTO #PersonContactInfo
(
	BusinessEntityID,
	Title,
	FirstName,
	MiddleName,
	LastName
)

SELECT
	BusinessEntityID,
	Title,
	FirstName,
	MiddleName,
	LastName
FROM AdventureWorks2019.Person.Person


UPDATE A
SET
	PhoneNumber = B.PhoneNumber,
	PhoneNumberTypeID = B.PhoneNumberTypeID
FROM #PersonContactInfo A
	JOIN AdventureWorks2019.Person.PersonPhone B
		ON A.BusinessEntityID = B.BusinessEntityID


UPDATE A
SET	PhoneNumberType = B.Name
FROM #PersonContactInfo A
	JOIN AdventureWorks2019.Person.PhoneNumberType B
		ON A.PhoneNumberTypeID = B.PhoneNumberTypeID


UPDATE A
SET	EmailAddress = B.EmailAddress
FROM #PersonContactInfo A
	JOIN AdventureWorks2019.Person.EmailAddress B
		ON A.BusinessEntityID = B.BusinessEntityID


SELECT * FROM #PersonContactInfo
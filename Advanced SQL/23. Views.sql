/* Exercise 1
Create a view named vw_Top10MonthOverMonth in your AdventureWorks database, based on the query below. Assign the view to the Sales schema.
HINT: You will need to make a slight tweak to the query code before it can be successfully converted to a view.
*/

CREATE VIEW Sales.vw_Top10MonthOverMonth AS
WITH Sales AS
(
SELECT 
	OrderDate,
	DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) AS OrderMonth,
	TotalDue,
	ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC) AS OrderRank
FROM AdventureWorks2019.Sales.SalesOrderHeader
),

Top10Sales AS
(
SELECT
	OrderMonth,
	SUM(TotalDue) AS Top10Total
FROM Sales
WHERE OrderRank <= 10
GROUP BY OrderMonth
)

SELECT
A.OrderMonth,
A.Top10Total,
B.Top10Total AS PrevTop10Total
FROM Top10Sales A
	LEFT JOIN Top10Sales B
		ON A.OrderMonth = DATEADD(MONTH,1,B.OrderMonth)
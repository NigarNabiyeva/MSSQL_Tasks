/* Refactor your solution to the exercise from the section on CTEs (average sales/purchases minus top 10) using temp tables in place of CTEs. */

SELECT 
	OrderDate,
	DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) AS OrderMonth,
	TotalDue,
	ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC) AS OrderRank
INTO #Sales
FROM AdventureWorks2019.Sales.SalesOrderHeader

SELECT 
	OrderMonth,
	SUM(TotalDue) AS TotalSales
INTO #SalesMinusTop10
FROM #Sales
WHERE OrderRank > 10
GROUP BY OrderMonth

SELECT 
	OrderDate,
	DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) AS OrderMonth,
	TotalDue,
	ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC) AS OrderRank
INTO #Purchases
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader

SELECT
	OrderMonth,
	TotalPurchases = SUM(TotalDue)
INTO #PurchasesMinusTop10
FROM #Purchases
WHERE OrderRank > 10
GROUP BY OrderMonth

SELECT
	A.OrderMonth,
	A.TotalSales,
	B.TotalPurchases
FROM #SalesMinusTop10 A
	JOIN #PurchasesMinusTop10 B
		ON A.OrderMonth = B.OrderMonth
ORDER BY 1

DROP TABLE #Sales
DROP TABLE #SalesMinusTop10
DROP TABLE #Purchases
DROP TABLE #PurchasesMinusTop10
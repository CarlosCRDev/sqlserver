DECLARE @pageNumber as int,
		@pageSize as int,
		@totalPages as int

SET @pageNumber = 5
SET @pageSize = 10
SET @totalPages = (SELECT COUNT(*) FROM Sales.SalesOrderHeader) / @pageSize

SELECT RowNumber,
		@totalPages as TotalPages,
		SalesOrderNumber,
		PurchaseOrderNumber,
		AccountNumber,
		CustomerID
FROM
	(SELECT *, 
			ROW_NUMBER() OVER (ORDER BY SalesOrderID) AS RowNumber
	FROM Sales.SalesOrderHeader) AS Sales
WHERE RowNumber BETWEEN @pageSize * @pageNumber + 1
	AND @pageSize * (@pageNumber + 1)
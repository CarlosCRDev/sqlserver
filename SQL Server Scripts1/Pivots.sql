SELECT * FROM Sales.SalesOrderHeader -- salesorderID, orderDate
SELECT * FROM Sales.SalesOrderDetail -- salesorderID, productID
SELECT * FROM Production.Product -- productID, productsubcategoryID 
SELECT * FROM Production.ProductSubcategory -- productsubcategoryID, productcategoryID
SELECT * FROM Production.ProductCategory -- productcategoryID, name

--Coloca el resultado de la consulta en una tabla temporal
WITH VentasPorCategoria AS (
SELECT DISTINCT DATEPART(year, SOH.OrderDate) as anio,
	PC.[name] as categoria,
	P.ProductID
FROM Sales.SalesOrderHeader SOH INNER JOIN Sales.SalesOrderDetail SOD ON SOH.SalesOrderID = SOD.SalesOrderID
INNER JOIN Production.Product P ON P.ProductID = SOD.ProductID
INNER JOIN Production.ProductSubcategory PSC ON PSC.ProductSubcategoryID = P.ProductSubcategoryID
INNER JOIN Production.ProductCategory PC ON PC.ProductCategoryID = PSC.ProductCategoryID
)

--se aplica el pivot el resultado almacenado en la tabla temporal, este interpola las columas con las filas
SELECT * FROM VentasPorCategoria
PIVOT (COUNT(ProductID) FOR anio IN([2014],[2013],[2011])) as pivotTable
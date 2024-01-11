--NOLOCK es una propiedad de tabla, que al realizar una consulta a dicha tabla,
--se realiza una lectura de datos sin confirmar o lectura sucia(lo que significa que si la tabla esta siendo usada
--en una transacción, se pueden leer los datos si bloquearlos (por lo que no es recomendable hacerlo)

BEGIN TRAN

UPDATE Sales.SalesOrderHeader SET [Status]=4

SELECT *
FROM Sales.SalesOrderHeader SOH INNER JOIN Sales.SalesOrderDetail SOD ON SOH.SalesOrderID = SOD.SalesOrderID
INNER JOIN Production.Product P ON P.ProductID = SOD.ProductID
INNER JOIN Production.ProductSubcategory PSC ON PSC.ProductSubcategoryID = P.ProductSubcategoryID
CROSS JOIN Production.ProductCategory PC

ROLLBACK TRAN

--Esta consulta debe esperar a que termine la transacción para poder ejecutarse
--SELECT * FROM  Sales.SalesOrderHeader SOH

SELECT * FROM  Sales.SalesOrderHeader SOH(NOLOCK)


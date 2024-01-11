--Raiserror permite lanzar excepciones personalizadas.
BEGIN TRY
	INSERT INTO Sales.SalesPerson
	VALUES (270,20,100,200,0,25000,200000,NEWID(),GETDATE())
END TRY
BEGIN CATCH
	RAISERROR('Error al Insertar una venta', 16, 1)
END CATCH
CREATE PROCEDURE SEL_ProductsOutput(@orden char(1), @out varchar(MAX) OUTPUT)
AS
	DECLARE @script nvarchar(4000)
	DECLARE @orderby nvarchar(500)

	SET @script = 'SELECT productID, name, listprice FROM Production.Product WHERE listprice > 0'
	SET @orderby = (CASE WHEN @orden = 'N' THEN 'ORDER BY name'
						WHEN @orden = 'I' THEN 'ORDER BY productID'
						WHEN @orden = 'P' THEN 'ORDER BY listprice'	
					END)

	SET @out = @script + @orderby



--Ejecución del procedure
DECLARE @out nvarchar(MAX)
EXEC SEL_ProductsOutput 'I', @out OUTPUT
EXEC SP_EXECUTESQL @out
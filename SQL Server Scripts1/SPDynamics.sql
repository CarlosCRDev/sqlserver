CREATE PROCEDURE SEL_Products(@orden char(1))
AS
	DECLARE @script nvarchar(4000)
	DECLARE @orderby nvarchar(500)

	SET @script = 'SELECT productID, name, listprice FROM Production.Product WHERE listprice > 0'
	SET @orderby = (CASE WHEN @orden = 'N' THEN 'ORDER BY name'
						WHEN @orden = 'I' THEN 'ORDER BY productID'
						WHEN @orden = 'P' THEN 'ORDER BY listprice'	
					END)

	SET @script = @script + @orderby

	EXEC SP_EXECUTESQL @script

--Ejecución del procedure
EXEC SEL_Products 'P'
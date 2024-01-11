--Mensajes personalizados almacenados en SQL
sp_addmessage 50001, 16, 'Ocurrió un error de FK en la tabla sales.salesperson'
--Borrar mensajes personalizados de sql
sp_dropmessage 50001
--Agregamos un mensaje que permita recibir un argumento con apoyo del comodin %
sp_addmessage 50001, 16, 'Ocurrió un error de FK en la %s'

--Raiserror permite lanzar excepciones personalizadas.
BEGIN TRY
	SET NOCOUNT ON --quita la leyenda del número de líneas afectadas
	--esta línea devuelve el error número 547
	INSERT INTO Sales.SalesPerson
	VALUES (270,20,100,200,0,25000,200000,NEWID(),GETDATE())
	--NewID genera un id alfanumerico dinámico
END TRY
BEGIN CATCH
	--Devuelve este error "Msg 50000, Level 16, State 1, Line 7  --Error al Insertar una venta "
	--RAISERROR('Error al Insertar una venta', 16, 1)

	--Probando el mensaje personalizado que se creo
	--RAISERROR(50001, -1, 4)

	--Validamos el error que se genera al ejecutar la sentencia que se encuentra en el try
	IF @@ERROR = 547
		--podemos utilizar cualquier error, utilizaremos uno que pasa parametros
		RAISERROR(50001, -1, 4, 'sales.salesperson')
	ELSE
		RAISERROR('(0) Error inesperado', 16, 4)	
END CATCH
SELECT * FROM HumanResources.EmployeeList

CREATE TABLE HumanResources.EmployeeList(NationalIdNumber varchar(10), JobTitle varchar(100))

DECLARE @NationalIdNumber varchar(10), @JobTitle varchar(100)
DECLARE miCursor CURSOR FAST_FORWARD FOR
	SELECT NationalIdNumber, jobTitle FROM HumanResources.Employee
	WHERE Gender='M'

OPEN miCursor

FETCH NEXT FROM miCursor
INTO @NationalIdNumber, @JobTitle

--Validamos de que no haya llegado al final de la tabla con el status en 0
WHILE @@FETCH_STATUS = 0
BEGIN
	INSERT INTO HumanResources.EmployeeList VALUES(@NationalIdNumber, @JobTitle)
	FETCH NEXT FROM miCursor
	INTO @NationalIdNumber, @JobTitle
END
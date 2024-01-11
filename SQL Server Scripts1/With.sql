/*
UPDATE Person.Person SET Suffix = e.NationalIdNumber
FROM Person.Person p
INNER JOIN HumanResources.Employee e
ON e.BusinessEntityID = p.BusinessEntityID
WHERE e.JobTitle = 'Sales Representative'
*/

--Sustituimos la clausula anterior con la clausula WITH  por el tiempo de espera para la ejecución
--Almacena el resultado de la consulta en la tabla temporal employee
WITH employee AS(
	SELECT BusinessEntityID, NationalIDNumber
	FROM HumanResources.Employee e
	WHERE e.JobTitle = 'Sales Representative'
)

UPDATE Person.Person SET Suffix = e.NationalIdNumber
FROM Person.Person p
INNER JOIN employee e
ON e.BusinessEntityID = p.BusinessEntityID

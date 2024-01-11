BEGIN TRAN

	UPDATE Person.Person SET Suffix = e.NationalIdNumber
	FROM Person.Person p
	INNER JOIN HumanResources.Employee e
	ON e.BusinessEntityID = p.BusinessEntityID
	WHERE e.JobTitle = 'Sales Representative'

	WAITFOR DELAY '00:00:10'

ROLLBACK TRAN
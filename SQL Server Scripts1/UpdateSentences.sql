Create table personaEjemplo(
	firstName varChar(50),
	lastName varChar(50)
	)

--INSERT INTO

insert into personaEjemplo
	select firstName, lastName from Person.Person

Select * from personaEjemplo

--UPDATE INNER JOIN
Update Person.Person set Suffix = e.NationalIDNumber
From Person.Person p
Inner Join HumanResources.Employee e 
On e.BusinessEntityID = p.BusinessEntityID
Where e.JobTitle = 'Sales Representative'


Select p.Suffix, e.NationalIDNumber
From Person.Person p
Inner Join HumanResources.Employee e 
On e.BusinessEntityID = p.BusinessEntityID
Where e.JobTitle = 'Sales Representative'

--DELETE INNER JOIN
Delete e 
from Person.EmailAddress e
inner join Person.BusinessEntity b
on e.BusinessEntityID = b.BusinessEntityID
inner join HumanResources.Employee h
on h.BusinessEntityID = b.BusinessEntityID
where h.JobTitle = 'Tool designer'


Select *
from Person.EmailAddress e
inner join Person.BusinessEntity b
on e.BusinessEntityID = b.BusinessEntityID
inner join HumanResources.Employee h
on h.BusinessEntityID = b.BusinessEntityID
where h.JobTitle = 'Tool designer'

--SELECT INTO
--Crear tablas con la misma estructura de una tabla principal
Select * Into emailBackup
From Person.EmailAddress
Where 1=0

--Crear tabla y contenido desde una tabla principal
Select * Into person.personCopia
From person.Person

Select * From person.personCopia

--Copiar una tabla desde una bd hasta otra bd
Select * Into CentroMedico..personAddr
From person.Address

--Obtener datos desde una bd diferente
Select * From CentroMedico..personPhone

--Crear una tabla con campo identity
Select IDENTITY(int,1,1) as id, * Into CentroMedico..personPhone
From Person.PersonPhone
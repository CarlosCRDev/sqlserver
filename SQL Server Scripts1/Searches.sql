
--Busquedas
Select * 
From Person.person P
Inner Join Person.EmailAddress E
On E.BusinessEntityID = P.BusinessEntityID

-- Debuelve todos los registros de la tabla person y los que coindicen en ambas tablas
Select * 
From Person.person P
Left Join Person.EmailAddress E
On E.BusinessEntityID = P.BusinessEntityID

--Filtrando aquellos registros que no tienen ninguna coincidencia
Select * 
From Person.person P
Left Join Person.EmailAddress E
On E.BusinessEntityID = P.BusinessEntityID
Where ISNULL(E.BusinessEntityId,'') = ''
And ISNULL (p.Title, '') = ''

--Uso del case dentro de where
declare @nombre char(30)
set @nombre = null

Select *
From Person.Person
--Where FirstName = @nombre
Where FirstName = (Case When ISNULL(@nombre,'') <> '' Then @nombre
						Else FirstName
					End)
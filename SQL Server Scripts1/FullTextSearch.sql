--Contains
--Busqueda con mas de una palabra, usar comilla doble.

SELECT * 
FROM Person.Address A
WHERE CONTAINS(A.AddressLine1, '"first avenue"')

--Comtains/and/not/or

SELECT *
FROM Person.Address A
WHERE CONTAINS(A.AddressLine1, 'avenue AND port AND NOT 34')

SELECT *
FROM Person.Address A
WHERE CONTAINS(A.AddressLine1, 'avenue OR port AND NOT 34')

--Contains NEAR
SELECT *
FROM Person.Address A
WHERE CONTAINS(A.AddressLine1, '"5415 san" NEAR dr')

SELECT *
FROM Person.Address A
WHERE CONTAINS(A.AddressLine1, 'NEAR((21,centrale), 6)')

SELECT *
FROM Person.Address A --order by len(AddressLine1) desc
WHERE CONTAINS(A.AddressLine1, 'NEAR((Hilton,25),8)')

--FORMSOF INFLECTIONAL (sustantivos)
SELECT *
FROM Person.Address A
WHERE CONTAINS(A.AddressLine1, 'FORMSOF(INFLECTIONAL,"avenues")')

--FORMSOF INFLECTIONAL (verbos, sin importar el tiempo verbal)
 select * from person.Address where AddressID=8
 update Person.Address set AddressLine1='6387 Scenic Avenue hacer' where AddressID=8

 --3082 es el codigo de la localidad de españa
 SELECT *
FROM Person.Address A
WHERE CONTAINS(A.AddressLine1, 'FORMSOF(INFLECTIONAL,"hagamos")', LANGUAGE 3082)

--Obtener los tiempos verbales de un verbo
SELECT display_term
FROM SYS.DM_FTS_PARSER('FORMSOF(INFLECTIONAL,trabajo)',3082,0,0)

--FREETEXT
SELECT *
FROM Person.Address A
WHERE FREETEXT(A.AddressLine1,'"99828 Routh avenue"')

--POPULATION de una tabla
ALTER FULLTEXT INDEX ON Person.Address START FULL POPULATION
--Modificar la propiedad change tracking a automatico del full text index
ALTER FULLTEXT INDEX ON Person.Address START UPDATE POPULATION

--Actualización de catalogos
--Database
	--Storage
		--Full text catalogs
			--Click derecho en el catalogo
				--Properties
					--Population Schedule
						--New
							--Name, periodicidad (recurring), frecuencia (daily), cada que tiempo, duración, 
								--OK

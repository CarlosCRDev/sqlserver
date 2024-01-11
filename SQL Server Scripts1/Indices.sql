--Limpiar caché y buffer de la memoria de SQL

DBCC FREEPROCCACHE WITH NO_INFOMSGS
DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS

SELECT * 
FROM [Person].[Contact]
WHERE Email = 'magna.phasellus@aol.com'

CREATE CLUSTERED INDEX IX_Contact_Email
ON [Person].[Contact](Email)
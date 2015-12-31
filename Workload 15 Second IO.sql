/* Workload for 15 Second I/O Error */ 

--How can I get I/O to last 15 seconds? 
USE AdventureWorks2014;
GO 

/*nope 
BEGIN TRANSACTION 

SELECT *
FROM Person.Person; 

WAITFOR DELAY '00:00:15'

COMMIT TRANSACTION
*/ 
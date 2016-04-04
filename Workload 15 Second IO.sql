/* Workload for 15 Second I/O Error */ 

--How can I get I/O to last 15 seconds? 

/*nope 
USE AdventureWorks2014;
GO 

BEGIN TRANSACTION 

SELECT *
FROM Person.Person; 

WAITFOR DELAY '00:00:15'

COMMIT TRANSACTION
*/ 

USE AdventureWorks2012;
GO 

SELECT *
FROM bigProduct; 

SELECT *
FROM bigTransactionHistory; 

--Still got nothin' 
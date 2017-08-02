/* Workload for Capture Function Executions */ 

USE AdventureWorks2014;
GO 

/* Create function */
CREATE FUNCTION [dbo].[ParseLastName](@LastName VARCHAR(50))
RETURNS VARCHAR(5)
AS
-- Returns the 5 left characters of the last name
BEGIN
DECLARE @ret VARCHAR(5);
SET @ret =
LEFT(@LastName, 5)
RETURN @ret
END;

/* Simple query */
SELECT LastName
FROM Person.Person;

/* Slightly more work */
SELECT LastName, LEFT(LastName, 5)
FROM Person.Person;

/* Now with a function */ 
SELECT LastName, dbo.ParseLastName(LastName)
FROM Person.Person;
--Stop live data feed. Group by name, statement. 
--SELECT statement executed ___ times 
--FUNCTION executed ___ times 
USE AdventureWorks2016;
GO 

create table #temptable
(ID int);
GO 

CREATE TABLE ##Temp2
(ID INT IDENTITY, 
Blah VARCHAR(25)); 
GO

DECLARE @Table1 AS TABLE 
	(ID INT IDENTITY, 
	Blah VARCHAR(25), 
	Various VARCHAR(10));
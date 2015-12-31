/* Workload for Capture Deadlock Graphs */ 

USE AdventureWorks2014;
GO

-- step 1: open new query window (window 1) and run only the following 3 lines
begin transaction
update [Person].[Address]
set AddressLine1='aaa' where AddressID=1

-- step 2: open new query window (window 2) and run only the following 5 lines
begin transaction
update [AdventureWorks].[Person].[Address]
set AddressLine1='bbb' where AddressID=2
update [AdventureWorks].[Person].[Address]
set AddressLine1='aaa' where AddressID=1

-- step 3: go back to your first query window (window 1) and run the following 2 line
update [Person].[Address]
set AddressLine1='bbb' where AddressID=2

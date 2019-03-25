/* Workload for Capture Deadlock Graphs */ 

USE AdventureWorks2016;
GO

-- step 1: open new query window (window 1) and run only the following 3 lines
BEGIN TRANSACTION
UPDATE [Person].[Address]
SET AddressLine1='aaa' WHERE AddressID=1

-- step 2: open new query window (window 2) and run only the following 5 lines
BEGIN TRANSACTION
UPDATE [Person].[Address]
SET AddressLine1='bbb' WHERE AddressID=2
UPDATE [Person].[Address]
SET AddressLine1='aaa' WHERE AddressID=1

-- step 3: go back to your first query window (window 1) and run the following 2 line
UPDATE [Person].[Address]
SET AddressLine1='bbb' WHERE AddressID=2

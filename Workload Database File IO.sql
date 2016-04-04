/* Workload for Database File I/O */

USE AdventureWorks2012;
GO 

/* DANGER, WILL ROBINSON */
DBCC DROPCLEANBUFFERS; 

SELECT SOH.CustomerID, SOD.ProductID, SUM(SOD.OrderQty) AS Total_Qty, SUM(SOD.UnitPrice) AS Total_Price, SUM(SOD.UnitPriceDiscount) AS Total_Discount 
FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID = SOH.SalesOrderID
GROUP BY SOH.CustomerID, SOD.ProductID;

SELECT P.FirstName + ' ' + P.LastName AS SalesPerson, SP.SalesQuota, SP.SalesYTD, SP.SalesLastYear, SP.SalesYTD - SP.SalesLastYear AS YearDiff, SP.Bonus, ST.Name AS Territory
FROM Sales.SalesPerson SP 
	INNER JOIN Person.Person P ON P.BusinessEntityID = SP.BusinessEntityID 
	INNER JOIN Sales.SalesTerritory ST ON ST.TerritoryID = SP.TerritoryID; 

CREATE TABLE TestForFileIO 
	(ID INT IDENTITY, 
	Superhero VARCHAR(25), 
	PlanetOfOrigin VARCHAR(25)); 
INSERT INTO TestForFileIO 
VALUES ('Wonder Woman', 'Paradise Island'), ('Superman', 'Krypton'), ('Batman', 'Earth');

DELETE FROM TestForFileIO 
WHERE Superhero = 'Batman';

--Cleanup 
DROP TABLE TestForFileIO; 


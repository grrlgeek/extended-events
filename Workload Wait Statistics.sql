/* Workload for Wait Statistics */

USE AdventureWorks2012;
GO 

--Read 
SELECT P.ProductNumber, P.Name, PS.Name AS SubcategoryName, PC.Name AS CategoryName
FROM Production.Product P 
	INNER JOIN Production.ProductSubcategory PS ON PS.ProductSubcategoryID = P.ProductSubcategoryID 
	INNER JOIN Production.ProductCategory PC ON PC.ProductCategoryID = PS.ProductCategoryID

--Write 
CREATE TABLE TestForWaitStats 
	(ID INT IDENTITY, 
	Superhero VARCHAR(25), 
	PlanetOfOrigin VARCHAR(25)); 
INSERT INTO TestForWaitStats 
VALUES ('Wonder Woman', 'Paradise Island'), ('Superman', 'Krypton'), ('Batman', 'Earth');

DELETE FROM TestForWaitStats 
WHERE Superhero = 'Batman';

--tempdb 
CREATE TABLE #BigTempTable 
	(Value INT); 
DECLARE @Number INT = 1; 
WHILE @Number < 1000
	BEGIN 
	INSERT INTO #BigTempTable VALUES (@Number); 
	SET @Number = @Number + 1 
	END 
SELECT *
FROM #BigTempTable; 

--More 
SELECT P.FirstName + ' ' + P.LastName AS SalesPerson, SP.SalesQuota, SP.SalesYTD, SP.SalesLastYear, SP.SalesYTD - SP.SalesLastYear AS YearDiff, SP.Bonus, ST.Name AS Territory
FROM Sales.SalesPerson SP 
	INNER JOIN Person.Person P ON P.BusinessEntityID = SP.BusinessEntityID 
	INNER JOIN Sales.SalesTerritory ST ON ST.TerritoryID = SP.TerritoryID; 

--Cleanup 
DROP TABLE TestForWaitStats; 
DROP TABLE #BigTempTable; 
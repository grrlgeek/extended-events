/* Demo XE causality tracking on nested stored procedures */ 

USE AdventureWorks2016; 
GO 

--Queries to use: 
--Product catalog info 
	SELECT ProductID, Name, DaysToManufacture 
	FROM Production.Product
	WHERE ProductID = @ProductID 

--Product inventory info 
	SELECT PINV.ProductID, P.Name, P.ReorderPoint, SUM(PINV.Quantity) AS InStockQty 
	FROM Production.ProductInventory PINV
		INNER JOIN Production.Product P ON P.ProductID = PINV.ProductID 
	WHERE PINV.ProductID = @ProductID 
	GROUP BY PINV.ProductID, P.Name, P.ReorderPoint

--Create procs 
CREATE PROCEDURE ProductInfo (@ProductID INT) 
AS 
SELECT ProductID, Name, DaysToManufacture 
FROM Production.Product
WHERE ProductID = @ProductID  
; 
GO 

CREATE PROCEDURE ProductInventory (@ProductID INT) 
AS 
SELECT PINV.ProductID, P.Name, P.ReorderPoint, SUM(PINV.Quantity) AS InStockQty 
FROM Production.ProductInventory PINV
	INNER JOIN Production.Product P ON P.ProductID = PINV.ProductID 
WHERE PINV.ProductID = @ProductID 
GROUP BY PINV.ProductID, P.Name, P.ReorderPoint
; 
GO 

CREATE PROCEDURE ProductReorderInfo (@ProductID INT) 
AS 
EXEC ProductInfo @ProductID

EXEC ProductInventory @ProductID
; 
GO 

EXEC ProductReorderInfo @ProductID = 1

EXEC ProductReorderInfo @ProductID = 700 

EXEC ProductReorderInfo @ProductID = 925 



--Cleanup 
DROP PROCEDURE ProductInfo;
GO 

DROP PROCEDURE ProductInventory; 
GO 

DROP PROCEDURE ProductReorderInfo; 
GO 

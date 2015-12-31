/* Workload for 'Capture queries and resources' */

USE AdventureWorks2014;
GO 

EXEC [dbo].[uspGetManagerEmployees] 5 ;

SELECT SOH.SalesOrderID, SOH.OrderDate, SOD.ProductID, SOD.OrderQty, SOD.UnitPrice, SOD.UnitPriceDiscount
FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID = SOH.SalesOrderID;

EXEC [dbo].[uspGetManagerEmployees] 44

SELECT SOH.SalesOrderID, SOH.OrderDate, SOD.ProductID, SOD.OrderQty, SOD.UnitPrice, SOD.UnitPriceDiscount
FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID = SOH.SalesOrderID 
WHERE SOD.ProductID = 756;


EXEC [dbo].[uspGetManagerEmployees] 55 

SELECT SOD.ProductID, SUM(SOD.OrderQty) AS Total_Qty, SUM(SOD.UnitPrice) AS Total_Price, SUM(SOD.UnitPriceDiscount) AS Total_Discount 
FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID = SOH.SalesOrderID
GROUP BY SOD.ProductID;

SELECT SOH.CustomerID, SOD.ProductID, SUM(SOD.OrderQty) AS Total_Qty, SUM(SOD.UnitPrice) AS Total_Price, SUM(SOD.UnitPriceDiscount) AS Total_Discount 
FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID = SOH.SalesOrderID
GROUP BY SOH.CustomerID, SOD.ProductID;

/* Workload for Capture execution plan */

USE AdventureWorks2014;
GO 

SELECT  [p].[Name],
        [p].[ProductNumber],
        [ph].[ListPrice]
FROM    [Production].[Product] p
        INNER JOIN [Production].[ProductListPriceHistory] ph 
ON [p].[ProductID] = ph.[ProductID]
         AND ph.[StartDate] = ( SELECT TOP ( 1 ) [ph2].[StartDate]
             FROM     [Production].[ProductListPriceHistory] ph2
             WHERE    [ph2].[ProductID] = [p].[ProductID]
             ORDER BY [ph2].[StartDate] DESC
                               ); 


SELECT  *
FROM    [Sales].[vIndividualCustomer]
WHERE   [BusinessEntityID] = 1721 ;
/* Capture Parameters - workload */

/* Execute a stored proc several times, with different parameters */ 
USE AdventureWorks2012;
GO 

exec uspGetBillOfMaterials @StartProductID = 723, @CheckDate = '2009/01/01';
GO 

exec uspGetBillOfMaterials @StartProductID = 826, @CheckDate = '2009/01/01';
GO 

exec uspGetBillOfMaterials @StartProductID = 963, @CheckDate = '2009/01/01';
GO 

/* Review the XE output */ 
/* Pay attention to batch_text column */ 
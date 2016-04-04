/* Workload for Page Splits */

USE AdventureWorks2012;
GO 

CREATE TABLE TestForPageSplits 
	(ID UNIQUEIDENTIFIER, 
	Value VARCHAR(25)); 

CREATE CLUSTERED INDEX CX_PageSplits_GUID ON TestForPageSplits (ID); 

INSERT INTO TestForPageSplits 
VALUES (NEWID(), 'Blah');
GO 5000 

SELECT *
FROM TestForPageSplits; 
--49 pages 

--View target data; close  

UPDATE TestForPageSplits 
SET Value = 'BlahBlahBlahBlahBlah'; 

--Reopen View live data; add add'l columns; save view 

SELECT 
    s.Name AS SchemaName,
    t.NAME AS TableName,
    p.rows AS RowCounts, 
	SUM(a.total_pages) AS TotalPages, 
    SUM(a.total_pages) * 8 AS TotalSpaceKB, 
    SUM(a.used_pages) * 8 AS UsedSpaceKB, 
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB
FROM sys.tables t
	INNER JOIN  sys.schemas s ON s.schema_id = t.schema_id
	INNER JOIN sys.indexes i ON t.OBJECT_ID = i.object_id
	INNER JOIN sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
	INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id
WHERE t.NAME = 'TestForPageSplits'
GROUP BY t.Name, s.Name, p.Rows
ORDER BY s.Name, t.Name; 
--65 pages 

INSERT INTO TestForPageSplits 
VALUES (NEWID(), 'Blah');
GO 500
--65 pages 

--Reopen View target data 

--Now query to get useful info 
--Which file? 
SELECT *
FROM sys.database_files 
WHERE file_id = 1;

--What other questions need to be answered? 

--Cleanup 
DROP TABLE TestForPageSplits; 

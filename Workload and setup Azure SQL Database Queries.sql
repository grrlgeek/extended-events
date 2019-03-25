/* Set up storage for Azure SQL Database Extended Events file target */

--Create storage account (Portal or PowerShell) 
--extendedeventsfiles.blob.core.windows.net

--Create blob (Portal or PowerShell) 
--files

--Generate SAS token (Portal or PowerShell) 
--Portal > Settings > Shared access signatures > Generate SAS and connection string 

--Create key and credential 
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Th!sIsMyStr@ngP@ssw0rd'
 
CREATE DATABASE SCOPED CREDENTIAL
        [https://extendedeventsfiles.blob.core.windows.net/files]
    WITH
        IDENTITY = 'SHARED ACCESS SIGNATURE',  -- "SAS" token.
        -- Paste in the long SasToken here for Secret BUT AFTER the ? only
        SECRET = 'sv=2018-03-28&ss=bfqt&srt=sco&sp=rwdlacup&se=2019-04-26T03:12:11Z&st=2019-03-25T19:12:11Z&spr=https&sig=DCbtpjOt8KiNp3goUmOkYYOFSR9vjwEzwrHYFmd7eDw%3D'
    ;
GO

--Add to XE session TARGET 
/* 
ADD TARGET
        package0.event_file
            (
 
            SET filename =
                'https://extendedeventsfiles.blob.core.windows.net/files/code.xel'
            )
*/

-----------------------------------------------------------------------------------------------------------

/* Workload sample */

SELECT *
FROM SalesLT.Address; 

SELECT *
FROM SalesLT.SalesOrderHeader; 

--Try to right-click and view 

--Open Azure Storage Explorer 

--Download file(s) 

--Open in SSMS 
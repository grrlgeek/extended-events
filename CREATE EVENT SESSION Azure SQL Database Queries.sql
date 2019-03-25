CREATE EVENT SESSION [Azure SQL Database Queries] ON DATABASE 
ADD EVENT sqlserver.sql_statement_completed(SET collect_statement=(1)
    ACTION(sqlserver.database_name,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.sql_text))
ADD TARGET package0.event_file(SET filename=N'https://extendedeventsfiles.blob.core.windows.net/files/AzureSQLDBQueries.xel')
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO


/* Clean up */ 
ALTER EVENT SESSION [Azure SQL Database Queries] ON DATABASE 
STATE = STOP;

DROP EVENT SESSION [Azure SQL Database Queries] ON DATABASE 
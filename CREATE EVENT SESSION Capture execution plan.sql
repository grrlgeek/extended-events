CREATE EVENT SESSION [Capture execution plan] ON SERVER 
ADD EVENT sqlserver.query_post_execution_showplan(SET collect_database_name=(1)
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.nt_username,sqlserver.plan_handle,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.sql_text)
    WHERE ([sqlserver].[equal_i_sql_unicode_string]([database_name],N'AdventureWorks2014')))
ADD TARGET package0.event_file(SET filename=N'Capture execution plan',max_rollover_files=(0))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO

ALTER EVENT SESSION [Capture execution plan] ON SERVER 
STATE = START;

ALTER EVENT SESSION [Capture execution plan] ON SERVER 
STATE = STOP; 

DROP EVENT SESSION [Capture execution plan] ON SERVER; 
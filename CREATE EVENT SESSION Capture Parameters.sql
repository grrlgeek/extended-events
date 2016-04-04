/* Capture parameters passed to stored procedure */ 

--Grant's 
CREATE EVENT SESSION [Filtered Event] ON SERVER 
ADD EVENT sqlserver.sql_batch_completed(SET collect_batch_text=(1)
    WHERE ([sqlserver].[equal_i_sql_unicode_string]([sqlserver].[database_name],N'AdventureWorks2014') AND [sqlserver].[like_i_sql_unicode_string]([batch_text],N'%uspGetBillOfMaterials%') AND [sqlserver].[like_i_sql_unicode_string]([batch_text],N'%@StartProductID = 723%')))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO

/* Set up session that ues sql_batch_completed & rpc_completed */
CREATE EVENT SESSION [Capture Parameters] ON SERVER 
ADD EVENT sqlserver.rpc_completed(SET collect_output_parameters=(1),collect_statement=(1)
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.sql_text)
    WHERE ([sqlserver].[database_id]=(5))),
ADD EVENT sqlserver.sql_batch_completed(
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.sql_text)
    WHERE ([sqlserver].[database_id]=(5))) 
ADD TARGET package0.event_file(SET filename=N'Capture Parameters',max_rollover_files=(0))
WITH (STARTUP_STATE=OFF)
GO

ALTER EVENT SESSION [Capture Parameters] ON SERVER 
STATE = START; 

/* Clean up */ 
ALTER EVENT SESSION [Capture Parameters] ON SERVER 
STATE = STOP;

DROP EVENT SESSION [Capture Parameters] ON SERVER; 
CREATE EVENT SESSION [Capture queries and resources] ON SERVER 
ADD EVENT sqlserver.rpc_completed(SET collect_statement=(1)
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.session_id)
    WHERE (([package0].[greater_than_uint64]([sqlserver].[database_id],(4))) AND ([package0].[equal_boolean]([sqlserver].[is_system],(0))))),
ADD EVENT sqlserver.sp_statement_completed(SET collect_object_name=(1)
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.session_id)
    WHERE (([package0].[greater_than_uint64]([sqlserver].[database_id],(4))) AND ([package0].[equal_boolean]([sqlserver].[is_system],(0))))),
ADD EVENT sqlserver.sql_batch_completed(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.session_id)
    WHERE (([package0].[greater_than_uint64]([sqlserver].[database_id],(4))) AND ([package0].[equal_boolean]([sqlserver].[is_system],(0))))),
ADD EVENT sqlserver.sql_statement_completed(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.session_id)
    WHERE (([package0].[greater_than_uint64]([sqlserver].[database_id],(4))) AND ([package0].[equal_boolean]([sqlserver].[is_system],(0))))) 
ADD TARGET package0.event_file(SET filename=N'Capture queries and resources',max_rollover_files=(0)),
ADD TARGET package0.ring_buffer(SET max_memory=(1048576))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=ON,STARTUP_STATE=OFF)
GO

ALTER EVENT SESSION [Capture queries and resources] ON SERVER 
STATE = START; 

ALTER EVENT SESSION [Capture queries and resources] ON SERVER 
STATE = STOP; 

DROP EVENT SESSION [Capture queries and resources] ON SERVER; 
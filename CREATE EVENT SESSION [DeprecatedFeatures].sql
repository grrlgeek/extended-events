/* This session will track usage of deprecated features. */ 

CREATE EVENT SESSION [DeprecatedFeatures] ON SERVER 
ADD EVENT sqlserver.deprecation_announcement(
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.session_id,sqlserver.sql_text)
    WHERE ([sqlserver].[is_system]=(0))),
ADD EVENT sqlserver.deprecation_final_support(
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.session_id,sqlserver.sql_text)
    WHERE ([sqlserver].[is_system]=(0)))
ADD TARGET package0.event_file(SET filename=N'DeprecatedFeatures',max_rollover_files=(0))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO


ALTER EVENT SESSION [DeprecatedFeatures] ON SERVER 
STATE = START; 

ALTER EVENT SESSION [DeprecatedFeatures] ON SERVER 
STATE = STOP;

DROP EVENT SESSION [DeprecatedFeatures] ON SERVER; 
CREATE EVENT SESSION [Causality Tracking - Nested Stored Procedures] ON SERVER 
ADD EVENT sqlserver.sp_statement_completed(
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.nt_username,sqlserver.session_id,sqlserver.sql_text)
    WHERE ([sqlserver].[is_system]=(0))),
ADD EVENT sqlserver.sql_statement_completed(SET collect_statement=(1)
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.nt_username,sqlserver.session_id,sqlserver.sql_text)
    WHERE ([sqlserver].[is_system]=(0)))
ADD TARGET package0.event_file(SET filename=N'Nested Stored Procedures',max_file_size=(128))
WITH (
MAX_MEMORY=4096 KB,
EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,
MAX_DISPATCH_LATENCY=30 SECONDS,
MAX_EVENT_SIZE=0 KB,
MEMORY_PARTITION_MODE=NONE,
TRACK_CAUSALITY=ON, --> This is the magic keyword 
STARTUP_STATE=OFF)
GO


ALTER EVENT SESSION [Causality Tracking - Nested Stored Procedures] ON SERVER 
STATE = START; 

ALTER EVENT SESSION [Causality Tracking - Nested Stored Procedures] ON SERVER 
STATE = STOP; 

DROP EVENT SESSION [Causality Tracking - Nested Stored Procedures] ON SERVER; 



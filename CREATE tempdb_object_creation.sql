/* This session will track all temp tables created in tempdb. */

CREATE EVENT SESSION [tempdb_object_creation] ON SERVER 
ADD EVENT sqlserver.object_created(SET collect_database_name=(1)
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.client_pid,sqlserver.database_id,sqlserver.database_name,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text)
    WHERE ([database_id]=(2) AND [sqlserver].[is_system]=(0)))
ADD TARGET package0.event_file(SET filename=N'tempdb_object_creation',max_file_size=(128),max_rollover_files=(4))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO

ALTER EVENT SESSION [tempdb_object_creation] ON SERVER 
STATE = START; 

ALTER EVENT SESSION [tempdb_object_creation] ON SERVER 
STATE = STOP;

DROP EVENT SESSION [tempdb_object_creation] ON SERVER; 
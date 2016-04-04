CREATE EVENT SESSION [15SecondIOError] ON SERVER 
ADD EVENT sqlserver.file_read_completed(SET collect_io_data=(1),collect_path=(1)
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.sql_text)
    WHERE ([duration]>(15000))),
ADD EVENT sqlserver.file_write_completed(SET collect_path=(1)
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.sql_text)
    WHERE ([duration]>(15000))) 
ADD TARGET package0.event_file(SET filename=N'15SecondIOError')
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=ON)
GO

ALTER EVENT SESSION [15SecondIOError] ON SERVER 
STATE = START; 

ALTER EVENT SESSION [15SecondIOError] ON SERVER 
STATE = STOP;

DROP EVENT SESSION [15SecondIOError] ON SERVER; 
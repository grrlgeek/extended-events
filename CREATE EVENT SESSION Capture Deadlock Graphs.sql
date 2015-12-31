CREATE EVENT SESSION [Capture Deadlock Graphs] ON SERVER 
ADD EVENT sqlserver.database_xml_deadlock_report(
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.plan_handle,sqlserver.sql_text)),
ADD EVENT sqlserver.xml_deadlock_report(
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.plan_handle,sqlserver.sql_text)) 
ADD TARGET package0.event_file(SET filename=N'Capture Deadlock Graphs')
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=ON)
GO

ALTER EVENT SESSION [Capture Deadlock Graphs] ON SERVER 
STATE = START;

ALTER EVENT SESSION [Capture Deadlock Graphs] ON SERVER 
STATE = STOP;

DROP EVENT SESSION [Capture Deadlock Graphs] ON SERVER; 
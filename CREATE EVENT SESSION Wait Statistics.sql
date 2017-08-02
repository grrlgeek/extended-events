CREATE EVENT SESSION [Wait Statistics] ON SERVER 
ADD EVENT sqlos.wait_completed(SET collect_wait_resource=(1)
    ACTION(sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id)
    WHERE ([package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[not_equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlos.wait_info(
    ACTION(sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id)
    WHERE ([package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[not_equal_boolean]([sqlserver].[is_system],(0)))),
ADD EVENT sqlos.wait_info_external(
    ACTION(sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id)
    WHERE ([package0].[greater_than_uint64]([sqlserver].[database_id],(4)) AND [package0].[not_equal_boolean]([sqlserver].[is_system],(0))))
ADD TARGET package0.ring_buffer(SET max_memory=(102400))
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO

ALTER EVENT SESSION [Wait Statistics] ON SERVER 
STATE = START;

ALTER EVENT SESSION [Wait Statistics] ON SERVER 
STATE = STOP;

DROP EVENT SESSION [Wait Statistics] ON SERVER; 
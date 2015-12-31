CREATE EVENT SESSION [Wait Statistics] ON SERVER 
ADD EVENT sqlos.wait_completed(SET collect_wait_resource=(1)
    ACTION(sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id)
    WHERE (([sqlserver].[database_id]>(5)) AND ([sqlserver].[is_system]<>(0)))),
ADD EVENT sqlos.wait_info(
    ACTION(sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id)
    WHERE (([sqlserver].[database_id]>(5)) AND ([sqlserver].[is_system]<>(0)))),
ADD EVENT sqlos.wait_info_external(
    ACTION(sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id)
    WHERE (([sqlserver].[database_id]>(5)) AND ([sqlserver].[is_system]<>(0)))) 
ADD TARGET package0.ring_buffer(SET max_memory=(102400))
GO

ALTER EVENT SESSION [Wait Statistics] ON SERVER 
STATE = START;

ALTER EVENT SESSION [Wait Statistics] ON SERVER 
STATE = STOP;

DROP EVENT SESSION [Wait Statistics] ON SERVER; 
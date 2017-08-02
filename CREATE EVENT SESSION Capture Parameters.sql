/* Capture parameters passed to stored procedure */ 


CREATE EVENT SESSION [Capture Parameters] ON SERVER 
ADD EVENT sqlserver.rpc_completed(SET collect_output_parameters=(1),collect_statement=(1)
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.sql_text)
    WHERE ([sqlserver].[database_id]>(4))),
ADD EVENT sqlserver.sql_batch_completed(
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.query_hash,sqlserver.query_plan_hash,sqlserver.sql_text)
    WHERE ([sqlserver].[database_id]>(4))) 
ADD TARGET package0.event_file(SET filename=N'Capture Parameters',max_rollover_files=(0))
WITH (STARTUP_STATE=OFF)
GO

ALTER EVENT SESSION [Capture Parameters] ON SERVER 
STATE = START; 

/* Clean up */ 
ALTER EVENT SESSION [Capture Parameters] ON SERVER 
STATE = STOP;

DROP EVENT SESSION [Capture Parameters] ON SERVER; 
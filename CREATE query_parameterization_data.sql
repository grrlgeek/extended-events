/* This session will capture events to find what queries may be causing forced parameterization to be recommended in Azure SQL Database. */

CREATE EVENT SESSION [query_parameterization_data] ON DATABASE 
ADD EVENT sqlserver.query_parameterization_data(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.compile_plan_guid,sqlserver.database_name,sqlserver.execution_plan_guid,sqlserver.plan_handle,sqlserver.query_hash,sqlserver.query_hash_signed,sqlserver.query_plan_hash,sqlserver.query_plan_hash_signed,sqlserver.session_id,sqlserver.sql_text,sqlserver.transaction_id))
ADD TARGET package0.ring_buffer
WITH (STARTUP_STATE=OFF)
GO


ALTER EVENT SESSION [query_parameterization_data] ON SERVER 
STATE = START; 

ALTER EVENT SESSION [query_parameterization_data] ON SERVER 
STATE = STOP;

DROP EVENT SESSION [query_parameterization_data] ON SERVER; 
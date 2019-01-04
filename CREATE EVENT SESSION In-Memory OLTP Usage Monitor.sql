/* This session will track creation of In-Memory OLTP objects. */

CREATE EVENT SESSION [In-Memory OLTP Usage Monitor] ON SERVER 
ADD EVENT sqlserver.after_natively_compiled_proc_entry_removal_on_drop(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text)),
ADD EVENT sqlserver.before_natively_compiled_proc_entry_removal_on_drop(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text)),
ADD EVENT sqlserver.natively_compiled_module_inefficiency_detected(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text)),
ADD EVENT sqlserver.natively_compiled_proc_execution_started(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text)),
ADD EVENT sqlserver.natively_compiled_proc_slow_parameter_passing(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text)),
ADD EVENT sqlserver.xtp_alter_table(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text)),
ADD EVENT sqlserver.xtp_create_procedure(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text)),
ADD EVENT sqlserver.xtp_create_table(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text)),
ADD EVENT sqlserver.xtp_database_deployed(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text)),
ADD EVENT sqlserver.xtp_database_undeployed(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text)),
ADD EVENT sqlserver.xtp_deploy_done(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text)),
ADD EVENT sqlserver.xtp_drop_table(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text)),
ADD EVENT sqlserver.xtp_table_created(
    ACTION(sqlserver.client_app_name,sqlserver.client_connection_id,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.is_system,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text))
ADD TARGET package0.event_counter,
ADD TARGET package0.event_file(SET filename=N'In-Memory OLTP Usage Monitor',max_file_size=(128),max_rollover_files=(8))
GO

ALTER EVENT SESSION [In-Memory OLTP Usage Monitor] ON SERVER 
STATE = START; 

ALTER EVENT SESSION [In-Memory OLTP Usage Monitor] ON SERVER 
STATE = STOP;

DROP EVENT SESSION [In-Memory OLTP Usage Monitor] ON SERVER; 



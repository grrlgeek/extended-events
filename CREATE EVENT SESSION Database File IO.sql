CREATE EVENT SESSION [Database File I/O] ON SERVER 
ADD EVENT sqlserver.file_read_completed(SET collect_io_data=(1),collect_path=(1)
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.plan_handle,sqlserver.sql_text)
    WHERE ([sqlserver].[database_id]>(5))),
ADD EVENT sqlserver.file_write_completed(SET collect_path=(1)
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.plan_handle,sqlserver.sql_text)
    WHERE ([sqlserver].[database_id]>(5))) 
ADD TARGET package0.event_counter,
ADD TARGET package0.histogram(SET filtering_event_name=N'sqlserver.file_read_completed',source=N'file_id',source_type=(0))
GO

ALTER EVENT SESSION [Database File I/O] ON SERVER 
STATE = START;

ALTER EVENT SESSION [Database File I/O] ON SERVER 
STATE = STOP;

DROP EVENT SESSION [Database File I/O] ON SERVER; 
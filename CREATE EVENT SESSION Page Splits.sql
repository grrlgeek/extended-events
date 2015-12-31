CREATE EVENT SESSION [Page Splits] ON SERVER 
ADD EVENT sqlserver.page_split(
    ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.sql_text)) 
ADD TARGET package0.event_file(SET filename=N'Page Splits',max_rollover_files=(0))
GO

ALTER EVENT SESSION [Page Splits] ON SERVER 
STATE = START; 

ALTER EVENT SESSION [Page Splits] ON SERVER 
STATE = STOP; 

DROP EVENT SESSION [Page Splits] ON SERVER; 
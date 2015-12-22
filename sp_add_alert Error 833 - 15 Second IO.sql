USE [msdb]
GO

/****** Object:  Alert [Error 833 - 15 Second I/O]    Script Date: 12/22/2015 9:17:10 AM ******/
EXEC msdb.dbo.sp_add_alert @name=N'Error 833 - 15 Second I/O', 
		@message_id=833, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=30, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'ce785e05-0a71-4fde-9453-fafddd6f3b7d'
GO



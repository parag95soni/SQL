Create Procedure sp_userdefined_db_backup
AS
Declare @dbname varchar(max)
Declare @sysdbname Table(sysdbname varchar(max))
insert into @sysdbname values('master'),('tempdb'),('model'),('msdb'),('DQS_MAIN'),('DQS_PROJECTS'),('DQS_STAGING_DATA'),('SSISDB')

Declare cursor_dbname Cursor
for 
	Select name 
	from sysdatabases
	where name not in (select sysdbname from @sysdbname);

open cursor_dbname

Fetch Next From cursor_dbname into @dbname

while @@FETCH_STATUS = 0
Begin
/*Insert List Validation and Execute Stored Procedure sp_db_backup to take the backup of every db int the server*/
	--Use [SQLTutorial]
	Print @dbname
	exec sp_db_backup @dbname
	Fetch Next From cursor_dbname into @dbname
End

Close cursor_dbname
Deallocate cursor_dbname


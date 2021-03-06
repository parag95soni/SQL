USE [SQLTutorial]
GO
/****** Object:  StoredProcedure [dbo].[sp_userdefined_db_restore]    Script Date: 01-05-2022 15:33:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[sp_userdefined_db_restore]
AS
Declare @dbname varchar(max)
DECLARE @Path nvarchar(500) = 'D:\dbbackup'
--Change the path 
DECLARE @FindFile TABLE  (FileNames nvarchar(500)  ,depth int  ,isFile int) 
INSERT INTO @FindFile EXEC xp_DirTree @Path,1,1

Declare cursor_dbname Cursor
for 
	Select Left(FileNames,CHARINDEX('_full',FileNames,0)-1) 
	from @FindFile 
	where isFile=1

open cursor_dbname

Fetch Next From cursor_dbname into @dbname

while @@FETCH_STATUS = 0
Begin
/*Insert List Validation and Execute Stored Procedure sp_db_backup to take the backup of every db int the server*/
	--Use [SQLTutorial]
	Print @dbname
	exec sp_db_restore @dbname
	Fetch Next From cursor_dbname into @dbname
End

Close cursor_dbname
Deallocate cursor_dbname

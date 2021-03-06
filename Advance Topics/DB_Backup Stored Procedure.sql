USE [SQLTutorial]
GO
/****** Object:  StoredProcedure [dbo].[sp_db_backup]    Script Date: 01-05-2022 10:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[sp_db_backup] @dbname varchar(max)
AS

Declare @path varchar(max)
Set @path = 'D:\dbbackup\'+@dbname+'_full_'+convert(varchar,getdate(),112)+'.bak'

Backup Database @dbname
To Disk = @path


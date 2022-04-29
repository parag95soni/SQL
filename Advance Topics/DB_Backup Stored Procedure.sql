USE [SQLTutorial]
GO
/****** Object:  StoredProcedure [dbo].[sp_db_backup]    Script Date: 30-04-2022 00:06:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[sp_db_backup] @dbname varchar(max)
AS

Declare @path varchar(max)
Set @path = 'D:\dbbackup\'+@dbname+'_full.bak'

Backup Database @dbname
To Disk = @path

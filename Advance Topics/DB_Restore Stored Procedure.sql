USE [SQLTutorial]
GO
/****** Object:  StoredProcedure [dbo].[sp_db_Restore]    Script Date: 01-05-2022 15:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[sp_db_Restore] @dbname varchar(max)
AS

Declare @path varchar(max)
Set @path = 'D:\dbbackup\'+@dbname+'_full_'+convert(varchar,getdate(),112)+'.bak'

Restore Database @dbname
From Disk = @path
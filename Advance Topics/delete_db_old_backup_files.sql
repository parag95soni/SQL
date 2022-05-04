USE [SQLTutorial]
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_old_backup_files]    Script Date: 04-05-2022 22:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[sp_delete_old_backup_files]
AS
DECLARE @DeleteDate DATETIME = DATEADD(day,-1,GETDATE());
DECLARE @path nvarchar(50) = 'D:\dbbackup\'
exec master.sys.xp_delete_file 0, @path,'bak', @DeleteDate, 0;

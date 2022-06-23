RESTORE DATABASE DatabaseName
FROM DISK = N'FilePathforBackup'
WITH REPLACE,
MOVE N'Database_LogicalName' TO N'FilePathforDatabase',  
MOVE N'Database_Log_LogicalName' TO N'FilePathforDatabaseLog';
GO
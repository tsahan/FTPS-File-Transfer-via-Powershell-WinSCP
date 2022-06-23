# FTPS File Transfer & Database Restore
- This script makes a copy of the daily backup of a remote database to a local folder on a server. 
- SQL Server Agent runs this PS script and then the T-SQL script to restore the backup on a daily schedule.
- If the script is executed directly from PowerShell, a file transfer progress bar will be displayed.

# Requirements
WinSCP .NET Assembly
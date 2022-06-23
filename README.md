# FASTER Database Restore
- This script makes a copy of the daily backup of FASTER database to D:\FASTER on cosb-reports. 
- Faster Database Restore job in the SQL Server Agent runs this PS script and then a T-SQL script to restore the backup on cosb-reports.
- If the script is executed directly from PowerShell, a file transfer progress bar will be displayed.

# Requirements
WinSCP .NET Assembly
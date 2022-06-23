param (
    $localPath = "",
    $remotePath = "",
    $fileName = ""
)

# Load WinSCP .NET assembly
Add-Type -Path "WinSCPnet.dll"
 
# Session.FileTransferProgress event handler
 
function FileTransferProgress
{
    param($e)

    Write-Progress `
        -Id 1 -Activity $e.FileName -Status ("{0:P0} complete:" -f $e.FileProgress) `
        -PercentComplete ($e.FileProgress * 100)
}
 
# Main script
 
$script:lastFileName = $Null
 
try
{   
    # Set up session options
    $sessionOptions = New-Object WinSCP.SessionOptions -Property @{
        Protocol = [WinSCP.Protocol]::Ftp
        HostName = ""
        UserName = ""
        Password = ""
        FtpSecure = [WinSCP.FtpSecure]::Implicit
    }

    $session = New-Object WinSCP.Session
    try
    {
        # Will continuously report progress of transfer
        $session.add_FileTransferProgress( { FileTransferProgress($_) } )
 
        # Connect
        $session.Open($sessionOptions)
 
        # Download the file and throw on any error
        $session.GetFiles(
            $remotePath,
            ($localPath + $fileName)).Check()
    }
    finally
    {
        # Terminate line after the last file (if any)
        if ($script:lastFileName -ne $Null)
        {
            Write-Host
        }
 
        # Disconnect, clean up
        $session.Dispose()
    }
 
    exit 0
}
catch
{
    Write-Host "Error: $($_.Exception.Message)"
    exit 1
}
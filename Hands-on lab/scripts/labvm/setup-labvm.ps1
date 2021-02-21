param($labFilesName="")

# Install Chocolatey
# Previously, SMSS was being installed through chocolatey. 
# It is now installed as a stand-alone install. Leaving chocolatey in case it can be used during the Lab.
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) 

# We are waiting for other potential MSI installs to finish.
function Wait-Install {
    $msiRunning = 1
    $msiMessage = ""
    while($msiRunning -ne 0)
    {
        try
        {
            $Mutex = [System.Threading.Mutex]::OpenExisting("Global\_MSIExecute");
            $Mutex.Dispose();
            $DST = Get-Date
            $msiMessage = "An installer is currently running. Please wait...$DST"
            Write-Host $msiMessage 
            $msiRunning = 1
        }
        catch
        {
            $msiRunning = 0
        }
        Start-Sleep -Seconds 1
    }
}

Wait-Install
(New-Object System.Net.WebClient).DownloadFile('https://aka.ms/ssmsfullsetup', 'C:\SSMS-Setup.exe')
$pathArgs = {C:\SSMS-Setup.exe /Install /Quiet /Norestart /Logs logSSMS.txt}
Invoke-Command -ScriptBlock $pathArgs

# Download and extract the starter solution files
# ZIP File sometimes gets corrupted
New-Item -ItemType directory -Path C:\MCW
while((Get-ChildItem -Directory C:\MCW | Measure-Object).Count -eq 0 )
{
    (New-Object System.Net.WebClient).DownloadFile($labFilesName, 'C:\MCW.zip')
    Expand-Archive -LiteralPath 'C:\MCW.zip' -DestinationPath 'C:\MCW' -Force
}

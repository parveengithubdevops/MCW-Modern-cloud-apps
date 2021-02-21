param($labFilesName="")

# To resolve the error of https://github.com/microsoft/MCW-Modern-cloud-apps/issues/79
# The cause of the error is that Powershell uses TLS 1.0 to connect to a website, but website security requires TLS 1.2.
# You can change this behavior by running any of the below commands to use all protocols. You can also specify a single protocol.
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Ssl3
[Net.ServicePointManager]::SecurityProtocol = "Tls, Tls11, Tls12, Ssl3"

# Chocolatey has been used for SMSS install. Now SMMS is being set up as a stand-alone install. 
# Still leaving Chocolatey in case one of the labs uses it.
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

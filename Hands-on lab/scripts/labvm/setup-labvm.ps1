param($labFilesName="")

function Disable-InternetExplorerESC {
    $AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
    $UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
    Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0 -Force
    Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0 -Force
    Stop-Process -Name Explorer -Force
    Write-Host "IE Enhanced Security Configuration (ESC) has been disabled." -ForegroundColor Green
}

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

# To resolve the error of https://github.com/microsoft/MCW-App-modernization/issues/68. The cause of the error is Powershell by default uses TLS 1.0 to connect to website, but website security requires TLS 1.2. You can change this behavior with running any of the below command to use all protocols. You can also specify single protocol.
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Ssl3
[Net.ServicePointManager]::SecurityProtocol = "Tls, Tls11, Tls12, Ssl3"

# Disable IE ESC
Disable-InternetExplorerESC

# Download and extract the starter solution files
# ZIP File sometimes gets corrupted
New-Item -ItemType directory -Path C:\MCW
while((Get-ChildItem -Directory C:\MCW | Measure-Object).Count -eq 0 )
{
    (New-Object System.Net.WebClient).DownloadFile($labFilesName, 'C:\MCW.zip')
    Expand-Archive -LiteralPath 'C:\MCW.zip' -DestinationPath 'C:\MCW' -Force
}

# Download and install SQL Server Management Studio
Wait-Install
(New-Object System.Net.WebClient).DownloadFile('https://aka.ms/ssmsfullsetup', 'C:\SSMS-Setup.exe')
$pathArgs = {C:\SSMS-Setup.exe /Install /Quiet /Norestart /Logs logSSMS.txt}
Invoke-Command -ScriptBlock $pathArgs




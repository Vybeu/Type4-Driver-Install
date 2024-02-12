# Install Script for both Sharp and HP V4 Drivers. 
# MUST be run as admin!

Write-Host "Creating Sharp Driver Path..."
Copy-Item -Path "v4_02_PCL6_1712a.zip" -Destination "C:\temp\v4_02_PCL6_1712a.zip" -ErrorAction SilentlyContinue
Expand-Archive -Path 'C:\temp\v4_02_PCL6_1712a.zip' -DestinationPath 'C:\Drivers\'
Start-Sleep 5

Write-Host "Creating HP Driver Path..."
Copy-Item -Path "ps-x64-7.1.0.25570.zip" -Destination "C:\temp\ps-x64-7.1.0.25570.zip" -ErrorAction SilentlyContinue
Expand-Archive -Path "C:\temp\ps-x64-7.1.0.25570.zip" -DestinationPath "C:\Drivers\"
Start-Sleep 5

$sharpDriver = "SHARP BP-50C65 PCL6"
$sharpInfPath = "C:\Drivers\PCL6\64bit\su06menu.inf"
$hpDriver = "HP Universal Print Driver"
$hpInfPath = "C:\Drivers\ps-x64-7.1.0.25570\hpbuio200l.inf"

Write-Host "Adding print drivers..."
Add-PrinterDriver -Name $sharpDriver
pnputil.exe /add-driver $sharpInfPath /install
Write-Host "Sharp completed. Continuing in 5 seconds..."
Start-Sleep 5
Add-PrinterDriver -Name $hpDriver
pnputil.exe /add-driver $hpInfPath /install
Write-Host "HP completed. Exiting..."

# Install Script for both Sharp and HP V4 Drivers. 
# MUST be run as admin!

Copy-Item -Path "SH_D25_PCL6_PS_2308a_EnglishUS_64bit.zip" -Destination "C:\temp\SH_D25_PCL6_PS_2308a_EnglishUS_64bit.zip" -ErrorAction SilentlyContinue
Expand-Archive -Path 'C:\temp\SH_D25_PCL6_PS_2308a_EnglishUS_64bit.zip' -DestinationPath 'C:\Drivers\'

Copy-Item -Path "SUPD-V4-X64-3.08.1.2731.zip" -Destination "C:\temp\SUPD-V4-X64-3.08.1.2731.zip" -ErrorAction SilentlyContinue
Expand-Archive -Path "C:\temp\ps-x64-7.1.0.255570.zip" -DestinationPath "C:\Drivers\"

$sharpDriver = "SHARP BP-50C65 PCL6"
$sharpInfPath = "C:\Drivers\SH_D25_PCL6_PS_2308a_EnglishUS_64bit\EnglishA\PCL6\64bit\su3emenu.inf"
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

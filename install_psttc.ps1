# Define paths and variables
$sourceExePath = Resolve-Path ".\psttc.exe"
$sourceDir = Split-Path -Path $sourceExePath -Parent
$destinationDir = "C:\Program Files\PSTTC"
$destinationExePath = Join-Path -Path $destinationDir -ChildPath "psttc.exe"
$logFilePath = Join-Path -Path $destinationDir -ChildPath "access.log"
$desktopPath = Join-Path -Path $([Environment]::GetFolderPath("Desktop")) -ChildPath "PSTTC.lnk"
$startMenuPath = Join-Path -Path $([Environment]::GetFolderPath("CommonStartMenu")) -ChildPath "PSTTC.lnk"
$serviceName = "PSTTCWebServer"

# Ensure the destination directory exists
if (-Not (Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir
}

# Copy the executable to the destination directory
Copy-Item -Path $sourceExePath -Destination $destinationExePath -Force

# Copy any other necessary files to the destination directory
Get-ChildItem -Path $sourceDir -Exclude "psttc.exe", "install_psttc.ps1" | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination $destinationDir -Force
}

# Create a shortcut to the executable
$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($desktopPath)
$shortcut.TargetPath = $destinationExePath
$shortcut.WorkingDirectory = $destinationDir
$shortcut.Description = "Launch PSTTC Web Server"
$shortcut.Save()

# Optionally create a shortcut in the Start Menu
$shortcut = $shell.CreateShortcut($startMenuPath)
$shortcut.TargetPath = $destinationExePath
$shortcut.WorkingDirectory = $destinationDir
$shortcut.Description = "Launch PSTTC Web Server"
$shortcut.Save()

# Register the service using NSSM (Nullsoft Scriptable Install System)
# Ensure NSSM is installed first: https://nssm.cc/
$nssmPath = "C:\Program Files\nssm\win64\nssm.exe"
if (Test-Path -Path $nssmPath) {
    & $nssmPath install $serviceName "$destinationExePath"
    & $nssmPath set $serviceName AppDirectory $destinationDir
    & $nssmPath set $serviceName AppStdout $logFilePath
    & $nssmPath set $serviceName AppStderr $logFilePath
    & $nssmPath set $serviceName Start SERVICE_AUTO_START
} else {
    Write-Host "NSSM not found at $nssmPath. Please install NSSM before registering the service."
}

# Create a README file
$readmeContent = @"
# PSTTC Web Server Installation Guide

## Overview
This is a simple web server created with PowerShell.

## Usage
To start the server:

1. Run the shortcut from the Desktop or Start Menu.
2. Or run the executable manually using Command Prompt.

## Configuration
- **Port**: The server listens on port 8001 by default.
- **Log File**: Logs are stored in `access.log`.

## Uninstallation
To uninstall, simply delete the folder `C:\Program Files\PSTTC`.

## Support
For support or issues, contact the developer.
"@

$readmePath = Join-Path -Path $destinationDir -ChildPath "README.txt"
$readmeContent | Out-File -FilePath $readmePath -Encoding UTF8

Write-Host "Installation completed successfully!"
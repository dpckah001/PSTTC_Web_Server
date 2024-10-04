# PSTTC Web Server

This is a simple HTTP server based on PowerShell, demonstrating how to create and deploy a lightweight web server. The server listens for requests on a specified port and returns a designated HTML file.

## Features

- Supports basic HTTP request handling.
- Logging functionality.
- Can be run as a Windows service.

## Installation

### 1. Run the Installation Script

The installation script `install_psttc.ps1` will install the program into the `C:\Program Files\PSTTC` directory and create shortcuts on the desktop and in the Start Menu.

```powershell
.\install_psttc.ps1
```

## Usage

### Starting the Server

#### Through Shortcut

Double-click the shortcut on your desktop or in the Start Menu to start the server.

#### Through Command Line

```powershell
.\psttc.exe [htmlFile]
```

Where `[htmlFile]` is an optional parameter; the default is `./www/index.html`.

### Viewing Help Information

Run the `-help` parameter to view the usage information:

```powershell
.\psttc.exe -help
```

### Configuration Options

- **Port**: The default listening port is 8001. You can change this by modifying the `$port` variable in the source code.
- **Log File**: The default log file is `access.log`, located in the `C:\Program Files\PSTTC` directory.

## Uninstallation

To uninstall the program, delete the installation directory `C:\Program Files\PSTTC` along with the shortcuts on the desktop and in the Start Menu.

```powershell
rmdir /s /q "C:\Program Files\PSTTC"
```

## Service Management

If the program has been registered as a Windows service, you can manage the service using the following commands:

### Start the Service

```powershell
sc start PSTTCWebServer
```

### Stop the Service

```powershell
sc stop PSTTCWebServer
```

### Remove the Service

```powershell
sc delete PSTTCWebServer
```

## Support

If you encounter any issues or have any suggestions while using the program, please contact the development team.

## License

This project is released under the MIT License. See the LICENSE file for details.

---
*This document is written by the development team. Please refer to the latest version for updates.*


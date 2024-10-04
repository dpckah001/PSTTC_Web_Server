# PSTTC Web Server

这是一个简单的基于 PowerShell 的 Web 服务器，用于演示如何创建和部署一个轻量级的 HTTP 服务器。该服务器可以监听指定端口上的请求，并返回指定的 HTML 文件。


## 特性

- 支持基本的 HTTP 请求处理。
- 日志记录功能。
- 可以作为 Windows 服务运行。

## 特性

- 支持基本的 HTTP 请求处理。
- 日志记录功能。
- 可以作为 Windows 服务运行。

## 安装

### 1. 运行安装脚本

安装脚本 `install_psttc.ps1` 会将程序安装到 `C:\Program Files\PSTTC` 目录，并创建桌面和开始菜单的快捷方式。

```powershell
.\install_psttc.ps1
```

## 使用

### 启动服务器

#### 通过快捷方式启动

双击桌面上或开始菜单中的快捷方式即可启动服务器。

#### 通过命令行启动

```powershell
.\psttc.exe [htmlFile]
```

其中 `[htmlFile]` 是可选参数，默认为 `./www/index.html`。

### 查看帮助信息

运行 `-help` 参数以查看脚本的用法信息：

```powershell
.\psttc.exe -help
```

### 配置选项

- **端口**：默认监听端口为 8001，可以通过修改源代码中的 `$port` 变量来更改。
- **日志文件**：默认日志文件为 `access.log`，位于 `C:\Program Files\PSTTC` 目录下。

## 卸载

要卸载程序，请删除安装目录 `C:\Program Files\PSTTC` 以及桌面上和开始菜单中的快捷方式。

```powershell
rmdir /s /q "C:\Program Files\PSTTC"
```

## 服务管理

如果已将程序注册为 Windows 服务，可以使用以下命令管理服务：

### 启动服务

```powershell
sc start PSTTCWebServer
```

### 停止服务

```powershell
sc stop PSTTCWebServer
```

### 删除服务

```powershell
sc delete PSTTCWebServer
```

## 支持

如果您在使用过程中遇到任何问题或有任何建议，请联系开发人员。

## 许可证

本项目采用 MIT 许可证发布。详情见 LICENSE 文件。

---
*此文档由开发团队编写，如有更新，请以最新版为准。*

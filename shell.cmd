@echo off

set "CHROMIUM_SOURCE_DIRECTORY=%~dp0chromium\src"
set "CHROMIUM_DEPOT_TOOLS_DIRECTORY=%~dp0depot_tools"
set "PATH=%~dp0;%CHROMIUM_DEPOT_TOOLS_DIRECTORY%;%CHROMIUM_DEPOT_TOOLS_DIRECTORY%\bootstrap-2@3_11_8_chromium_35_bin\python3\bin;%PATH%"

set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if not exist "%VSWHERE%" (
    echo vswhere.exe was not found.
    exit /b 1
)

set "VS2026_INSTALL="
for /f "tokens=*" %%i in ('^""%VSWHERE%" -latest -version "[18.0,19.0)" -prerelease -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath^"') do (
    set "VS2026_INSTALL=%%i"
)
if not defined VS2026_INSTALL (
    echo Visual Studio 2026 was not found.
    exit /b 1
)

set "VS2026_VCVARSALL=%VS2026_INSTALL%\VC\Auxiliary\Build\vcvarsall.bat"
if not exist "%VS2026_VCVARSALL%" (
    echo Visual Studio 2026 C++ build tools were not found.
    exit /b 1
)
call "%VS2026_VCVARSALL%" x64
if errorlevel 1 (
    echo Failed to initialize the Visual Studio 2026 environment.
    exit /b 1
)

set "DEPOT_TOOLS_WIN_TOOLCHAIN=0"
set "DEPOT_TOOLS_UPDATE=1"
set "NINJA_SUMMARIZE_BUILD=1"

pushd "%CHROMIUM_SOURCE_DIRECTORY%"

:: set "http_proxy="
:: set "https_proxy="

cls
cmd

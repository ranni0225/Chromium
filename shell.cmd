@echo off

set "CHROMIUM_SOURCE_DIRECTORY=%~dp0chromium\src"
set "CHROMIUM_DEPOT_TOOLS_DIRECTORY=%~dp0depot_tools"
set "PATH=%~dp0;%CHROMIUM_DEPOT_TOOLS_DIRECTORY%;%CHROMIUM_DEPOT_TOOLS_DIRECTORY%\bootstrap-2@3_11_8_chromium_35_bin\python3\bin;%PATH%"

set "VS2022_INSTALL=C:\Program Files\Microsoft Visual Studio\2022\Community"
call "%VS2022_INSTALL%\VC\Auxiliary\Build\vcvarsall.bat" x64
set "DEPOT_TOOLS_WIN_TOOLCHAIN=0"
set "DEPOT_TOOLS_UPDATE=1"
set "NINJA_SUMMARIZE_BUILD=1"

pushd "%CHROMIUM_SOURCE_DIRECTORY%"

:: set "http_proxy="
:: set "https_proxy="

cls
cmd

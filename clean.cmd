@echo off

if /I "%1"=="debug" goto:CleanDebugVersion
if /I "%1"=="release" goto:CleanReleaseVersion
echo Usage: clean.cmd [debug^|release]
exit /b 1

:CleanDebugVersion
pushd "%~dp0chromium\src"
call gn clean out\Debug
if errorlevel 1 (
    echo Failed to clean Chromium build outputs.
    popd
    exit /b 1
)
popd
goto:eof

:CleanReleaseVersion
pushd "%~dp0chromium\src"
call gn clean out\Release
if errorlevel 1 (
    echo Failed to clean Chromium build outputs.
    popd
    exit /b 1
)
popd
goto:eof

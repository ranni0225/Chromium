@echo off

if /I "%1"=="debug" goto:BuildDebugVersion
if /I "%1"=="release" goto:BuildReleaseVersion
echo Usage: build.cmd [debug^|release]
exit /b 1

:BuildDebugVersion
pushd "%~dp0chromium\src"
call generate.cmd %1
if errorlevel 1 (
    echo Failed to generate the %1 build configuration.
    popd
    exit /b 1
)
call autoninja -C out\Debug chrome
if errorlevel 1 (
    echo Failed to build Chromium.
    popd
    exit /b 1
)
popd
goto:eof

:BuildReleaseVersion
pushd "%~dp0chromium\src"
call generate.cmd %1
if errorlevel 1 (
    echo Failed to generate the %1 build configuration.
    popd
    exit /b 1
)
call autoninja -C out\Release chrome
if errorlevel 1 (
    echo Failed to build Chromium.
    popd
    exit /b 1
)
popd
goto:eof

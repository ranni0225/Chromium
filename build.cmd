@echo off

if /I "%1"=="debug" goto:BuildDebugVersion
if /I "%1"=="release" goto:BuildReleaseVersion

:BuildDebugVersion
pushd "%~dp0chromium\src"
call generate.cmd %1
call autoninja -C out\Debug chrome
popd
goto:eof

:BuildReleaseVersion
pushd "%~dp0chromium\src"
call generate.cmd %1
call autoninja -C out\Release chrome
popd
goto:eof

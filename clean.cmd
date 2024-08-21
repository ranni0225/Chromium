@echo off

if /I "%1"=="debug" goto:CleanDebugVersion
if /I "%1"=="release" goto:CleanReleaseVersion

:CleanDebugVersion
pushd "%~dp0chromium\src"
call generate.cmd %1
call autoninja -C out\Debug chrome -tclean
popd
goto:eof

:CleanReleaseVersion
pushd "%~dp0chromium\src"
call generate.cmd %1
call autoninja -C out\Release chrome -tclean
popd
goto:eof

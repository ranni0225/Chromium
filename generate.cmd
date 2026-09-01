@echo off

if /I "%1"=="debug" goto:GenerateDebugVersion
if /I "%1"=="release" goto:GenerateReleaseVersion
echo Usage: generate.cmd [debug^|release]
exit /b 1

:GenerateDebugVersion
pushd "%~dp0chromium\src"
call gn gen out\Debug --ide=vs --ninja-executable=autoninja --export-compile-commands --args="target_cpu=\"x64\" is_component_build=true is_debug=true dcheck_always_on=true treat_warnings_as_errors=true chrome_pgo_phase=0 symbol_level=2 blink_symbol_level=2 v8_symbol_level=2 proprietary_codecs=true ffmpeg_branding=\"Chrome\""
if errorlevel 1 (
    popd
    exit /b 1
)
popd
goto:eof

:GenerateReleaseVersion
pushd "%~dp0chromium\src"
call gn gen out\Release --ide=vs --ninja-executable=autoninja --export-compile-commands --args="target_cpu=\"x64\" is_component_build=false is_debug=false dcheck_always_on=false treat_warnings_as_errors=false chrome_pgo_phase=0 symbol_level=0 blink_symbol_level=0 v8_symbol_level=0 proprietary_codecs=true ffmpeg_branding=\"Chrome\""
if errorlevel 1 (
    popd
    exit /b 1
)
popd
goto:eof

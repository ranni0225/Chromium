@echo off

pushd "%~dp0depot_tools"

if errorlevel 1 (
    echo depot_tools directory was not found.
    exit /b 1
)

call git checkout main
if errorlevel 1 (
    echo Failed to checkout the depot_tools main branch.
    popd
    exit /b 1
)

call git pull --ff-only
if errorlevel 1 (
    echo Failed to update depot_tools.
    popd
    exit /b 1
)

popd

pushd "%~dp0chromium\src"

if errorlevel 1 (
    echo Chromium source directory was not found.
    exit /b 1
)

call git checkout main
if errorlevel 1 (
    echo Failed to checkout the Chromium source main branch.
    popd
    exit /b 1
)

call git rebase-update
if errorlevel 1 (
    echo Failed to update Chromium source repository.
    popd
    exit /b 1
)

call gclient sync -D
if errorlevel 1 (
    echo Failed to synchronize Chromium dependencies.
    popd
    exit /b 1
)

popd

@echo off

pushd %~dp0chromium\src
call git checkout main
call git pull
call git rebase-update
call gclient sync -D
popd

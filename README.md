# Chromium for Windows

## Project Structure

``` plaintext
- chromium
  - src
- depot_tools
- build.cmd
- clean.cmd
- DepotTools.props
- Directory.Build.targets
- generate.cmd
- shell.cmd
- update.cmd
```

## Prerequisites

See [Chromium Docs](https://chromium.googlesource.com/chromium/src/+/main/docs/windows_build_instructions.md) for more details.

## Usage

- configure git
  ```
  git config --global branch.autosetuprebase always
  git config --global core.autocrlf false
  git config --global core.filemode false
  git config --global core.fscache true
  git config --global core.longpaths true
  git config --global core.preloadindex true
  ```


**Run `shell.cmd` from the project root. During the initial setup, if `chromium\src` does not exist, the shell remains in the project root.**

- `git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git`
- `mkdir chromium && cd chromium`
- `fetch chromium`
- `gclient sync`
- relaunch `shell.cmd`
- use `generate.cmd debug` or `generate.cmd release` to generate ninja projects, compile commands, and Visual Studio solutions (`out\{Debug|Release}\all.sln`)
- use `build.cmd debug` or `build.cmd release` to build Chromium (target: chrome)
- use `clean.cmd debug` or `clean.cmd release` to clean Chromium build outputs
- use `update.cmd` to update Chromium source code and tools from upstream

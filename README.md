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

- Visual Studio 2022
- git

See [Chromium Docs](https://chromium.googlesource.com/chromium/src/+/main/docs/windows_build_instructions.md).

## Usage

- local preparations
  - proxy
  - git
    - `git config --global core.autocrlf false`
    - `git config --global core.filemode false`
    - `git config --global branch.autosetuprebase always`
    - `git config --global core.longpaths true`
  - launch `shell.cmd`
- `git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git`
- `mkdir chromium && cd chromium`
- `fetch chromium`
- `gclient sync`
- relaunch `shell.cmd`
- use `generate.cmd debug` or `generate.cmd release` to generate ninja projects and Visual Studio solutions (`out\{Debug|Release}\all.sln`)
- use `build.cmd debug` or `build.cmd release` to build chromium (target: chromium)
- use `clean.cmd debug` or `clean.cmd release` to remove built files (target: chromium)
- use `update.cmd` to update git repository for `depot_tools` and `chromium`

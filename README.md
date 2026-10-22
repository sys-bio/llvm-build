# llvm-build

Builds LLVM to roadrunner's specifications and publishes the binaries as GitHub releases.
There is no LLVM source fork: the workflow downloads the official `llvm-project` source
tarball and configures it with `config/llvm-flags.cmake`.

## What is built

- Static libraries, headers, CMake files and `llvm-config` for X86 and AArch64.
- RTTI and exception handling enabled (roadrunner derives from LLVM classes).
- No zlib, zstd, libxml2 or terminfo dependencies.
- Every tool except `llvm-config` is disabled.
- Release and Debug on Windows (MSVC), macOS (arm64 and x86_64) and Ubuntu; Release only on manylinux_2_28.

Each zip is named `llvm-<version>-<os_and_compiler>-<arch>-<build_type>.zip` and unpacks
with `bin`, `lib` and `include` at the top level.

## Changing the LLVM version

Edit `LLVM_VERSION` at the top of `.github/workflows/build-llvm.yml`.

## Publishing

Pushing a tag that starts with `llvm-` (for example `llvm-23.1.4-r1`) builds every
platform and attaches the zips to a release with that tag. Pull requests and manual runs
build and upload workflow artifacts only.

## Using the binaries

Point roadrunner's `LLVM_INSTALL_PREFIX` at the unpacked zip.

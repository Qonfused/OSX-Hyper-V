#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2034,SC2164

## @file
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# Change CWD for imports
__PWD__=$(pwd); cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")"


while read -r args; do
  while read -r BUILD; do
    # Set build type in config to target build version
    REPLACE="$(sed "s/build: [A-Z]*/build: $BUILD/" src/build.yml)"
    echo "$REPLACE" > src/build.yml
    # Run build script
    TARGET="${args//|/-}"
    FLAGS="--skip-serial --${args//|/ --}"
    echo "Building \"EFI-$TAG-$TARGET-$BUILD.zip\"..."
    powershell.exe scripts/build.ps1 "$FLAGS"
    # Compress EFI directory
    (cd dist && zip -r -X "../EFI-$TAG-$TARGET-$BUILD.zip" . >/dev/null)
  done <<< $'RELEASE\nDEBUG'
done <<< $'64-bit\nlegacy|64-bit\nlegacy|32-bit'
#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2034,SC2164

## @file
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# Change CWD for imports
__PWD__=$(pwd); cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")"

source ./scripts/lib/constants.sh
source ./scripts/lib/oce-build/lib/macros.sh

while read -r args; do
  while read -r BUILD; do
    # Set build type in config to target build version
    REPLACE="$(sed "s/oce-build: [A-Z]*/oce-build: $BUILD/" src/build.yml)"
    echo "$REPLACE" > src/build.yml
    # Run build script
    TARGET="${args//|/-}";
    echo "Building \"EFI-$TAG-$TARGET-$BUILD.zip\"..."
    FLAGS="--${args//|/ --}"
    bash scripts/lib/oce-build/build.sh -c "$CONFIG" "$FLAGS"
    bash scripts/lib/vmtools.sh
    # Compress EFI directory
    (cd dist && zip -r -X "../EFI-$TAG-$TARGET-$BUILD.zip" EFI >/dev/null)
  done <<< $'RELEASE\nDEBUG'
done <<< $'64-bit\nlegacy|64-bit\nlegacy|32-bit'
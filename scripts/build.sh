#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2164

## @file
# EFI build script for Hyper-V
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# Change CWD for imports
__PWD__="$(pwd)"; cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")"/../)";

source ./scripts/lib/constants.sh


# Run build script
bash ./scripts/lib/oce-build/build.sh -c "$CONFIG"

# Extract daemons from release package's `Tools` folder

pushd "$(realpath "$(dirname "${BASH_SOURCE[0]}")"/lib/oce-build)" > /dev/null
CONFIG="$(realpath "$__PWD__/$CONFIG")"
source ./lib/config.sh
source ./lib/constants.sh
LOCKFILE="${CONFIG%.*}.lock"
# Extract binaries
pkg="$BUILD_DIR/.temp/@acidanthera/MacHyperVSupport"
url="$($yq ".${pkg##*/}.url" "$LOCKFILE")"
mkdir -p "$pkg"
curl -sL "$url" | bsdtar -xvf- -C "$pkg" > /dev/null 2>&1
cp -a "$pkg/Tools/." "$BUILD_DIR/tools"
# Update lockfile
find "$BUILD_DIR/tools" -maxdepth 1 -type f | while read -r f; do
  daemon="${f##*/}"; $yq -i e ".${pkg##*/}.bundled
    .\"$daemon\" = { \"extract\": \"./Tools/$daemon\", \"type\": \"binary\" }"\
    "$LOCKFILE"
done
# Cleanup
rm -r "$BUILD_DIR/.temp" && popd > /dev/null

# Patch SMBIOS serial data
if printf '%s\n' "$@" | grep -Fxq -- '--skip-serial'; then
  echo "Skipping SMBIOS serial generation..."
else bash ./scripts/lib/oce-build/scripts/patch-serial.sh -c "$CONFIG"; fi
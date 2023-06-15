#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2154,SC2164

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
bash ./scripts/lib/oce-build/build.sh -c "$CONFIG" "$@"

# Patch execution flow in OCE-Build for adding post-install tools
pushd "$(realpath ./scripts/lib/oce-build)" > /dev/null
CONFIG="$(realpath "$__PWD__/$CONFIG")"
source ./lib/config.sh
source ./lib/constants.sh
mkdir -p "$BUILD_DIR/tools"
# Copy powershell scripts
cp "../convert-efi-disk.ps1" "$SCR_DIR/convert-efi-disk.ps1"
cp "../create-macos-recovery.ps1" "$SCR_DIR/create-macos-recovery.ps1"
cp "../create-virtual-machine.ps1" "$SCR_DIR/create-virtual-machine.ps1"
# Copy additional post-install scripts
cp "../optimize-vm.sh" "$BUILD_DIR/tools/optimize-vm.sh"
# Extract daemons from release package's `Tools` folder
LOCKFILE="${CONFIG%.*}.lock"
pkg="$BUILD_DIR/.temp/@acidanthera/MacHyperVSupport"
url="$($yq ".${pkg##*/}.url" "$LOCKFILE")"
mkdir -p "$pkg" && curl -sL "$url" | bsdtar -xvf- -C "$pkg" > /dev/null 2>&1
cp -a "$pkg/Tools/." "$BUILD_DIR/tools/daemons"
# Update lockfile
find "$pkg/Tools" -maxdepth 1 -type f | while read -r f; do
  daemon="${f##*/}"; $yq -i e ".${pkg##*/}.bundled
    .\"$daemon\" = { \"extract\": \"./Tools/$daemon\", \"type\": \"binary\" }"\
    "$LOCKFILE"
done
# Teardown
rm -r "$BUILD_DIR/.temp" && popd > /dev/null

# Patch SMBIOS serial data
if printf '%s\n' "$@" | grep -Fxq -- '--skip-serial'; then
  echo "Skipping SMBIOS serial generation..."
else bash ./scripts/lib/oce-build/scripts/patch-serial.sh -c "$CONFIG"; fi

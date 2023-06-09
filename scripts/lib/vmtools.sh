#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2154,SC2164

## @file
# Patches execution flow in OCE-Build to add post-install tools.
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# Change CWD for imports
__PWD__="$(pwd)"; cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")")";

source ./constants.sh


# Patch execution flow in OCE-Build for adding post-install tools
pushd "$(realpath ./oce-build)" > /dev/null
CONFIG="$(realpath "$__PWD__/$CONFIG")"
source ./lib/config.sh
source ./lib/constants.sh

# Extract daemons from release package's `Tools` folder
LOCKFILE="${CONFIG%.*}.lock"
pkg="$BUILD_DIR/.temp/@acidanthera/MacHyperVSupport"
url="$($yq ".${pkg##*/}.url" "$LOCKFILE")"
mkdir -p "$pkg" && curl -sL "$url" | bsdtar -xvf- -C "$pkg" > /dev/null 2>&1
cp -a "$pkg/Tools/." "$BUILD_DIR/tools"
# Update lockfile
find "$BUILD_DIR/tools" -maxdepth 1 -type f | while read -r f; do
  daemon="${f##*/}"; $yq -i e ".${pkg##*/}.bundled
    .\"$daemon\" = { \"extract\": \"./Tools/$daemon\", \"type\": \"binary\" }"\
    "$LOCKFILE"
done

# Teardown
rm -r "$BUILD_DIR/.temp" && popd > /dev/null

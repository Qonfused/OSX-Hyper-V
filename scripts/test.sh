#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2164

## @file
# Convenience script for running CI check scripts locally.
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# Change CWD for imports
__PWD__="$(pwd)"; cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")"/../)";

source ./scripts/lib/constants.sh


# Run shellcheck script
bash .github/scripts/shellcheck.sh

# Run EFI validation script
bash ./scripts/lib/oce-build/scripts/validate-efi.sh -c "$CONFIG"

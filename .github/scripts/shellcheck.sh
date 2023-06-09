#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2164

## @file
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# Change CWD for imports
__PWD__=$(pwd); cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")"

find . \( -name "*.sh" -o -name "*.command" \) -exec sh -c 'for TargetFile; do shellcheck --severity=info "${TargetFile}" || exit 1; done' sh {} +

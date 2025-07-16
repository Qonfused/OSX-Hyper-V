## @file
# AMD CPU patch script for OSX Hyper-V
#
# Copyright (c) 2023-2025, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

[CmdletBinding(PositionalBinding=$false)]
param (
  [string]$pwd = "$((Get-Item "$PSScriptRoot\..").FullName)",
  # Script arguments
  [parameter(ValueFromRemainingArguments)][string[]]$arguments
)

icm `
  -ScriptBlock $([Scriptblock]::Create($(iwr 'https://raw.githubusercontent.com/Qonfused/OCE-Build/main/ci/bootstrap.ps1'))) `
  -ArgumentList (@("-c $pwd -e https://raw.githubusercontent.com/Qonfused/OCE-Build/refs/heads/main/scripts/amd.py --hyperv --out src/patch.amd.yml $($arguments -join ' ')"))

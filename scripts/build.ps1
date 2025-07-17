## @file
# EFI build script for OSX Hyper-V
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

function HasFlag {
  param ([string]$flag)

  $arg_array = $arguments -split ' '
  foreach ($arg in $arg_array) {
    if ($arg -eq $flag) {
      $script:arguments = ($arg_array | ? { $_ -ne $flag }) -join ' '
      return $true
    }
  }

  return $false
}

# Switches for additional '--legacy' and '--32-bit' patches
# TODO: Add switch for legacy iASL for macOS 10.6 and older
$patches = @('-p config.yml')
if (HasFlag '--legacy') { $patches += @('-p patch.legacy.yml') }
if (HasFlag '--32-bit') { $patches += @('-p patch.32-bit.yml') }
if (HasFlag '--64-bit') { }
# Check if patch.amd.yml exists
if ((Test-Path "$pwd\src\patch.amd.yml") -or
    (Test-Path "$pwd\patch.amd.yml")) {
  $patches += @('-p patch.amd.yml')
}

icm `
  -ScriptBlock $([Scriptblock]::Create($(iwr 'https://raw.githubusercontent.com/Qonfused/OCE-Build/main/ci/bootstrap.ps1'))) `
  -ArgumentList (@("build -c $pwd $($patches -join ' ') $($arguments -join ' ')"))

# Run the post-build script
Write-Host "`nRunning post-build script..."
& "$PSScriptRoot\post-build.ps1"
Write-Host "Done.`n"

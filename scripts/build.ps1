## @file
# EFI build script for OSX Hyper-V
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
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
      $arguments = ($arg_array | ? { $_ -ne $flag }) -join ' '
      return $true
    }
  }

  return $false
}

# Switches for additional '--legacy' and '--32-bit' patches
$patches = @('-p config.yml')
if (HasFlag '--legacy') { $patches += @('-p patch.legacy.yml') }
if (HasFlag '--32-bit') {
  $patches += @('-p patch.32-bit.yml')
  # Ensure the target architecture is set to IA32
  (Get-Content "$pwd\src\build.yml") -replace 'target: X64', 'target: IA32' |
   Set-Content "$pwd\src\build.yml"
} else {
  # Ensure the target architecture is set to X64
  (Get-Content "$pwd\src\build.yml") -replace 'target: IA32', 'target: X64' |
   Set-Content "$pwd\src\build.yml"
}

icm `
  -ScriptBlock $([Scriptblock]::Create($(iwr 'https://raw.githubusercontent.com/Qonfused/OCE-Build/main/ci/bootstrap.ps1'))) `
  -ArgumentList (@("build -c $pwd $patches") + $arguments)

# Run the post-build script
Write-Host "`nRunning post-build script..."
& "$PSScriptRoot\post-build.ps1"
Write-Host "Done.`n"

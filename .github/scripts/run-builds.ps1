## @file
# EFI build script for OSX Hyper-V
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# [CmdletBinding(PositionalBinding=$false)]
# param (
#   [string]$pwd = "$((Get-Item "$PSScriptRoot\..").FullName)",
#   # Script arguments
#   [parameter(ValueFromRemainingArguments)][string[]]$arguments
# )

$buildList = @('RELEASE', 'DEBUG')
$flagsList = @(
  @('--64-bit'),
  @('legacy', '--32-bit'),
  @('legacy', '--64-bit')
)

foreach ($build in $buildList) {
  # Prepare for each build configuration
  Remove-Item src\build.lock -ErrorAction SilentlyContinue
  (Get-Content src\build.yml) -replace '^build: [A-Z]*', "build: $build" |
    Set-Content src\build.yml

  # Run build for each flag configuration
  foreach ($flags in $flagsList) {
    Remove-Item dist -Force -Recurse -ErrorAction SilentlyContinue
  
    # Run build script
    $flags = $($flags -join ' ')
    Write-Host "Starting $build build with flags: $flags"
    powershell.exe "$pwd\scripts\build.ps1" $flags

    # Compress EFI directory
    $identifier = "$($flags -replace '--', '' -join '-')-$build"
    cp src\build.lock dist\EFI\OC\build.lock
    tar.exe -czf "EFI-$env:TAG-$identifier.zip" -C dist .
  }
}

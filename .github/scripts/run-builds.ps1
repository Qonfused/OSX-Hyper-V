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

$buildList = 'DEBUG',
             'RELEASE'
$flagsList =             '--64-bit',
            ('--legacy', '--64-bit'),
            ('--legacy', '--32-bit')

foreach ($build in $buildList) {
  # Prepare for each build configuration
  Remove-Item src\build.lock -ErrorAction SilentlyContinue
  (Get-Content src\build.yml) -replace '^build: [A-Z]*', "build: $build" |
    Set-Content src\build.yml

  # Run build for each flag configuration
  foreach ($flags in $flagsList) {
    # Run build script
    Write-Host "Running $build build with flags: $flags..."
    pwsh "$pwd/scripts/build.ps1" -ArgumentList "$($flags -join ' ')"

    # Compress EFI directory
    cp "$pwd/src/build.lock" "$pwd/dist/EFI/OC/build.lock"
    $identifier = "$($flags -replace '--', '' -join '-')-$build"
    Compress-Archive `
      -Path "$pwd/dist/*" `
      -DestinationPath "EFI-$env:TAG-$identifier.zip" `
      -Force

    # Cleanup
    Remove-Item dist -Force -Recurse -ErrorAction SilentlyContinue
  }
}

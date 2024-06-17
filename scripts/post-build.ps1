## @file
# EFI build script for OSX Hyper-V
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

[CmdletBinding(PositionalBinding=$false)]
param (
  [string]$pwd = "$((Get-Item "$PSScriptRoot\..").FullName)"
)

$buildDir = "$pwd\dist"
if (-not (Test-Path $buildDir)) {
  throw (`
    "Unable to locate OCE-Build build directory. " +
    "Please ensure the build script is ran before running the post-build script.");
}

# Copy Hyper-V setup and post-install scripts under 'dist/Scripts'
$ScriptsDir = "$pwd\dist\Scripts"
if (-not (Test-Path $ScriptsDir)) {
  New-Item -Path $ScriptsDir -ItemType Directory | Out-Null
  Copy-Item -Path "$PSScriptRoot\lib\*" -Destination $ScriptsDir
}

# Extract the MacHyperVSupport tools to 'dist/Tools'
$ToolsDir = "$pwd\dist\Tools"
if (-not (Test-Path $ToolsDir)) {
  # Extract the resolved url for MacHyperVSupport from the lockfile
  $lockfile = Get-Content -Path "$pwd\src\build.lock" -Raw
  $lockfile -match "MacHyperVSupport:[\s\S]*?url: '([^\s]+)'" | Out-Null

  # Extract the contents of MacHyperVSupport archive to the temporary directory
  $TempDir = Get-Item "$([System.IO.Path]::GetTempPath())\ocebuild-unpack-*"
  if (-not $TempDir) {
    throw (`
      "Unable to locate OCE-Build temporary directory. " +
      "Please ensure the build script is ran before running the post-build script.");
  }
  $MacHyperVSupport = "$TempDir\MacHyperVSupport.zip"
  iwr -Uri $Matches[1] -OutFile $MacHyperVSupport
  Expand-Archive -Path $MacHyperVSupport -Destination $TempDir

  # Move the Tools directory to the build directory
  Move-Item -Path "$TempDir\Tools" -Destination $ToolsDir

  # Clean up the temporary directory
  if ($TempDir -match "ocebuild-unpack-") {
    Remove-Item -Path $TempDir\* -Recurse -Force
  }
}

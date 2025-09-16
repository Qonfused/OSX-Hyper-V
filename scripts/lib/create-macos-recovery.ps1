## @file
# macrecovery.py wrapper script
#
# Copyright (c) 2023-2025, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

param (
  [string]$pwd = "$((Get-Item "$PSScriptRoot\..").FullName)",
  # Script arguments
  [string]$macrecovery = "$($pwd)\Utilities\macrecovery\macrecovery.py",
  [string]$version = "latest",
  [string]$outdir = "$($pwd)\com.apple.recovery.boot"
)
$ErrorActionPreference = 'Stop'

# Create `outdir` if it doesn't exist
New-Item -ItemType Directory "$outdir" -Force | Out-Null

# Keep in sync with https://github.com/acidanthera/OpenCorePkg/blob/master/Utilities/macrecovery/recovery_urls.txt
switch ($version)
{
  # Lion (10.7)
  "10.7"  { $b="Mac-2E6FAB96566FE58C"; $m="00000000000F25Y00"; }
  # "10.7"  { $b="Mac-C3EC7CD22292981F"; $m="00000000000F0HM00"; }
  # Mountain Lion (10.8)
  "10.8"  { $b="Mac-7DF2A3B5E5D671ED"; $m="00000000000F65100"; }
  # Mavericks (10.9)
  "10.9"  { $b="Mac-F60DEB81FF30ACF6"; $m="00000000000FNN100"; }
  # Yosemite (10.10)
  "10.10" { $b="Mac-E43C1C25D4880AD6"; $m="00000000000GDVW00"; }
  # El Capitan (10.11)
  "10.11" { $b="Mac-FFE5EF870D7BA81A"; $m="00000000000GQRX00"; }
  # Sierra (10.12)
  "10.12" { $b="Mac-77F17D7DA9285301"; $m="00000000000J0DX00"; }
  # High Sierra (10.13)
  "10.13" { $b="Mac-7BA5B2D9E42DDD94"; $m="00000000000J80300"; }
  # "10.13" { $b="Mac-BE088AF8C5EB4FA2"; $m="00000000000J80300"; }
  # Mojave (10.14)
  "10.14" { $b="Mac-7BA5B2DFE22DDD8C"; $m="00000000000KXPG00"; }
  # Catalina (10.15)
  "10.15" { $b="Mac-00BE6ED71E35EB86"; $m="00000000000000000"; }
  # "10.15" { $b="Mac-CFF7D910A743CAAF"; $m="00000000000PHCD00"; }
  # Big Sur (11)
  "11"    { $b="Mac-2BD1B31983FE1663"; $m="00000000000000000"; }
  # Monterey (12)
  "12"    { $b="Mac-E43C1C25D4880AD6"; $m="00000000000000000"; }
  # Ventura (13)
  "13"    { $b="Mac-B4831CEBD52A0C4C"; $m="00000000000000000"; }
  # Sonoma (14)
  "14"    { $b="Mac-827FAC58A8FDFA22"; $m="00000000000000000"; }
  # Sequoia (15)
  "15"    { $b="Mac-7BA5B2D9E42DDD94"; $m="00000000000000000"; }
  # Latest (defaults to Sequoia 15.6)
  Default { $b="Mac-CFF7D910A743CAAF"; $m="00000000000000000"; }
}

# Run macrecovery.py script
# & python.exe "$macrecovery" -b "$b" -m "$m" -o "$outdir" download
icm `
  -ScriptBlock $([Scriptblock]::Create($(iwr 'https://raw.githubusercontent.com/Qonfused/OCE-Build/main/ci/bootstrap.ps1'))) `
  -ArgumentList (@("-e $macrecovery -b $b -m $m -o $outdir download"))

# Check if the outdir was created
if (-not (Test-Path -Path $outdir)) {
  Write-Error "Failed to create recovery directory at $outdir. Please check the script and try again."
  exit 1
}

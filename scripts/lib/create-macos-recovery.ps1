## @file
# macrecovery.py wrapper script
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

param (
  [string]$pwd = "$((Get-Item "$PSScriptRoot\..").FullName)",
  # Script arguments
  [string]$macrecovery = "$($pwd)\Utilities\macrecovery\macrecovery.py",
  [string]$version = "latest",
  [string]$outdir = "$($pwd)\com.apple.recovery.boot"
)


# Create `outdir` if it doesn't exist
New-Item -ItemType Directory "$outdir" -Force | Out-Null

switch ($version)
{
  "10.7"  { $b="Mac-2E6FAB96566FE58C"; $m="00000000000F25Y00"; }
  "10.8"  { $b="Mac-7DF2A3B5E5D671ED"; $m="00000000000F65100"; }
  "10.9"  { $b="Mac-F60DEB81FF30ACF6"; $m="00000000000FNN100"; }
  "10.10" { $b="Mac-E43C1C25D4880AD6"; $m="00000000000GDVW00"; }
  "10.11" { $b="Mac-FFE5EF870D7BA81A"; $m="00000000000GQRX00"; }
  "10.12" { $b="Mac-77F17D7DA9285301"; $m="00000000000J0DX00"; }
  "10.13" { $b="Mac-7BA5B2D9E42DDD94"; $m="00000000000J80300"; }
  "10.14" { $b="Mac-7BA5B2DFE22DDD8C"; $m="00000000000KXPG00"; }
  "10.15" { $b="Mac-00BE6ED71E35EB86"; $m="00000000000000000"; }
  "11"    { $b="Mac-42FD25EABCABB274"; $m="00000000000000000"; }
  "12"    { $b="Mac-FFE5EF870D7BA81A"; $m="00000000000000000"; }
  "13"    { $b="Mac-4B682C642B45593E"; $m="00000000000000000"; }
  "14"    { $b="Mac-937A206F2EE63C01"; $m="00000000000000000"; }
  # "15"    { $b=""; $m="00000000000000000"; }
  Default { $b="Mac-7BA5B2D9E42DDD94"; $m="00000000000000000"; }
}

# Run macrecovery.py script
& python.exe "$macrecovery" -b "$b" -m "$m" -o "$outdir" download

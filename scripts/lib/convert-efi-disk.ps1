## @file
# EFI VHDX conversion script for Hyper-V
#
# Copyright (c) 2023-2025, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

param (
  [string]$pwd = "$((Get-Item "$PSScriptRoot\..").FullName)",
  # Script arguments
  [string]$path = "$($pwd)\EFI",
  [string]$dest = "$($pwd)\EFI.vhdx"
)
$ErrorActionPreference = 'Stop'

# Prompt for Administrator priviledges
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  Start-Process powershell.exe -Verb RunAs -ArgumentList ("-NoExit -noprofile -file `"{0}`" -elevated -pwd `"$pwd`" -name `"$name`" -version $version -cpu $cpu -ram $ram -size $size -outdir `"$outdir`"" -f ($myinvocation.MyCommand.Definition));
  exit;
}

# Log a warning if the Microsoft-Hyper-V feature is not enabled
if (-not (Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -ErrorAction SilentlyContinue).State -eq 'Enabled') {
  Write-Warning "Microsoft-Hyper-V feature is not enabled. " +
    "Please enable it in Windows Features before creating a new VM."
}


# Create and mount a new EFI.vhdx disk
Write-Host "Creating and mounting EFI VHDX disk at $dest..."
$efiDisk = New-VHD -Path "$dest" -Dynamic -SizeBytes 5GB |
  Mount-VHD -Passthru |
  Initialize-Disk -PartitionStyle "GPT" -Confirm:$false -Passthru |
  New-Partition -AssignDriveLetter -UseMaximumSize |
  Format-Volume -FileSystem "FAT32" -NewFileSystemLabel "EFI" -Confirm:$false -Force

# Copy EFI folder to VHDX disk
Copy-Item -Path "$path" -Recurse -Destination "$($efiDisk.DriveLetter):\EFI"

# Copy the Scripts directory (for post-install scripts)
$scriptsDir = "$pwd\Scripts"
if (Test-Path -Path $scriptsDir) {
  # Only copy shell scripts (.sh) intended for post-install
  $postInstallScripts = Get-ChildItem -Path $scriptsDir -Filter "*.sh" -Recurse
  if ($postInstallScripts) {
    # Create Scripts directory on the VHDX disk
    New-Item -Path "$($efiDisk.DriveLetter):\Scripts" -ItemType Directory -Force | Out-Null

    # Copy each script to the Scripts directory on the VHDX disk
    Write-Host "Copying post-install scripts to $($efiDisk.DriveLetter):\Scripts"
    foreach ($script in $postInstallScripts) {
      $destinationPath = "$($efiDisk.DriveLetter):\Scripts\$($script.Name)"
      Copy-Item -Path $script.FullName -Destination $destinationPath -Force
      Write-Host "Copied script: $($script.Name) to $destinationPath"
    }
  }
} else {
  Write-Host "Scripts directory not found at $scriptsDir. Skipping copy."
}

# Copy the Tools directory (for post-install daemons)
$toolsDir = "$pwd\Tools"
if (Test-Path -Path $toolsDir) {
  Copy-Item -Path $toolsDir -Recurse -Destination "$($efiDisk.DriveLetter):\Tools"
  Write-Host "Copied Tools directory to $($efiDisk.DriveLetter):\Tools"
} else {
  Write-Host "Tools directory not found at $toolsDir. Skipping copy."
}

# Copy macOS recovery image if present
$recoveryImage = "com.apple.recovery.boot"
if (Test-Path -Path "$($pwd)\$recoveryImage") {
  Write-Host "Copying macOS recovery image to EFI disk..."
  Copy-Item -Path "$($pwd)\$recoveryImage" -Recurse -Destination "$($efiDisk.DriveLetter):\$recoveryImage"
}

# Unmount VHDX disk
Write-Host "Unmounting EFI VHDX disk..."
Dismount-VHD -Path "$dest" | Out-Null

Write-Host "Optimizing EFI VHDX disk..."

# Optimize the VHDX disk to compress the image
Mount-VHD -Path "$dest" -ReadOnly | Out-Null
Optimize-VHD -Path "$dest" -Mode Full
Dismount-VHD -Path "$dest" | Out-Null

# Shrink the VHDX disk to minimum size
Resize-VHD -Path "$dest" -ToMinimumSize

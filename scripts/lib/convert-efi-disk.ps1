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

# Prompt for Administrator priviledges
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  Start-Process powershell.exe -Verb RunAs -ArgumentList ("-noprofile -file `"{0}`" -elevated -pwd $pwd -path $path -dest $dest" -f ($myinvocation.MyCommand.Definition));
  exit;
}


# Create and mount a new EFI.vhdx disk
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
  Copy-Item -Path "$($pwd)\$recoveryImage" -Recurse -Destination "$($efiDisk.DriveLetter):\$recoveryImage"
}

# Unmount VHDX disk
Dismount-VHD -Path "$dest" | Out-Null

# Optimize the VHDX disk to compress the image
Mount-VHD -Path "$dest" -ReadOnly | Out-Null
Optimize-VHD -Path "$dest" -Mode Full
Dismount-VHD -Path "$dest" | Out-Null

# Shrink the VHDX disk to minimum size
Resize-VHD -Path "$dest" -ToMinimumSize

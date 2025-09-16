## @file
# Hyper-V virtual machine creation script
#
# Copyright (c) 2023-2025, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

param (
  [string]$pwd = "$((Get-Item "$PSScriptRoot\..").FullName)",
  # Script arguments
  [string]$name = "macOS",
  [string]$version = "latest",
  [int]$cpu = 2,
  [int]$ram = 8,    # Size in GB
  [int]$size = 50,  #
  [string]$outdir = "$env:USERPROFILE\Documents\Hyper-V"
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

# Check if $outdir/$name already exists (and is non-empty)
if ((Test-Path -Path "$outdir\$name") -and (Get-ChildItem -Path "$outdir\$name").Count -gt 0) {
  Write-Host "Virtual machine '$name' already exists in '$outdir'. Please choose a different name or delete the existing one."
  exit 1
}


# Create new virtual machine
Write-Host "Creating new virtual machine '$name'..."
New-VM -Generation 2 -Name "$name" -path "$outdir" -NoVHD | Out-Null

# Configure network adapter to use the default vswitch
Write-Host "Configuring network adapter for virtual machine '$name'..."
$networkAdapter = Get-VMNetworkAdapter -VMName "$name"
Connect-VMNetworkAdapter -VMName "$name" -Name "$($networkAdapter.name)" -SwitchName "Default Switch"

# Create EFI disk
Write-Host "Creating EFI disk for virtual machine '$name'..."
$efiVHD = "$outdir\$name\EFI.vhdx"
& "$PSScriptRoot\create-macos-recovery.ps1" -version $version
& "$PSScriptRoot\convert-efi-disk.ps1" -dest $efiVHD
Add-VMHardDiskDrive -VMName "$name" -Path "$efiVHD" -ControllerType SCSI
$efiDisk = Get-VMHardDiskDrive -VMName "$name"

# Create macOS disk
$macOSVHD = "$outdir\$name\$name.vhdx" 
Write-Host "Creating macOS disk for virtual machine '$name'..."
New-VHD -Path "$macOSVHD" -SizeBytes $($size * 1GB) |
  Mount-VHD -Passthru |
  Initialize-Disk -PartitionStyle "GPT" -Confirm:$false -Passthru |
  New-Partition -AssignDriveLetter -UseMaximumSize |
  Format-Volume -FileSystem "exFAT" -NewFileSystemLabel "macOS" -Confirm:$false -Force
Dismount-DiskImage -ImagePath "$macOSVHD" | Out-Null

# Add macOS disk to virtual machine
Write-Host "Adding macOS disk to virtual machine '$name'..."
Add-VMHardDiskDrive -VMName "$name" -Path "$macOSVHD" -ControllerType SCSI

# Configure virtual machine
Write-Host "Configuring virtual machine '$name'..."
Set-VM `
  -Name "$name" `
  -ProcessorCount $cpu `
  -MemoryStartupBytes $($ram*1GB) `
  -AutomaticCheckpointsEnabled $false
Set-VMFirmware -VMName "$name" `
  -EnableSecureBoot Off `
  -FirstBootDevice $efiDisk

# Wait for user input before closing (to show any errors)
Write-Host "`nVirtual machine '$name' created successfully at $outdir\$name.`n"

## @file
# Hyper-V virtual machine creation script
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
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

# Prompt for Administrator priviledges
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  Start-Process powershell.exe -Verb RunAs -ArgumentList ("-noprofile -file `"{0}`" -elevated -pwd $pwd -name $name -version $version -cpu $cpu -ram $ram -size $size -outdir $outdir" -f ($myinvocation.MyCommand.Definition));
  exit;
}


# Create and configure virtual machine
New-VM -Generation 2 -Name "$name" -path "$outdir" -NoVHD | Out-Null
Set-VM -Name "$name" -ProcessorCount $cpu -MemoryStartupBytes $($ram*1GB)
Set-VMFirmware -VMName "$name" -EnableSecureBoot Off

# Create EFI disk
$efiDisk = "$outdir\$name\EFI.vhdx"
& powershell.exe "$($pwd)\scripts\create-macos-recovery.ps1" -version "$version"
& powershell.exe "$($pwd)\scripts\convert-efi-disk.ps1" -dest "$efiDisk"
Add-VMHardDiskDrive -VMName "$name" -Path "$efiDisk" -ControllerType SCSI

# Create macOS disk
$macOSDisk = "$outdir\$name\$name.vhdx" 
New-VHD -SizeBytes $($size*1GB) -Path "$macOSDisk" | Out-Null
Add-VMHardDiskDrive -VMName "$name" -Path "$macOSDisk" -ControllerType SCSI

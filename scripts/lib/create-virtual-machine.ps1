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


# Create new virtual machine
New-VM -Generation 2 -Name "$name" -path "$outdir" -NoVHD | Out-Null

# Configure network adapter to use the default vswitch
$networkAdapter = Get-VMNetworkAdapter -VMName "$name"
Connect-VMNetworkAdapter -VMName "$name" -Name "$($networkAdapter.name)" -SwitchName "Default Switch"

# Create EFI disk
$efiVHD = "$outdir\$name\EFI.vhdx"
& powershell.exe "$PSScriptRoot\create-macos-recovery.ps1" -version "$version"
& powershell.exe "$PSScriptRoot\convert-efi-disk.ps1" -dest "$efiVHD"
Add-VMHardDiskDrive -VMName "$name" -Path "$efiVHD" -ControllerType SCSI
$efiDisk = Get-VMHardDiskDrive -VMName "$name"

# Create post-install VHDX if tools folder is present
$toolsDir = "$($pwd)\Tools"
if (Test-Path -Path "$toolsDir") {
  $toolsVHD = "$outdir\$name\Tools.vhdx" 
  # Create and mount a new tools.vhdx disk
  $toolsDisk = New-VHD -Path "$toolsVHD" -Dynamic -SizeBytes 512MB |
    Mount-VHD -Passthru |
    Initialize-Disk -PartitionStyle "GPT" -Confirm:$false -Passthru |
    New-Partition -AssignDriveLetter -UseMaximumSize |
    Format-Volume -FileSystem "FAT32" -NewFileSystemLabel "Tools" -Confirm:$false -Force
  # Copy tools folder contents
  Copy-Item -Path "$toolsDir\*" -Recurse -Destination "$($toolsDisk.DriveLetter):\"
  # Unmount VHDX disk
  Dismount-DiskImage -ImagePath "$toolsVHD" | Out-Null
  # Add VHDX disk to virtual machine
  Add-VMHardDiskDrive -VMName "$name" -Path "$toolsVHD" -ControllerType SCSI
}

# Create macOS disk
$macOSVHD = "$outdir\$name\$name.vhdx" 
New-VHD -SizeBytes $($size*1GB) -Path "$macOSVHD" | Out-Null
Add-VMHardDiskDrive -VMName "$name" -Path "$macOSVHD" -ControllerType SCSI

# Configure virtual machine
Set-VM `
  -Name "$name" `
  -ProcessorCount $cpu `
  -MemoryStartupBytes $($ram*1GB) `
  -AutomaticCheckpointsEnabled $false
Set-VMFirmware -VMName "$name" `
  -EnableSecureBoot Off `
  -FirstBootDevice $efiDisk

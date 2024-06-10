<h1 align="center">OSX-Hyper-V</h1>
<p align="center">
  <img
    src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/graphic.png"
    alt="Graphic of Hyper-V Window"
    class="center"
    width=500px
  ><br>
  A <b>Hackintosh</b> project implementing the <a href="https://github.com/acidanthera/MacHyperVSupport">MacHyperVSupport</a> package for <b>Windows Hyper-V</b>, built on top of the <a href="https://github.com/acidanthera/OpenCorePkg">OpenCore</a> bootloader and <a href="https://github.com/Qonfused/OCE-Build">OCE-Build</a> build manager.
</p>

<div align="center">

  <a href="/LICENSE">![License](https://img.shields.io/badge/⚖_License-BSD_3_Clause-lightblue?labelColor=3f4551)</a>
  <a href="/docs/CHANGELOG.md">![SemVer](https://img.shields.io/badge/SemVer-v0.1.0-important?logo=SemVer&labelColor=3f4551)</a>
  <a href="">![macOS Versions](https://img.shields.io/badge/macOS%20Versions-10.4%20to%2014-important?labelColor=3f4551)</a>
    <a href="https://github.com/acidanthera/OpenCorePkg/releases">![OpenCore](https://img.shields.io/badge/OpenCore-0.9.8-0c7dbe?logo=Osano&logoColor=0298e1&labelColor=3f4451)</a>
  <a href="https://github.com/Qonfused/OSX-Hyper-V/actions/workflows/oce-build.yml">![OCE Build](https://github.com/Qonfused/OSX-Hyper-V/actions/workflows/oce-build.yml/badge.svg?branch=main)</a>

</div>

## ⚡Quick Links

- [Current Progress](#%EF%B8%8F-current-progress)
  - [macOS Version Support](#macos-version-support)
- [Getting Started](#-getting-started)
  - [1. Clone this repository using git](#1-clone-this-repository-using-git)
  - [2. Build this repository using OCE-Build](#2-build-this-repository-using-oce-build)
  - [3. Setting up Hyper-V](#3-setting-up-hyper-v)
  - [4. Using this EFI with macOS](#4-using-this-efi-with-macos)
- [Contributing](#-contributing)
- [License](#%EF%B8%8F-license)
- [Credits](#-credits)

## ⚙️ Current Progress

Refer to the [CHANGELOG](/docs/CHANGELOG.md) or [SemVer board](#) for changes implemented per release version.

### macOS Version Support:

> [!IMPORTANT]
> Beta versions of macOS may require the boot arg `-lilubetaall` to be set in the `boot-args` section of your config.plist. This is needed to allow Lilu and all dependent plugins to load on macOS versions that are not yet officially supported.

> [!NOTE]
> Installations of OS X Tiger (10.4) to Snow Leopard (10.6) are not possible directly. It is recommended to first install a newer version of macOS and restore to the desired version using a [disk image provided by Acidanthera](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/mac-install-dmg.html).
>
> You can also find other past InstallAssistant.dmg archives on [Archive.org](https://archive.org/details/@khronokernel).

Supported versions below include macOS versions **10.4** to **15.0**.

<table>
  <thead>
    <tr>
      <th>macOS Version</th>
      <th colspan=2>Status</th>
      <th>Minimum version</th>
      <th>Maximum version</th>
    </tr>
  </thead>
  <tbody>
  <!-- macOS 15 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/sequoia.png"
          width=25
          hspace=2
          align="top"
        />
        Sequoia
      </td>
      <td style="text-align: center;">🚧</td>
      <td>In Preview.</td>
      <td><code>(None)</code></td>
      <td><a href="https://www.apple.com/macos/macos-sequoia-preview/"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 14 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/sonoma.png"
          width=25
          hspace=2
          align="top"
        />
        Sonoma
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-sonoma/id6450717509"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 13 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/ventura.png"
          width=25
          hspace=2
          align="top"
        />
        Ventura
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-ventura/id1638787999"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 12 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/monterey.png"
          width=22
          hspace=2
          align="top"
        />
        Monterey
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-monterey/id1576738294"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 11 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/big-sur.png"
          width=25
          hspace=2
          align="top"
        />
        Big Sur
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-big-sur/id1526878132"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.15 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/catalina.png"
          width=25
          hspace=2
          align="top"
        />
        Catalina
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-catalina/id1466841314"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.14 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/mojave.png"
          width=25
          hspace=2
          align="top"
        />
        Mojave
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-mojave/id1398502828"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.13 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/high-sierra.png"
          width=25
          hspace=2
          align="top"
        />
        High Sierra
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-high-sierra/id1246284741"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.12 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/sierra.png"
          width=25
          hspace=2
          align="top"
        />
        Sierra
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="http://updates-http.cdn-apple.com/2019/cert/061-39476-20191023-48f365f4-0015-4c41-9f44-39d3d2aca067/InstallOS.dmg"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.11 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/el-capitan.png"
          width=25
          hspace=2
          align="top"
        />
        El Capitan
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="http://updates-http.cdn-apple.com/2019/cert/061-41424-20191024-218af9ec-cf50-4516-9011-228c78eda3d2/InstallMacOSX.dmg"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.10 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/yosemite.png"
          width=25
          hspace=2
          align="top"
        />
        Yosemite
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="http://updates-http.cdn-apple.com/2019/cert/061-41343-20191023-02465f92-3ab5-4c92-bfe2-b725447a070d/InstallMacOSX.dmg"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.9 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/mavericks.png"
          width=25
          hspace=2
          align="top"
        />
        Mavericks
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://archive.org/details/os-x-mavericks-10.9.5"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.8 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/mountain-lion.png"
          width=25
          hspace=2
          align="top"
        />
        Mountain Lion
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://updates.cdn-apple.com/2021/macos/031-0627-20210614-90D11F33-1A65-42DD-BBEA-E1D9F43A6B3F/InstallMacOSX.dmg"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.7 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/lion.png"
          width=25
          hspace=2
          align="top"
        />
        Lion
      </td>
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://updates.cdn-apple.com/2021/macos/041-7683-20210614-E610947E-C7CE-46EB-8860-D26D71F0D3EA/InstallMacOSX.dmg"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.6 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/snow-leopard.png"
          width=25
          hspace=2
          align="top"
        />
        Snow Leopard
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><code>(Retail)</code></td>
    </tr>
  <!-- macOS 10.5 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/leopard.png"
          width=25
          hspace=2
          align="top"
        />
        Leopard
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><code>(Retail)</code></td>
    </tr>
  <!-- macOS 10.4 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/tiger.png"
          width=25
          hspace=2
          align="top"
        />
        Tiger
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><code>(Retail)</code></td>
    </tr>
  </tbody>
</table>

Refer to [HyperV-versions.md](https://github.com/acidanthera/MacHyperVSupport/blob/master/Docs/HyperV-versions.md) for a complete breakdown of macOS compatibility with Windows Client, Server, and Hyper-V versions.

## ✨ Getting Started

If you opt to use one of the pre-built releases from this repository, you can skip to [3. Setting up Hyper-V](#3-setting-up-hyper-v).

### 1. Clone this repository using Git

To clone this repository, run the below command:
```sh
git clone https://github.com/Qonfused/OSX-Hyper-V
cd OSX-Hyper-V
```

### 2. Build this repository using OCE-Build

This project uses [OCE-Build](https://github.com/Qonfused/OCE-Build) to automatically version and build this repository's EFI.

> [!IMPORTANT]
> To run powershell scripts, you may need to set your execution policy using:
> ```powershell
> Set-ExecutionPolicy RemoteSigned
> ```

To build this project's EFI, run one of the below commands at the root of the project:
```powershell
# Build for macOS 10.8 and newer
scripts\build.ps1

# Build for macOS 10.7 and older
scripts\build.ps1 --legacy

# Build for macOS 10.4 - 10.5, 10.6 if running in 32-bit mode
scripts\build.ps1 --legacy --32-bit
```

### 3. Setting up Hyper-V

> [!NOTE]
> **MacHyperVSupport** requires Windows Server 2012 R2 / Windows 8.1 or higher. Windows Server 2016 is currently unsupported.

First check that you've [enabled Hyper-V](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v) before proceeding.
- You can enable the Hyper-V role by running the below command in PowerShell as administrator:
  ```ps
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
  ```
- After rebooting, you can check that you've successfully enabled Hyper-V by running:
  ```ps
  Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V
  ```

> [!TIP]
> After building or downloading this project's EFI, you can run the [`create-virtual-machine.ps1`](/scripts/lib/create-virtual-machine.ps1) script to quickly bootstrap a new virtual-machine (to skip the below steps).
> 
> For example:
> 
> ```powershell
> $ cd ~/Downloads/EFI-1.0.0-64-bit-DEBUG # Scripts are packaged with releases
> 
> # Use the latest version of macOS (cpu=2 cores, ram=8 GB, size=50 GB)
> $ scripts\create-virtual-machine.ps1 -name "My New Virtual Machine"
> 
> # Use an older version of macOS (cpu=4 cores, ram=16 GB, size=128 GB)
> $ scripts\create-virtual-machine.ps1 -name "Catalina" -version 10.15 -cpu 4 -ram 16 -size 128
> ```

Below outline the steps to manually create a new virtual machine for macOS:

---

#### i. Create a boot VHDX disk

Format a small (1GB) FAT32 disk initialized with GPT (GUID partition table) and mount it. This will serve as the boot partition for your macOS virtual machine and contain the OpenCore EFI folder.
- Choose one of three ways of creating VHD/VHDX disks:
  - (A) Hyper-V Manager - Navigate to `Action > New > Hard Disk`. <br>![A-VHD](https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/README/A-VHD.png)
    - Hard disks are located under `C:\ProgramData\Microsoft\Windows\Virtual Hard Disks\`.
    - You can mount a VHD/VHDX disk by right clicking on the file and selecting `Mount`.
    - You can unmount by right-clicking on the mounted disk and selecting `Eject`.
  - (B) Disk Management - Navigate to `Action > Create VHD`. <br>![B-VHD](https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/README/B-VHD.png)
    - Make sure to initialize the disk as GPT and create a new FAT32 partition.
    - You can mount a VHD/VHDX disk with `Action > Attach VHD`.
    - You can unmount by right-clicking on the volume and selecting `Detach VHD`.
  - (C) Powershell - Create a new VHD/VHDX disk with the [`New-VHD`][ps/New-VHD] command.
    <details><summary>(Powershell command)</summary>

    ```ps
    # Run this command in PowerShell as Administrator

    $vhdpath = "$env:USERPROFILE\Desktop\EFI.vhdx"
    $vhdsize = 1GB
    $vhdpart = "GPT"
    $vhdfs = "FAT32"
    New-VHD -Path $vhdpath -Dynamic -SizeBytes $vhdsize |
      Mount-VHD -Passthru |
      Initialize-Disk -PartitionStyle $vhdpart -Confirm:$false -Passthru |
      New-Partition -AssignDriveLetter -UseMaximumSize |
      Format-Volume -FileSystem $vhdfs -Confirm:$false -Force
    ```

    </details>

Move the EFI folder (the whole folder) to the root of the VHDX disk.
- You should be left with an `EFI/` folder at the root of your EFI VHDX disk.

[ps/New-VHD]: https://learn.microsoft.com/en-us/powershell/module/hyper-v/new-vhd

---

#### ii. Create a macOS installer/recovery VHDX disk
Create or add an installer disk with either of the below methods:
- (A) Download a BaseSystem or Recovery image file directly from Apple using [macrecovery.py][OpenCorePkg]:
  - Follow the [Dortania-Guide][Dortania-Guide/Installer#Windows] for steps on downloading macOS installer images.
  - Move both `.chunklist` and `.dmg` files downloaded by macrecovery to your EFI VHDX disk under a new folder named `com.apple.recovery.boot`. You should be left with both an `EFI/` and `com.apple.recovery.boot/` folder at the root of your EFI VHDX disk.
- (B) Convert a DMG installer to a VHDX disk with [`qemu-img`][qemu-img/docs]:
  - If you already have a DMG installer for macOS (e.g. on Sierra and older), you can convert the installer image to a VHDX disk directly by running qemu-img with the command:
    ```powershell
    qemu-img.exe convert -f raw -O vhdx InstallMacOSX.dmg InstallMacOSX.vhdx
    ```

[qemu-img/docs]: https://cloudbase.it/qemu-img-windows/
[OpenCorePkg]: https://github.com/acidanthera/OpenCorePkg/releases
[Dortania-Guide/Installer#Windows]: https://dortania.github.io/OpenCore-Install-Guide/installer-guide/windows-install.html

---

#### iii. Creating the macOS Virtual Machine

In the Hyper-V Manager, navigate to `Action > New > Virtual Machine`.
![3-New-VM](https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/README/3-New-VM.png)

Configure the below options while going through the wizard:
- **Specify Generation**: Choose `Generation 2`.
- **Assign Memory**: Allocate at least `4096 MB` (recommended is `8192 MB` for Big Sur and newer).
- **Configure Networking**: Choose the default network switch.
- **Connect Virtual Hard Disk**: Name and select the size of the disk to install macOS on.

Once created, right click on your new virtual-machine (under the 'Virtual Machines' section of the window), and select `Settings`.
![3-VM-Settings](https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/README/3-VM-Settings.png)

Then configure the below options under the Hardware section:
- Navigate to 'Security' and uncheck `Enable Secure Boot` (disable).
- Navigate to 'SCSI Controller' and add a new hard drive for your EFI VHDX (and installer VHDX if applicable).
  - You'll need to attach your EFI VHDX with a location value of `0` and change the location value for your main virtual hard disk to a different value (e.g. `1` or `2`). This is to ensure that the EFI disk is the first disk in the boot order.

---

### 4. Using this EFI with macOS

Installation of macOS should fall in line with the [Installation Process][Dortania-Guide/Installation-Process] section of the Dortania Guide. Some additional post-install sections are provided to facilitate with Hyper-V (or project) specifics.

[Dortania-Guide/Installation-Process]: https://dortania.github.io/OpenCore-Install-Guide/installation/installation-process.html

#### Limitations

There are some known limitations with the base configuration for Hyper-V:

- Display Resolution
  - The default virtual display resolution is set to a 1024x768 resolution and is not resizable.
- Graphics Acceleration
  - By default, macOS will run without graphics acceleration using VESA graphics drivers (CPU). Additionally, display graphics is limited to 3 MB of video memory.
  - GPU acceleration is possible through [Discrete Device Assignment (DDA)][aka.ms/dda] using a supported GPU, however there exist a couple major caveats:
    - AMD GPUs (particularly Navi and older GPUs) generally have poor compatibility with macOS through DDA. Natively supported NVIDIA GPUs (using driver v465 or later on Windows) tend to have the best results.
    - GPU patching with Lilu and WhateverGreen is currently not supported (refer to [#2299](https://github.com/acidanthera/bugtracker/issues/2299) for tracking). This also applies to other kexts like NootedRed/NootedRX that use Lilu.
- Audio Support
  - By default, Hyper-V does not expose an audio device to macOS.

> [!NOTE]
> DDA is only available for Windows Server and Microsoft Hyper-V Server versions 2016 and newer. Windows Pro and Windows Enterprise users have no support for DDA with Hyper-V.

[aka.ms/dda]: https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/deploy/deploying-graphics-devices-using-dda

#### iServices

To enable **iServices** functionality, you can:
1. Generate SMBIOS data with [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)
  - Follow the Dortania [iServices guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html#using-gensmbios) to generate new SMBIOS data for your machine.
2. For local builds of this EFI, patch *existing* SMBIOS data automatically.
  - This is automatically patched each time you run a build using the **.serialdata** file (using existing data or data generated by GenSMBIOS).
  - Refer to the [**.serialdata.example**](/src/.serialdata.example) file for an example of the entry format.

## 🔥 Contributing
Contributions of any size to this project are always welcome!

Refer to [CONTRIBUTING.md](/docs/CONTRIBUTING.md) for instructions (and tips) on making contributions to this project.

## ⚖️ License
[BSD 3-Clause License](/LICENSE).

## 🌟 Credits
- [@Goldfish64](https://github.com/Goldfish64) for creating and maintaining [MacHyperVSupport](https://github.com/acidanthera/MacHyperVSupport) and it's supporting documentation.

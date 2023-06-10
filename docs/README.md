<h1 align="center">OSX-Hyper-V</h1>
<p align="center">
  A <b>Hackintosh</b> project for implementing the <a href="https://github.com/acidanthera/MacHyperVSupport">MacHyperVSupport</a> package for <b>Windows Hyper-V</b> built on top of the <a href="https://github.com/acidanthera/OpenCorePkg">OpenCore</a> bootloader and <a href="https://github.com/Qonfused/OCE-Build">OCE-Build</a> build manager.
</p>

<div align="center">

  <a href="/LICENSE">![License](https://img.shields.io/badge/⚖_License-BSD_3_Clause-lightblue?labelColor=3f4551)</a>
  <a href="/docs/CHANGELOG.md">![SemVer](https://img.shields.io/badge/SemVer-v0.0.0-important?logo=SemVer&labelColor=3f4551)</a>
  <a href="">![macOS Versions](https://img.shields.io/badge/macOS%20Versions-10.4%20to%2014-important?labelColor=3f4551)</a>
  <a href="https://github.com/acidanthera/OpenCorePkg/releases">![OpenCore](https://img.shields.io/badge/dynamic/yaml?label=OpenCore&logo=Osano&logoColor=0298e1&labelColor=3f4451&prefix=v&query=OpenCorePkg.version&url=https%3A%2F%2Fraw.githubusercontent.com%2FQonfused%2FOSX-Hyper-V%2Fmain%2Fsrc%2Fbuild.lock)</a>
  <a href="https://github.com/Qonfused/OSX-Hyper-V/actions/workflows/oce-build.yml">![OCE Build](https://github.com/Qonfused/OSX-Hyper-V/actions/workflows/oce-build.yml/badge.svg?branch=main)</a>

</div>

## ⚡Quick Links

- [Current Progress](#%EF%B8%8F-current-progress)
  - [Limitations](#limitations)
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

> **Note** This repository is still a work in progress.
>
> Refer to the [CHANGELOG](/docs/CHANGELOG.md) or [SemVer board](#) for changes implemented per release version.

### Limitations

There are some known limitations with the base configuration for Hyper-V:

- Display Resolution
  - The default virtual display resolution is set to a 1024x768 resolution and is not resizable.
- Graphics Acceleration
  - By default, macOS will run without graphics acceleration using VESA graphics drivers (CPU). Additionally, display graphics is limited to 3 MB of video memory.
  - GPU acceleration is however possible through [Discrete Device Assignment (DDA)][aka.ms/dda] with a supported GPU.
    > **Note** DDA is only available for Windows Server and Microsoft Hyper-V Server versions 2016 and newer. Windows Pro and Windows Enterprise users have no support for DDA with Hyper-V.
- Audio Support
  - By default, Hyper-V does not expose an audio device to macOS.

[aka.ms/dda]: https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/deploy/deploying-graphics-devices-using-dda

Refer to [HyperV-versions.md](https://github.com/acidanthera/MacHyperVSupport/blob/master/Docs/HyperV-versions.md) for a complete breakdown of macOS compatibility with Windows Client, Server, and Hyper-V versions.

### macOS Version Support:
Supported versions below include macOS versions **10.4** to **14.0**.

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
  <!-- macOS 14 -->
    <tr>
      <td>
        <img
          src="/docs/assets/sonoma.png"
          width=25
          hspace=2
          align="top"
        />
        Sonoma
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><a href="https://www.apple.com/macos/sonoma-preview/"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 13 -->
    <tr>
      <td>
        <img
          src="/docs/assets/ventura.png"
          width=25
          hspace=2
          align="top"
        />
        Ventura
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-ventura/id1638787999"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 12 -->
    <tr>
      <td>
        <img
          src="/docs/assets/monterey.png"
          width=22
          hspace=2
          align="top"
        />
        Monterey
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-monterey/id1576738294"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 11 -->
    <tr>
      <td>
        <img
          src="/docs/assets/big-sur.png"
          width=25
          hspace=2
          align="top"
        />
        Big Sur
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-big-sur/id1526878132"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.15 -->
    <tr>
      <td>
        <img
          src="/docs/assets/catalina.png"
          width=25
          hspace=2
          align="top"
        />
        Catalina
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-catalina/id1466841314"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.14 -->
    <tr>
      <td>
        <img
          src="/docs/assets/mojave.png"
          width=25
          hspace=2
          align="top"
        />
        Mojave
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-mojave/id1398502828"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.13 -->
    <tr>
      <td>
        <img
          src="/docs/assets/high-sierra.png"
          width=25
          hspace=2
          align="top"
        />
        High Sierra
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><a href="https://apps.apple.com/us/app/macos-high-sierra/id1246284741"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.12 -->
    <tr>
      <td>
        <img
          src="/docs/assets/sierra.png"
          width=25
          hspace=2
          align="top"
        />
        Sierra
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><a href="http://updates-http.cdn-apple.com/2019/cert/061-39476-20191023-48f365f4-0015-4c41-9f44-39d3d2aca067/InstallOS.dmg"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.11 -->
    <tr>
      <td>
        <img
          src="/docs/assets/el-capitan.png"
          width=25
          hspace=2
          align="top"
        />
        El Capitan
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><a href="http://updates-http.cdn-apple.com/2019/cert/061-41424-20191024-218af9ec-cf50-4516-9011-228c78eda3d2/InstallMacOSX.dmg"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.10 -->
    <tr>
      <td>
        <img
          src="/docs/assets/yosemite.png"
          width=25
          hspace=2
          align="top"
        />
        Yosemite
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><a href="http://updates-http.cdn-apple.com/2019/cert/061-41343-20191023-02465f92-3ab5-4c92-bfe2-b725447a070d/InstallMacOSX.dmg"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.9 -->
    <tr>
      <td>
        <img
          src="/docs/assets/mavericks.png"
          width=25
          hspace=2
          align="top"
        />
        Mavericks
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><a href="https://archive.org/details/os-x-mavericks-10.9.5"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.8 -->
    <tr>
      <td>
        <img
          src="/docs/assets/mountain-lion.png"
          width=25
          hspace=2
          align="top"
        />
        Mountain Lion
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><a href="https://updates.cdn-apple.com/2021/macos/031-0627-20210614-90D11F33-1A65-42DD-BBEA-E1D9F43A6B3F/InstallMacOSX.dmg"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.7 -->
    <tr>
      <td>
        <img
          src="/docs/assets/lion.png"
          width=25
          hspace=2
          align="top"
        />
        Lion
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><a href="https://updates.cdn-apple.com/2021/macos/041-7683-20210614-E610947E-C7CE-46EB-8860-D26D71F0D3EA/InstallMacOSX.dmg"><code>(Latest)</code></a></td>
    </tr>
  <!-- macOS 10.6 -->
    <tr>
      <td>
        <img
          src="/docs/assets/snow-leopard.png"
          width=25
          hspace=2
          align="top"
        />
        Snow Leopard
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><code>(Retail)</code></td>
    </tr>
  <!-- macOS 10.5 -->
    <tr>
      <td>
        <img
          src="/docs/assets/leopard.png"
          width=25
          hspace=2
          align="top"
        />
        Leopard
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><code>(Retail)</code></td>
    </tr>
  <!-- macOS 10.4 -->
    <tr>
      <td>
        <img
          src="/docs/assets/tiger.png"
          width=25
          hspace=2
          align="top"
        />
        Tiger
      </td>
      <td style="text-align: center;">🚧</td>
      <td>Untested.</td>
      <td><code>(None)</code></td>
      <td><code>(Retail)</code></td>
    </tr>
  </tbody>
</table>

## ✨ Getting Started
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/Qonfused/OSX-Hyper-V)

If you opt to use one of the pre-built releases from this repository, you can skip to [3. Setting up Hyper-V](#3-setting-up-hyper-v).

### 1. Clone this repository using Git

To clone this repository locally with submodules, run the below commands:
```sh
git clone --recurse-submodules https://github.com/Qonfused/OSX-Hyper-V
cd OSX-Hyper-V
```

If you've cloned this project without resolving submodules, you'll need to initialize them:
```sh
git submodule init
git submodule update
```

> **Note**: Optionally, you can add git aliases to always resolve submodules:
> ```sh
> git config --global alias.clone-all 'clone --recurse-submodules'
> git config --global alias.pull-all 'pull --recurse-submodules'
> ```

### 2. Build this repository using OCE-Build

This project uses the [OCE-Build](https://github.com/Qonfused/OCE-Build) to automatically version and build this repository's EFI. This is automatically included under the `scripts/lib/oce-build` folder.

#### i. Setting up OCE-Build
> **Note** **OCE-Build** must be run in a Linux or macOS environment.

For Windows users, refer to [aka.ms/wslinstall](aka.ms/wslinstall) and [aka.ms/wsl2](aka.ms/wsl2) for instructions on installing wsl and upgrading to the wsl2 kernel (recommended).
- You can install a Linux distribution directly from the Microsoft Store (e.g. [Ubuntu 20.04.5 LTS](https://apps.microsoft.com/store/detail/ubuntu-20045-lts/9MTTCL66CPXJ)).
- Alternatively, you can [setup devcontainers](https://code.visualstudio.com/docs/devcontainers/containers#_installation) with Docker and VSCode to run a containerized Linux environment on top of the wsl backend.
  - The [devcontainer](/.devcontainer/devcontainer.json) for this project will setup and build the project automatically upon container creation.

For Linux users (or wsl), ensure you install the following packages:
- Install with `sudo apt install curl libarchive-tools acpica-tools`
- Check with `curl --version`, `bsdtar --version`, or `iasl -v`

#### ii. Building an EFI target
To build this project's EFI, run one of the below commands at the root of the project:
```sh
# Build for macOS 10.8 and newer
bash scripts/build.sh

# Build for macOS 10.7 and older
bash scripts/build.sh --legacy

# Build for macOS 10.4 - 10.5, 10.6 if running in 32-bit mode
bash scripts/build.sh --legacy --32-bit
```

### 3. Setting up Hyper-V

> **Note** **MacHyperVSupport** currently requires Windows Server 2012 R2 / Windows 8.1 or higher. Windows Server 2016 is unsupported.

First check that you've [enabled Hyper-V](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v) before proceeding.
- You can run PowerShell as administrator and enable the Hyper-V role by running the below command:
  ```ps
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
  ```
- After rebooting, you can check that you've successfully enabled Hyper-V by running:
  ```ps
  Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V
  ```

#### i. Create a boot VHDX disk

Format a small (1GB) FAT32 disk initialized with GPT (GUID partition table) and mount it. This will serve as the boot partition for your macOS virtual machine and contain the OpenCore EFI folder.
- Choose one of three ways of creating VHD/VHDX disks:
  - (A) Hyper-V Manager - Navigate to `Action > New > Hard Disk`.
    - Hard disks are located under `C:\ProgramData\Microsoft\Windows\Virtual Hard Disks\`.
    - You can mount a VHD/VHDX disk by right clicking on the file and selecting `Mount`.
    - You can unmount by right-clicking on the mounted disk and selecting `Eject`.
  - (B) Disk Management - Navigate to `Action > Create VHD`.
    - You can mount a VHD/VHDX disk with `Action > Attach VHD`.
    - You can unmount by right-clicking on the volume and selecting `Detach VHD`.
  - (C) Powershell - Create a new VHD/VHDX disk with the [`New-VHD`][ps/New-VHD] command.
    <details><summary>(Powershell command)</summary>

    ```ps
    $vhdpath = "$env:USERPROFILE\Desktop\EFI.vhdx"
    $vhdsize = 1GB
    $vhdpart = "GPT"
    $vhdfs = "FAT32"
    # Run this command in PowerShell as Administrator
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

#### ii. Create a macOS installer/recovery VHDX disk
Create or add an installer disk by either:
- (A) Convert a DMG installer to a VHDX disk with [`qemu-img`][qemu-img/docs]:
  - If you already have a DMG installer for macOS (e.g. on Sierra and older), you can convert the installer image to a VHDX disk directly by running:
    ```sh
    qemu-img convert -f raw -O vhdx InstallMacOSX.dmg InstallMacOSX.vhdx
    ```
- (B) Download a BaseSystem or RecoveryImage file directly from Apple using [macrecovery.py][OpenCorePkg]:
  - Follow the [Dortania-Guide][Dortania-Guide/Installer#Windows] for steps on downloading macOS installer images.
  - Move both `.chunklist` and `.dmg` files downloaded by macrecovery to your EFI VHDX disk under a new folder named `com.apple.recovery.boot`.
  - You should be left with both an `EFI/` and `com.apple.recovery.boot/` folder at the root of your EFI VHDX disk.

[qemu-img/docs]: https://qemu.readthedocs.io/en/latest/tools/qemu-img.html
[OpenCorePkg]: https://github.com/acidanthera/OpenCorePkg/releases
[Dortania-Guide/Installer#Windows]: https://dortania.github.io/OpenCore-Install-Guide/installer-guide/windows-install.html

#### iii. Creating the macOS Virtual Machine

In the Hyper-V Manager, navigate to `Action > New > Virtual Machine`.
  - Configure the below options while going through the wizard:
    - **Specify Generation**: Choose `Generation 2`
    - **Assign Memory**: Allocate at least `4096 MB` (recommended is `8192 MB`)
    - **Connect Virtual Hard Disk**: Name and select the size of the disk to install macOS on.

Once created, right click on your new virtual-machine (under the 'Virtual Machines' section of the window), and select `Settings`.
- Configure the below options under the Hardware section:
  - Navigate to 'Security' and uncheck `Enable Secure Boot` (disable).
  - Navigate to 'SCSI Controller' and add a new hard drive for your EFI VHDX (and installer VHDX if applicable).
    - You'll need to attach your EFI VHDX with a location value of `0` and change the location value for your main virtual hard disk to a different value (e.g. `1` or `2`).

### 4. Using this EFI with macOS

Installation of macOS should fall in line with the [Installation Process][Dortania-Guide/Installation-Process] section of the Dortania Guide. Some additional post-install sections are provided to facilitate with Hyper-V (or project) specifics.

[Dortania-Guide/Installation-Process]: https://dortania.github.io/OpenCore-Install-Guide/installation/installation-process.html

#### iServices

To enable **iServices** functionality, you can either:
- (A) Generate SMBIOS data with [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)
  - Follow the Dortania [iServices guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html#using-gensmbios) to generate new SMBIOS data for your machine.
- (B) For local builds of this EFI, generate and patch SMBIOS data automatically.
  - This is automatically generated each time you run a build as long as no existing **.serialdata** file exists.
  - You can re-generate this data by removing **.serialdata** and re-running the build script (or running `bash scripts/lib/oce-build/scripts/patch-serial.sh -c src/config.yml`).
  - Please refer to the notice in the build-generated **.serialdata** file under the **src/** directory for instructions on validating your serial number.

## 🔥 Contributing
Contributions of any size to this project are always welcome!

Refer to [CONTRIBUTING.md](/docs/CONTRIBUTING.md) for instructions (and tips) on making contributions to this project.

## ⚖️ License
[BSD 3-Clause License](/LICENSE).

## 🌟 Credits
- [@Goldfish64](https://github.com/Goldfish64) for creating and maintaining [MacHyperVSupport](https://github.com/acidanthera/MacHyperVSupport) and it's supporting documentation.

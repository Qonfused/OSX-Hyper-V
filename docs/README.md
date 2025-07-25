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
  <a href="/docs/CHANGELOG.md">![SemVer](https://img.shields.io/github/v/release/Qonfused/OSX-Hyper-V?label=SemVer&logo=SemVer&labelColor=3f4551)</a>
  <a href="">![macOS Versions](https://img.shields.io/badge/macOS%20Versions-10.4%20to%2026-important?labelColor=3f4551)</a>
    <a href="https://github.com/acidanthera/OpenCorePkg/releases">![OpenCore](https://img.shields.io/badge/OpenCore-1.0.5-0c7dbe?logo=Osano&logoColor=0298e1&labelColor=3f4451)</a>
  <a href="https://github.com/Qonfused/OSX-Hyper-V/actions/workflows/oce-build.yml">![OCE Build](https://github.com/Qonfused/OSX-Hyper-V/actions/workflows/oce-build.yml/badge.svg?branch=main)</a>

</div>

## ⚡Quick Links

- [Current Progress](#%EF%B8%8F-current-progress)
  - [macOS Version Support](#macos-version-support)
- [Getting Started](#-getting-started)
  - [1. Clone this repository using git](#1-clone-this-repository-using-git)
  - [2. Configure OpenCore for your hardware](#2-configure-opencore-for-your-hardware)
    - [Intel](#intel)
    - [AMD](#amd)
  - [3. Build this repository using OCE-Build](#3-build-this-repository-using-oce-build)
  - [4. Setting up Hyper-V](#4-setting-up-hyper-v)
  - [5. Using this EFI with macOS](#5-using-this-efi-with-macos)
  - [6. Troubleshooting](#6-troubleshooting)
- [Contributing](#-contributing)
- [License](#%EF%B8%8F-license)
- [Credits](#-credits)

## ⚙️ Current Progress

Refer to the [CHANGELOG](/docs/CHANGELOG.md) or [SemVer board](#) for changes implemented per release version.

### macOS Version Support:

> [!NOTE]
> Installations of OS X Tiger (10.4) to Snow Leopard (10.6) are not possible directly. It is recommended to first install a newer version of macOS and restore to the desired version using a [disk image provided by Acidanthera](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/mac-install-dmg.html).
>
> You can also find other past InstallAssistant.dmg archives on [Archive.org](https://archive.org/details/@khronokernel).

Supported versions below include macOS versions **10.4** to **26.0**.

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
  <!-- macOS 26 -->
    <tr>
      <td>
        <img
          src="https://raw.githubusercontent.com/Qonfused/OSX-Hyper-V/main/docs/assets/macOS-roundrels/_placeholder.png"
          width=25
          hspace=2
          align="top"
        />
        Tahoe
      </td>
      <td style="text-align: center;">🚧</td>
      <td>In Progress.</td>
      <td><code>(None)</code></td>
      <td><a href="https://www.apple.com/macos/macos-tahoe-preview/"><code>(Latest)</code></a></td>
    </tr>
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
      <td style="text-align: center;">✅</td>
      <td>Supported.</td>
      <td><code>(None)</code></td>
      <td><a href="https://www.apple.com/macos/macos-sequoia/"><code>(Latest)</code></a></td>
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

If you opt to use one of the pre-built releases from this repository, you can skip to [2. Configure OpenCore for your hardware](#2-configure-opencore-for-your-hardware) to setup OpenCore for your specific CPU, and then proceed to [4. Setting up Hyper-V](#4-setting-up-hyper-v) to create a new virtual machine.

Those who wish to build this project from source can follow the below steps to clone this repository, build the EFI, and setup Hyper-V.

### 1. Clone this repository using Git

To clone this repository, run the below command:
```sh
git clone https://github.com/Qonfused/OSX-Hyper-V
cd OSX-Hyper-V
```

> [!TIP]
> Alternatively, you can use the curl command to download and extract the tarball from GitHub:
> ```pwsh
> iwr https://github.com/Qonfused/OSX-Hyper-V/archive/refs/heads/main.zip -OutFile OSX-Hyper-V-main.zip | tar -xf OSX-Hyper-V-main.zip
> rm OSX-Hyper-V-main.zip
> cd OSX-Hyper-V-main
> ```

### 2. Configure OpenCore for your hardware

> [!NOTE]
> **MacHyperVSupport** requires Windows Server 2012 R2 / Windows 8.1 or higher. Windows Server 2016 is currently unsupported.

As Hyper-V is a type-1 hypervisor, it requires a compatible CPU to run macOS. This means that any passed-through hardware needs to be supported or patched as you would on a bare-metal Hackintosh.

There is no GPU acceleration by default, which means any graphics-related tasks will be driven by the CPU and will be slow. To get GPU acceleration, you will need to use Discrete Device Assignment (DDA) to pass through a supported GPU for acceleration.

> [!IMPORTANT]
> Unlike bare metal, iGPU/APUs are not visible to the VM by default and require DDA support for GPU passthrough. Additionally, most discrete GPUs, even if natively supported, may not work if passed through with DDA. Refer to the [limitations](https://github.com/Qonfused/OSX-Hyper-V?tab=readme-ov-file#limitations) section for an overview of current support in Hyper-V.

For a general overview of hardware support, refer to the [CPU Support](https://dortania.github.io/OpenCore-Install-Guide/macos-limits.html#cpu-support) and [GPU Support](https://dortania.github.io/OpenCore-Install-Guide/macos-limits.html#gpu-support) sections of the Dortania guide for a breakdown of hardware support by macOS version.

To setup OpenCore for your specific CPU, follow the Intel or AMD section of the [Dortania Install](https://dortania.github.io/OpenCore-Install-Guide/) guide for your CPU family. Ignore any USB mapping, firmware, or motherboard-specific sections as they are not relevant to Hyper-V (which provides its own virtualized hardware).

See the below sections for a breakdown of hardware support and Hyper-V-specific configuration.

#### Intel

> [!NOTE]
> For Intel Tiger Lake and newer (11th Gen and newer), you can follow the Dortania install guide for [Comet Lake](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html).
>
> You'll need to spoof your CPU as Comet Lake by using the below CPUID patch:
> ```yml
> Kernel:
>   Emulate:
>     Cpuid1Data: Data | <55 06 0A 00 00 00 00 00 00 00 00 00 00 00 00 00>
>     Cpuid1Mask: Data | <FF FF FF FF 00 00 00 00 00 00 00 00 00 00 00 00>
> ```
> Add this to the **config.yml** file under the `Kernel -> Emulate` section or
> manually to the generated **config.plist** file under `EFI/OC/config.plist`.
>
> See [Cpuid1Data](https://github.com/Qonfused/OCE-Build/blob/main/docs/schema.md#kernel---emulate---cpuid1data) for other available CPUID patches for better XCPM support.

Below is a list of supported CPU generations and their initial and latest supported macOS versions:

##### Desktop CPUs:

| Generation                      | Initial Support            | Latest Support              |
| ------------------------------- | -------------------------- | --------------------------- |
| [Penryn](ID-1)                  | OS X 10.4.10 (Tiger)       | macOS 10.13.6 (High Sierra) |
| [Clarkdale (1st Gen)](ID-2)     | OS X 10.6.3 (Snow Leopard) | macOS 12 (Monterey)         |
| [Sandy Bridge (2nd Gen)](ID-3)  | OS X 10.6.7 (Snow Leopard) | macOS 12 (Monterey)         |
| [Ivy Bridge (3rd Gen)](ID-4)    | OS X 10.7 (Lion)           | macOS 12 (Monterey)         |
| [Haswell (4th Gen)](ID-5)       | OS X 10.8 (Mountain Lion)  | (Current)                   |
| [Skylake (6th Gen)](ID-6)       | OS X 10.11 (El Capitan)    | (Current)                   |
| [Kaby Lake (7th Gen)](ID-7)     | macOS 10.12 (Sierra)       | (Current)                   |
| [Coffee Lake (8th Gen)](ID-8 )  | macOS 10.13 (High Sierra)  | (Current)                   |
| [Comet Lake (10th Gen)](ID-9)   | macOS 10.15 (Catalina)     | (Current)                   |

[ID-1]: https://dortania.github.io/OpenCore-Install-Guide/config.plist/penryn.html
[ID-2]: https://dortania.github.io/OpenCore-Install-Guide/config.plist/clarkdale.html
[ID-3]: https://dortania.github.io/OpenCore-Install-Guide/config.plist/sandy-bridge.html
[ID-4]: https://dortania.github.io/OpenCore-Install-Guide/config.plist/ivy-bridge.html
[ID-5]: https://dortania.github.io/OpenCore-Install-Guide/config.plist/haswell.html
[ID-6]: https://dortania.github.io/OpenCore-Install-Guide/config.plist/skylake.html
[ID-7]: https://dortania.github.io/OpenCore-Install-Guide/config.plist/kaby-lake.html
[ID-8]: https://dortania.github.io/OpenCore-Install-Guide/config.plist/coffee-lake.html
[ID-9]: https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html

##### Mobile CPUs:

| Generation                     | Initial Support            | Latest Support              |
| ------------------------------ | -------------------------- | --------------------------- |
| [Arrandale (1st Gen)](IM-1)    | OS X 10.6.3 (Snow Leopard) | macOS 10.13 (High Sierra)   |
| [Sandy Bridge (2nd Gen)](IM-2) | OS X 10.6.7 (Snow Leopard) | macOS 12 (Monterey)         |
| [Ivy Bridge (3rd Gen)](IM-3)   | OS X 10.7 (Lion)           | macOS 12 (Monterey)         |
| [Haswell (4th Gen)](IM-4)      | OS X 10.8 (Mountain Lion)  | macOS 12 (Monterey)         |
| [Broadwell (5th Gen)](IM-5)    | OS X 10.10 (Yosemite)      | macOS 12 (Monterey)         |
| [Skylake (6th Gen)](IM-6)      | OS X 10.11 (El Capitan)    | (Current)                   |
| [Kaby Lake (7th Gen)](IM-7)    | macOS 10.12 (Sierra)       | (Current)                   |
| [Coffee Lake (8th Gen)](IM-8)  | macOS 10.13 (High Sierra)  | (Current)                   |
| [Whiskey Lake (8th Gen)](IM-8) | macOS 10.14.1 (Mojave)     | (Current)                   |
| [Comet Lake (10th Gen)](IM-9)  | macOS 10.15.4 (Catalina)   | (Current)                   |
| [Ice Lake (10th Gen)](IM-10)    | macOS 10.15.4 (Catalina)   | (Current)                   |

[IM-1]: https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/arrandale.html
[IM-2]: https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/sandy-bridge.html
[IM-3]: https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/ivy-bridge.html
[IM-4]: https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/haswell.html
[IM-5]: https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/broadwell.html
[IM-6]: https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/skylake.html
[IM-7]: https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/kaby-lake.html
[IM-8]: https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/coffee-lake.html
[IM-9]: https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/coffee-lake-plus.html
[IM-10]: https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/icelake.html

#### AMD

> [!IMPORTANT]
> AMD CPUs require the [`Kernel -> Emulate -> DummyPowerManagement`](https://github.com/Qonfused/OCE-Build/blob/main/docs/schema.md#kernel---emulate---dummypowermanagement) option to be enabled in the config.plist as AMD does not have a native power management driver in macOS:
> ```yml
> Kernel:
>   Emulate:
>     DummyPowerManagement:   Boolean | true
> ```

Below is a list of supported CPU generations and their initial and latest supported macOS versions:

| Generation                 | Initial Support        | Latest Support      |
| -------------------------- | ---------------------- | ------------------- |
| [Bulldozer (15h)](AD-1)    | macOS 13 (High Sierra) | macOS 12 (Monterey) |
| [Jaguar (16h)](AD-1)       | macOS 13 (High Sierra) | macOS 12 (Monterey) |
| [Ryzen (17h)](AD-2)        | macOS 13 (High Sierra) | (Current)           |
| [Threadripper (19h)](AD-2) | macOS 13 (High Sierra) | (Current)           |

[AD-1]: https://dortania.github.io/OpenCore-Install-Guide/AMD/fx.html
[AD-2]: https://dortania.github.io/OpenCore-Install-Guide/AMD/zen.html

In addition to [AMD kernel patches](https://github.com/AMD-OSX/AMD_Vanilla) (for AMD CPU families 15h, 16h, 17h and 19h), the below kernel patch is required for High Sierra and above:

```yml
Kernel:
  Patch:
    - Arch:                 String  | "x86_64"
      Base:                 String  | "_cpu_syscall_init"
      Comment:              String  | "flagers - kill invalid wrmsr | 10.13+"
      Count:                Number  | 3
      Find:                 Data    | "0F30"
      Identifier:           String  | "kernel"
      MaxKernel:            String  | ""
      MinKernel:            String  | "17.0.0"
      Replace:              Data    | "9090"
```

You can also manually add the below plist entry to your config.plist:

<details><summary>Plist entry (file: <a href="https://github.com/user-attachments/files/18508274/patch.plist.zip">patch.plist.zip</a>)</summary>


```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Kernel</key>
    <dict>
        <key>Patch</key>
        <array>
            <dict>
                <key>Arch</key>
                <string>x86_64</string>
                <key>Base</key>
                <string>_cpu_syscall_init</string>
                <key>Comment</key>
                <string>flagers - kill invalid wrmsr | 10.13+</string>
                <key>Count</key>
                <integer>3</integer>
                <key>Enabled</key>
                <true/>
                <key>Find</key>
                <data>DzA=</data>
                <key>Identifier</key>
                <string>kernel</string>
                <key>Limit</key>
                <integer>0</integer>
                <key>Mask</key>
                <data></data>
                <key>MaxKernel</key>
                <string></string>
                <key>MinKernel</key>
                <string>17.0.0</string>
                <key>Replace</key>
                <data>kJA=</data>
                <key>ReplaceMask</key>
                <data></data>
                <key>Skip</key>
                <integer>0</integer>
            </dict>
        </array>
    </dict>
</dict>
</plist>
```

</details>

> [!NOTE]
> When applying the AMD kernel patches, choose a core count matching the number
> of cores assigned to the VM when configuring the CPU core count
> (i.e. the `algrey - Force cpuid_cores_per_package`) patches.
>
> For example, on a 6-Core AMD Ryzen 9600X, you may find it helpful to assign 6
> cores to the VM and use `06` for the `cpuid_cores_per_package` patch. If you
> encounter issues booting when assigning 6 cores, try assigning 8 cores instead
> and using `08` for the `cpuid_cores_per_package` patch (see [#37](https://github.com/Qonfused/OSX-Hyper-V/issues/37)).

> [!TIP]
> You can use the `amd.ps1` script to automatically generate these AMD patches for your CPU by running the below command:
> ```powershell
> .\scripts\amd.ps1 --cpu <core_count>
> ```
>
> Notice that this requires the `--cpu` option to be set to the number of cores assigned to the VM.

### 3. Build this repository using OCE-Build

This project uses [OCE-Build](https://github.com/Qonfused/OCE-Build) to automatically version and build this repository's EFI.

> [!IMPORTANT]
> To run powershell scripts, you may need to set your execution policy using:
> ```powershell
> Set-ExecutionPolicy RemoteSigned
> ```

To build this project's EFI, run one of the below commands at the root of the project:
```powershell
# Build for macOS 10.8 and newer
.\scripts\build.ps1

# Build for macOS 10.7 and older
.\scripts\build.ps1 --legacy

# Build for macOS 10.4 - 10.5, 10.6 if running in 32-bit mode
.\scripts\build.ps1 --legacy --32-bit
```

This will create a new `dist/` directory containing the EFI.vhdx virtual disk and a `dist/Scripts/` directory containing various scripts for creating and configuring the virtual machine.

### 4. Setting up Hyper-V

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
> After **building** or **downloading this project's EFI**, you can run the `create-virtual-machine.ps1` script to quickly setup a new virtual-machine.
> 
> For example, from a local build of this project:
>
> ```powershell
> # Use the latest version of macOS (cpu=2 cores, ram=8 GB, size=50 GB)
> .\dist\Scripts\create-virtual-machine.ps1 -name "My New Virtual Machine"
> 
> # Use an older version of macOS (cpu=4 cores, ram=16 GB, size=128 GB)
> .\dist\Scripts\create-virtual-machine.ps1 -name "Catalina" -version 10.15 -cpu 4 -ram 16 -size 128
> ```
> or from a downloaded release:
> ```powershell
> cd ~/Downloads/EFI-1.0.0-64-bit-DEBUG # Scripts are packaged with releases
> 
> # Use the latest version of macOS (cpu=2 cores, ram=8 GB, size=50 GB)
> .\Scripts\create-virtual-machine.ps1 -name "My New Virtual Machine"
> 
> # Use an older version of macOS (cpu=4 cores, ram=16 GB, size=128 GB)
> .\Scripts\create-virtual-machine.ps1 -name "Catalina" -version 10.15 -cpu 4 -ram 16 -size 128
> ```

> [!IMPORTANT]
> Newer macOS versions (Big Sur and newer) require 6-8 GB of RAM to boot the installer. If you are using an older version of macOS, you can use less RAM (4 GB is the minimum).

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

### 5. Using this EFI with macOS

Refer to the [Installation Process][Dortania-Guide/Installation-Process] section of the Dortania Guide. Some additional post-install sections are provided to facilitate with Hyper-V (or project) specifics.

  <!--
  Another user's suggestion for installation steps (for reference):
     1. Run PS script to create VM
     2. Start VM, open Console
     3. boot to EFI (dmg) to launch recovery menu
     4. Enter Disk Utility
     5. Choose "Msft Virtual Disk Media", Select "Erase"
     6. Name new drive "MyInteralDrive", choose AFPS for filesystem format
     7. Execute Erase
     8. Quit Disk Utility
     9. Back at main menu for the Recovery program, choose "Reinstall macOS "
    10. Select your newly minted AFPS-formatted disk
    11. Let macOS do it's thing for approx 2 hours.
  -->

A basic summary of the installation process is as follows:

1. Start the virtual machine and select the `EFI (dmg)` from the OpenCore boot menu.
   - If you created a separate macOS installer VHDX, this may also show up as `macOS Base System (External)` or `Install macOS Big Sur (External)` depending on the version of macOS you are installing.
2. Once the installer loads, open Disk Utility from the Utilities menu.
   - Select the `Msft Virtual Disk Media` (your main virtual hard disk) from the list of disks.
   - Click `Erase` to format the disk.
     - Name the disk as desired (e.g., `macOS` or `Macintosh HD`, etc.).
     - For macOS 10.13 and newer, use the `APFS` format. For older versions, use `Mac OS Extended (Journaled)`.
4. Quit Disk Utility and return to the main installer menu.
5. Select `Reinstall macOS` to start the main installer.
   - Follow the prompts to install macOS on your newly formatted disk.
   - Make sure to target the disk you just formatted (e.g., `macOS` or whatever you named it), not the EFI disk.
   - Note that this process may take a while (upwards of 30 minutes to 2 hours).
6. Once the installation is complete, the virtual machine will reboot and you should see the OpenCore boot menu again.
   - This may require multiple reboots to install additional components and finalize the installation.
7. Select the newly installed macOS disk (or whatever you named it) from the OpenCore boot menu to boot into macOS.
    - If you are still unable to boot into your macOS installation, you may need to select the installer disk again.
    - You can set this as the default boot entry by holding the `Ctrl` key while selecting the disk.

The EFI virtual disk created by this project bundles a post-installation script responsible for installing the **MacHyperVFramebuffer** driver and configuring daemons for additional Hyper-V service support. This is required to support resolution changes and the hardware cursor in macOS.

To run this script, execute the `post-install.sh` script from the EFI disk located in the `Scripts/` directory. For example, you can run the following command in Terminal after booting into the macOS installer:

```bash
cd /Volumes/EFI # Change to the EFI disk
bash ./Scripts/post-install.sh
```

You can also optionally run the `optimize-vm.sh` script to disable Spotlight indexing, reduce disk I/O, and turn off system animations. This is recommended for virtual machines with CPU-rendered graphics and limited disk performance.

```bash
cd /Volumes/EFI # Change to the EFI disk
bash ./Scripts/optimize-vm.sh
```

[Dortania-Guide/Installation-Process]: https://dortania.github.io/OpenCore-Install-Guide/installation/installation-process.html

### 6. Troubleshooting

If you encounter issues during the installation or boot process, feel free to [create a GitHub issue](https://github.com/Qonfused/OSX-Hyper-V/issues/new) and provide as much detail as possible about your setup, including:
- The version of macOS you are trying to install.
- The version of Windows you are running Hyper-V on.
- The CPU you are using (e.g. Intel i7-9700K, AMD Ryzen 5 3600, etc.).
- The number of CPU cores and amount of RAM assigned to the virtual machine.
- Any error messages you are seeing in the OpenCore boot menu or during the installation process.

There are however some common issues that you may encounter, outlined below:
- Early reboot after selecting the installer (`#[EB.MM.AKM|!] Err(0xE) <- EB.MM.MKP`)
  - This usually indicates that the macOS installer does not have enough memory to boot. Make sure you have at least 6-8 GB of RAM for macOS 11 Big Sur and newer, or at least 4 GB for older versions (Catalina and older).
  - See [#44](https://github.com/Qonfused/OSX-Hyper-V/issues/44) for more details.
- Stuck on `vm_shared_region_start_address()` or `failed lookup: com.apple.dock.fullscreen`:
  - Stalling around here usually means the macOS installer GUI couldn't start. You may find other messages related to `WindowServer` or `gui/0` requesting other services (namely `logd` or `recoveryosd`), which serve as a hint for this issue.
  - Try restarting and clearing NVRAM (using the `Reset NVRAM` option in the OpenCore boot menu) to see if that resolves the issue.
  - A good workaround if this issue persists is to instead install macOS Catalina (10.15), and then upgrade to the desired version of macOS after installation. See [#53](https://github.com/Qonfused/OSX-Hyper-V/issues/53#issuecomment-3089641792) for details.
- Reboot after installation when selecting installer.
  - This is relatively normal behavior. It may require multiple reboots (selecting the macOS installer each time) to complete the installation process.

#### Limitations

There are some known limitations with the base configuration for Hyper-V:

- Display Resolution
  - The default virtual display resolution is set to a 1024x768 resolution, but can be reconfigured by modifying the `SupportedResolutions` entry in MacHyperVFramebuffer's Info.plist file.
  - See issue [#6](https://github.com/Qonfused/OSX-Hyper-V/issues/6) for more details.
- Graphics Acceleration
  - By default, macOS will run using the MacHyperVFramebuffer synthetic graphics driver, which provides basic graphics support (with 8 MB of video memory). This driver is sufficient for basic tasks, but does not provide hardware acceleration or advanced graphics features.
  - GPU acceleration is possible through [Discrete Device Assignment (DDA)][aka.ms/dda] using a supported GPU, however there exist a couple major caveats:
    - AMD GPUs (particularly Navi and older GPUs) generally have poor compatibility with macOS through DDA. Natively supported NVIDIA GPUs (using driver v465 or later on Windows) tend to have the best results.
    - GPU patching with Lilu and WhateverGreen is currently not supported (refer to [#2299](https://github.com/acidanthera/bugtracker/issues/2299) for tracking). This also applies to other kexts like NootedRed/NootedRX that use Lilu.
- Audio Support
  - By default, Hyper-V does not expose an audio device to macOS.
  - See issue [#9](https://github.com/Qonfused/OSX-Hyper-V/issues/9) for more details.

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
- [@ssdsl0126](https://github.com/ssdsl0126) for testing and discoverying a fix for recoveryOS boot issues on AMD Ryzen 5950x CPUs.

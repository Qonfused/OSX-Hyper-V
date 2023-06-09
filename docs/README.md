<h1 align="center">OSX-Hyper-V</h1>
<p align="center">
  A <b>Hackintosh</b> project for implementing the <a href="https://github.com/acidanthera/MacHyperVSupport">MacHyperVSupport</a> package for <b>Windows Hyper-V</b> built on top of the <a href="https://github.com/acidanthera/OpenCorePkg">OpenCore</a> bootloader and <a href="https://github.com/Qonfused/OCE-Build">OCE-Build</a> build manager.
</p>

<div align="center">

  <!--3rd item: <a href="">![Supported Versions](https://img.shields.io/badge/Supported%20Versions-{A}%20%7C%20{B}-important?labelColor=3f4551)</a> -->

  <a href="/LICENSE">![License](https://img.shields.io/badge/⚖_License-BSD_3_Clause-lightblue?labelColor=3f4551)</a>
  <a href="/docs/CHANGELOG.md">![SemVer](https://img.shields.io/badge/SemVer-v0.0.0-important?logo=SemVer&labelColor=3f4551)</a>
  <a href="https://github.com/acidanthera/OpenCorePkg/releases">![OpenCore](https://img.shields.io/badge/dynamic/yaml?label=OpenCore&logo=Osano&logoColor=0298e1&labelColor=3f4451&prefix=v&query=OpenCorePkg.version&url=https%3A%2F%2Fraw.githubusercontent.com%2FQonfused%2FOSX-Hyper-V%2Fmain%2Fsrc%2Fbuild.lock)</a>
  <a href="https://github.com/Qonfused/OSX-Hyper-V/actions/workflows/oce-build.yml">![OCE Build](https://github.com/Qonfused/OSX-Hyper-V/actions/workflows/oce-build.yml/badge.svg?branch=main)</a>

</div>

## ⚡Quick Links

- [Current Progress](#%EF%B8%8F-current-progress)
  - [macOS Version Support](#macos-version-support)
- [Getting Started](#-getting-started)
  - [1. Clone this repository using git](#1-clone-this-repository-using-git)
  - [2. Build this repository using OCE-Build](#2-build-this-repository-using-oce-build)
  - [3. Using this EFI with macOS](#3-using-this-efi-with-macos)
- [Contributing](#-contributing)
- [License](#%EF%B8%8F-license)
- [Credits](#-credits)

## ⚙️ Current Progress

> **Note** This repository is still a work in progress.
>
> See [MacHyperVSupport](https://github.com/acidanthera/MacHyperVSupport/blob/master/Docs/HyperV-versions.md) for a complete breakdown of macOS compatibility with Windows Client, Server, and Hyper-V versions.
>
> Refer to the [CHANGELOG](/docs/CHANGELOG.md) or [SemVer board](#) for changes implemented per release version.

### macOS Version Support:
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
> **Note** **OCE-Build** must be run in a Linux or macOS environment.
> 
> For Windows users, refer to [aka.ms/wslinstall](aka.ms/wslinstall) and [aka.ms/wsl2](aka.ms/wsl2) for instructions on installing wsl and upgrading to the wsl2 kernel (recommended).
> - You can install a Linux distribution directly from the Microsoft Store (e.g. [Ubuntu 20.04.5 LTS](https://apps.microsoft.com/store/detail/ubuntu-20045-lts/9MTTCL66CPXJ)).
> - Alternatively, you can [setup devcontainers](https://code.visualstudio.com/docs/devcontainers/containers#_installation) with Docker and VSCode to run a containerized Linux environment on top of wsl. The [devcontainer](/.devcontainer/devcontainer.json) for this project will setup and build the project automatically upon container creation.
>
> For Linux users (or wsl), ensure you have the following commands available:
> - **cURL**
>   - Check with `curl --version`
>   - Install with `sudo apt install curl`
> - **bsdtar**
>   - Check with `bsdtar --version`
>   - Install with `sudo apt install libarchive-tools`
> - **iasl**
>   - Check with `iasl -v`
>   - Install with `sudo apt install acpica-tools`

To build this project's EFI, run the below command at the root of the project:
```sh
# Build for macOS 10.7 and newer
bash scripts/build.sh

# Build for macOS 10.4 - 10.5, 10.6 if running in 32-bit mode
bash scripts/build.sh --32-bit
```

### 3. Using this EFI with macOS
> **WIP**

> **Note** To enable **iServices** functionality, please refer to the notice in
> the build-generated **.serialdata** file under the **src/** directory for instructions on validating your
> serial number. This is automatically generated each time you run a new build using the build script as long as no existing **.serialdata** file exists. Remember that you can re-generate this data by running `bash scripts/lib/oce-build/scripts/patch-serial.sh -c src/config.yml` or by removing **.serialdata** and re-running the build script.
>
> You can optionally instead download [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) follow the [iServices guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html#using-gensmbios) to generate new SMBIOS data for your machine to be applied before running the build script. You'll then need to store your SMBIOS data in a new **.serialdata** file:
> ```yaml
> MLB:                String | "M0000000000000001"
> ROM:                Data   | <112233445566>
> SystemProductName:  String | "iMac19,1"
> SystemSerialNumber: String | "W00000000001"
> SystemUUID:         String | "00000000-0000-0000-0000-000000000000"
> ```

## 🔥 Contributing
Contributions of any size to this project are always welcome!

Refer to [CONTRIBUTING.md](/docs/CONTRIBUTING.md) for instructions (and tips) on making contributions to this project.

## ⚖️ License
[BSD 3-Clause License](/LICENSE).

## 🌟 Credits
- [@Goldfish64](https://github.com/Goldfish64) for creating and maintaining [MacHyperVSupport](https://github.com/acidanthera/MacHyperVSupport). This project is wholly based off their work.

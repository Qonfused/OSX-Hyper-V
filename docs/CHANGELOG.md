# Change Log
All notable changes to this project will be documented in this file.
 
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

The latest progress can be viewed on this repository's [project board](#).

## [0.3.3] - 2025-07-17

Fixes an issue with build scripts and updates `create-macos-recovery.ps1` to no longer require an existing python installation. The updated scripts include better logging and error handling, so it is easier to diagnose any issues creating the VM.

## Fixes
- Fix build script patch arguments ([`e50fb6d`](https://github.com/Qonfused/OSX-Hyper-V/commit/e50fb6d9869438556ddc8224a425f924b2a67938))

## Changed
- Update scripts to include logging, remove python3 requirement ([`7ccd8b80`](https://github.com/Qonfused/OSX-Hyper-V/commit/7ccd8b80b85b511d4c1aee3cfc533de9bcbab370))

## Added
- Added amd.ps1 script ([`dadaa79`](https://github.com/Qonfused/OSX-Hyper-V/commit/dadaa796e74029b0e8189db34ec95b4481949e39))

## [0.3.2] - 2025-07-11

Fixes an issue with iCloud login due to missing `hv_vmm_present` kernel patches.

## Fixes
- Prevent plist overrides from clearing kernel patches ([`e689108`](https://github.com/Qonfused/OSX-Hyper-V/commit/e689108d397935c26b4e5ad392fa222d83a44e98))

## [0.3.1] - 2025-07-03

Fixes an issue with `convert-efi-disk.ps1` script not correctly locating folders from release artifacts.

## Fixes
- Fix post-install folder paths ([`d701770`](https://github.com/Qonfused/OSX-Hyper-V/commit/d701770b53499c8d3f16347813985e5c29ec26b3))

## [0.3.0] - 2025-07-02

A major update introducing significant improvements, new features, and internal refactoring for enhanced compatibility and user experience.

This release modernizes the Hyper-V integration stack with updated kexts, automation scripts, and configuration changes, streamlining macOS installation and post-installation on Hyper-V VMs.

## Changed
- Update License to match upstream ([`3498a02`](https://github.com/Qonfused/OSX-Hyper-V/pull/40/commits/3498a023644184ec8086442365b64cf12998212e))
- Update ACPI patches; remove WS2022 SSDT ([`1d3e69b`](https://github.com/Qonfused/OSX-Hyper-V/pull/40/commits/1d3e69bf29af5e50e7350259bacfd2908c815d06))
- Update OpenCore and MacHyperVSupport versions ([`ac04dd0`](https://github.com/Qonfused/OSX-Hyper-V/pull/40/commits/ac04dd034665250b9c3320b3b12aa2988b370a77))
- Fix IOGraphicsFamily paths and remove MaxKernel version ([`feed097`](https://github.com/Qonfused/OSX-Hyper-V/pull/40/commits/feed09783784373528a4ba9e934339eda1c0fe1e))
- Remove ACPI0007 objects from SSDT-HV-DEV [`238b571`](https://github.com/Qonfused/OSX-Hyper-V/pull/40/commits/238b571e16ef857ffa5eaf7a390f16162774f7fa)
- Remove VMHide kext, replacing with direct `hv_vmm_present` kernel patch ([`a377f97`](https://github.com/Qonfused/OSX-Hyper-V/pull/40/commits/a377f977d1c4b48d4630c5c48fa4006474b9196f); see [#46](https://github.com/Qonfused/OSX-Hyper-V/issues/46#issuecomment-2813907377))
- Disable MacHyperVFramebuffer injection (kept for post-install use) ([`a19f660`](https://github.com/Qonfused/OSX-Hyper-V/pull/40/commits/a19f660b95e1e4f397c9b0ccb581496e3cf0b725))
- Upgraded OpenCore to v1.0.5 ([`93cd2ab`](https://github.com/Qonfused/OSX-Hyper-V/commit/93cd2ab3647450be544f0883eb0f70ea0a8a574f))

## Added
- Add MacHyperVFramebuffer kext and update configuration ([`f2eb5a1`](https://github.com/Qonfused/OSX-Hyper-V/pull/40/commits/f2eb5a1b88d3fe802df57e40135049dab2d98351))
- Add post-install script to automate installation of Hyper-V daemons and MacHyperVFramebuffer ([`d888782`](https://github.com/Qonfused/OSX-Hyper-V/pull/40/commits/d888782fbb726e762a80d35609d03ed497bc93b3))
- Add amd.py script for generating AMD patches ([`26efe52`](https://github.com/Qonfused/OSX-Hyper-V/commit/26efe5282b5788f4755bad346103c6577a97ad4c))

## Fixed
- Fixed macOS install volume initialization for diskutil detection ([`fbaecc6`](https://github.com/Qonfused/OSX-Hyper-V/commit/fbaecc635db26ce3ee63bff3ca543abd29ff6bcb))
- Update README and post-install script instructions ([`aabc21a`](https://github.com/Qonfused/OSX-Hyper-V/pull/40/commits/aabc21a61cc1d098eea4b5becf277f6f35ed06f4))

## [0.2.4] - 2025-01-22

## Changed
- Update MacHyperVSupport to e987ee2 - Adds constants for macOS 15 support without requiring `-lilubetaall` ([`744f385`](https://github.com/Qonfused/OSX-Hyper-V/commit/744f3850f0e41e2c7ca24f5f183af230e3215dac))

## [0.2.3] - 2024-12-26

## Changed
- Force X64 ISA for Gen2 VMs ([`e471c83`](https://github.com/Qonfused/OSX-Hyper-V/commit/e471c834bde52f10362898b5ce9319fd6b50e4e3))

## Fixed
- README: Fix `count` field type in AMD patch ([`3f18bb6`](https://github.com/Qonfused/OSX-Hyper-V/commit/3f18bb62974b48426ec27d6e05f8a53c996f0580))

## [0.2.2] - 2024-12-08

## Added
- Added csr-active-config to NVRAM delete list ([`08fc280`](https://github.com/Qonfused/OSX-Hyper-V/commit/08fc28037db79ad947983d108787aa765c545298))
- Added OpenCore ISA switch for 32-bit OSes ([`d84213c`](https://github.com/Qonfused/OSX-Hyper-V/commit/d84213c58480bd2f75150f1a094203f2e7513c0a))

## Changed
- Upgraded OpenCore to v1.0.3 ([`0f66426`](https://github.com/Qonfused/OSX-Hyper-V/commit/0f664268253389eb70388cd5ed229c8e42e3db97))

## [0.2.1] - 2024-11-21

## Added
- Added VMHide kext for macOS Sequoia ([`d594e28`](https://github.com/Qonfused/OSX-Hyper-V/commit/d594e28e791a432a84ad665f674fa1b576fb132b))

## [0.2.0] - 2024-11-04

## Changed
- Upgraded OpenCore to v1.0.2 ([`58ccd4b`](https://github.com/Qonfused/OSX-Hyper-V/commit/58ccd4b6e1c6492fab0d704d4b2bf24b834e56f7))
- Simplified `-legacy` boot arg patch ([`36b00a7`](https://github.com/Qonfused/OSX-Hyper-V/commit/36b00a73eaf1bee4ab42b07c70f1900e7500db10))
- Refactored build script for PowerShell Core compatibility ([`31680e2`](https://github.com/Qonfused/OSX-Hyper-V/commit/31680e2a762059555ae85407db450f625cf5d939))

### Added
- Added Sonoma board-id for creating macOS Recovery ([`3bc60c6`](https://github.com/Qonfused/OSX-Hyper-V/commit/3bc60c6a2d7b5b17603123b0565d795870dfa089))

### Fixed
- Changed the default disk size to fit larger macOS Recovery images ([`25e9275`](https://github.com/Qonfused/OSX-Hyper-V/commit/25e92751264f71671e4c1287744a211d87b49482))
- Ensure build script is ran before post-install scripts ([`ee0c7e3`](https://github.com/Qonfused/OSX-Hyper-V/commit/ee0c7e3760e9b0c191fbae5fff124ef78afba0cf))
- Fixed incorrect archive metadata and extension in release artifacts ([`24ad5a2`](https://github.com/Qonfused/OSX-Hyper-V/commit/24ad5a2decd27c34ea906e23ec465e685eee756f))

## [0.1.0] - 2024-02-26

### Changed
- Migrate build to new OCE-Build rewrite ([`83f31a5`](https://github.com/Qonfused/OSX-Hyper-V/pull/4/commits/83f31a53f26d0d3451ffc9215564bc8e156cb8cb))
- Updated build pipeline to use new powershell workflow ([`42a77be`](https://github.com/Qonfused/OSX-Hyper-V/pull/4/commits/42a77be235c4bccccf6664708b5547bd68008147))

### Added
- Added switches for legacy and 32-bit builds ([`2ab0c7b`](https://github.com/Qonfused/OSX-Hyper-V/pull/4/commits/2ab0c7b2b214886be6c2cc6da0595e4ff1e08b2a))

### Removed
- Removed old devcontainers ([`ee9a3cd`](https://github.com/Qonfused/OSX-Hyper-V/pull/4/commits/ee9a3cdcae8bf1322502705bc39f43429db2da13))

## [0.0.0] - 2023-06-15

Initial release of the project containing bug fixes, feature and documentation improvements to the original [MacHyperVSupport](https://github.com/acidanthera/MacHyperVSupport) project:

### Changed
- Updated scanpolicy for consistent installer detection ([`8f838a2`](https://github.com/Qonfused/OSX-Hyper-V/commit/8f838a2342af58ccc568ac590f850df6771c6eb9))
- Configure network adapter to use default vswitch ([`1ce9be2`](https://github.com/Qonfused/OSX-Hyper-V/commit/1ce9be20a0e7f2a1a7980b5c9f80003bf228c9b9))
- Disabled automatic checkpoints ([`de3c6ab`](https://github.com/Qonfused/OSX-Hyper-V/commit/de3c6ab29b2b9903c1e2281f6b1d8a6fe98373a8))

### Added
- Added separate `--legacy` patch for 10.7 and below ([`468bef2`](https://github.com/Qonfused/OSX-Hyper-V/commit/468bef2c552e661982de3c7cb8091a1ddd9fd495))
- Added small boot fixes and security fixes ([`2764ade`](https://github.com/Qonfused/OSX-Hyper-V/commit/2764ade116b944e8b8ace6dbf183609356d8c02e))
- Added powershell scripts for VM creation automation ([`6badacf`](https://github.com/Qonfused/OSX-Hyper-V/commit/6badacfccf32c3a818fe5ea61eddbad04c8d9738))
- Added post-install daemons and tools to EFI VHD ([`c426d92`](https://github.com/Qonfused/OSX-Hyper-V/commit/c426d928ba7d2afe4bee16b8c56244668d9fec2b))
- Added post-install VHD creation ([`f2415d4`](https://github.com/Qonfused/OSX-Hyper-V/commit/f2415d41160f79d66591fe4dda1532aa92b6c9c0))

### Fixed
- Fixed recovery image packing script ([`46bfb01`](https://github.com/Qonfused/OSX-Hyper-V/commit/46bfb01c4c38abc0a75f3d5ae410184538754c6a))
- Fixed patch-serial script for linux/WSL2 ([`7557d71`](https://github.com/Qonfused/OSX-Hyper-V/commit/7557d713a5a0551ccd5ac0c40fc0356a1cac1dc5))

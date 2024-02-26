# Change Log
All notable changes to this project will be documented in this file.
 
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

The latest progress can be viewed on this repository's [project board](#).

## [0.1.0] - Unreleased

> [!NOTE]
> This release is currently in development and is not recommended for use.

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

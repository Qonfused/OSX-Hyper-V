#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2164

## @file
# MacHyperVSupport post-install script
#
# Copyright (c) 2023-2025, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##

# Change CWD for imports
__PWD__=$(pwd); cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")"/../)"

# Check if the Tools/ directory exists
if [[ ! -d "Tools" ]]; then
  echo "Tools directory not found. This script must be ran from the Scripts directory inside the EFI volume."
  exit 1
fi

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root (use sudo or run as root user)."
  exit 1
fi


PKG_BUILD_DIR="/tmp/pkg-build"
APP_SUPPORT_DIR="/Library/Application Support/MacHyperVSupport"
LAUNCH_DAEMON_DIR="/Library/LaunchDaemons"

sudo mkdir -p "${APP_SUPPORT_DIR}"
sudo mkdir -p "${LAUNCH_DAEMON_DIR}"


copy_daemon() {
  local daemon_path="$1"
  local plist_path="$2"

  local daemon_name="${daemon_path##*/}"
  local plist_name="${plist_path##*/}"

  if [[ -f "${daemon_path}" && -f "${plist_path}" ]]; then
    # Unload the daemon if it's already loaded
    if sudo launchctl list | grep -q "${daemon_name}"; then
      echo "Unloading existing daemon: ${daemon_name}"
      sudo launchctl unload "${LAUNCH_DAEMON_DIR}/${plist_name}"
    fi

    # Copy the daemon and plist to the appropriate directories
    sudo cp "${daemon_path}" "${APP_SUPPORT_DIR}/"
    sudo cp "${plist_path}" "${LAUNCH_DAEMON_DIR}/"

    # Set ownership and permissions
    sudo chown root:wheel "${APP_SUPPORT_DIR}/${daemon_name}"
    sudo chmod 755 "${APP_SUPPORT_DIR}/${daemon_name}"
    sudo chown root:wheel "${LAUNCH_DAEMON_DIR}/${plist_name}"
    sudo chmod 644 "${LAUNCH_DAEMON_DIR}/${plist_name}"

    # Load the daemon
    sudo launchctl load "${LAUNCH_DAEMON_DIR}/${plist_name}"
  else
    echo "Daemon or plist file for ${daemon_name} not found."
  fi
}


# Install each Hyper-V daemon to launchd
(
  cd "Tools" || { echo "Failed to change directory to Tools."; exit 1; }

  for plist in fish.goldfish64.*; do
    [ -e "${plist}" ] || continue
    # Extract the daemon name from the plist
    daemon="${plist%.plist}"
    daemon="${daemon#fish.goldfish64.}"
    if [[ -f "${daemon}" ]]; then
      echo "Installing daemon: ${daemon}"
      copy_daemon "${daemon}" "${plist}"
    fi
  done
)


FRAMEBUFFER_KEXT="EFI/OC/Kexts/MacHyperVFramebuffer.kext"
if [[ -d "${FRAMEBUFFER_KEXT}" ]]; then
  # Unload the kext if it's already loaded
  if kextstat | grep -q "com.apple.driver.MacHyperVFramebuffer"; then
    echo "Unloading existing MacHyperVFramebuffer kext..."
    sudo kextunload /Library/Extensions/MacHyperVFramebuffer.kext
  fi

  echo "Installing MacHyperVFramebuffer kext..."
  sudo cp -R "${FRAMEBUFFER_KEXT}" "/Library/Extensions/"
  sudo chown -R root:wheel "/Library/Extensions/MacHyperVFramebuffer.kext"
  sudo chmod -R 755 "/Library/Extensions/MacHyperVFramebuffer.kext"

  echo "Loading MacHyperVFramebuffer kext..."
  sudo kextload "/Library/Extensions/MacHyperVFramebuffer.kext"

  echo "Rebuilding kext cache..."
  sudo kextcache -i /
else
  echo "MacHyperVFramebuffer kext could not be found. Please ensure it exists in the EFI/OC/Kexts directory."
fi

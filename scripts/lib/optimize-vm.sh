#!/usr/bin/env bash

## @file
# Post-Install script - Optimizes macOS virtual machines for Hyper-V
#
# Copyright (c) 2023, Cory Bennett. All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
##


# Ask for and keep sudo alive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
osascript -e "tell application \"System Preferences\" to quit"

# Constants
KERNEL=$(uname -r)

################################################################################
#                               Boot Optimizations                             #
################################################################################

# Disables saving application state on logout/shutdown
defaults write com.apple.loginwindow TALLogoutSavesState -bool false

# Skip GUI login screen
defaults write com.apple.loginwindow autoLoginUser -bool true
# Disable login screen wallpaper
sudo defaults write /Library/Preferences/com.apple.loginwindow DesktopPicture ""

################################################################################
#                              Server Optimizations                            #
################################################################################

# Disable screen lock
defaults write com.apple.loginwindow DisableScreenLock -bool true
# Disables automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
# Disable automatic log-out
sudo defaults write GlobalPreferences com.apple.autologout.AutoLogOutDelay 0

# Enable server mode - Dedicates additional resources for server applications.
# @see https://support.apple.com/en-us/HT202528
if [[ $(cut -d. -f1 <<< "$KERNEL") -ge 15 ]]; then
  sudo nvram boot-args="serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)"
else
  serverinfo --setperfmode 1
fi

# Check for and install critical security updates daily
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate ConfigDataInstall -bool true
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -bool true
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# Disable automatic macOS/app store update downloads and restarts
defaults write com.apple.SoftwareUpdate AutomaticUpdateRestartRequired -bool false
defaults write com.apple.SoftwareUpdate AutomaticDownload -bool false

# Restart automatically on system freeze
sudo systemsetup -setrestartfreeze on

################################################################################
#                               Disk/IO Optimizations                          #
################################################################################

# Disable spotlight indexing
sudo mdutil -i off -a

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Enable additional disk image options
defaults write com.apple.DiskUtility advanced-image-options -bool true
# Show details in first aid
defaults write com.apple.DiskUtility DUShowDetailsInFirstAid -bool true
# Disable disk image checksum verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Disable hibernation
sudo pmset -a hibernatemode 0
# Remove the sleep image file to save disk space
sudo rm /Private/var/vm/sleepimage
sudo touch /Private/var/vm/sleepimage
sudo chflags uchg /Private/var/vm/sleepimage

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

################################################################################
#                             Networking Optimizations                         #
################################################################################

# Disables reading/writing .DS_Stores on SMB network shares
# @see https://support.apple.com/en-us/HT208209
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enables osascript over SSH without keygen and fulldiskaccess warnings
defaults write com.apple.universalaccessAuthWarning /System/Applications/Utilities/Terminal.app -bool true
defaults write com.apple.universalaccessAuthWarning /usr/libexec -bool true
defaults write com.apple.universalaccessAuthWarning /usr/libexec/sshd-keygen-wrapper -bool true
defaults write com.apple.universalaccessAuthWarning com.apple.Terminal -bool true

################################################################################
#                            VESA/Graphics Optimizations                       #
################################################################################

# Enable subpixel font rendering for non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Reduce motion and transparency
defaults write com.apple.Accessibility DifferentiateWithoutColor -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.universalaccess reduceMotion -int 1
defaults write com.apple.universalaccess reduceTransparency -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1

# Disable all macOS animations
defaults write -g NSScrollViewRubberbanding -int 0
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSScrollAnimationEnabled -bool false
defaults write -g NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write -g NSScrollViewRubberbanding -bool false
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
defaults write -g NSToolbarFullScreenAnimationDuration -float 0
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0
defaults write com.apple.dock springboard-page-duration -float 0
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write NSGlobalDomain NSWindowResizeTime .001

################################################################################

# Run reactivateSettings to apply the updated settings.
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
defaults write com.apple.activatesettings log true

# Kill all affected applications
for app in "cfprefsd" "Dock" "Finder" "SystemUIServer" "Terminal"; do
  killall "${app}" > /dev/null 2>&1
done

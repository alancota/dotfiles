#!/bin/bash

# Set MacOS defaults to my preference
# Some copied from the .dotfiles of:
# - @sheharyarn

# Always show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Always show Hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Open new folders in windows instead of tabs
defaults write com.apple.finder FinderSpawnTab 0

# Always search within the current folder in Finder
defaults write com.apple.finder FXDefaultSearchScope 'SCcf'

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Finder: 

# Kill Finder to refresh settings
killall Finder

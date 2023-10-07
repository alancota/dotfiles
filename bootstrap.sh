#!/bin/bash

#set -eu

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
eval "$(/opt/homebrew/bin/brew shellenv)"

if test ! $(which brew); then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Defining the Bootstrap Brew Packages
bootstrap_brew_packages=(
    zsh
    wget
    mackup
    warp
    iterm2
    1password
    google-chrome
    font-fira-mono-nerd-font
    font-roboto-mono-nerd-font
    font-droid-sans-mono-nerd-font
    font-fira-code-nerd-font
    font-meslo-lg-nerd-font
    vim
)

# Brew cask taps
bootstrap_brew_cask_taps=(
    homebrew/cask-fonts
    1password/tap
    homebrew/bundle
    homebrew/cask-versions
)

# Adding the Brew Taps
for tap in "${bootstrap_brew_cask_taps[@]}"; do
    if test ! $(brew tap | grep -i $tap); then
        brew tap $tap
    fi
done

# Installing the Bootstrap Brew Packages if needed
for package in "${bootstrap_brew_packages[@]}"; do
    if test ! $(brew ls | grep -i $package); then
        brew install $package
    fi
done

# Check for Oh My Zsh and install if we don't have it
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    echo "Installing Oh-My-Zsh"

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    echo
    echo "Oh-My-Zsh installed"
    echo

    zsh

    omz reload
fi

echo "Bootstrap done. Run install.sh next"

#!/bin/sh

# Load custom functions
source "$(dirname $0)/oh-my-zsh/functions.zsh"

p_msg "Generating a new SSH key for GitHub..."
# Usage: ssh email keyname

if [ $# != 2 ]; then
    echo
    echo "Invalid arguments"
    echo "$0 <valid-email> <ssh-key-name>"
    echo "Example: $0 alancota@gmail.com alancota"
    abort "Enter the valid arguments and try again"
fi

re="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"
if ! [[ "$1" =~ $re ]]; then
    abort "Error: the first argument is not valid email: $1"
fi

re="[^a-zA-Z_0-9\s]"
if [[ "$2" =~ $re ]]; then
    abort "Error: they ssh key is not a valid name (only allowed [a-zA-Z-_0-9]): $2"
fi

# Set variables with received arguments
email="$1"
gituser="$2"
filename="$2"_gitkey
key_passphrase=$(openssl rand -hex 16)

echo $key_passphrase | pbcopy | xargs
echo "Here is your auto-generated passphrase: $key_passphrase"
echo "Your passphrase has copied to the clipboard. Press any key to continue"
wait_for_user

# Generating a new SSH key
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key
if [ -f "${HOME}/.ssh/$filename" ]; then
    echo "SSH key ${HOME}/.ssh/$filename already exists. Do you want to delete it?"
    wait_for_user
    rm -f "${HOME}/.ssh/$filename"
fi

echo "Creating the new ssh key: ${HOME}/.ssh/$filename"
ssh-keygen -q -t ed25519 -C "$email" -f "${HOME}/.ssh/$filename" -N "$key_passphrase"

# Adding your SSH key to the ssh-agent
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent
eval "$(ssh-agent -s)"

# Create the config file if it doesn't exist
if [ ! -f "${HOME}/.ssh/config" ]; then
    echo "${HOME}/.ssh/config file created"
    touch "${HOME}/.ssh/config"
fi

echo "Writting the new git ssh key configuration to the ${HOME}/.ssh/config"
# Appending the new ssh-key to the config file
cat >>"${HOME}/.ssh/config" <<EOL

# $gituser Github SSH key
# Generated using the ${HOME}/.dotfiles/gengitkey.sh script
# Created on $(date +"%m/%d/%Y %H:%M:%S") by ${USER}
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ${HOME}/.ssh/$filename

EOL

echo "Adding key to Apple Keychain"
ssh-add -q --apple-use-keychain ${HOME}/.ssh/$filename

# Adding your SSH key to your GitHub account
# https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account
echo "Public key content copied to the clipboard"
pbcopy <${HOME}/.ssh/$filename.pub

echo
echo "Do you want to launch launch Chrome and access github now?"
wait_for_user

if test ! $(which chrome-cli); then
    echo "Installing chrome-cli Brew package"
    brew install chrome-cli
fi

# Launching Chrome using chrome-cli: https://github.com/prasmussen/chrome-cli
echo "Launching Github using Chrome"
chrome-cli open https://github.com/settings/ssh/new -n

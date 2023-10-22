#!/bin/sh

set -ue

echo "Here we go..."

echo

echo "Creating symbolic links..."
source symlinks

echo
echo "Homebrew bundle starting now. Grab a coffee... "

brew bundle install --file=Brewfile

echo
echo "That took forever! Restoring config files using mackup"

mackup restore -f

echo
echo "Welcome to your new MacBook Pro!"

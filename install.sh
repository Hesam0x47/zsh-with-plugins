#!/bin/bash
set -x

# Update package lists and install Zsh and curl
echo "Installing Zsh and curl..."
sudo apt update && sudo apt install -y zsh curl

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Set Zsh as the default shell for the user
echo "Setting Zsh as the default shell..."
chsh -s "$(which zsh)"

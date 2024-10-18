#!/bin/bash
set -x

# Update package lists and install Zsh and curl
echo "Installing Zsh and curl..."
sudo apt update && sudo apt install -y zsh curl

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Hesam0x47/zsh-with-plugins/refs/heads/main/install-plugins-and-others.sh)" --unattended

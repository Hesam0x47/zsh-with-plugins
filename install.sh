#!/bin/bash
set -x

# Update package lists and install Zsh and curl
echo "Installing Zsh and curl..."
sudo apt update && sudo apt install -y zsh curl

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Install zsh-autocomplete
echo "Installing zsh-autocomplete..."
git clone https://github.com/marlonrichert/zsh-autocomplete "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete"

# Enable the plugins in the ~/.zshrc file
echo "Enabling plugins in .zshrc..."
sed -i '/plugins=(git)/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete)' ~/.zshrc
echo 'source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh' >> ~/.zshrc

# Source the ~/.zshrc file to apply the changes
echo "Sourcing .zshrc to apply changes..."
source ~/.zshrc

echo "Zsh, Oh My Zsh, and plugins installed successfully!"

# Restart Zsh to apply changes
exec zsh

# Install Starship prompt
echo "Installing Starship prompt..."
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Set Zsh as the default shell for the user
echo "Setting Zsh as the default shell..."
chsh -s "$(which zsh)"

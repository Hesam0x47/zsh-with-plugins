#!/usr/bin/zsh

# Set the ZSH_CUSTOM variable
export ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# Install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Install zsh-autocomplete
echo "Installing zsh-autocomplete..."
git clone https://github.com/marlonrichert/zsh-autocomplete "$ZSH_CUSTOM/plugins/zsh-autocomplete"

# Enable the plugins in the ~/.zshrc file
echo "Enabling plugins in .zshrc..."
sed -i '/plugins=(git)/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete)' ~/.zshrc
echo 'source $ZSH_CUSTOM/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh' >> ~/.zshrc

# Source the ~/.zshrc file to apply the changes
echo "Sourcing .zshrc to apply changes..."
source ~/.zshrc

echo "Zsh, Oh My Zsh, and plugins installed successfully!"

# Restart Zsh to apply changes
exec zsh

# Install Starship prompt
echo "Installing Starship prompt..."
curl -sS https://starship.rs/install.sh | sh -s -- --yes
echo '''

#Star Ship
eval "$(starship init zsh)"
''' >> ~/.zshrc

#!/bin/bash

# Warning message
echo "WARNING: This script will replace your existing ~/.vimrc file."
read -p "Do you want to proceed? (y/n): " -n 1 -r
echo    # (Optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	    echo "Operation aborted by user."
	        exit 1
fi

# Step 1: Update and install dependencies
echo "Updating package lists and installing dependencies..."
sudo apt update && sudo apt install -y vim curl python3-pip

# Step 2: Install vim-plug (Plugin manager)
echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Step 3: Backup existing .vimrc (if it exists)
if [ -f "~/.vimrc" ]; then
	    echo "Backing up existing ~/.vimrc to ~/.vimrc.bak"
	        cp ~/.vimrc ~/.vimrc.bak
fi

# Step 4: Set up .vimrc
echo "Setting up new .vimrc configuration for vim-plug and jedi-vim..."
cat <<EOL > ~/.vimrc
" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" Add plugins here
Plug 'davidhalter/jedi-vim'

" Initialize plugin system
call plug#end()

" Optional: Other Vim settings
filetype plugin indent on
syntax on
set number
EOL

# Step 5: Install the plugins through Vim command line
echo "Installing plugins using vim-plug..."
vim +PlugInstall +qall

# Step 6: Install Python dependencies for jedi-vim
echo "Installing Python dependencies for jedi-vim..."
pip3 install jedi

echo "Setup complete! Your previous .vimrc has been backed up to ~/.vimrc.bak."


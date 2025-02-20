#!/bin/bash

# Use this script to tell the wizard any other instructions that you want it to execute

# Other packages
sudo snap install nvim --classic

# Folder structure
mkdir ~/downloads ~/repos

# Load config files
cp ./configs/.bash_aliases ~/.bash_aliases

# Clone repos
git clone https://github.com/Wamoya/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim


exit 0

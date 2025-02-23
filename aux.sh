#!/bin/bash

# Use this script to tell the wizard any other instructions that you want it to execute

# Other packages
sudo snap install nvim --classic

# Folder structure
mkdir ~/downloads ~/repos

# Load config files
cp ./configs/bash_aliases ~/.bash_aliases
# source ~/.bash_aliases # TODO: Aliases are not loaded right since this command is executed in a subshell! I have to find a way to fix it.

# Clone repos
git clone https://github.com/Wamoya/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
git clone https://github.com/Wamoya/bash_scripts.git ~/repos/bash_scripts


exit 0

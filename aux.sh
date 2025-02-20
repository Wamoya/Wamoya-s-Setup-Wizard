#!/bin/bash

# Use this script to tell the wizard any other instructions that you want it to execute
sudo snap install nvim --classic
git clone https://github.com/Wamoya/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim



exit 0

#!/bin/bash

# Color
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[0m' # No Color

# Print ascii_art.txt in the terminal
function ascii_art() {
    cat ascii_art.txt
} # ascii_art

# Greeting message
function greet() {
    cat greet.txt
}

# Installation form. Here the user can customize their installation in an interactive way
function form() {
    echo "function form(), UNIMPLEMENTED"
} # form

# Install packages
function install_packages() {
    echo -e "${YELLOW}Actualizando paquetes...${NC}"
    sudo apt update
    sudo apt upgrade

    echo -e "${YELLOW}Instalando paquetes...${NC}"
    while IFS= read -r package || [[ -n "$package" ]]; do
        if [[ -z "$package" || "$package" =~ ^# ]]; then
            continue
        fi
        echo -e "\t${YELLOW}Instalando ${package}...${NC}"
        sudo apt install -y "$package"
    done < packages.txt

    echo -e "${GREEN}Instalación completada.${NC}"
} # install_packages

ascii_art
greet
form
#if [ "$i_packages" = " y" ]; then
#    install_packages
#fi


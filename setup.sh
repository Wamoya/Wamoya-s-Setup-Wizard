#!/bin/bash


# Colors
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[0m' # No Color

# Important paths
ASCII_ART="ascii_art.txt"
GREET="greet.txt"
LICENSE_NOTICE="license_notice.txt"
#CONFIG_FILES=""



# Print an ascii art in the terminal
function ascii_art() {
    cat $ASCII_ART
} # ascii_art

# Greeting message
function greet() {
    cat $GREET
} # greet

# Mode selection (1 = start setup form. 2 = license info)
function mode() {
    while true; do
        echo "Select an option:"
        echo -e "\t1. Start wizard."
        echo -e "\t2. License information.\n"

        read -p "Waiting for user input: " option
        if [ "$option" = "1" ] || [ "$option" = "2" ]; then
            break
        else
            echo -e "${RED}Invalid input... Enter either '1' or '2'.${NC}"
        fi
    done
} # mode

# Display License information
function license() {
    echo -e $(cat $LICENSE_NOTICE)
} # license

# Installation form. Here the user can customize their installation in an interactive way
function form() {
    echo "function form(), UNIMPLEMENTED"
} # form

# Main wizard function.
function start() {
    if [ "$i_packages" = "y" ]; then
        install_packages
    fi
} # start

# Install packages
function install_packages() {
    echo -e "${YELLOW}Updating packages...${NC}"
    sudo apt update
    sudo apt upgrade

    echo -e "${YELLOW}Installing packages...${NC}"
    while IFS= read -r package || [[ -n "$package" ]]; do
        if [[ -z "$package" || "$package" =~ ^# ]]; then
            continue
        fi
        echo -e "\t${YELLOW}Installing ${package}...${NC}"
        sudo apt install -y "$package"
    done < packages.txt

    echo -e "${GREEN}All packages have been installed.${NC}"
} # install_packages



# Routine
ascii_art
greet
mode
if [ "$option" = "1" ]; then
    form
    start
else
    license
fi

exit 0

#!/bin/bash


# Colors
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[0m' # No Color

# Important paths
ASCII_ART="assets/ascii_art.txt"
GREET="assets/greet.txt"
LICENSE_NOTICE="assets/license_notice.txt"
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
    while true; do # Loop until user runs the wizard OR quit
        echo "Select an option:"
        echo -e "\t1. Start wizard."
        echo -e "\t2. License information."
        echo -e "\tq. Quit.\n"

        read -p "Waiting for user input: " option


        if [ "$option" = "1" ]; then
            break
        elif [ "$option" = "2" ]; then
            license
        elif [ "$option" = "q" ] || [ "$option" = "Q" ]; then
            exit 0
        else
            echo -e "${RED}Invalid input... Enter either '1', '2' or 'q'.${NC}"
        fi
    done
} # mode

# Display License information
function license() {
    cat $LICENSE_NOTICE
} # license

# Installation form. Here the user can customize their installation in an interactive way
function form() {
    echo "function form(), UNIMPLEMENTED"
} # form

# Main wizard function.
function start() {
    echo -e "${YELLOW}Updating packages...${NC}" # Packages should always be updated first
    sudo apt update
    sudo apt upgrade -y
    echo -e "${GREEN}All packages have been updated.${NC}"


    # NOTE:
    # The rest of this function will be a bunch of IF blocks that:
    # - Check if the user wants to set an specific configuration by looking at a variable
    # - Calls an specific function if the condition is TRUE
    #   - This function will contain the sequence that will apply the desired configuration
    if [ "$i_packages" = "y" ]; then
        install_packages
    fi
} # start

# Install packages listed in `packages.txt`
function install_packages() {
    echo -e "${YELLOW}Installing packages...${NC}"
    while IFS= read -r package || [[ -n "$package" ]]; do
        if [[ -z "$package" || "$package" =~ ^# ]]; then # Ignore if (line start with '#' OR line is empty)
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
form
start

exit 0

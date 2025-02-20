#!/bin/bash


# Colors
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
L_YELLOW='\e[93m'
ORANGE='\e[38;5;202m'
L_MAGENTA='\e[95m'
CYAN='\e[96m'
NC='\e[0m' # No Color

# Important paths
ASCII_ART="assets/ascii_art.txt"
GREET="assets/greet.txt"
LICENSE_NOTICE="assets/license_notice.txt"
#CONFIG_FILES=""



# Print an ascii art in the terminal
function ascii_art() {
    #cat $ASCII_ART
    echo -e "${L_YELLOW}$(cat $ASCII_ART)${NC}"
} # ascii_art

# Greeting message
function greet() {
    cat $GREET
} # greet

# Mode selection (1 = start setup form. 2 = license info)
function mode() {
    while true; do # Loop until user runs the wizard OR quit
        echo -e "${ORANGE}Select an option:"
        echo -e "\t1. Start wizard."
        echo -e "\t2. License information."
        echo -e "\tq. Quit.\n${NC}"

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

    while true; do
        echo "Select an option:"
        echo -e "\t1. Note 1"
        echo -e "\t2. Note 2"
        echo -e "\n\tTo return to the main menu, just press enter.\n"

        read -p "Waiting for user input: " option


        if [ "$option" = "1" ]; then
            echo "Notice 1"
        elif [ "$option" = "2" ]; then
            echo "Notice 2"
        elif [ "$option" = "" ]; then
            break
        else
            echo -e "${RED}Invalid input... Enter either '1', '2' or just press Enter.${NC}"
        fi
    done
} # license

# Installation form. Here the user can customize their installation in an interactive way
function form() {
    read -p "Install all listed packages? [y/n]: " do_packages
    if [ "$do_packages" != "y" ] && [ "$do_packages" != "n" ]; then
        echo -e "${RED}Invalid input... Enter either 'y' or 'n'.${NC}"
        exit 1
    fi

    read -p "Execute auxiliary script?    [y/n]: " do_script
    if [ "$do_script" != "y" ] && [ "$do_script" != "n" ]; then
        echo -e "${RED}Invalid input... Enter either 'y' or 'n'.${NC}"
        exit 1
    fi
} # form

# Main wizard function.
function start() {
    echo -e "${YELLOW}Updating packages...${NC}" # Packages should always be updated first, even if no packages are going to be installed
    sudo apt update
    sudo apt upgrade -y
    echo -e "${GREEN}All packages have been updated.${NC}"


    # NOTE:
    # The rest of this function will be a bunch of IF blocks that:
    # - Check if the user wants to set an specific configuration by looking at a variable
    # - Calls an specific function if the condition is TRUE
    #     - This function will contain the sequence that will apply the desired configuration
    if [ "$do_packages" = "y" ]; then
        install_packages
    fi

    if [ "$do_script" = "y" ]; then
        run_script
    fi
} # start

# Install packages listed in `packages.txt`
function install_packages() {
    echo -e "${YELLOW}Installing packages...${NC}"
    while IFS= read -r package || [[ -n "$package" ]]; do # Process each line, with no error if last line doesn't end with a new line
        if [[ -z "$package" || "$package" =~ ^# ]]; then # Ignore if (line is empty OR line starts with '#')
            continue
        fi

        echo -e "\t${YELLOW}Installing ${package}...${NC}"
        sudo apt install -y "$package"
    done < packages.txt

    echo -e "${GREEN}All packages have been installed.${NC}"
} # install_packages

# Run auxiliary script `aux.sh` -> Here, the user can write any routine that wants to run with the wizard
function run_script() {
    ./aux.sh
}


# Routine
ascii_art
greet
mode
form
start

exit 0

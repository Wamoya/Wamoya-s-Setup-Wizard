# Woya-s-Setup-Wizard
Interactive setup wizard that fulfills my personal needs.

> [!CAUTION]
> THIS PROJECT IS **NOT READY FOR USE**. IT STILL IS A WORK IN PROGRESS.

## What will you find here?
- My personal config files for various apps.
- A list of packages and applications that I consider indispensable.
- An executable bash-written setup wizard that manages everything in an interactive way.

> 📁 **Folder structure**
> - `assets/` -> Contains auxiliary files used by the wizard.
> - `configs/` -> Contains personal configuration files.
> - `packages.txt` -> A list of packages to install.
> - `setup.sh` -> The main interactive setup wizard.
> - `aux.sh` -> Auxiliary script for running extra custom routines.

## Installation
1. Clone this repository in your machine:
```bash
$ git clone https://github.com/Wamoya/Woya-s-Setup-Wizard.git
$ cd Woya-s-Setup-Wizard
```
2. Give execution permissions to the setup script:
```bash
$ chmod +x setup.sh aux.sh
```
3. Run the wizard: By running this command, you grant Super User privileges to the setup wizard.
> [!WARNING]
> **Don't execute this command if you don't know what you are doing.**
```bash
$ sudo ./setup.sh
```
4. Follow the instructions through the command prompt.

## Why would you want this?
My main goal with this project is to collect all the tools that I use in my Linux machine in one place, so that I can easily restore my system anywhen and anywhere to a "default" value.
Of course, you probably won't agree with all my choices here, and that's normal. You may download this software and customize it so that it fulfills your personal needs.

## TODO
- [ ] Add information about compatibility
- [x] Fix the callouts in README.md
- [ ] Add a customization guide
- [ ] Add the interactive elements that the current license states as required for terminal applications.
- [ ] List dependencies

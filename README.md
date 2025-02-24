# Woya-s-Setup-Wizard
Interactive setup wizard that fulfills my personal needs.

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

## Features
- Already structured interactive bash-written script, customizable and exapandible. *(see customization guide)*

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
```bash
$ ./setup.sh
```
4. Follow the instructions through the command prompt.
> [!WARNING]
> You will probably be asked for your user password at some point. **Do not enter it if you don't know what you are doing.**

## Why would you want this?
My main goal with this project is to collect all the tools that I use in my Linux machine in one place, so that I can easily restore my system anywhen and anywhere to a "default" value.
Of course, you probably won't agree with all my choices here, and that's normal. You may download this software and customize it so that it fulfills your personal needs.

## Customization guide
First, you should fork this repository to modify it. Once you have your own copy, you will be able to customize the program in several ways:
1. Through `packages.txt`. Here you can list, line by line, the packages that will be installed by the wizard. *(the wizard uses the `apt` for installing these by default)*
2. Through `aux.sh`. Here you can add any set of instructions that you want the wizard to run. It is executed as its own script alongside `setup.sh`.
3. Add your dotfiles in `configs/`. You can use this folder to store your dotfiles, which may then be referred in `aux.sh`.

If you are a more advanced user, you may be interested on reading `setup.sh`. The main thing that you might want to edit are the functions `form()` and `start()`:
- `form()`. You can easily add more interactive questions for the wizard, following the format of the ones that are already there.
- `start()`. Here you can add a bunch of IF blocks that check the answers of the interactive questions to execute additional functions, such as additional functions that you can define too.

## TODO
- [ ] Add information about compatibility
- [x] Fix the callouts in README.md
- [x] Add a customization guide
- [x] Add the interactive elements that the current license states as required for terminal applications.
- [ ] List dependencies

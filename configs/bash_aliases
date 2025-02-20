# Bash script shortcuts
alias backup="~/repos/bash_scripts/backup.sh"
alias bu="backup"

alias digitalize="~/repos/bash_scripts/digitalize.sh"
alias digi="digitalize"

alias opn="~/repos/bash_scripts/opn.sh"


# Command aliases
alias bat="batcat"
alias treee="tree -dL 2"

# Common directories
alias winu="cd /mnt/c/Users/juang/"
alias wink="cd /mnt/c/Users/juang/OneDrive/Desktop/"
alias wind="cd /mnt/c/Users/juang/Downloads/"

alias msv="cd /mnt/c/Users/juang/OneDrive/Desktop/Obsidian_vaults/MySuperVault/"
alias wb="cd /mnt/c/Users/juang/OneDrive/Desktop/Obsidian_vaults/Worldbuilding/"

# Functions
function gstatus() {
	for dir in ~/repos/*; do
		if [ -d "$dir" ]; then
			echo $(basename "$dir")
			(cd "$dir" && git status)
			echo "========================================================================"
		fi
	done
}

function duu() {
	if [ $# -eq 0 ]; then
		target="./*"
	else
		target="$@"
	fi
	for file in ${target}; do
		echo $(basename "$file")
		du --human-readable --total "$file" | grep "total"
		echo ""
	done
}

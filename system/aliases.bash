# Aliases 

# modified commands

alias cl='cd ..;ls'
alias c='cd '
alias p='cd -'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias ..='cd ..'

# new commands
alias da='date "+%A, %B %d%, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet --inet6'
alias pg='ps -Af | grep $1'         # requires an argument (note: /usr/bin/pg is installed by the util-linux package; maybe a different alias name should be used)

# privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
    alias reboot='sudo reboot'
    alias halt='sudo halt'
    alias update='sudo pacman -Su'
    alias netcfg='sudo netcfg'
fi

# ls
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# pacman aliases (if applicable, replace 'pacman' with your favorite AUR helper)
#alias pac="sudo pacman-color -S"      # default action     - install one or more packages
#alias pacu="sudo pacman-color -Syu"   # '[u]pdate'         - upgrade all packages to their newest version
#alias pacs="sudo pacman-color -Ss"    # '[s]earch'         - search for a package using one or more keywords
#alias paci="sudo pacman-color -Si"    # '[i]nfo'           - show information about a package
#alias pacr="sudo pacman-color -R"     # '[r]emove'         - uninstall one or more packages
#alias pacl="sudo pacman-color -Sl"    # '[l]ist'           - list all packages of a repository
#alias pacll="sudo pacman-color -Qqm"  # '[l]ist [l]ocal'   - list all packages which were locally installed (e.g. AUR packages)
#alias paclo="sudo pacman-color -Qdt"  # '[l]ist [o]rphans' - list all packages which are orphaned
#alias paco="sudo pacman-color -Qo"    # '[o]wner'          - determine which package owns a given file
#alias pacf="sudo pacman-color -Ql"    # '[f]iles'          - list all files installed by a given package
#alias pacc="sudo pacman-color -Sc"    # '[c]lean cache'    - delete all not currently installed package files
#alias pacm="makepkg -fci"  # '[m]ake'           - make package from PKGBUILD file in current directory

# Pacman alias examples
alias pacupg='sudo pacman-color -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin='sudo pacman-color -S'           # Install specific package(s) from the repositories
alias pacins='sudo pacman-color -U'          # Install specific package not from the repositories but from a file 
alias pacre='sudo pacman-color -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman-color -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman-color -Si'              # Display information about a given package in the repositories
alias pacreps='pacman-color -Ss'             # Search for package(s) in the repositories
alias pacloc='pacman-color -Qi'              # Display information about a given package in the local database
alias paclocs='pacman-color -Qs'             # Search for package(s) in the local database

# Additional pacman-color alias examples
alias pacupd='sudo pacman-color -Sy && sudo abs'     # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman-color -S --asdeps'        # Install given package(s) as dependencies of another package
alias pacmir='sudo pacman-color -Syy'                # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias pacudb='sudo pacman-color -Sy'                 # Update the package repos and sync the db
alias paccupd='sudo pacman-color -Qu'                # Check system for any pacman updates

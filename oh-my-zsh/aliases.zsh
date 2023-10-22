# My custom aliases for ZSH
# Updated on: 09-23-2023

# --------------------------------------------------------------------#
#                    Custom functions and tools                       #
# --------------------------------------------------------------------#

# Generate a hex secure string
# @param <number>: length of the Hex key to generate
# @example: genkey 16
alias genkey='openssl rand -hex'

# Generate a new random password
# @param <number>: length of the password key to generate
# @example: genpwd 20
alias genpwd='gen_random_password'

# Backup Home Brew and my custom Aliases to iCloud drive
alias bkp='${HOMEBREW_BACKUP}/homebrew_backup.sh'

# Git add all + commit + push
alias gall='c_gitall'

# --------------------------------------------------------------------#
#                        Zsh specific aliases                         #
# --------------------------------------------------------------------#

# Open .zshrc config in VSCode
alias ez="code ~/.zshrc"

# Reload .zshrc config
alias reload="source ~/.zshrc"

# Edit this aliast file in code
alias ea='code ${ZSH_CUSTOM}/aliases.zsh'

# Edit p10k.zsh
alias p10='code ~/.p10k.zsh'

# --------------------------------------------------------------------#
#                              Homebrew                               #
# --------------------------------------------------------------------#

# Use custom function brew_install() to install a package and run
# the homebrew_backup.sh right after
alias bib='c_brew install'
alias bub='c_brew uninstall'

# Home Brew aliases

alias bud='brew update'
alias bu='brew upgrade'
alias bi='c_brew install'
alias bic='brew install --cask'
alias bun='c_brew uninstall'
alias bs='brew search'
alias bif='brew info'
alias bls='brew ls'

# --------------------------------------------------------------------#
#                     System Commands aliases                         #
# --------------------------------------------------------------------#

# System aliases
alias c='clear'
alias h='cd ~'

# Vi to Vim
alias vi='vim'

# Go to my main Dev folder
alias d="cd ~/Dev"

# Replace cat with ccat
alias cat='ccat'

# Edit hosts file
alias eh='sudo vim /etc/hosts'

# Show hidden files
alias la='ls -ltra'

# Go to iCloud
alias ic='cd ${HOME}/iCloud'

# Check which Mac network interface is being used
alias whichif='networksetup -listnetworkserviceorder  |grep -B1 "$(route get google.com | awk "/interface/ {print \$2}")"'

# --------------------------------------------------------------------#
#                    Docker and Docker Compose                        #
# --------------------------------------------------------------------#

# Custom alias to work with docker secrets
alias dscr='gen_docsec 12'
alias dsls='docker secret ls'
alias dsrm='docker secret rm'
alias dsin='docker secret inspect'
alias ds='docker secret'

# Additional docker-compose custom aliases
# This alias will run and open the logs right away
# Important: it must be run INSIDE the directory
# where the docker-compose.yaml file is located
alias dcrun='dcupd && dclf'

# Docker ps with colors
alias dpsc='docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.State}}\t{{.Status}}\t{{.RunningFor}}" | (read -r; printf "%s\n" "$REPLY"; sort -k 4 ) |  docker-color-output'

# Docker-compose ps with colors
alias dcps='docker-compose ps | docker-color-output'

# Docker-compose logs
alias dcl='docker-compose logs -f'
alias dclt='docker-compose logs -f --tail=5'

# --------------------------------------------------------------------#
#                  Development and Programming                        #
# --------------------------------------------------------------------#

# Go aliases
alias grm='go run main.go'
alias gbm='go build main.go'

# Python 3 aliases
alias p='python3'

# PlantUML alias
alias plantuml='java -jar /usr/local/bin/plantuml-1.2023.10.jar'

# Jenv aliases
alias jg='jenv global'
alias jl='jenv local'
alias js='jenv shell'
alias jv='jenv versions'
alias j8='jenv shell 1.8.0.292'
alias j='java -version'

# Set java_home
alias java_home="/usr/libexec/java_home"

# NVM Node Manager Aliases
alias nu="nvm use"

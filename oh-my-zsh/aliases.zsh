# My custom aliases for ZSH
# Updated on: 12-06-2023

# --------------------------------------------------------------------#
#                      GraphQL Hacking Tools                          #
# --------------------------------------------------------------------#

# Server / implementation Fingerprint Reconnessance tool:
# Graphw00f <https://github.com/dolevf/graphw00f>
alias grw00f="python3 ~/Noname/graphql/graphw00f/main.py"

# Password brute-force and fuzzing
# CrackQL <https://github.com/nicholasaleks/CrackQL>
alias crql="python3 ~/Noname/graphql/CrackQL/CrackQL.py"


# --------------------------------------------------------------------#
#                       AWS Lab SSH Aliases                           #
# --------------------------------------------------------------------#

# Connect to the bastion host with access to the private subnets
# where my test apis are running
alias sb='ssh $NN_LAB_BASTION'
alias sn='ssh $NN_LAB_NONAME'
alias nnk8s='cd ~/Noname/labs/kubernetes/lab1-eks-sa01_3.23'


# --------------------------------------------------------------------#
#                         AWS cli Aliases                             #
# --------------------------------------------------------------------#

# Replace the aws command line with a custom one including the
# Noname SA AWS profile
alias aws='aws --profile $AWS_PROFILE'

# Show information about which account I'm using
alias awho='{ aws sts get-caller-identity & aws iam list-account-aliases; } | jq -s ".|add"'

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

# Git add all + custom git commit message
alias gallmsg='git add . && git commit'

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

# Edit functions.zsh
alias ef='code ${ZSH_CUSTOM}/functions.zsh'

# Copypath plugin alias (will copy PWD to clipboard)
alias co='copypath'

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

# Mkdir
alias md='mkdir -p'

# --------------------------------------------------------------------#
#                    Docker and Docker Compose                        #
# --------------------------------------------------------------------#

# Custom alias to work with docker secrets
alias dscr='gen_docsec 12'
alias dsls='docker secret ls'
alias dsrm='docker secret rm'
alias dsin='docker secret inspect'
alias ds='docker secret'
alias dc='docker compose'

# Additional docker-compose custom aliases
# This alias will run and open the logs right away
# Important: it must be run INSIDE the directory
# where the docker-compose.yaml file is located
alias dcrun='dcupd && dclf'

# Docker ps with colors
alias dpsc='docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.State}}\t{{.Status}}\t{{.RunningFor}}" | (read -r; printf "%s\n" "$REPLY"; sort -k 4 ) |  docker-color-output'

# Docker-compose ps with colors
alias dcps='docker compose ps | docker-color-output'

# Docker-compose logs
alias dcl='docker compose logs -f'
alias dclt='docker compose logs -f --tail=5'

# Run Docker Compose commands
alias dcr='docker compose run --rm app sh -c'

# Docker compose build
alias dcb='docker compose build'

# Docker compose up
alias dcup='docker compose up'

# --------------------------------------------------------------------#
#                  Development and Programming                        #
# --------------------------------------------------------------------#

# Go aliases
alias grm='go run main.go'
alias gbm='go build main.go'

# Python 3 aliases
alias p='python3'
alias python='python3'
alias pl='pip list'
alias pi='pip install'
alias pf='pip freeze'
alias dja='django-admin'
alias dpm='python manage.py'
alias dpmmk='python manage.py makemigrations'
alias dpmmi='python manage.py migrate'
alias dpmsh='python manage.py shell'
alias dpmr='python manage.py runserver'


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

# Python Docker Compose development aliases


# --------------------------------------------------------------------#
#                           NPM Aliases                               #
# --------------------------------------------------------------------#

alias ni="npm install --save"
alias nid="npm install --save-dev"
alias nig="npm install --global"

# --------------------------------------------------------------------#
#                     AWS cli and Programming                         #
# --------------------------------------------------------------------#

# whoami get authenticated identity
alias ami='aws my-instances'
alias adi='aws desc-inst'

# --------------------------------------------------------------------#
#                              Kubernetes                             #
# --------------------------------------------------------------------#

# switch between contexts
alias kcg='kubectl config get-contexts'
alias kcu="kubectl config use-context"
alias kcd='kubectl config use-context docker-desktop'
alias kcn='kubectl config use-context sa-eks-cluster && kubens noname-alanc-platform'

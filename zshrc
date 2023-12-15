# Changed on 11/26/2023
# What changed: added 1Password CLI (op) auto-completion

# Poetry Global Configurations
export POETRY_VIRTUALENVS_IN_PROJECT=true

# Activate Pytest autocompletion
# https://docs.pytest.org/en/7.1.x/how-to/bash-completion.html
eval "$(register-python-argcomplete pytest)"

# [12/15 7:22 AM - ac]: Set the Noname SA AWS profile as default when using aws cli   
export AWS_ACCESS_KEY_ID="ASIAXE3YJQMBU6EHRI2O"
export AWS_SECRET_ACCESS_KEY="ZSV/Wa3/wVJ3RIVuZrh274RFyGL9XOiySJJodZ+a"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEP7//////////wEaCXVzLWVhc3QtMSJHMEUCIQDJ8KmpJLn30wLqJyTRk/H0Xj9hRrjcmQ6PDjtMAxGmhAIgQr3r+l0l5b2CMQZVlMcxMtzhuWysF/dJUXjrKZ98AosqlwMIdhACGgw0OTE0ODkxNjYwODMiDHUy0/j0W9lReWR6ryr0Ao/cVJCksEdeC1JH9exiN5eZUbrfgs8A4qn0/IRs32w18TMvyQK8jerQyh5mcm+9gJ4W7JQajGElU5lRvSbxRNFsXT8GOcb4d1HjevOEdAlpVOpLfo4+EDeCYZ6nRLK/y+qEb8lVaxbK/bU39l6ccdk/2jX4SrSobAYzhDCy25erN3xx9dFWAm491DdtLNizFYNjRQPSSWOhbkR3ZkzJuj09PRFVbUKeLbrCMww5Mf2zD3cX1nwXATVztqdorzuGnGLGnT92b87wIebYBUpWpHbumlvpOYW+AqocVym9kpnvT8cPUU9fOghx1QaT1ahT1eRovBpWz6IXW6ciXlebblq/lHzjVfeMfh5WjS3WoAi+DuLyduldlhCRG/ldtFYUJ+Kkga2IsaqeoUbOyBObFyhCKIQhIwyt+wOo1Kw7GTtl5mwTmwnsrIsdTeaIxt6bQ/bHHSM0svKWAnRlgB5vEh42HXAslYAp6HhrSf5WtAB5kyeBlTDupfGrBjqmAZ5z4UHlOFY1q8S8zuhg3LGg8pIS+Cnxn2H+YElwTuzQbd5iFO9nhSqH5A75kDCZ8CVemhyDQUVTECIR7l1Ay3T7jXctb4eSHeneKJ+jFrRzFZhbgdM5WT2ntqi5n1+pfBt99ZVBvXClMRWYBFsrI5PS+vRv+PkLzhCgZqkpaAtyD3z7lGwasL66W4Q8mbSWzhr4nPozCSGuC5rbj5xangka0Z/w/kM="

export AWS_PROFILE=491489166083_SA_Standard_Access
# export AWS_REGION=us-west-2
# disable the aws cli output to be sent to vi 
export AWS_PAGER=""

# My Noname AWS Labs
export NN_LAB_BASTION=bastion.apiseclab.com
export NN_LAB_NONAME=noname.apiseclab.com

# Location to store the AWS keystore
export AWS_KEYPAIR_LOCATION=/Users/acota/Dropbox/config/awskeypairs

# SSH Agent hosted by 1Password
# More info: https://developer.1password.com/docs/ssh/agent/config
SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ssh-add -l


# direnv hook
# https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# .dotfiles location
export DOTFILES_LOCATION=$HOME/.dotfiles

# iCloud
export ICLOUD=$HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs

# Homebrew backup scripts
export HOMEBREW_BACKUP=${HOME}/Dropbox/config/backups/homebrew

# mackup location
export MACKUP_LOCATION=$ICLOUD/.config/mackup

# Go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Homebrew bin
export PATH="/opt/homebrew/bin:$PATH"
# export PATH=$PATH:/opt/homebrew/bin
export PATH="/opt/homebrew/sbin:$PATH"
export PATH=/Users/acota/.local/bin:$PATH
# Enabled on 6/26 - Brew for x86_64 packages
# https://medium.com/mkdir-awesome/how-to-install-x86-64-homebrew-packages-on-apple-m1-macbook-54ba295230f
# Disabled on 10/07/2023
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH="/opt/homebrew/bin/chromium"

export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Kubectl Krew - Package Manager for Kubectl
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Maven 3.8.9
export MAVEN_HOME="$HOME/AnypointStudio/maven/apache-maven-3.8.7"
export PATH="$MAVEN_HOME/bin:$PATH"

#export JAVA_HOME="$(/usr/libexec/java_home -v 18)"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Kind (Kubernetes multinote cluster)
export KIND_PATH=/usr/local/Cellar/kind/0.9.0/bin
export PATH=$PATH:$KIND_PATH

# Python 3.9
# export PYTHON_PATH=/Users/acota/Library/Python/3.9/bin
# export PATH=$PATH:$PYTHON_PATH

# Python tool to install multiple versions: https://github.com/pyenv/pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#jenv enable-plugin export
#jenv enable-plugin maven

# Node Version Manager (NVM) - Multiple node versions
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Homebrew configurations
export HOMEBREW_NO_ENV_HINTS=TRUE
export HOMEBREW_BUNDLE_FILE=$DOTFILES_LOCATION/Brewfile

# Setting VS Code as the official EDITOR
export EDITOR=/usr/bin/vim

# To enable shims and autocompletion add to your profile:
if which jenv >/dev/null; then eval "$(jenv init -)"; fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="lukerandall"
#ZSH_THEME="fletcherm" (09/12/2023)
#ZSH_THEME="fino-time"
ZSH_THEME="steeef"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${DOTFILES_LOCATION}/oh-my-zsh

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git node brew docker npm macos bgnotify web-search 1password jsontools)
plugins=(
	git
	brew
	npm
	yarn
	macos
	web-search
	jsontools
	aws
	kubectl
	copypath
	copyfile
	dirhistory
	docker
	docker-compose
	golang
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval
API_CATALOG_AC_ZSH_SETUP_PATH=/Users/acota/Library/Caches/api-catalog-cli/autocomplete/zsh_setup && test -f $API_CATALOG_AC_ZSH_SETUP_PATH && source $API_CATALOG_AC_ZSH_SETUP_PATH # api-catalog autocomplete setupexport PATH="/usr/local/opt/openjdk@11/bin:$PATH"

eval
SFDX_AC_ZSH_SETUP_PATH=/Users/acota/Library/Caches/sfdx/autocomplete/zsh_setup && test -f $SFDX_AC_ZSH_SETUP_PATH && source $SFDX_AC_ZSH_SETUP_PATH # sfdx autocomplete setupeval
SF_AC_ZSH_SETUP_PATH=/Users/acota/Library/Caches/sf/autocomplete/zsh_setup && test -f $SF_AC_ZSH_SETUP_PATH && source $SF_AC_ZSH_SETUP_PATH         # sf autocomplete setup

# pnpm
export PNPM_HOME="/Users/acota/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Powerlevel10k
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# [11/26 3:28 AM - ac]: 1Password CLI ZSH auto-completion feature
eval "$(op completion zsh)"; compdef _op opsource /Users/acota/.config/op/plugins.sh

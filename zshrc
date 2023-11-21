# Changed on 10/06/2023

# Set the Noname SA AWS profile as default when using aws cli
# export AWS_ACCESS_KEY_ID="ASIAXE3YJQMBUR667KWZ"
# export AWS_SECRET_ACCESS_KEY="QdZ62ydzhigAWravA3MguUkWHdm3u16LDUKRpDvJ"
# export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEMb//////////wEaCXVzLWVhc3QtMSJHMEUCICWe/E/y7Cryl58bVpRpIN30VVV2yS2DRlk+pckzFkOaAiEAneRzvm1h3WcYnDf6PXLOvd9/BXNbmjsUhYrxBS/fDDAqoAMI7///////////ARACGgw0OTE0ODkxNjYwODMiDLUM92KDZX87gYniryr0AjjsBGI0XrU0cvLAjnBxaoJwzlP2mx1l/tHmJC858G04FpxXcSnF2Hk48Rhf29J9ov7XcrvT/3b9GlFGPb+Axkds/kVQG7Rl4WG34Tf1Ec+I1sOKP+ruZxmKw4gpmIYdPi0fFJ2qOF6YHe3chV1D4NNAyidoUO+LxwzQj+kfZTQBZ6UQs096ZMNF6Jweg5C38v3ZLclUbZRGnxHPUZLt/PfbGKef89WrvEWkZCt3VT8NtTCU7/gE4QAvSeTGJXbGDlRhoAaA42sMDUsAYNlek54X8v2DiFnbqTkw6BXuxoeoRAIAEB8fzyIYIOvV0X4W5/RLFRAwDhKLNRDn4Kg+Bu2j4VA6dqIpq24COEZiy/1R9mr9zUPQKda8cTFtfrOhzEvHoXmz9CWJgC2brDxSQ4wBiaeybvukGf/B4A/V1MmSdUqRVY+vco0AS8PjssrAGtSlkvszNovtj36ZZhbbHxtuTPbBefVc4gBspQ66CGtT1BR4KDDVjISqBjqmAWlNlH0SzIkAxg6OSXceazuHm6FzLuYX9fMfYF8mjBgPwtuQYQ4TnPUECjPztMSib3AIACaGBn/rBR+5tcTdDRM7ntHbqNQdb7cSn4Eg9Z+eehETaK7Sua6YqZbWyDqi0Xq7ETDtgrugAYDHNonDV1sn6vjjwOi5abvVf7GhLXRh6QQk5b+O52k6W/8jfBIgtf5GKiDpmscXI9KJISkzaxsrn8BtGyM="
# export AWS_PROFILE=491489166083_SA_Standard_Access
# export AWS_REGION=us-west-2
# disable the aws cli output to be sent to vi 
export AWS_PAGER=""

# My Noname AWS Labs
export NN_LAB_BASTION=bastion.apiseclab.com
export NN_LAB_NONAME=noname.apiseclab.com

# Adds the ssh keys to the keystore
# All the keystores must have the following permissions: chmod 400 acota-awsnn.pem

# Location to store the AWS keystore
export AWS_KEYPAIR_LOCATION=/Users/acota/Dropbox/config/awskeypairs

# The following command will add all the keypairs to the apple keychain
# allowing me to ssh into AWS instances without passing the keypair as parameter

# if [ ! -S ~/.ssh/ssh_auth_sock ]; then
#     echo "'ssh-agent' has not been started since the last reboot. Starting 'ssh-agent' now."
#     eval "$(ssh-agent -s)" /dev/null 2>&1
#     ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
# fi
# export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# SSH Agent hosted by 1Password
# More info: https://developer.1password.com/docs/ssh/agent/config
SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ssh-add -l

# ssh-add -l > /dev/null
# if [ "$?" -ne "0" ]; then
#     echo "No ssh keys have been added to your 'ssh-agent' since the last reboot. Adding default keys now."
# 	for keypair in "$AWS_KEYPAIR_LOCATION"/*.pem; do
# 		if [ -f "$keypair" ]; then
# 			ssh-add --apple-use-keychain "$keypair" > /dev/null 2>&1
# 		fi
#   	done
# fi

# TO-DO: Reorganize the PATH exports

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
export PATH=$PATH:/opt/homebrew/bin
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
export PYTHON_PATH=/Users/acota/Library/Python/3.9/bin
export PATH=$PATH:$PYTHON_PATH

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

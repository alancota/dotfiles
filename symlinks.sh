#!/bin/sh

echo
#eval "$(/opt/homebrew/bin/brew shellenv)"

export DOTFILES="$HOME/.dotfiles"

backup_file() {
    local file=$1
    local new_file_name="$1-backup-$(date +"%m%d%Y%H%M%S")"
    # Check if the file exists
    if [ -e "$file" ]; then
        # check if it's not a link
        if [ ! -L "$file" ]; then
            mv "$file" "$new_file_name"
            echo "File $file backed up to $new_file_name"
        fi
    fi
}

create_symlinks() {
    local targets="$1"
    while read -r line; do
        for data in "${line}"; do
            link=${data##*:}
            target=${data%%:*}

            backup_file $target
            echo "Creating link to $target"
            echo "Link: $link"
            if [ ! -e "$link" ]; then
                echo "ln -s '$target' $link"
                ln -s "$target" $link
                echo "Symbolic link created: $target ---> $link"
            fi
        done
    done <"$targets"
}

# Create symbolic links using a dictionary from the cfg file
create_symlinks "symlinks.cfg"

#echo "$(keys "${TARGETS_MAP[@]}")"
#echo "VALUES=$(values "${TARGETS_MAP[@]}")"

# if [ -f "$HOME/.zshrc" ]; then
#     if [ ! -L "$HOME/.zshrc" ]; then
#         mv $HOME/.zshrc $HOME/.zshrc-backup-$(date +"%m%d%Y%H%M%S")
#         echo "$HOME/.zshrc physical file backed up to .zshrc-backup-$(date +"%m%d%Y%H%M%S")"
#     else
#         rm mv $HOME/.zshrc
#         echo "$HOME/.zshrc existing link deleted"
#     fi
# fi
# ln -s $DOTFILES/zshrc $HOME/.zshrc
# echo "$HOME/.zshrc linked to $DOTFILES/zshrc"

# if [ -f "$HOME/.mackup.cfg" ]; then
#     # mackup.cfg already exists
#     if [ ! -L "$HOME/.mackup.cfg" ]; then
#         # It's not a link
#         mv $HOME/.mackup.cfg $HOME/.mackup.cfg-backup-$(date +"%m%d%Y%H%M%S")
#         echo "$HOME/.mackup.cfg physical file backed up to .mackup.cfg-backup-$(date +"%m%d%Y%H%M%S")"
#     else
#         # It is a link
#         rm mv $HOME/.mackup.cfg
#         echo "$HOME/.mackup.cfg existing link deleted"
#     fi
# fi
# ln -s "$HOME/Library/Mobile Documents/com~apple~CloudDocs/.config/mackup/.mackup.cfg" $HOME/.mackup.cfg
# echo "$HOME/.mackup.cfg linked to $HOME/Library/Mobile Documents/com~apple~CloudDocs/.config/mackup/.mackup.cfg"

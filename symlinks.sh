#!/bin/sh

set -ue

echo
#eval "$(/opt/homebrew/bin/brew shellenv)"

DOTFILES=$HOME/.dotfiles

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
    else
        echo "Removing the link $file"
        rm "$file"
    fi
}

create_symlinks() {
    local targets="$1"
    while read -r line; do
        echo
        for data in "${line}"; do
            link=${data##*:}
            target=${data%%:*}
            backup_file $link
            echo "Creating link to $target"
            if [ ! -e "$link" ]; then
                #echo "ln -s $target $link"
                ln -s "$target" $link
                echo "Symbolic link created: $link ---> $target"
            fi
        done
    done <"$targets"
}

# Create symbolic links using a dictionary from the cfg file
create_symlinks "symlinks.cfg"

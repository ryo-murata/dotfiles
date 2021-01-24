#! /usr/bin/env bash
set -u

e_newline() {
    printf "\n"
}

e_header() {
    printf "\033[37;1m%s\033[m\n" "$*"
}

e_error() {
    printf "\033[31m%s\033[m\n" "✖ $*" 1>&2
}

DOTPATH=${DOTPATH:-$HOME/.dotfiles}
REPO="https://github.com/faruryo/dotfiles"

# if [ -d "$DOTPATH" ]; then
#     e_error "$DOTPATH: already exists"
#     exit 1
# fi

e_newline
e_header "Downloading dotfiles..."
git clone --recursive "$REPO" "$DOTPATH"

e_header "Symlink z files..."
XDG_CONFIG_HOME=$HOME/.config

# files
declare -A dot_files
dot_files=(
    ["zshenv"]="zsh/.zshenv" \
    ["gitconfig"]="git/gitconfig" \
)
for file in "${!dot_files[@]}"; do
    if [[ -f  $HOME/.$file && ! -L $HOME/.$file ]]; then
        mv $HOME/.$file $HOME/.$file.$(date +'%Y%m%d%H%M%S').backup
    fi
    ln -snf $DOTPATH/${dot_files[$file]} $HOME/.$file
done

# directories
link_dirs=(zsh git)
for dir in "${link_dirs[@]}"; do
    if [[ -d "$XDG_CONFIG_HOME/$dir"  && ! -L "$XDG_CONFIG_HOME/$dir" ]]; then
        mv $XDG_CONFIG_HOME/$dir $XDG_CONFIG_HOME/$dir.$(date +'%Y%m%d%H%M%S').backup
    fi
    ln -snf $DOTPATH/$dir $XDG_CONFIG_HOME/$dir
done

#brew
if [[ -r /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if [[ -r /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# complete
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    autoload -Uz compinit && compinit
fi

# asdf
if [[ -r $(brew --prefix asdf)/asdf.sh ]]; then
    . $(brew --prefix asdf)/asdf.sh
fi
if [[ -r $(brew --prefix asdf)/libexec/asdf.sh ]]; then
    . $(brew --prefix asdf)/libexec/asdf.sh
fi

# go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# kubectl
if [[ -r $HOME/.asdf/shims/kubectl ]]; then
    source <(kubectl completion zsh)
elif [[ -r $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/kubectl ]]; then
    source <(kubectl completion zsh)
fi
alias k=kubectl
compdef __start_kubectl k

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# direnv
emulate zsh -c "$(direnv hook zsh)"

# gcloud
source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# gpg
export GPG_TTY=$(tty)


# gary tools
export JUMPMARKS=~/.jumpmarks
touch $JUMPMARKS
alias ja='pwd >> $JUMPMARKS | sort -o $JUMPMARKS $JUMPMARKS'
alias jc='cat $JUMPMARKS | grep -v "^\s*#" | grep -v "^\s*$" | fzf --reverse'
alias ju='cd "$(jc)"'

function _fdf (){
    export FZF_DEFAULT_COMMAND="fd \
        --type=file \
        --hidden \
        --case-sensitive \
        --exclude '.git'
        "

    selected=$(
        fzf \
            --ansi \
            --reverse \
            --bind "ctrl-t:execute-silent(code -g $PWD/{1..3})" \
            --preview-window 'right,50%,border-left' \
            --preview 'bat --color=always {1}'
    )

    [[ -n $selected ]] && code -g "$PWD"/"$selected"
}

alias fdf='_fdf'

function _rgf (){
    RG_PREFIX="rg \
        --color=never \
        --no-heading \
        --with-filename \
        --line-number \
        --column \
        --smart-case \
        --hidden \
        --glob '\!.git/'"

    INITIAL_QUERY="${*:-}"

    selected=$(
        FZF_DEFAULT_COMMAND="$RG_PREFIX $(printf %q "$INITIAL_QUERY")" \
            fzf --ansi \
            --disabled --query "$INITIAL_QUERY" \
            --delimiter : \
            --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
            --bind "ctrl-t:execute-silent(code -g $PWD/{1..3})" \
            --preview 'bat --color=always {1} --highlight-line {2}' \
            --preview-window 'right,50%,border-left'
    )

    selected_array=(${(s/:/)selected})

    [ -n "${selected_array[1]}" ] && code -g "${selected_array[1]}:${selected_array[2]}:${selected_array[3]}"
}

alias rgf='_rgf'
alias tt='if [ -z "$TMUX" ] && [ ${UID} != 0 ]; then; tmux new-session -A -s main; fi'

# asdf
. $(brew --prefix asdf)/asdf.sh

# go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# kubectl
[[ /Users/faru/.asdf/shims/kubectl ]] && source <(kubectl completion zsh)
alias k=kubectl
complete -o default -F __start_kubectl k

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# direnv
emulate zsh -c "$(direnv hook zsh)"


# asdf
. $(brew --prefix asdf)/asdf.sh

# go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# kubectl
[[ /Users/faru/.asdf/shims/kubectl ]] && source <(kubectl completion zsh)
alias k=kubectl
complete -o default -F __start_kubectl k

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# direnv
emulate zsh -c "$(direnv hook zsh)"

# gcloud
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
export PIPENV_VENV_IN_PROJECT=1

export PATH="$HOME/.poetry/bin:$PATH"
export PATH=$PATH:$HOME/.nodebrew/current/bin
export EDITOR=code

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

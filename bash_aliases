alias vim='nvim'
alias vi='nvim'

export PATH="${HOME}/.fzf/bin:${HOME}/.mcfly/:$PATH"

if [[ -n $ZSH_NAME ]]; then
  eval "$(mcfly init zsh)"
fi

if [[ -n $BASH ]]; then
  eval "$(mcfly init bash)"
fi

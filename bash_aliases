alias vim='nvim'
alias vi='nvim'

export PATH="${HOME}/.fzf/bin:${HOME}/.mcfly/:$PATH"
export EDITOR=nvim

if [[ -n $ZSH_NAME ]]; then
  eval "$(mcfly init zsh)"
fi

if [[ -n $BASH ]]; then
  eval "$(mcfly init bash)"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git 
  aliases 
  colored-man-pages 
  copypath 
  zsh-autosuggestions 
  sudo 
  copybuffer 
  dirhistory 
  history 
  jsontools 
  z 
  tmux 
  emoji 
  zsh-syntax-highlighting 
  kubectl
  docker
  docker-compose
  vi-mode
  zsh-fzf-history-search
)

# For kubectl install jq, fx, yh 
# yay jq
# yay fx
# yay yh-bin

source $ZSH/oh-my-zsh.sh

alias gcm="git commit -m"
alias hc="echo -n > $HOME/.zsh_history"
alias lg="lazygit"
alias cl="clear"
alias v="nvim"
alias pn="pnpm"
alias pnvim="poetry run nvim"
alias lscn="ls --color=never"
alias dps="docker ps"
alias lad="lazydocker"
alias j="z"
alias clock="tty-clock -S -c -C 7"
alias ls="eza --color=always --long --git --no-time --icons=always"

alias kubectl=kubecolor
compdef kubecolor=kubectl

# pbcopy like
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# imgcat for wezterm
alias icat='wezterm imgcat'

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# poetry
export POETRY_VIRTUALENVS_IN_PROJECT=true
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# zsh-fzf-history-search config (-e for exact match)
export ZSH_FZF_HISTORY_SEARCH_FZF_ARGS='+s +m -e -x --preview-window=hidden'
export ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS=0
export ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH=0
export ZSH_FZF_HISTORY_SEARCH_REMOVE_DUPLICATES=1

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=magenta'

# fzf oldworld
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#c9c7cd,bg:#141415,hl:#f0c5a9
    --color=fg+:#efeae7,bg+:#27272a,hl+:#f0c5a9
    --color=info:#ea83a5,prompt:#ea83a5,pointer:#ea83a5
    --color=marker:#85b5ba,spinner:#85b5ba,header:#85b5ba'

# lf cd
LFCD="$HOME/.config/lf/lfcd.sh"                                #  pre-built binary, make sure to use absolute path
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

# keybindings
bindkey '^ ' autosuggest-accept
bindkey '^]' forward-word

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export ZED_KEYRING_PASSWORD=""
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export KUBE_EDITOR=vim

eval "$(starship init zsh)"

export PAGER="moar --quit-if-one-screen --no-clear-on-exit --statusbar=bold"

source "$HOME/.zshrc_private"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mr/dev/gcloud-setup/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mr/dev/gcloud-setup/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mr/dev/gcloud-setup/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mr/dev/gcloud-setup/google-cloud-sdk/completion.zsh.inc'; fi

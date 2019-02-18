# Path to your oh-my-zsh installation.
export ZSH=/Users/arthur/.oh-my-zsh

# themes are in ~/.oh-my-zsh/themes/
ZSH_THEME="Honukai"

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="false"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
DISABLE_UNTRACKED_FILES_DIRTY="false"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

# plugins are in ~/.oh-my-zsh/plugins/*
# custom plugins in ~/.oh-my-zsh/custom/plugins/
plugins=(git, docker)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR='vim'

alias gitgraph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias tmux="TERM=screen-256color tmux"

# exa FTW
alias ls="exa -F"

# go
export GOPATH=~/Development/go
export PATH=$PATH:$GOPATH/bin

# ruby
export PATH="$PATH:$HOME/.rvm/bin"

# python
export PATH=${PATH}:/usr/local/lib/python3.6/site-packages

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/arthur/exec -l /bin/zsh/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/arthur/exec -l /bin/zsh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/arthur/exec -l /bin/zsh/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/arthur/exec -l /bin/zsh/google-cloud-sdk/completion.zsh.inc'; fi

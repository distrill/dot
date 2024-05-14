# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# themes are in ~/.oh-my-zsh/themes/
ZSH_THEME="honukai"

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="false"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
DISABLE_UNTRACKED_FILES_DIRTY="false"

source $ZSH/oh-my-zsh.sh

# plugins are in ~/.oh-my-zsh/plugins/*
# custom plugins in ~/.oh-my-zsh/custom/plugins/
plugins=(git docker zsh-autosuggestions)


export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR='vim'


alias ls="exa -F"

alias sps="yay -S"
alias spr="yay -R"
alias spc="sudo pacman -Rns $(pacman -Qdtq)"
alias spu="yay -U"

alias vim="nvim"

# sourcing bits
# node version manager
source /usr/share/nvm/init-nvm.sh

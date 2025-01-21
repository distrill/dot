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
# plugins=(git docker zsh-autosuggestions)


export EDITOR='nvim'
export GOPATH="/home/bh/Downloads/bin/go"
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin"


# getting around
alias ls="exa -F"

# package management
alias sps="yay -S"
alias spr="yay -R"
alias spc="sudo pacman -Rns $(pacman -Qdtq)"
alias spa="yay -U"
alias spu="yay -Syu"

# editorrrrrrrrrrr
alias vim="nvim"

# ssh
alias ssh="kitten ssh"

# language specific
alias clj="clojure"
alias cljdep="echo '{:deps\n  {clojure.java-time/clojure.java-time {:mvn/version \"1.1.0\"}}}' > deps.edn"

# tailing logs through pino pretty
prettylog() {
  tail -n 100 -f "$1" | grep --line-buffered "$2" | npx pino-pretty --levelFirst --translateTime "yyyy/mm/dd | HH:MM:ss"
}

# nvm takes too god damn long to init so we do it on demand only
alias nvmi="source /usr/share/nvm/init-nvm.sh"

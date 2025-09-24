# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# themes are in $HOME/.oh-my-zsh/themes/
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

# plugins are in $HOME/.oh-my-zsh/plugins/*
# custom plugins in $HOME/.oh-my-zsh/custom/plugins/
# plugins=(git docker zsh-autosuggestions)


export EDITOR='nvim'
export GOPATH="$HOME/Downloads/bin/go"
export VOLTA_HOME="$HOME/.volta"
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.ghcup/bin"
export PATH="$PATH:$VOLTA_HOME/bin"


# getting around
alias ls="exa -F -1 --icons=always --color=always --group-directories-first"
alias lst="ls -T -L=3"

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

alias tmx="$HOME/dev/dot/scripts/tmx.sh"

# gitetc
alias gits="lazygit"

# tailing logs through pino pretty
prettylog() {
  tail -n 100 -f "$1" | grep --line-buffered "$2" | npx pino-pretty --levelFirst --translateTime "yyyy/mm/dd | HH:MM:ss"
}

# nvm takes too god damn long to init so we do it on demand only
alias nvmi="source /usr/share/nvm/init-nvm.sh"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '$HOME/.opam/opam-init/init.zsh' ]] || source '$HOME/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

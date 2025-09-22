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
export PATH="$PATH:/home/bh/.dotnet/tools"


# getting around
alias ls="exa -F -1 --icons=always --color=always --group-directories-first"
alias lst="ls -T -L=3"

# package management
alias sps="paru -S"
alias spr="paru -R"
alias spc="sudo pacman -Rns $(pacman -Qdtq)"
alias spa="paru -U"
alias spu="paru -Syu"

# editorrrrrrrrrrr
alias vim="nvim"
source ~/.config/avante/token

# ssh
alias ssh="kitten ssh"

# language specific
alias clj="clojure"
alias cljdep="echo '{:deps\n  {clojure.java-time/clojure.java-time {:mvn/version \"1.1.0\"}}}' > deps.edn"

alias tmx="~/dev/dot/scripts/tmx.sh"

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
[[ ! -r '/home/bh/.opam/opam-init/init.zsh' ]] || source '/home/bh/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

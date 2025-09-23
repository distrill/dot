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
export GOPATH="~/Downloads/bin/go"
export VOLTA_HOME="$HOME/.volta"
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin"
export PATH="$PATH:$VOLTA_HOME/bin"

# getting around
alias ls="eza -F -1 --icons=always --color=always --group-directories-first"
alias lst="ls -T -L=3"

source ~/.keys

# workworkworkwokrk
alias rsapi="source .env && NODE_ENV=development pnpm dev"
alias rsapp="VITE_NODE_ENV=development pnpm run start"
alias rsembed="pnpm run dev"
alias rsscrot="pnpm run dev"

# editorrrrrrrrrrr
alias vim="nvim"

# ssh
alias ssh="kitten ssh"

# language specific
alias clj="clojure"
alias cljdep="echo '{:deps\n  {clojure.java-time/clojure.java-time {:mvn/version \"1.1.0\"}}}' > deps.edn"

alias tmx="~/dev/dot/scripts/tmx.sh"

# tailing logs through pino pretty
prettylog() {
  tail -n 100 -f "$1" | grep --line-buffered "$2" | npx pino-pretty --levelFirst --translateTime "yyyy/mm/dd | HH:MM:ss"
}

# nvm takes too god damn long to init so we do it on demand only
alias nvmi="source /usr/share/nvm/init-nvm.sh"

# nix
export NIX_CONFIG="experimental-features = nix-command flakes"


# pnpm
export PNPM_HOME="/Users/bh/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

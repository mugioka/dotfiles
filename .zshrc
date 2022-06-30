export EDITOR=vim
export GOPATH=${HOME}/go
# to use ctrl + a/e with vscode terminal
bindkey -e
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ssh-add --apple-use-keychain
source /Users/mugioka/projects/mugioka/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
zinit light sindresorhus/pure
zstyle :prompt:pure:git:branch color "#ffff00"


export PATH="${PATH}:${GOPATH}/bin:${HOME}/Library/Python/3.8/bin"
# source "${HOME}/.local/share/zinit/plugins/jonmosco---kube-ps1/kube-ps1.sh"
# PS1='$(kube_ps1)'$PS
alias awsp="source _awsp"
export XDG_CONFIG_HOME=$HOME/.config

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export KUBECTL_EXTERNAL_DIFF="dyff between --omit-header --set-exit-code"

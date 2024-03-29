export PATH=$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/bin
export PATH=$PATH:$HOME/.local/kitty.app/bin

source ~/.antigen/antigen.zsh
source ~/.local.zshrc

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle git
antigen bundle z
antigen bundle docker
antigen bundle pip
antigen bundle node
antigen bundle npm
antigen bundle extract
antigen bundle autojump
antigen bundle command-not-found
antigen bundle colored-man-pages
antigen bundle vi-mode # Only used to trigger MODE in theme, solvable in other ways

antigen bundle Aloxaf/fzf-tab
antigen bundle b4b4r07/enhancd
antigen bundle ytet5uy4/fzf-widgets
antigen bundle wfxr/forgit # ga for interactive git add
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle hlissner/zsh-autopair
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zdharma-continuum/fast-syntax-highlighting

# Load the theme.
antigen theme avit

# Tell Antigen that you're done.
antigen apply

ZSH_THEME="avit"
HIST_STAMPS="yyyy-mm-dd"

# morhetz/gruvbox
export FZF_DEFAULT_OPTS='--color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'
export BAT_THEME="gruvbox-dark"

bindkey -v

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# Jump words with CTRL + [left / right]
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Delete words with CTRL + [del / backspace] - find key code with Ctrl+v & Ctrl+backspace
bindkey '5~' kill-word
bindkey '^H' backward-kill-word 

# Move up, down and forward with jkl
bindkey -s '^k' '^[OA'
bindkey -s '^j' '^[OB'
bindkey -s '^l' '^[OC'

bindkey '^g' fzf-git-add-files
bindkey '^p'  fzf-select-widget

alias ..="cd .."
alias cd..="cd .."
alias ll="ls -lFh"
alias la="ls -lAFh"
alias lt="ls -ltFh"
# alias grep="grep --color=auto"
alias mkdir="mkdir -p -v"
alias hist="history | grep"

# alias cat='bat'
alias top='htop'
alias grep='rg'

# NeoVim by default
alias vim='nvim'
alias vi='nvim'

# fzf for fuzzy history Ctrl+r
[ -f ~/configs/fzf-completion.zsh ] && source ~/configs/fzf-completion.zsh
[ -f ~/configs/fzf-key-bindings.zsh ] && source ~/configs/fzf-key-bindings.zsh

alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

if [ $commands[fd] ]; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
elif [ $commands[rg] ]; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!.git/*"'
fi

# Enhanced backward search on cd ...
export ENHANCD_DOT_ARG=...
export ENHANCD_DOT_SHOW_FULLPATH=1

# Kitty things
if [ -x "$(command -v kitty)" ]; then
  autoload -Uz compinit
  compinit
  # Completion for kitty
  kitty + complete setup zsh | source /dev/stdin
fi

# Needed for enhancd
source ~/.antigen/bundles/b4b4r07/enhancd/init.sh

# Make ^Z toggle between ^Z and fg
function ctrlz() {
    if [[ $#BUFFER == 0 ]]; then
        fg >/dev/null 2>&1 && zle redisplay
    else
        zle push-input
    fi
}

zle -N ctrlz
bindkey '^Z' ctrlz

# kube completions
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

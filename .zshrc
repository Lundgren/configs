export PATH=$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/bin
export PATH=$PATH:$HOME/.local/kitty.app/bin

source ~/.antigen/antigen.zsh
source ~/.local.zshrc

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
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

antigen bundle b4b4r07/enhancd
antigen bundle ytet5uy4/fzf-widgets
antigen bundle wfxr/forgit # ga for interactive git add
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle hlissner/zsh-autopair
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zdharma/fast-syntax-highlighting

# Load the theme.
antigen theme avit

# Tell Antigen that you're done.
antigen apply

ZSH_THEME="avit"
HIST_STAMPS="yyyy-mm-dd"

bindkey -v

# Jump words with CTRL + [left / right]
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Delete words with CTRL + [del / backspace] - find key code with Ctrl+v & Ctrl+backspace
bindkey '^[[3;5~' kill-word
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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

# Anaconda
source ~/anaconda3/etc/profile.d/conda.sh

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

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.local/kitty.app/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/opt/protoc-3.6.0/bin

source ~/.antigen/antigen.zsh
source ~/.local.zshrc

# Worth looking at?
# https://github.com/ytet5uy4/fzf-widgets
# https://github.com/b4b4r07/enhancd - Ctrl+T used by fzf
# https://github.com/jonmosco/kube-ps1
# https://github.com/wting/autojump
# https://github.com/mollifier/anyframe/blob/master/anyframe-functions/sources/anyframe-source-git-status

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle adb
antigen bundle z
antigen bundle docker
# antigen bundle kubectl
antigen bundle pip
antigen bundle node
antigen bundle npm
antigen bundle extract
antigen bundle autojump
antigen bundle command-not-found
antigen bundle colored-man-pages

#Hmm https://github.com/b4b4r07/enhancd
antigen bundle b4b4r07/enhancd

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

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

# Jump words with CTRL + [left / right]
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Delete words with CTRL + [del / backspace] - find key code with Ctrl+v & Ctrl+backspace
bindkey '^[[3;5~' kill-word
bindkey '^H' backward-kill-word 

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

alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"


# fzf for fuzzy history Ctrl+r
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ $commands[fd] ]; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
fi


# Kitty things
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# Needed for enhancd
source .antigen/bundles/b4b4r07/enhancd/init.sh
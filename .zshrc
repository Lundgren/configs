export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/opt/protoc-3.6.0/bin

source ~/.antigen/antigen.zsh
source ~/.local.zshrc

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle adb
antigen bundle z
antigen bundle docker
antigen bundle pip
antigen bundle node
antigen bundle npm
antigen bundle extract
antigen bundle autojump
antigen bundle command-not-found
antigen bundle colored-man-pages

#antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zdharma/fast-syntax-highlighting

# Load the theme.
antigen theme avit

# Tell Antigen that you're done.
antigen apply

ZSH_THEME="avit"
HIST_STAMPS="yyyy-mm-dd"


alias ..="cd .."
alias cd..="cd .."
alias ll="ls -lFh"
alias la="ls -lAFh"
alias lt="ls -ltFh"
alias grep="grep --color=auto"
alias mkdir="mkdir -p -v"
alias hist="history | grep"

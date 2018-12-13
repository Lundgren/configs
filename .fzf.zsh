# Setup fzf
# ---------
if [[ ! "$PATH" == */home/andreas/.fzf/bin* ]]; then
  export PATH="$PATH:/home/andreas/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/andreas/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/andreas/.fzf/shell/key-bindings.zsh"


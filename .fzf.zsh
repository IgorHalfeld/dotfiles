# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/igorhalfeld/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/igorhalfeld/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/igorhalfeld/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/igorhalfeld/.fzf/shell/key-bindings.zsh"

. ~/.exports

export ZSH="/Users/igorhalfeld/.oh-my-zsh"
export GOROOT="$(brew --prefix golang)/libexec"
export GOPATH=~/.go
export GOSUMDB="off"
export SUBLIME_ENV=/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin:${SUBLIME_ENV}:$HOME/Documents/flutter/bin:$HOME/.pub-cache/bin"

ZSH_THEME="halfeld"

alias gocode="cd ~/Documents/projects/"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

/usr/local/bin/tmux

plugins=(
  #git
  zsh-autosuggestions
  vscode
  docker
  kubectl
  terraform
  golang
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
tic ~/xterm-256color-italic.terminfo
export TERM=xterm-256color-italic

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/igorhalfeld/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/igorhalfeld/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/igorhalfeld/opt/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/igorhalfeld/opt/miniconda3/bin:$PATH"
#    fi
#fi
# <<< conda initialize <<<
#unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

PATH="/Users/igorhalfeld/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/igorhalfeld/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/igorhalfeld/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/igorhalfeld/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/igorhalfeld/perl5"; export PERL_MM_OPT;

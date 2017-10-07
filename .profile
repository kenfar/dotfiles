# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export PYTHON_EGG_CACHE=/tmp

export PATH="$PATH:$HOME/.rvm/bin"      # Add RVM to PATH for scripting
export PATH=$PATH:/usr/lib/go-1.8/bin   # add go
export PATH=$PATH:~/go/bin              # add go - my code
export GOBIN=~/go/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

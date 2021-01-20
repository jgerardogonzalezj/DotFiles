# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
 if [ -d "$HOME/bin" ] ; then
    if [[ $PATH != *"$HOME/bin"* ]] ; then
        PATH="$HOME/bin:$PATH"
    fi
 fi

# set PATH so it includes user's private bin if it exists
if [ -d $HOME/.local/bin ] ; then
    if [[ $PATH != *"$HOME/.local/bin"* ]] ; then
        PATH="$HOME/.local/bin:$PATH"
    fi
fi
# Adding the go's PATH to the PATH env.
export GOROOT=/usr/local/go
if [[ -d $GOROOT/bin ]]; then
    if [[ $PATH != *"$GOROOT"* ]] ; then
        PATH=$GOROOT/bin:$PATH
    fi
fi

export GOPATH=$HOME/Documents/PATH/TO/YOUR/CodeBase
if [[ $PATH != *"PARTIAL/PATH/TO/YOUR/CodeBase"* ]] ; then
    export PATH="$GOPATH/bin:$PATH"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [[ $PATH != *"$HOME/.rvm"* ]] ; then
    export PATH="$PATH:$HOME/.rvm/bin"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#!/bin/bash

alias vim="mvim -v"
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
alias vi=vim

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi


export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"


function _update_ps1() {
    PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*




alias sl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
export PATH="$PATH:$HOME/.composer/vendor/bin"
alias fl="bundle exec fastlane"


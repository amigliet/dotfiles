# ~/.bashrc.d/prompt.bash

# Set PROMPT_COMMAND
if [ -r "$HOME/.bashrc.d/functions" ];
then
    source "$HOME/.bashrc.d/functions"
    PROMPT_COMMAND=_bash_history_sync
fi

# -- BEGIN: prompt configuration
PS1='[\u@\h \W]'

if ! type -t __git_ps1 2>&1 1>/dev/null \
   && [ -e /usr/share/git-core/contrib/completion/git-prompt.sh ]
then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

if type -t __git_ps1 2>&1 1>/dev/null
then
    PS1="$PS1"'$(__git_ps1 " [%s]")'
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
fi

if [ "$UID" -gt 0 ]
then
    PS1="$PS1"'$ '
else
    PS1="$PS1"'# '
fi
# -- END: prompt configuration

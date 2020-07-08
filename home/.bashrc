# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# load functions and aliases
source ~/.functions

# make bash autocomplete with up arrow
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Show only the lasta 3 directory names
PROMPT_DIRTRIM=3

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# Ignore basic "ls" and history commands
HISTIGNORE="ls:ls -al:ll:exit:history:h:h[dh]:h [0-9]*:h[dh] [0-9]*"

# Save timestamp info for every command
HISTTIMEFORMAT="[%F %T] ~~~ "

#enable autocd
shopt -s autocd
bind 'set completion-ignore-case on'

# clear junk i hate seeing
(rm -rf ${HOME}/{*.core,*.out,*.dump,.nv,Desktop,.dbus,.rofi_fb_prevloc,.pki,.lesshst,.wget-hsts,.nvidia-settings-rc} 2>&1 1>/dev/null)


# PS1 configuration
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

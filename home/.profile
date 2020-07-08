# path
export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/bin"
export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.yarn/bin"

# manpages path
export MANPATH="/usr/share/doc:/usr/share/man:/usr/local/share/man/"
export MANPATH="$MANPATH:$HOME/.local/share/man"

# system
export CHARSET="UTF-8"
export SHELL="/bin/bash"
export PAGER="less"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="urxvt"
export BROWSER="firefox"
export PLAYER="mpv"

# xdg
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Musics"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

# colorful man pages
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;32m'     # begin blink
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\e[01;35m'    # begin reverse video
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\e[4;33m'     # begin underline
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline

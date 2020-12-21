# /etc/zsh/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

# Start tmux or attach to an existing session

    # If tmux exists in this system
    if which tmux 2>&1 >/dev/null; then
        # If this terminal isn't already inside tmux
        if [[ -z "$TMUX" ]] ;then
            # Look for sessions not attached
            if tmux ls 2>/dev/null | grep -v attached; then
                exec tmux attach
            else
                exec tmux
            fi
        fi
    fi

# Misc options

    # Fix pasted URLs
    autoload -Uz url-quote-magic
    zle -N self-insert url-quote-magic
    autoload -Uz bracketed-paste-magic
    zle -N bracketed-paste bracketed-paste-magic

    # Print return code of commands with return code different than 0
    setopt print_exit_value
    # Auto continue jobs disowned with disown
    setopt auto_continue
    # Use C prefixes for numeric values (hexadecimal 0xFF, octal 077)
    setopt c_bases
    # Allow CSH-style loops
    setopt csh_junkie_loops
    # Don't change directory just by typing a path
    unsetopt auto_cd
    # Make cd push the old directory onto the directory stack.
    setopt auto_pushd

# Prompt

    #source ${ZDOTDIR}/prompt-nouser.zsh
    source ${ZDOTDIR}/prompt-user.zsh

# Editors

    READNULLCMD=${PAGER:-/usr/bin/less}
    export VISUAL=vim
    export EDITOR="$VISUAL"

# History

    HISTFILE=${ZDOTDIR}/zsh_history
    HISTSIZE=1000
    SAVEHIST=$HISTSIZE
    export HISTFILE SAVEHIST

    setopt extended_history

    # Don't share history between instances
    unsetopt share_history

    # Append history list to the history file, rather than replace it.
    setopt append_history
    setopt inc_append_history

    # Do not store calls to "history" command in history
    setopt hist_no_store
    # Expire duplicate entries first when trimming history.
    setopt hist_expire_dups_first
    # Do not record an entry that was just recorded again.
    setopt hist_ignore_dups
    # Delete old recorded entry if new entry is a duplicate.
    setopt hist_ignore_all_dups
    # Do not display a line previously found.
    setopt hist_find_no_dups
    # Record entries starting with a space.
    unsetopt hist_ignore_space
    # Do not write duplicate entries in the history file.
    setopt hist_save_no_dups
    # Remove superfluous blanks before recording entry.
    setopt hist_reduce_blanks
    # Display the command before executing it when using "!"
    setopt hist_verify
    # Beep when accessing nonexistent history.
    setopt hist_beep

# Colors

    autoload -U colors && colors

    # Change the color scheme for 'ls'. This has to be done before initializing
    # the completion options.
    source ${ZDOTDIR}/dircolors.zsh

    # Change the color scheme for 'grep'
    export GREP_COLORS='fn=34:mc=01;30:ms=1;33'

# Completion

    source ${ZDOTDIR}/completion.zsh

# Key bindings

    source ${ZDOTDIR}/key-bindings.zsh

# Alias and Environment configuration

    # Colorize ls output by default
    alias ls='ls --color=auto'

    alias ll='ls -l --color=auto'

    # Resolve the physical path, resolving all the symbolic links
    alias cdd="cd -P"

    # Less configuration
    export LESS="-SRXI"

    # Colorize output, ignore GIT directory
    alias grep='grep --color=auto --exclude-dir=.git'

    # Console git tree
    alias gitl='git log --oneline --graph --color --decorate'

    # Show list of commits per author
    alias git-authors='git shortlog -s -n --no-merges'

    # Clear reflog and perform garbage collection
    function git-force-gc() {
        git reflog expire --expire=all --all
        git gc --prune=now
    }

    # Checkout the GitHub pull request ID passed as argument
    function git-checkout-pr() {
        if [ -n "$1" ]; then
            if git fetch origin pull/$1/head; then
                git checkout FETCH_HEAD
            fi
        else
            echo "Pull request ID not provided."
        fi
    }

    # Kill all tmux sessions
    alias tkillall='tmux kill-server'

    # Kill chosen tmux session, or the active one if no arguments
    function tkill() {
        if [ -n "$1" ]; then
            tmux kill-session -t "$1"
        else
            tmux kill-session
        fi
    }

    # Kill chosen tmux pane
    function tkillpane() {
        if [ -n "$1" ]; then
            tmux kill-pane -t "$1"
        else
            echo "Pane number not provided."
        fi
    }

    # List processes running in the current session
    function tps() {
            tmux list-panes -s -F "#{pane_index} #{pane_pid} #{pane_current_command}"
            tmux display-panes
    }

    # List tmux sessions
    function tlist() {
            tmux list-sessions
    }

    # Print progress of dd
    alias dd='dd status=progress'

    # Print progress of basic file operations
    alias copy='rsync -phr --progress'
    alias move='rsync -aPhr --remove-source-files'

    # Print information about the sensors in the computer
    alias sensors='watch -c -n 1 sensors'

    # Color config for ripgrep
    alias rg="rg --colors 'path:fg:blue' --colors 'path:style:bold' --colors 'line:fg:green' --colors 'match:style:bold' --colors 'match:fg:yellow'"

    # Easier name to remember
    alias music='ncmpcpp'
    alias music-update='mpc update'

    # Configuration for music visualizer
    alias nausea='nausea -cps /tmp/mpd.fifo'

# Commands to run before letting the user take control

    # Freeze the TTY settings to avoid corruption by badly behaved programs
    ttyctl -f

# Plugins

    source ${ZDOTDIR}/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ${ZDOTDIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    # zsh-autosuggestions
    ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=blue"

# Welcome string

    # Print system information
    bold=$(tput bold)
    normal=$(tput sgr0)
    echo "${bold}$(uname -srvmo)${normal}"
    echo

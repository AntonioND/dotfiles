# /etc/zsh/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

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

    #source $HOME/.zsh/prompt-nouser.zsh
    source $HOME/.zsh/prompt-user.zsh

# Editors

    READNULLCMD=${PAGER:-/usr/bin/less}
    export VISUAL=nvim
    export EDITOR="$VISUAL"

# History

    HISTFILE=$HOME/.zsh/zsh_history
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

# Completion

    source $HOME/.zsh/completion.zsh

# Key bindings

    source $HOME/.zsh/key-bindings.zsh

# Alias and Environment configuration

    # Colorize ls output by default
    alias ls='ls --color=auto'

    # Resolve the physical path, resolving all the symbolic links
    alias cdd="cd -P"

    # Less configuration
    export LESS="-SRXI"

    # Colorize output, ignore GIT directory
    alias grep='grep --color=auto --exclude-dir=.git'
    # Change the color scheme
    export GREP_COLORS='fn=34:mc=01;30:ms=1;33'

    # Console git tree
    alias gitl='git log --oneline --graph --color --decorate'

    # Show list of commits per author
    alias git-authors='git shortlog -s -n --no-merges'

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

    # Print progress of dd
    alias dd='dd status=progress'

    # Print progress of basic file operations
    alias copy='rsync -phr --progress'
    alias move='rsync -aPhr --remove-source-files'

    # Less typing
    alias nv='nvim'

    # Color config for ripgrep
    alias rg="rg --colors 'path:fg:blue' --colors 'path:style:bold' --colors 'line:fg:green' --colors 'match:style:bold' --colors 'match:fg:yellow'"

    # Always ignore files in a .gitignore and .git/ folders
    alias exa='exa --git-ignore'

    # Print file information
    alias el='exa -l'

    # Print tree of file information
    alias ell='exa -lT'

    # Easier name to remember
    alias music='ncmpcpp'

    # Configuration for music visualizer
    alias nausea='nausea -cps /tmp/mpd.fifo'

# Commands to run before letting the user take control

    # Freeze the TTY settings to avoid corruption by badly behaved programs
    ttyctl -f

    # Move prompt to the last row of the terminal
    #tput cup $LINES 0

# Plugins

    source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    # zsh-autosuggestions
    ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=blue"

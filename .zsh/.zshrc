# /etc/zsh/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

#   _________  _   _ ____   ____
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |
# _ / /_ ___) |  _  |  _ <| |___
#(_)____|____/|_| |_|_| \_\\____|
#

# Oh My Zsh

    # Path to your oh-my-zsh configuration.
    ZSH=$HOME/.zsh/oh-my-zsh

    # Set name of the theme to load.
    # Look in ~/.oh-my-zsh/themes/
    # Optionally, if you set this to "random", it'll load a random theme each
    # time that oh-my-zsh is loaded.
    #ZSH_THEME="jreese"

    # Set to this to use case-sensitive completion
    CASE_SENSITIVE="true"

    # Comment this out to disable weekly auto-update checks
    DISABLE_AUTO_UPDATE="true"

    # Uncomment following line if you want to disable colors in ls
    # DISABLE_LS_COLORS="true"

    # Uncomment following line if you want to disable autosetting terminal title.
    DISABLE_AUTO_TITLE="true"

    # Uncomment following line if you want red dots to be displayed while waiting for completion
    # COMPLETION_WAITING_DOTS="true"

    # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
    # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
    # Example format: plugins=(rails git textmate ruby lighthouse)
    # WARNING: Order matters, especially for zsh-syntax-highlighting and history-substring-search
    plugins=(command-not-found zsh-completions zsh-completion-generator git screen zsh-autosuggestions zsh-navigation-tools zsh-cmd-architect cd-gitroot zsh-syntax-highlighting history-substring-search)
    # Enable autorrection features in Oh My Zsh, especially exception to autocorrection
    # that are annoying
    # ENABLE_CORRECTION="true"

    source $ZSH/oh-my-zsh.sh

    # zsh-navigation-tool
    znt_list_border=0
    # 1 to select entry when Enter is pressed
    znt_list_instant_select=1
    # znt_list_colorpair="green/black"
    # - underline or reverse - how should be active element highlighted
    znt_history_active_text="reverse"

    # zsh-autosuggestions plugin
    ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=blue"

# Misc options
    setopt interactive_comments
    setopt path_dirs
    setopt print_exit_value
    setopt auto_continue
    setopt c_bases
    setopt csh_junkie_loops
    unsetopt auto_cd

# Prompt
    #source $HOME/.zsh/prompt-nouser.sh
    source $HOME/.zsh/prompt-user.sh

# Editors
    READNULLCMD=${PAGER:-/usr/bin/less}
    export VISUAL=vim
    export EDITOR="$VISUAL"

# History
    HISTFILE=~/.zsh/zsh_history;
    HISTSIZE=1000;
    SAVEHIST=$HISTSIZE;
    export HISTFILE SAVEHIST;

    # Share history between instances
    setopt share_history
    setopt append_history

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

# cd
    # Make cd push the old directory onto the directory stack.
    setopt auto_pushd

# Completion
    if [ -z "$skip_global_compinit" ]; then
        autoload -U compinit
        compinit -C
    fi
    zmodload zsh/complist

    setopt extended_glob
    # Do globbing on unquoted command parameters like "param=value"
    setopt magic_equal_subst
    setopt numeric_glob_sort
    setopt mark_dirs
    setopt rc_expand_param
    # Autocorrect commands
    # Exceptions added by Oh My Zsh (option ENABLE_CORRECTION)
    #setopt correct_all

    # Ignore completion functions for commands you don't have
    zstyle ':completion:*:functions' ignored-patterns '_*'

    zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
    zstyle ':completion:*:processes-names' command 'ps -e -o comm='
    zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
    # Build completion cache, useful for completions that requires lot of
    # computations such as the package list
    zstyle ':completion:*' use-cache on
    zstyle ':completion:*' cache-path ~/.zsh_cache
    # Colors for process list
    zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# Alias and Environment configuration
    alias ls='ls --color=auto'
    alias ll='ls --color=auto -lh'
    alias la='ls --color=auto -lah'
    alias lll='ls --color=auto -lh | less'

    # Resolve the physical path, resolving all the symbolic links
    alias cdd="cd -P"
    # cd-gitroot plugin
    alias gcd='cd-gitroot'

    alias cv='cp -Rva'

    # Colorize output, ignore GIT directory
    alias grep='grep --color=auto --exclude-dir=.git'
    # Recursive, show line numbers, ignore binary files
    alias grepp='grep -IRn'
    # Change the color scheme
    export GREP_COLORS="fn=34:mc=01;30:ms=1;33:sl=21:cx=31"

    # Console git tree
    alias gitl='git log --oneline --graph --color --decorate'

    # Less configuration
    LESS="-SRXI"

# Freeze the TTY settings to avoid corruption by badly behaved programs
ttyctl -f

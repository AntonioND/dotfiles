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

# Prompt

    # Allocate variables
    local -h termwidth
    local -h right_prompt_length left_prompt_length
    local -h time_ branch_ dir_

    # In case you want to have `user@hostname` in the prompt
    #local -h host user
    #user=`whoami` # "%n"
    #host=`hostname` # "%m"

    # Get a string describing the current HEAD if we are in a git repository
    function get_git_branch() {
        if git rev-parse --git-dir > /dev/null 2>&1; then
            # This is a valid git repository (but maybe not the top level).
            git describe --all
        else
            echo ""
        fi
    }

    update_left_prompt_length() {
        local -h left_prompt_naked
        # Create string to calculate lenght. Time always uses the same space
        left_prompt_naked="[00:00:00] [$dir_]"
        (( left_prompt_length = $(printf "%s" "$left_prompt_naked" | wc -m) ))
    }

    update_right_prompt() {
        branch_=`printf "%s" $(get_git_branch)`
        local -h right_prompt_naked
        right_prompt_naked="$branch_" # Create string to calculate lenght
        (( right_prompt_length = $(printf "%s" "$right_prompt_naked" | wc -m) ))
    }

    update_termwidth() { termwidth="$COLUMNS" }
    # Callback called by zsh when resizing the terminal
    TRAPWINCH() { update_termwidth }

    update_curdir() { dir_=`printf "%s" "${PWD/#$HOME/~}"` }
    # Callback called by zsh when changing dir
    chpwd() { update_curdir ; update_left_prompt_length }

    # Refresh prompt at the start of zsh by calling all refresh functions
    update_termwidth
    update_curdir
    update_left_prompt_length

    # Callback called by zsh before showing the prompt.
    precmd() {

        time_=`date +%X`

        update_right_prompt

        local -h total_length
        (( total_length = left_prompt_length + right_prompt_length ))

        # Create padding to align right in the current line. Long prompts
        # (because of a long path, for example) use more than one line, align to
        # the first possible line in that case.
        local -h padding_length padding
        (( padding_length = termwidth - (total_length % termwidth) ))
        padding=`printf '%*s' "$padding_length"` # String with lots of spaces

        local -h final_prompt
        final_prompt=(
        #   "%F{green}"  "$user"  "%F{red}"  "@"  "%F{green}"  "$host"  "%f"
            "%B"  "%f%k"  "[$time_] "  "%F{blue}"  "[$dir_]"  "%f%k"  "%b"
            "$padding"
            "%F{yellow}"  "$branch_"  "%f"
            $'\n'
            "%B"  ">>> "  "%b"
        )

        # Tell zsh to use this string as prompt
        PS1="${(j::)final_prompt}"
    }

# Editors
    READNULLCMD=${PAGER:-/usr/bin/less}
    export VISUAL=vim
    export EDITOR="$VISUAL"

# History
    HISTFILE=~/.zsh/zsh_history;
    HISTSIZE=1000;
    SAVEHIST=$HISTSIZE;
    export HISTFILE SAVEHIST;
    unsetopt share_history # Do not share history between instances. Can use "fc -W" and "fc -R" to do it
    setopt hist_ignore_all_dups # No duplicates in hitory
    setopt hist_ignore_space # Do not add commands with leading whitespace to history
    setopt hist_no_store # Do not store calls to "history" command in history
    setopt hist_reduce_blanks # Remove superfluous blanks in command before adding to history
    setopt hist_verify # Display the command before executing it when using "!"
    setopt append_history

# cd
    #setopt auto_pushd  # "cd +" completion with tab and directory history stack

# Completion
    # Cygwin fix :
    # If you don't want compinit called here, place the line
    # skip_global_compinit=1
    # in your $ZDOTDIR/.zshenv or $ZDOTDIR/.zprofice

    if [ -z "$skip_global_compinit" ]; then
        autoload -U compinit
        compinit -C
    fi
    zmodload zsh/complist

    setopt extended_glob
    setopt magic_equal_subst # Do globbing on unquoted command parameters like "param=value"
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

    #alias mplayer='mplayer -vo fbdev -zoom -x 800 -y 600' #pour avoir le framebuffer actif en console
    alias cv='cp -Rva'

    # Colorize output, ignore GIT directory
    alias grep='grep --color=auto --exclude-dir=.git'
    # Recursive, show line numbers, ignore binary files
    alias grepp='grep -IRn'

    # Console git tree
    alias gitl='git log --oneline --graph --color --decorate'

    # Import history from all other running shells immediatly
    alias hist-sync='fc -IR'

    # Less configuration
    LESS="-SRXI"

# Freeze the TTY settings to avoid corruption by badly behaved programs
ttyctl -f

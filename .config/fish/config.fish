# fish shell configuration file
# =============================

set PATH ~/bin $PATH

# Editors
# -------

export VISUAL=nvim
export EDITOR="$VISUAL"

# System commands
# ---------------

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

# Print progress of dd
alias dd='dd status=progress'

# Print progress of basic file operations
alias copy='rsync -phr --progress'
alias move='rsync -aPhr --remove-source-files'

# Git
# ---

# Console git tree
alias gitl='git log --oneline --graph --color --decorate'

# Show list of commits per author
alias git-authors='git shortlog -s -n --no-merges'

# Checkout the GitHub pull request ID passed as argument
function git-checkout-pr
    if count $argv -gt 2
        if git fetch origin pull/$argv[1]/head
            git checkout FETCH_HEAD
        end
    else
        echo "Pull request ID not provided."
    end
end

# User tools
# ----------

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
